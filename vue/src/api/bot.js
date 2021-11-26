import request from "@/utils/request";

const ClassName = "/Bot";

/**
 * GET /api/v{version}/Bot Bot管理-列表
 * @export
 * @returns
 */
export  function getBotList() {
    return request({
      url: `${ClassName}`,
      method: "get"
    });
}

/**
 * POST /api/v{version}/Bot Bot管理-列表
 * @export
 * @returns
 */
export  function addBot(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}

/**
 * GET /api/v{version}/Bot Bot管理-查询实体
 * @export
 * @returns
 */
export  function queryBotById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get",
    });
}

/**
 * PUT /api/v{version}/Bot/{id} Bot管理-修改
 * @export
 * @param {array[string]} knPacksIds 
 * @param {string} knWelcomingId 
 * @param {boolean} isTrain 
 * @param {string} guideLanguage 
 * @param {string} overTimeRemind 
 * @returns
 */

export  function putBotById(id,data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "put",
      data
    });
}

/**
 * DELETE /api/v{version}/Bot/{id} Bot管理-删除
 * @export
 * @returns
 */

export  function deleteBotById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete",
    });
}

/**
 * PATCH /api/v{version}/Bot/{id} Bot管理-训练
 * @export
 * @returns
 */

export  function patchBotById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "patch",
    });
}

/**
 * /api/v{version}/Bot/DropDown Bot管理-下拉
 * @export
 * @returns
 */
export  function getBotDropDown() {
    return request({
      url: `${ClassName}/DropDown`,
      method: "get"
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
      url: "/Intent",
      method: "post",
      data
    });
  }