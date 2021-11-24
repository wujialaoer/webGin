package controller

import (
	"github.com/gin-gonic/gin"
	"net/http"
	"strconv"
	"strings"
	"time"
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
	engine.POST("/Faq/addMultipleRounds/", k.AddMultipleRounds)
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
	var nodeList []map[string]interface{}
	data["nodeList"] = MultipleRoundsNodes(nodeList, process)
	utils.Response(ctx, 200, "success", data)
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
	user := GetCurrentUser(ctx.Request.Header.Get("Authorization"))
	if has := utils.DbEngine.Find(&kn.FaqPackage{Id: addMul.FaqPackageId}); has.RowsAffected == 0 {
		utils.Response(ctx, 400, "知识包未找到", nil)
		return
	}
	faq := kn.Faq{Id: utils.UUID4(), FaqPackageId: addMul.FaqPackageId,
		Problem: addMul.Problem, Answer: addMul.Answer,
		FaqType: 1, LastModificationTime: time.Now(), LastModifierId: user["userId"]}
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
	updateFaqPkg := new(FaqPkgHandle)
	ctx.BindJSON(updateFaqPkg)
	faqPkg := kn.FaqPackage{}
	has := utils.DbEngine.Where("faq_package_id = ?", updateFaqPkg.FaqPackageId).Find(&faqPkg)
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

// MultipleRoundsNodes 多轮节点数据
func MultipleRoundsNodes(data []map[string]interface{}, process kn.Process) []map[string]interface{} {

	allTrs := make([]kn.Transition, 0)
	//utils.DbEngine.Distinct("from_node_id").Find(&allTrs)
	utils.DbEngine.Where(kn.Transition{ProcessId: process.Id}).Distinct("from_node_id").Find(&allTrs)
	for _, tr := range allTrs {
		trs := make([]kn.Transition, 0)
		utils.DbEngine.Where(kn.Transition{FromNodeId: tr.FromNodeId, ProcessId: process.Id}).Distinct("id", "to_node_id").Find(&trs)
		//	根据拿到的node_id查node信息
		node := kn.Node{NodeId: tr.FromNodeId}
		utils.DbEngine.Find(&node)
		nodeInfo := map[string]interface{}{
			"nodeId":      node.NodeId,
			"type":        node.NodeType,
			"nodeContent": node.Description,
			"top":         node.Top,
			"left":        node.Left,
		}
		nextNodes := make([]map[string]string, 0)
		for _, t := range trs {
			n := kn.Node{NodeId: t.ToNodeId}
			utils.DbEngine.Find(&n)
			ts := kn.Transition{
				Id: t.Id,
			}
			utils.DbEngine.Where(kn.Transition{ProcessId: process.Id}).Find(&ts)

			nextNodes = append(nextNodes, map[string]string{
				"nodeId":       n.NodeId,
				"type":         n.NodeType,
				"nodeContent":  n.Description,
				"conditions":   ts.Conditions,
				"sourceAnchor": ts.SourceAnchor,
			})
		}
		// 拼接
		nodeInfo["data"] = map[string]interface{}{
			"nextNode": nextNodes,
		}
		//返回
		data = append(data, nodeInfo)
	}
	endNode := kn.Node{}
	utils.DbEngine.Where(kn.Node{ProcessId: process.Id, NodeType: "Exit"}).Find(&endNode)
	data = append(data, map[string]interface{}{
		"nodeId":      endNode.NodeId,
		"type":        endNode.NodeType,
		"nodeContent": endNode.Description,
		"top":         endNode.Top,
		"left":        endNode.Left,
		"data": map[string]interface{}{
			"nextNode": []map[string]string{},
		},
	})
	return data
}

/*
{"faqPackageId":"89e405ebad4c4746bb2510cb49f73826","problem":"提问","answer":"引导","nodeList":[{"nodeId":"cfa9bad0-4ced-11ec-a832-a598d3888fcd","type":"Root","name":"","conditions":"","sourceAnchor":"","nodeContent":" \n              开始\n              ","status":"0","top":163,"left":114,"data":{"nextNode":[{"nodeId":"d1b171b0-4ced-11ec-a832-a598d3888fcd","name":"","nodeContent":"","status":"","conditions":"开始提问","type":"Problem","sourceAnchor":"Right"}]}},{"nodeId":"d1b171b0-4ced-11ec-a832-a598d3888fcd","type":"Problem","name":"","conditions":"","sourceAnchor":"","nodeContent":"提问？","status":"0","top":177,"left":206,"data":{"nextNode":[{"nodeId":"d30a4af0-4ced-11ec-a832-a598d3888fcd","name":"","nodeContent":"","status":"","conditions":"转到引导","type":"Option","sourceAnchor":"Right"}]}},{"nodeId":"d30a4af0-4ced-11ec-a832-a598d3888fcd","type":"Option","name":"","conditions":"","sourceAnchor":"","nodeContent":"引导语","status":"0","top":296,"left":173,"data":{"nextNode":[{"nodeId":"d4115ab0-4ced-11ec-a832-a598d3888fcd","name":"","nodeContent":"","status":"","conditions":"答案","type":"Answer","sourceAnchor":"Right"}]}},{"nodeId":"d4115ab0-4ced-11ec-a832-a598d3888fcd","type":"Answer","name":"","conditions":"","sourceAnchor":"","nodeContent":"答案","status":"0","top":310,"left":521,"data":{"nextNode":[{"nodeId":"d5749430-4ced-11ec-a832-a598d3888fcd","name":"","nodeContent":"","status":"","conditions":"","type":"Exit","sourceAnchor":"Left"}]}},{"nodeId":"d5749430-4ced-11ec-a832-a598d3888fcd","type":"Exit","name":"","conditions":"","sourceAnchor":"","nodeContent":" \n              结束\n              ","status":"0","top":339,"left":828,"data":{"nextNode":[]}}],"faq_type":1}

*/
