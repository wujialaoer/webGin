import request from "@/utils/request";

const ClassName = "/Faq";

/**
 * POST/api/v{version}/Faq/Simple 问答管理-新增(简单知识)
 * @returns
*/
export function addSimple(data) {
    return request({
      url: `${ClassName}/Simple/`,
      method: "POST",
      data
    });
}

/**
 * PUT /api/v{version}/Faq/Simple/{id} 问答管理-编辑(简单知识)
 * @returns
*/
export function updateSimple(id,data) {
    return request({
      url: `${ClassName}/Simple/${id}/`,
      method: "PUT",
      data
    });
}

/**
 * PUT /api/v{version}/Faq/Simple/{id} 问答管理-根据ID查询(简单知识)
 * @returns
*/
export function getSimplefqaById(faqId) {
    return request({
      url: `${ClassName}/Simple/${faqId}/`,
      method: "GET",
    });
}




/**
 * POST /api/v{version}/Faq/MultipleRounds 问答管理-新增(多轮知识)
 * @returns
*/
export function addMultipleRounds(data) {
    return request({
      url: `${ClassName}/MultipleRounds/`,
      method: "POST",
      data
    });
}

/**
 * POST /api/v{version}/Faq/EditMultipleRounds  问答管理-编辑(多轮知识)
 * "faqId": "string",
  "faqPackageId": "string",
  "problem": "string",
  "answer": "string",
  "nodeList": [
    {
      "nodeId": "string",
      "type": "string",
      "nodeContent": "string",
      "top": 0,
      "left": 0,
      "data": {
        "nextNode": [
          {
            "nodeId": "string",
            "conditions": "string",
            "sourceAnchor": "string"
          }
        ]
      }
    }
  ]
 * @returns
*/
export function editMultipleRounds(id,data) {
    return request({
      url: `${ClassName}/EditMultipleRounds/${id}/`,
      method: "PUT",
      data
    });
}
export function getAllMultipleRounds() {
    return request({
      url: `${ClassName}/MultipleRounds/`,
      method: "get",
    });
}

/**
 * GET/api/v{version}/Faq/MultipleRounds 查询(多轮问答)
 * @returns
*/
export function getMultipleRounds(faqId) {
    return request({
      url: `${ClassName}/getMultipleRounds/${faqId}`,
      method: "get",
    });
}

/**
 * GET/api/v{version}/Faq/TypeSelect 知识管理-类型选择
 * @returns
*/
export function getTypeSelect() {
    return request({
      url: `${ClassName}/TypeSelect/`,
      method: "get",
    });
}

/**
 * POST  /api/v{version}/FaqTest  问答管理-测试集-新增
 * @export

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {int} TestType,  类型

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function addBatchFaqTest(data) {
    return request({
      url: `/FaqTest/Batch`,
      method: "post",
      data
    });
}

export const uploadImage = `${process.env.VUE_APP_BASE_API}${ClassName}/UploadImage/`;
