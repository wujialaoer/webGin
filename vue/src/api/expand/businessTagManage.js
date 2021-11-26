import request from "@/utils/request";

const ClassName = "/BusinessTagManage";

/**
 * GET /api/v{version}/BusinessTagManage/Tag 查询BU下业务标签
*/
export function getTagList() {
    return request({
      url: `${ClassName}/Tag/`,
      method: "get"
    });
}

/**
 * post /api/v{version}/BusinessTagManage  addTAG 新增标签
 * @param {string} tagName
 * @param {string} parentId
*/
export function addTag(data) {
    return request({
      url: `${ClassName}/`,
      method: "post",
      data
    });
}

/**
 * post /api/v{version}/BusinessTagManage/{id} addTAG 新增标签
 * @param {string} tagName
 * @param {string} parentId
*/
export function updateTag(id, data) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "PUT",
      data
    });
}

/**
 * post /api/v{version}/BusinessTagManage/{id} deleteTAG 删除标签
*/
export function deleteTag(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "DELETE",
    });
}


export function getCitationAnalysis(data) {
    return request({
      url: `${ClassName}/`,
      method: "GET",
      params:data
    });
}
