import request from "@/utils/request";

const ClassName = "/FAQ";

/**
 * GET /api/v{version}/FAQ/Select 问答管理-知识包选择
 * @export
 * @returns
 */

export function getOptions() {
  return request({
    url: `${ClassName}/Select/`,
    method: "get"
  });
}

/**
 * GET /api/v{version}/FAQ 问答管理-查询列表
 * @export
 * @returns
 */
export function getFAQList(data) {
  return request({
    url: `${ClassName}/`,
    method: "get"
  });
}

/**
 *GET /api/v{version}/FAQ/TypeSelect 知识管理-类型选择
 * @export
 * @returns
 */
export function getTypeSelect() {
  return request({
    url: `${ClassName}/TypeSelect/`,
    method: "get"
  });
}

/**
 * POST /api/v{version}/FAQ/Simple 问答管理-新增(简单知识)
 * @export
 * @param {string} knPacksId,
 * @param {string} problem,
 * @param {string} answer,
 * @returns
 */
export function addSimple(data) {
  return request({
    url: `${ClassName}/Simple/`,
    method: "post",
    data
  });
}

/**
 * POST /api/v{version}/FAQ/MultipleRounds 问答管理-新增(多轮知识)
 * @export
 * @param {string} knPacksId,
 * @param {string} problem,
 * @param {string} answer,
 * @param {Array} nodeList,
 * @returns
 */
export function addMultipleRounds(data) {
  return request({
    url: `${ClassName}/MultipleRounds/`,
    method: "post",
    data
  });
}

/**
 * GET  /api/v{version}/FAQ/MultipleRounds/{faqId}  问答管理-查询(多轮问答)
 * @export
 * @param {string} knPacksId,
 * @param {string} problem,
 * @param {string} answer,
 * @returns
 */
export function getMultipleRounds(faqId) {
  return request({
    url: `${ClassName}/MultipleRounds/${faqId}/`,
    method: "get",
  });
}

/**
 * POST  /api/v{version}/FAQ/Import  问答管理-导入
 * @export
 * @returns
 */
export function ImportFAQ() {
  return request({
    url: `${ClassName}/Import/`,
    method: "post",
  });
}
