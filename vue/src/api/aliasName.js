/* 词典管理 - 过滤词 */
import request from "@/utils/request";

const ClassName = "/AliasName";

/**
 * GET /api/v{version}/AliasName 别名-查询列表
 * @export
 * @returns
*/
export  function getAliasList(data) {
    return request({
      url: `${ClassName}`,
      method: "get",
      data
    });
}


/**
 * POST /api/v{version}/AliasName 别名-新增
 * @export
 * @param {string} standardName
 * @param {array[string]} aliasNames
 * @returns
*/

export  function addAlias(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}

/**
 * GET /api/v{version}/AliasName 别名-查询列表
 * @export
 * @returns
*/

export  function getAliasById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get",
    });
}

/**
 * DELETE /api/v{version}/AliasName 别名-删除
 * @export
 * @returns
*/

export  function deleteAliasById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete",
    });
}

/**
 * POST /api/v{version}/AliasName/Import 别名-导入
 * @export
 * @returns
*/
export  function importFileAboutAlias() {
    return request({
      url: `${ClassName}/Import`,
      method: "post",
    });
}