/* 词典管理 - 过滤词 */
import request from "@/utils/request";

const ClassName = "/FilterWords";

/**
 * POST /api/v{version}/FilterWords 过滤词-新增
 * @export
 * @param {string} standardName
 * @param {string} aliasNames
 * @returns
*/

export  function addFilterWords(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}

/**
 * GET /api/v{version}/FilterWords 过滤词-查询列表
 * @export
 * @param {string} searchword
 * @returns
*/

export  function getFilterWords(searchword) {
    let url = `${ClassName}`;
    if(searchword){
        url =  `${ClassName}?$filter=standardName in ${searchword} or aliasName in ${searchword}`;
    }
    return request({
      url: url,
      method: "get",
    });
}

/**
 * GET /api/v{version}/FilterWords 过滤词-查询实体
 * @export
 * @param {string} id
 * @returns
*/

export  function getFilterWordsById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get",
    });
}

/**
 * DELETE /api/v{version}/FilterWords 过滤词-删除
 * @export
 * @param {string} id
 * @returns
*/

export  function deleteFilterWords(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete",
    });
}
