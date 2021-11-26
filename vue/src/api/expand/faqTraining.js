import request from "@/utils/request";

const ClassName = "/FaqTraining";

/**
 * GET/api/v{version}/FaqTraining/WordFrequencyCount 问答管理-训练集-查询列表
 */
export function getTrainSetListByQustionId(id) {
  return request({
    url: `${ClassName}/WordFrequencyCount/${id}/`,
    method: "get",
  });
}

/**
 * POST  /api/v{version}/FaqTraining/Interpretation  问答管理-训练集-专有词典-新增
 */
export function addInterpretation(data) {
  return request({
    url: `${ClassName}/Interpretation/`,
    method: "post",
    data
  });
}

export function InterpretationAdd(data) {
  return request({
    url: `${ClassName}/InterpretationAdd`,
    method: "post",
    data
  });
}

/**
 * POST  /api/v{version}/FaqTraining/Wordset  问答管理-训练集-词集合-新增
 */
export function addWordset(data) {
  return request({
    url: `${ClassName}/Wordset/`,
    method: "post",
    data
  });
}

/**
 * DELETE  /api/v{version}/FaqTraining/Interpretation  知识管理-问答管理-训练集-专有词典-删除
 * faqId
 * entityLuisId
 */
export function deleteProperInTrain(data) {
  return request({
    url: `${ClassName}/Interpretation/`,
    method: "DELETE",
    data
  });
}


/**
 * /api/v{version}/FaqTraining/SimpleEntity
 * 知识管理-问答管理-训练集-专有词典-简单实体-新增或者删除实体标记
 *"faqTrainingId": "string",
 **  "startIndex": 0,
 ** "endIndex": 0,
 ** "entityId": "string",
 * "name": "string"
 */
export function toggleSimpleEntity(data) {
  return request({
    url: `${ClassName}/SimpleEntity/`,
    method: "POST",
    data
  });
}

/**
 * post /api/v{version}/BusinessFaqTag/BusinessFaq  添加
 *   "faqId": "string",
 "ids": [
 [
 "string"
 ]
 */
export function addBusinessTag(data) {
  return request({
    url: `${ClassName}/BusinessTag/`,
    method: "post",
    data
  });
}


/**
 * DELETE /api/v{version}/BusinessFaqTag/BusinessFaq  添加
 * /api/v{version}/FaqTraining/BusinessTag/{id}
 * 知识管理-问答管理-训练集- 删除业务标签
 "id"
 */
export function deleteBusinessTag(id, data) {
  return request({
    url: `${ClassName}/BusinessTag/${id}/`,
    method: "delete",
    data
  });
}

/**
 * POST  /api/v{version}/FaqTraining/AutomaticTag  知识管理-问答管理-训练集-删除自动标签
 "tagName": "string",
 "faqId": "string"
 */
export function deleteAutoTag(data) {
  return request({
    url: `${ClassName}/AutomaticTag`,
    method: "post",
    data
  });
}

/**
 *POST /api/v{version}/FaqTraining/InterpretationDelete 知识管理-问答管理-训练集-专有词典-简单实体-删除
 "faqId": "string",
 "name": "string"
 */
export function deleteProper(data) {
  return request({
    url: `${ClassName}/InterpretationDelete`,
    method: "post",
    data
  });
}
