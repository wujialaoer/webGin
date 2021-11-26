import request from "@/utils/request";

const ClassName = "/Welcoming";

/**
 * GET /api/v{version}/Welcoming/Personality 欢迎语-个性统计
 * @export
 * @returns
 */
export  function getPersonality() {
    return request({
      url: `${ClassName}/Personality/`,
      method: "get"
    });
}

/**
 * POST /api/v{version}/Welcoming/Personality 欢迎语-新增个性
 * @export
 * @param {string} type
 * @param {string} name
 * @returns
 */
export  function addPersonality(data) {
    return request({
      url: `${ClassName}/Personality/`,
      method: "post",
      data
    });
}

/**
 * DELETE /api/v{version}/Welcoming/Personality/{id} 欢迎语-删除个性
 * @export
 * @param {string} type
 * @param {string} name
 * @returns
 */
export  function deletePersonality(id) {
    return request({
      url: `${ClassName}/Personality/${id}/`,
      method: "delete",
    });
}

/**
 * GET /api/v{version}/Welcoming/DropDown 欢迎语-类型下拉
 * @export
 * @returns
 */
export  function getWelcomTypeDropDown() {
    return request({
      url: `${ClassName}/DropDown/`,
      method: "get"
    });
}

/**
 * GET /api/v{version}/Welcoming/DropDown/Personality 欢迎语-个性下拉
 * @export
 * @returns
 */
export  function getWelcomingDropDown() {
    return request({
      url: `${ClassName}/DropDown/Personality/`,
      method: "get"
    });
}

/**
 * GET /api/v{version}/Welcoming/Personality/List
 * 欢迎语-分页查询个性明细
 查询条件规则
 ?$filter=name eq 名字 or age gt 10
 或者?$filter=name eq 名字 and age gt 10
 注意： or 和 and 同时只能出现一种
 排序规则
 默认使用id asc排序
 ?$orderby=displayName DESC
 或者?$orderby=displayName,displayName DESC 多给排序字段使用","分割
 * @export
 * @returns
 */
export  function getWelcomingList() {
    return request({
      url: `${ClassName}/Personality/List/`,
      method: "get"
    });
}

/**
 * POST /api/v{version}/Welcoming/Personality/Time 欢迎语-根据个性添加欢迎语-时间
 * @export
 * @param {string} knWelcomingId
 * @param {string} startTime
 * @param {string} endTime
 * @param {string} sentence
 * @returns
*/

export  function addWelcomeWithCharaByTime(data) {
    return request({
      url: `${ClassName}/Personality/`,
      method: "post",
      data
    });
}

/**
 * POST /api/v{version}/Welcoming/Personality/Day 欢迎语-根据个性添加欢迎语-日期
 * @export
 * @param {string} knWelcomingId
 * @param {string} startDatetime
 * @param {string} endDatetime
 * @param {string} sentence
 * @returns
*/

export  function addWelcomeWithCharaByDate(data) {
    return request({
      url: `${ClassName}/Personality/`,
      method: "post",
      data
    });
}


/**
 * @export
 * @param {string} appId
 * @param {string} name
 * @param {string} exampleSentence
 * @param {number} state
 * @returns
 */

export function createIntent(data) {
    return request({
      url: "/Intent/",
      method: "post",
      data
    });
  }
