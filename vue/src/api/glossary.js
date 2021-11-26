/* 词典管理-名词解释 */
import request from "@/utils/request";

const ClassName = "/Glossary";

/**
 * GET /api/v{version}/Glossary 名词解释-查询列表
 * @export
 * @returns
*/
export  function getGlossaryList(data) {
    return request({
      url: `${ClassName}/`,
      method: "get",
      data
    });
}

/**
 * POST /api/v{version}/Glossary 名词解释-新增
 * @export
 * @param {string} noun
 * @param {string} explain
 * @param {boolean} choice
 * @param {string} transliteration
 * @returns
*/
export  function addGlossary(data) {
    return request({
      url: `${ClassName}/`,
      method: "post",
      data
    });
}

/**
 * GET /api/v{version}/Glossary 名词解释-查询实体
 * @export
 * @param {string} setName
 * @param {string} content
 * @returns
*/
export  function getGlossaryById(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "get",
    });
}

/**
 * DELETE /api/v{version}/Glossary 名词解释-删除
 * @export
 * @returns
*/
export  function deleteGlossaryById(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "delete",
    });
}

/**
 * POST /api/v{version}/Glossary/Import 别名-导入
 * @export
 * @returns
*/
export  function importFileAboutGlossary() {
    return request({
      url: `${ClassName}/Import/`,
      method: "post",
    });
}
