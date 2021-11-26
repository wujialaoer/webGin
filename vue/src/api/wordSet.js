/* 词典管理 - 词集合 */
import request from "@/utils/request";

const ClassName = "/WordSet";

/**
 * GET /api/v{version}/WordSet 词集合-查询列表
 * @export
 * @returns
*/
export  function getWordSetList() {
    return request({
      url: `${ClassName}`,
      method: "get",    
      
    });
}

/**
 * POST /api/v{version}/WordSet 词集合-新增
 * @export
 * @param {string} setName
 * @param {array[string]} contents
 * @returns
*/
export  function addWordSet(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}

/**
 * GET /api/v{version}/WordSet 词集合-查询实体
 * @export
 * @param {string} setName
 * @param {string} content
 * @returns
*/
export  function getWordSetById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get",
    });
}

/**
 * DELETE /api/v{version}/WordSet 词集合-删除
 * @export
 * @param {string} setName
 * @param {string} content
 * @returns
*/
export  function deleteWordSetById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete",
    });
}

/**
 * POST /api/v{version}/WordSet/Import 别名-导入
 * @export
 * @returns
*/
export  function importFileAboutWordSet() {
    return request({
      url: `${ClassName}/Import`,
      method: "post",
    });
}