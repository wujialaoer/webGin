package controller

import (
	"encoding/json"
	"github.com/gin-gonic/gin"
	"github.com/xuri/excelize/v2"
	"gorm.io/gorm/clause"
	"os"
	"path"
	"strconv"
	"strings"
	"time"
	"webGin/models/DictManage"
	"webGin/utils"
)

type DictManageController struct {
}

func (d *DictManageController) Router(engine *gin.Engine) {
	//routerGroup := engine.Group("/")
	engine.GET("/FilterWords/", d.GetFilterWord)
	engine.POST("/FilterWords/", d.AddFilterWord)
	engine.PUT("/FilterWords/:id/", d.UpdateFilterWord)
	engine.DELETE("/FilterWords/:id/", d.DeleteFilterWord)

	engine.GET("/Alias/", d.GetAlias)
	engine.POST("/Alias/", d.AddAlias)
	engine.PUT("/Alias/:id/", d.UpdateAlias)
	engine.DELETE("/Alias/:id/", d.DeleteAlias)
	engine.POST("/Alias/Import/", d.ImportAlias)

	engine.GET("/Glossary/", d.GetGlossary)
	engine.POST("/Glossary/", d.AddGlossary)
	engine.PUT("/Glossary/:id/", d.UpdateGlossary)
	engine.DELETE("/Glossary/:id/", d.DeleteGlossary)
}

// DeleteGlossary 删除解释
func (d *DictManageController) DeleteGlossary(ctx *gin.Context) {
	id := ctx.Param("id")
	gla := DictManage.Glossary{Id: id}
	has := utils.DbEngine.Find(&gla)
	if has.Error != nil {
		utils.Response(ctx, 400, "未找到", nil)
		return
	}
	if has.RowsAffected > 0 {
		utils.DbEngine.Delete(&gla)
		utils.Response(ctx, 200, "删除成功", nil)
		return
	}
	utils.Response(ctx, 400, "删除失败", nil)

}

// UpdateGlossary 更新解释
func (d *DictManageController) UpdateGlossary(ctx *gin.Context) {
	id := ctx.Param("id")
	updateGla := new(GlossaryHandle)
	ctx.BindJSON(updateGla)
	gla := DictManage.Glossary{Id: id}
	has := utils.DbEngine.Find(&gla)
	if has.Error != nil {
		utils.Response(ctx, 400, "未找到", nil)
		return
	}
	if has.RowsAffected > 0 {
		gla.Noun = updateGla.Noun
		gla.Explain = updateGla.Explain
		gla.Transliteration = updateGla.Transliteration
		gla.IsDefault = updateGla.IsDefault
		utils.DbEngine.Updates(&gla)
		utils.Response(ctx, 200, "更新成功", nil)
		return
	}
	utils.Response(ctx, 400, "更新失败", nil)

}

// AddGlossary 新增解释
func (d *DictManageController) AddGlossary(ctx *gin.Context) {
	addGl := new(GlossaryHandle)
	ctx.BindJSON(addGl)
	has := utils.DbEngine.Where(DictManage.Glossary{Noun: addGl.Noun}).Find(&DictManage.Glossary{})
	if has.RowsAffected > 0 {
		utils.Response(ctx, 200, "已存在相同名词", nil)
		return
	}
	utils.DbEngine.Create(&DictManage.Glossary{Id: utils.UUID4(), Noun: addGl.Noun, Explain: addGl.Explain, Transliteration: addGl.Transliteration, IsDefault: addGl.IsDefault})
	utils.Response(ctx, 200, "success", nil)
}

// GetGlossary Glossary
func (d *DictManageController) GetGlossary(ctx *gin.Context) {
	page, _ := strconv.Atoi(ctx.Query("page"))
	pageSize, _ := strconv.Atoi(ctx.Query("pageSize"))
	allGl := make([]DictManage.Glossary, 0)
	utils.DbEngine.Find(&allGl)
	total := len(allGl)
	utils.DbEngine.Limit(pageSize).Offset((page - 1) * pageSize).Find(&allGl)
	utils.PageResponse(ctx, 200, "success", allGl, total%20, pageSize, total)
}

// ImportAlias 导入别名
func (d *DictManageController) ImportAlias(ctx *gin.Context) {
	file, err := ctx.FormFile("file")
	if err != nil {
		utils.Response(ctx, 400, "检查文件2", nil)
	}
	existing := path.Ext(file.Filename)
	//根据当前时间鹾生成一个新的文件名
	fileNameInt := time.Now().Unix()
	fileNameStr := strconv.FormatInt(fileNameInt, 10)
	//新的文件名
	fileName := fileNameStr + existing
	filePath := path.Join("./upload", fileName)
	err = ctx.SaveUploadedFile(file, filePath)

	if err != nil {
		utils.Response(ctx, 400, err.Error(), nil)
		return
	}
	f, err := excelize.OpenFile(filePath)
	rows, _ := f.GetRows("Sheet1")
	alias := make([]DictManage.Alias, 0)

	for key, row := range rows {
		if key > 0 {
			a := DictManage.Alias{StandardName: row[0]}
			has := utils.DbEngine.Where(&a).Find(&a)
			var aItem []map[string]interface{}
			if has.RowsAffected > 0 {
				json.Unmarshal([]byte(a.AliasItems), &aItem)
			goFunc:
				for _, r := range strings.Split(row[1], ",") {
					for _, item := range aItem {
						if item["aliasName"] == r {
							continue goFunc
						}
					}
					aItem = append(aItem, map[string]interface{}{
						"aliasName": r,
					})
				}
				if len(aItem) > 0 {
					strItem, _ := json.Marshal(&aItem)
					a.AliasItems = string(strItem)
					alias = append(alias, a)
				}
			} else {
			goFunc1:
				for _, r := range strings.Split(row[1], ",") {
					if len(aItem) > 0 {
						for _, item := range aItem {
							if item["aliasName"] == r {
								continue goFunc1
							}
						}
					}
					aItem = append(aItem, map[string]interface{}{
						"aliasName": r,
					})

				}
				str, _ := json.Marshal(&aItem)
				a.Id = utils.UUID4()
				a.AliasItems = string(str)
				alias = append(alias, a)
			}

		}
	}
	defer os.Remove(filePath)
	if len(alias) > 0 {
		has := utils.DbEngine.Clauses(clause.OnConflict{UpdateAll: true}).Create(&alias)
		if has.Error != nil {
			utils.Response(ctx, 400, "导入失败", has.Error)
			return
		}
	}
	utils.Response(ctx, 200, "导入成功", nil)

}

// DeleteAlias 删除别名
func (d *DictManageController) DeleteAlias(ctx *gin.Context) {
	id := ctx.Param("id")
	alias := DictManage.Alias{Id: id}
	has := utils.DbEngine.Find(&alias)
	if has.RowsAffected > 0 {
		utils.DbEngine.Delete(&alias)
		utils.Response(ctx, 200, "删除成功", nil)
		return
	}
	utils.Response(ctx, 200, "未找到", nil)
}

// UpdateAlias 更新别名
func (d *DictManageController) UpdateAlias(ctx *gin.Context) {
	id := ctx.Param("id")
	updateAlias := new(AliasHandle)
	ctx.BindJSON(updateAlias)
	alias := DictManage.Alias{Id: id}
	has := utils.DbEngine.Find(&alias)
	if has.RowsAffected > 0 {
		up, _ := json.Marshal(updateAlias.AliasItems)
		alias.AliasItems = string(up)
		alias.StandardName = updateAlias.StandardName
		utils.DbEngine.Save(&alias)
		utils.Response(ctx, 200, "更新success", nil)
		return
	}
	utils.Response(ctx, 400, "数据不存在", nil)
}

// AddAlias 新增别名
func (d *DictManageController) AddAlias(ctx *gin.Context) {
	addAlias := new(AliasHandle)
	ctx.BindJSON(addAlias)
	if has := utils.DbEngine.Where(&DictManage.Alias{StandardName: addAlias.StandardName}).Find(&DictManage.Alias{}); has.RowsAffected > 0 {
		utils.Response(ctx, 200, "已存在相同", nil)
		return
	}
	al, _ := json.Marshal(addAlias.AliasItems)
	utils.DbEngine.Create(&DictManage.Alias{AliasItems: string(al), Id: utils.UUID4(), StandardName: addAlias.StandardName})
	utils.Response(ctx, 200, "success", nil)
}

// GetAlias 获取别名
func (d *DictManageController) GetAlias(ctx *gin.Context) {
	page, _ := strconv.Atoi(ctx.Query("page"))
	pageSize, _ := strconv.Atoi(ctx.Query("pageSize"))
	alias := make([]DictManage.Alias, 0)
	utils.DbEngine.Find(&alias)
	total := 0
	utils.DbEngine.Limit(pageSize).Offset((page - 1) * pageSize).Find(&alias)
	data := make([]map[string]interface{}, 0)
	for _, a := range alias {
		al := map[string]interface{}{
			"id":            a.Id,
			"standard_name": a.StandardName,
		}
		var aItem []map[string]interface{}
		json.Unmarshal([]byte(a.AliasItems), &aItem)
		al["dis_aliasItems"] = aItem
		al["aliasItems"] = a.AliasItems
		data = append(data, al)
	}
	utils.PageResponse(ctx, 200, "success", data, total%20, pageSize, total)
}

// DeleteFilterWord 删除 过滤词
func (d *DictManageController) DeleteFilterWord(ctx *gin.Context) {
	id := ctx.Param("id")
	word := DictManage.FilterWords{
		ID: id,
	}
	has := utils.DbEngine.Find(&word)
	if has.RowsAffected == 0 {
		utils.Response(ctx, 400, "未找到", nil)
		return
	}
	utils.DbEngine.Delete(&word)
	utils.Response(ctx, 200, "success", nil)
}

// UpdateFilterWord 更逊过滤词
func (d *DictManageController) UpdateFilterWord(ctx *gin.Context) {
	id := ctx.Param("id")
	update := new(WordHandle)
	ctx.BindJSON(update)
	has := utils.DbEngine.Where(&DictManage.FilterWords{Word: update.Word}).Find(&DictManage.FilterWords{})
	if has.RowsAffected > 0 {
		utils.Response(ctx, 400, "已存在", nil)
		return
	}
	word := DictManage.FilterWords{
		ID: id,
	}
	has = utils.DbEngine.Find(&word)
	if has.Error != nil {
		utils.Response(ctx, 400, "failed", nil)
		return
	}
	word.Word = update.Word
	utils.DbEngine.Save(&word)
	utils.Response(ctx, 200, "success", nil)
}

// GetFilterWord 获取过滤词
func (d *DictManageController) GetFilterWord(ctx *gin.Context) {
	page, _ := strconv.Atoi(ctx.Query("page"))
	pageSize, _ := strconv.Atoi(ctx.Query("pageSize"))
	filterWord := make([]DictManage.FilterWords, 0)
	utils.DbEngine.Find(&filterWord)
	total := len(filterWord)
	utils.DbEngine.Limit(pageSize).Offset((page - 1) * pageSize).Find(&filterWord)
	utils.PageResponse(ctx, 200, "success", filterWord, total%20, pageSize, total)
}

// AddFilterWord 新增过滤词
func (d *DictManageController) AddFilterWord(ctx *gin.Context) {
	addWord := new(WordHandle)
	ctx.BindJSON(addWord)
	has := utils.DbEngine.Where(&DictManage.FilterWords{Word: addWord.Word}).Find(&DictManage.FilterWords{})
	if has.RowsAffected > 0 {
		utils.Response(ctx, 400, "已存在", nil)
		return
	}
	utils.DbEngine.Create(&DictManage.FilterWords{Word: addWord.Word, ID: utils.UUID4()})
	utils.Response(ctx, 200, "success", nil)
}

// WordHandle 名词
type WordHandle struct {
	Word string `json:"word,omitempty" form:"word"`
}

// AliasHandle 别名
type AliasHandle struct {
	StandardName string `json:"standard_name" form:"standard_name"`
	AliasItems   []struct {
		AliasName string `json:"aliasName" form:"aliasName"`
	} `json:"aliasItems" form:"aliasItems"`
}

// GlossaryHandle 名词解释
type GlossaryHandle struct {
	Noun            string `json:"noun" form:"noun"`
	Explain         string `json:"explain" form:"explain"`
	Transliteration string `json:"transliteration" form:"transliteration"`
	IsDefault       int    `json:"is_default" form:"is_default"`
}
