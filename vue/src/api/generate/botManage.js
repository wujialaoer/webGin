//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------BotManage开始----------

import request from "@/utils/request";

const ClassName = "/BotManage";

/**
 *  bot管理
 */

/**
 * GET/api/v{version}/BotManage bot管理-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} Name,  bot名称

 * @param {Guid} WelcomingId,  欢迎语编号

 * @param {string} GuideLanguage,  引导语

 * @param {string} OverTimeRemind,  超时提醒

 * @param {int} OverTime,  超时时间（分钟）

 * @param {Guid} AppId,  应用程序ID

 * @param {int} TrainType,  发布状态

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getQueryBotManagePageList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/BotManage/Query bot管理-查询列表

 * @param {string} Name,  bot名称

 * @param {Guid} WelcomingId,  欢迎语编号

 * @param {string} GuideLanguage,  引导语

 * @param {string} OverTimeRemind,  超时提醒

 * @param {int} OverTime,  超时时间（分钟）

 * @param {Guid} AppId,  应用程序ID

 * @param {int} TrainType,  发布状态

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getBotManageList(params) {
  return request({
    url: `${ClassName}/Query/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/BotManage/Select bot管理-查询键值列表

 * @param {string} Name,  bot名称

 * @param {Guid} WelcomingId,  欢迎语编号

 * @param {string} GuideLanguage,  引导语

 * @param {string} OverTimeRemind,  超时提醒

 * @param {int} OverTime,  超时时间（分钟）

 * @param {Guid} AppId,  应用程序ID

 * @param {int} TrainType,  发布状态

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getBotManageSelect(params) {
  return request({
    url: `${ClassName}/Select`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/BotManage/{id} bot管理-主键查询单条
 * @export
 * @returns
 */
export function getBotManageById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "get"
  });
}

/**
 * POST  /api/v{version}/BotManage  bot管理-新增
 * @export

 * @param {string} Name,  bot名称

 * @param {Guid} welcomingIdMan,  男个性ID

 * @param {Guid} welcomingIdWom,  女个性ID

 * @param {string} GuideLanguage,  引导语

 * @param {string} OverTimeRemind,  超时提醒

 * @param {int} OverTime,  超时时间（分钟）

 * @param {Guid} AppId,  应用程序ID

 * @param {int} TrainType,  发布状态

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function addBotManage(data) {
  return request({
    url: `${ClassName}/`,
    method: "post",
    data
  });
}

/**
 * PUT/api/v{version}/BotManage/{id} bot管理-修改实体
 * @export

 * @param {string} Name,  bot名称

 * @param {Guid} WelcomingId,  欢迎语编号

 * @param {string} GuideLanguage,  引导语

 * @param {string} OverTimeRemind,  超时提醒

 * @param {int} OverTime,  超时时间（分钟）

 * @param {Guid} AppId,  应用程序ID

 * @param {int} TrainType,  发布状态

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function updateBotManage(id, data) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "put",
    data
  });
}

/**
 * DELETE/api/v{version}/BotManage/{id} bot管理-删除
 * @export
 * @returns
 */
export function deleteBotManageById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "delete"
  });
}

export function getBotGlossary(params) {
  return request({
    url: `${ClassName}/botGlossary`,
    params
  });
}

//----------KBS_BOT_MANAGE结束----------
