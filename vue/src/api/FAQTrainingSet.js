import request from "@/utils/request";
const ClassName = "/FAQTrainingSet";

/**
 * GET  /api/v{version}/FAQTrainingSet/{knFaqId}  知识管理-问答管理-训练集-查询-词频统计
 * @export
 * @returns
*/
export function getWordsFraq(knFaqId) {
    return request({
      url: `${ClassName}/${knFaqId}`,
      method: "get",
    });
}

/**
 * POST  /api/v{version}/FAQTrainingSet  知识管理-问答管理-训练集-新增
 * @export
 * @param {string} knFaqId,   父ID
 * @param {string} problem,  问题名称
 * @returns
*/
export function addFAQTrainingSet(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}

/**
 * POST  /api/v{version}/FAQTrainingSet/Interpretation 知识管理-问答管理-训练集-专有词典-新增
 * @export
 * @param {string} knFaqId,
 * @param {string} standardName,
 * @returns
*/
export function addInterpretation(data) {
    return request({
      url: `${ClassName}/Interpretation`,
      method: "post",
      data
    });
}

/**
 * POST  /api/v{version}/FAQTrainingSet/Wordset  问答管理-训练集-词集合-新增
 * @export
 * @param {string} knFaqId,
 * @param {string} setName,
 * @returns
*/
export function addWordset(data) {
    return request({
      url: `${ClassName}/Wordset`,
      method: "post",
      data
    });
}

/**
 * PUT  /api/v{version}/FAQTrainingSet/{id}  知识管理-问答管理-训练集-修改
 * @export
 * @param {string} id,
 * @param {string} problem,
 * @returns
*/
export function editFAQTrainingSet(id,data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "put",
      data
    });
}

/**
 * DELETE  /api/v{version}/FAQTrainingSet/{id}  知识管理-问答管理-训练集-删除
 * @export
 * @param {string} id,
 * @param {string} setName,
 * @returns
*/
export function deleteFAQTrainingSet(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete",
    });
}