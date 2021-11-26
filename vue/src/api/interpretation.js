/* 词典管理-专有词典 */
import request from "@/utils/request";

const ClassName = "/Interpretation";

/**
 * POST /api/v{version}/Interpretation 专有词典-新增
 * @export
 * @param {string} standardName
 * @param {string} aliasNames
 * @returns
*/

export  function addInterpretation(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}

/**
 * GET /api/v{version}/Interpretation 专有词典-查询列表
 * @export
 * @param {string} searchword
 * @returns
*/

export  function getInterpretation(searchword) {
    let url = `${ClassName}`;
    if(searchword){
        url =  `${ClassName}?$filter=standardName in ${searchword} or aliasName in ${searchword}`;
    }
    return request({
      url: url,
      method: "get",
    });
}

