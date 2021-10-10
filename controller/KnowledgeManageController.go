package controller

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
	"strings"
	"webGin/models"
	kn "webGin/models/KnowledgeManage"
	"webGin/utils"
)

type KnowledgeManageController struct {
}

func (k *KnowledgeManageController) Router(engine *gin.Engine) {
	routerGroup := engine.Group("/FaqPackage")
	routerGroup.GET("/BuFaqPackage/", k.BuFaqPackage)
	engine.POST("/BusinessUnit/", k.AddBusinessUnit)
	engine.POST("/FaqPackage/", k.AddFaqPackage)
	engine.PUT("/FaqPackage/:id/", k.UpdateFaqPack)
	engine.DELETE("/FaqPackage/:id/", k.DeleteFaqPkg)
	engine.GET("/FaqPackage/Select/", k.FaqPkgSelect)

	engine.GET("/Faq/", k.GetFaq)
	engine.GET("/Faq/TypeSelect/", k.FaqTypeSelect)
	engine.POST("/Faq/Simple/", k.FaqSimple)
	engine.GET("/Faq/Simple/:id/", k.GetFaqSimple)
	engine.PUT("/Faq/Simple/:id/", k.UpdateFaqSimple)
	engine.GET("/Faq/MultipleRounds/", k.MultipleRounds)
	engine.POST("/Faq/MultipleRounds/", k.AddMultipleRounds)
	engine.GET("/Faq/getMultipleRounds/:id", k.GetMultipleRounds)

}

// GetMultipleRounds 获取单条多轮数据
func (k *KnowledgeManageController) GetMultipleRounds(ctx *gin.Context) {
	faq := kn.Faq{Id: ctx.Param("id")}
	has := utils.DbEngine.Find(&faq)
	if has.Error != nil {
		utils.Response(ctx, 400, "未找到", nil)
		return
	}
	if has.RowsAffected == 0 {
		utils.Response(ctx, 400, "未找到", nil)
		return
	}
	process := kn.Process{FaqId: faq.Id}
	has = utils.DbEngine.Where(kn.Process{FaqId: faq.Id}).Find(&process)
	if has.Error != nil {
		utils.Response(ctx, 400, "未找到", nil)
		return
	}
	if has.RowsAffected == 0 {
		utils.Response(ctx, 400, "未找到", nil)
		return
	}
	data := make(map[string]interface{})
	data["faqId"] = faq.Id
	data["faqPackageId"] = faq.FaqPackageId
	data["problem"] = faq.Problem
	data["answer"] = faq.Answer
	data["nodeList"] = MultipleRoundsNodes(process.StartNode, process.Id, make([]map[string]interface{}, 0))
	utils.Response(ctx, 200, "success", data)
}

func MultipleRoundsNodes(startNode string, processId string, data []map[string]interface{}) []map[string]interface{} {
	readyNo := make([]string, 0)
all:
	node := kn.Node{NodeId: startNode}
	has := utils.DbEngine.Find(&node)
	if has.RowsAffected == 0 {
		return data
	}
	nodeData := map[string]interface{}{
		"nodeId":      node.NodeId,
		"type":        node.NodeType,
		"nodeContent": node.Description,
		"top":         node.Top,
		"left":        node.Left,
	}
	data = append(data, nodeData)
	readyNo = append(readyNo, node.NodeId)

	var allTrs []kn.Transition
	utils.DbEngine.Where(kn.Transition{ProcessId: processId}).Find(&allTrs)
	if allTrs == nil {
		return data
	}

	nextNodeIds := make([]string, 0)

	for _, tr := range allTrs {
		nextNode := make([]map[string]interface{}, 0)
		if len(nextNodeIds) > 0 && utils.IsHave(nextNodeIds, tr.ToNodeId) {
			continue
		}
		next := kn.Node{NodeId: tr.ToNodeId}
		has = utils.DbEngine.Find(&next)
		if has.RowsAffected == 0 {
			return data
		}
		fmt.Println(next)
		nextData := map[string]interface{}{
			"nodeId":       next.NodeId,
			"type":         next.NodeType,
			"nodeContent":  next.Description,
			"conditions":   tr.Conditions,
			"sourceAnchor": tr.SourceAnchor,
		}
		nextNode = append(nextNode, nextData)
		readyNo = append(readyNo, next.NodeId)
		nodeData["data"] = map[string]interface{}{
			"nextNode": nextNode,
		}
		//if next.NodeType == "Exit" && utils.IsHave(readyNo, next.NodeId) {
		//	return data
		//}
		if len(readyNo) > 0 && utils.IsHave(readyNo, tr.ToNodeId) {
			continue
		}
		utils.DbEngine.Not(readyNo).Where(kn.Transition{ProcessId: processId}).Find(&allTrs)
		if allTrs == nil {
			return data
		}
		goto all

	}

	return data
}

// MultipleRounds  获取多轮初始数据
func (k *KnowledgeManageController) MultipleRounds(ctx *gin.Context) {
	utils.Response(ctx, 200, "success", map[string]interface{}{
		"faqPackageId":         nil,
		"problem":              nil,
		"answer":               nil,
		"faqType":              0,
		"creationTime":         nil,
		"creatorId":            nil,
		"lastModificationTime": nil,
		"lastModifierId":       nil,
		"version":              nil,
		"name":                 nil,
		"trainingCount":        nil,
		"id":                   nil,
	})
}

// AddMultipleRounds 新增多轮
func (k *KnowledgeManageController) AddMultipleRounds(ctx *gin.Context) {
	addMul := new(MultipleRoundsHandle)
	ctx.BindJSON(&addMul)
	if has := utils.DbEngine.Find(&kn.FaqPackage{Id: addMul.FaqPackageId}); has.RowsAffected == 0 {
		utils.Response(ctx, 400, "知识包未找到", nil)
		return
	}
	faq := kn.Faq{Id: utils.UUID4(), FaqPackageId: addMul.FaqPackageId, Problem: addMul.Problem, Answer: addMul.Answer, FaqType: 1}
	utils.DbEngine.Create(&faq)
	process := kn.Process{FaqId: faq.Id, Id: utils.UUID4(), ProcessName: addMul.Problem}
	for _, n := range addMul.NodeList {
		if n.Type == "Root" {
			process.StartNode = n.NodeId
			continue
		}
		if n.Type == "Exit" {
			process.EndNode = n.NodeId
			continue
		}
	}
	utils.DbEngine.Create(&process)
	for _, nodes := range addMul.NodeList {
		newNode := kn.Node{
			NodeId:      nodes.NodeId,
			NodeType:    nodes.Type,
			NodeName:    nodes.Name,
			Top:         nodes.Top,
			Left:        nodes.Left,
			Description: nodes.NodeContent,
			ProcessId:   process.Id,
		}
		utils.DbEngine.Create(&newNode)
		fmt.Println(newNode)
		if len(nodes.Data.NextNode) == 0 {
			continue
		}
		for _, next := range nodes.Data.NextNode {

			tran := kn.Transition{
				Id:           utils.UUID4(),
				ProcessId:    process.Id,
				FromNodeId:   nodes.NodeId,
				ToNodeId:     next.NodeId,
				Conditions:   next.Conditions,
				SourceAnchor: next.SourceAnchor,
			}
			if next.Conditions != "" {
				tran.CondExpression = strings.Join(strings.Split(next.Conditions, "|"), "||")
				tran.Variable = "@0" + next.Conditions
			}
			utils.DbEngine.Create(&tran)
		}
	}
	utils.Response(ctx, 200, "success", addMul)
}

// UpdateFaqSimple 更新单轮
func (k *KnowledgeManageController) UpdateFaqSimple(ctx *gin.Context) {
	id := ctx.Param("id")
	upSim := new(FaqSimpleHandle)
	ctx.BindJSON(upSim)
	faq := kn.Faq{Id: id}
	has := utils.DbEngine.Find(&faq)
	if has.RowsAffected > 0 {
		faq.Problem = upSim.Problem
		faq.Answer = upSim.Answer
		faq.Problem = upSim.Problem
		utils.DbEngine.Updates(&faq)
		utils.Response(ctx, 200, "success", nil)
		return
	}
	utils.Response(ctx, 400, "更新失败", nil)
}

// GetFaqSimple 单挑单轮
func (k *KnowledgeManageController) GetFaqSimple(ctx *gin.Context) {
	id := ctx.Param("id")
	faq := kn.Faq{Id: id}
	has := utils.DbEngine.Find(&faq)
	if has.RowsAffected > 0 {
		ctx.JSON(http.StatusOK, faq)
		return
	}
	utils.Response(ctx, 200, "success", faq)

}

// FaqSimple 单轮新增
func (k *KnowledgeManageController) FaqSimple(ctx *gin.Context) {
	addSimple := new(FaqSimpleHandle)
	ctx.BindJSON(addSimple)
	fmt.Println(addSimple.Problem, addSimple.Answer)
	faq := kn.Faq{Problem: addSimple.Problem}
	has := utils.DbEngine.Where(faq).Find(&faq)
	if has.RowsAffected > 0 {
		utils.Response(ctx, 400, "已存在", nil)
		return
	}
	utils.DbEngine.Create(&kn.Faq{Problem: addSimple.Problem, FaqType: addSimple.FaqType, Answer: addSimple.Answer, Id: utils.UUID4(), FaqPackageId: addSimple.FaqPackageId})
	utils.Response(ctx, 200, "success", nil)
}

// FaqTypeSelect faq类型
func (k *KnowledgeManageController) FaqTypeSelect(ctx *gin.Context) {
	data := make([]map[string]interface{}, 0)
	data = append(data, map[string]interface{}{
		"value": "0",
		"text":  "单轮问答",
	},
		map[string]interface{}{
			"value": "1",
			"text":  "多轮问答",
		})
	utils.Response(ctx, 200, "success", data)
}

// GetFaq 获取问答管理
func (k *KnowledgeManageController) GetFaq(ctx *gin.Context) {
	page, _ := strconv.Atoi(ctx.Query("page"))
	pageSize, _ := strconv.Atoi(ctx.Query("pageSize"))
	faq := make([]kn.Faq, 0)
	utils.DbEngine.Find(&faq)
	total := len(faq)
	utils.DbEngine.Limit(pageSize).Offset((page - 1) * pageSize).Find(&faq)
	data := make([]map[string]interface{}, 0)
	for _, f := range faq {
		disAnswer := f.Answer
		if len(f.Answer) > 50 {
			disAnswer = f.Answer[:50] + "..."
		}
		faqPkg := kn.FaqPackage{Id: f.FaqPackageId}
		utils.DbEngine.Find(&faqPkg)
		user := models.UserInfo{Id: f.LastModifierId}
		utils.DbEngine.Find(&user)
		data = append(data, map[string]interface{}{
			"answer":                 f.Answer,
			"faq_package":            f.FaqPackageId,
			"faq_type":               f.FaqType,
			"problem":                f.Problem,
			"dis_answer":             disAnswer,
			"id":                     f.Id,
			"last_modification_time": f.LastModificationTime.Format("2006-01-02T15:04:05"),
			"last_modifier_id":       f.LastModifierId,
			"creater":                user.UserName,
			"name":                   faqPkg.Name,
		})
	}
	utils.PageResponse(ctx, 200, "success", data, page, pageSize, total)
}

// FaqPkgSelect 知识应用选择
func (k *KnowledgeManageController) FaqPkgSelect(ctx *gin.Context) {
	bus := make([]kn.BusinessUnit, 0)
	has := utils.DbEngine.Find(&bus)
	data := make([]map[string]interface{}, 0)
	if has.RowsAffected == 0 {
		utils.PageResponse(ctx, 400, "未找到数据", data, 1, 20, 0)
		return
	}
	for _, bu := range bus {
		buData := make(map[string]interface{})
		buData["text"] = bu.Name
		buData["value"] = bu.Id
		faqPkg := make([]kn.FaqPackage, 0)
		fData := make([]map[string]interface{}, 0)
		utils.DbEngine.Find(&faqPkg)
		if len(faqPkg) > 0 {
			for _, f := range faqPkg {
				fData = append(fData, map[string]interface{}{
					"text":  f.Name,
					"value": f.Id,
				})
			}
		}
		buData["children"] = fData
		data = append(data, buData)

	}
	utils.Response(ctx, 200, "success", data)
}

// DeleteFaqPkg 删除知识包
func (k *KnowledgeManageController) DeleteFaqPkg(ctx *gin.Context) {

	id := ctx.Param("id")
	fmt.Println("DeleteFaqPkg", id)
	faqPkg := kn.FaqPackage{Id: id}
	has := utils.DbEngine.Find(&faqPkg)
	if has.Error != nil {
		utils.Response(ctx, 400, "failed", nil)
		return
	}
	if has.RowsAffected > 0 {
		utils.DbEngine.Delete(&faqPkg)
		utils.Response(ctx, 200, "删除成功", nil)
		return
	}
	utils.Response(ctx, 200, "数据不存在", nil)
}

// UpdateFaqPack 更新知识包
func (k *KnowledgeManageController) UpdateFaqPack(ctx *gin.Context) {
	id := ctx.Param("id")
	fmt.Println(id)
	fmt.Println(ctx.Request.Form)
	updateFaqPkg := new(FaqPkgHandle)
	ctx.BindJSON(updateFaqPkg)
	faqPkg := kn.FaqPackage{}
	has := utils.DbEngine.Where("faq_package_id = ?", updateFaqPkg.FaqPackageId).Find(&faqPkg)
	fmt.Println(21221, has.RowsAffected)
	if has.Error != nil {
		utils.Response(ctx, 400, "failed", nil)
		return
	}
	faqPkg.Name = updateFaqPkg.Name
	utils.DbEngine.Save(&faqPkg)
	utils.Response(ctx, 200, "success", nil)

}

// AddFaqPackage 新增知识包
func (k *KnowledgeManageController) AddFaqPackage(ctx *gin.Context) {
	addPkg := new(FaqPkgHandle)
	ctx.BindJSON(addPkg)
	faqPkg := kn.FaqPackage{
		Name:           addPkg.Name,
		Id:             utils.UUID4(),
		BusinessUnitId: addPkg.BusinessUnitId,
	}
	utils.DbEngine.Create(&faqPkg)
	utils.Response(ctx, 200, "success", nil)
}

// BuFaqPackage 获取Bu,知识包
func (k *KnowledgeManageController) BuFaqPackage(ctx *gin.Context) {
	bus := make([]kn.BusinessUnit, 0)
	data := make([]map[string]interface{}, 0)
	utils.DbEngine.Find(&bus)
	for _, bu := range bus {
		d := make(map[string]interface{})
		d["id"] = bu.Id
		d["label"] = bu.Name
		row := make([]map[string]interface{}, 0)
		faqPack := make([]kn.FaqPackage, 0)
		utils.DbEngine.Where("business_unit_id = ?", bu.Id).Find(&faqPack)
		if len(faqPack) > 0 {
			for _, faq := range faqPack {
				r := make(map[string]interface{})
				r["id"] = faq.Id
				r["label"] = faq.Name
				row = append(row, r)
			}
		}
		d["children"] = row
		data = append(data, d)
	}
	utils.Response(ctx, 200, "success", data)
}

// AddBusinessUnit 新增BU
func (k *KnowledgeManageController) AddBusinessUnit(ctx *gin.Context) {
	addBu := new(FaqPkgHandle)
	ctx.BindJSON(addBu)
	utils.DbEngine.Create(&kn.BusinessUnit{
		Id:   utils.UUID4(),
		Name: addBu.Name,
	})
	utils.Response(ctx, 200, "success", nil)
}

// FaqPkgHandle 知识包
type FaqPkgHandle struct {
	Name           string `json:"name,omitempty" form:"name"`
	BusinessUnitId string `json:"business_unit_id,omitempty" form:"business_unit"`
	FaqPackageId   string `json:"id,omitempty" form:"id"`
}

// FaqSimpleHandle 单轮
type FaqSimpleHandle struct {
	Problem      string `json:"problem" form:"problem"`
	Answer       string `json:"answer" form:"answer"`
	FaqPackageId string `json:"faq_package" form:"faq_package"`
	FaqType      int    `json:"faq_type" form:"faq_type"`
}

type MultipleRoundsHandle struct {
	FaqPackageId string `json:"faqPackageId" form:"faqPackageId"`
	Problem      string `json:"problem" form:"problem"`
	Answer       string `json:"answer" form:"answer"`
	NodeList     []struct {
		NodeId       string  `json:"nodeId" form:"nodeId"`
		Type         string  `json:"type" form:"type"`
		Name         string  `json:"name" form:"name"`
		Conditions   string  `json:"conditions" form:"conditions"`
		SourceAnchor string  `json:"sourceAnchor" form:"sourceAnchor"`
		NodeContent  string  `json:"nodeContent" form:"nodeContent"`
		Status       string  `json:"status" form:"status"`
		Top          float64 `json:"top" form:"top"`
		Left         float64 `json:"left" form:"left"`
		Data         struct {
			NextNode []struct {
				NodeId       string `json:"nodeId" form:"nodeId"`
				Name         string `json:"name" form:"name"`
				NodeContent  string `json:"nodeContent" form:"nodeContent"`
				Status       string `json:"status" form:"status"`
				Conditions   string `json:"conditions" form:"conditions"`
				Type         string `json:"type" form:"type"`
				SourceAnchor string `json:"sourceAnchor" form:"sourceAnchor"`
			} `json:"nextNode" form:"nextNode"`
		} `json:"data" form:"data"`
	} `json:"nodeList" form:"nodeList"`
	FaqType int `json:"faq_type" form:"faq_type"`
}
