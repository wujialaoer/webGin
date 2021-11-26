import request from "@/utils/request";

const ClassName = "/FAQPackage";

/**
 * GET /api/v{version}/FAQPackage 知识包-查询列表
 * @export
 * @returns
*/
export function getFAQPackageList() {
    return request({
      url: `${ClassName}`,
      method: "get"
    });
}

/**
 * GET /api/v{version}/FAQPackage/{id} 知识包-查询
 * @export
 * @returns
*/
export function getFAQPackageById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get"
    });
}

/**
 * DELETE /api/v{version}/FAQPackage/{id} 知识包-删除
 * @export
 * @returns
*/
export function deleteFAQPackageById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete"
    });
}

/**
 * POST  /api/v{version}/FAQPackage  知识包-新增
 * @export
 * @param {string} businessUnitId,
 * @param {string} name,
 * @returns
*/
export function addFAQPackage(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}

/**
 * GET  /api/v{version}/FAQPackage/MultiSelection  知识包-多选列表
 * @export
 * @param {string} businessUnitId,
 * @param {string} name,
 * @returns
*/
export function getMultiSelectionOptions() {
    return request({
      url: `${ClassName}/MultiSelection`,
      method: "get",
    });
}