import request from "@/utils/request";

const ClassName = "/AutomaticFaqTag";

/**
 * GET /api/v{version}/AutomaticFaqTag/Tag 查询BU下业务标签
*/
export function getTagList() {
    return request({
      url: `${ClassName}/Tag`,
      method: "get"
    });
}

/**
 * post /api/v{version}/AutomaticFaqTag  addTAG 新增标签
 * @param {string} tagName
 * @param {string} parentId
*/
export function addAutoTag(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}

/**
 * post /api/v{version}/AutomaticFaqTag/{id} addTAG 新增标签
 * @param {string} tagName
 * @param {string} parentId
*/
export function updateAutoTag(id, data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "PUT",
      data
    });
}

/**
 * post /api/v{version}/AutomaticFaqTag/{id} deleteTAG 删除标签
*/
export function deleteAutoTag(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "DELETE",
    });
}