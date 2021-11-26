import request from "@/utils/request";
const ClassName = "/FAQTestSet";

/**
 * GET  /api/v{version}/FAQTestSet/{knFaqId}  知识管理-问答管理-测试集-查询列表
 * @export
 * @param {string} knFaqId,
 * @param {string} name,
 * @returns
*/
export function getFAQTestSetList(knFaqId) {
    return request({
      url: `${ClassName}/${knFaqId}`,
      method: "get",
    });
}

/**
 * POST  /api/v{version}/FAQTestSet  知识管理-问答管理-测试集-新增
 * @export
 * @param {string} knAskAnswerId,
 * @param {string} problem,
 * @param {0} type,
 * @returns
*/
export function addFAQTestSet(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}