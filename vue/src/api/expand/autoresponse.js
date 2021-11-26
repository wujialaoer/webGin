//----------autoresponselist----------

import request from "@/utils/request";

const ClassName = "/AutoResponse";

/**
 *  欢迎语
 */

/**
 * GET/api/v{version}/AutoResponse 欢迎语-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {Guid} PersonalityId,  个性编号

 * @param {TimeSpan?} StartTime,  结束-时间

 * @param {TimeSpan?} EndTime,  结束-时间

 * @param {DateTime?} StartDatetime,  结束-日期

 * @param {DateTime?} EndDatetime,  结束-日期

 * @param {string} Sentence,  语句

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getQueryAutoResponsePageList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/AutoResponse/{id} 欢迎语-主键查询单条
 * @export
 * @returns
 */
export function getAutoResponseById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "get"
  });
}

/**
 * POST  /api/v{version}/AutoResponse  欢迎语-新增
 * @export

 * @param {Guid} PersonalityId,  个性编号

 * @param {TimeSpan?} StartTime,  结束-时间

 * @param {TimeSpan?} EndTime,  结束-时间

 * @param {DateTime?} StartDatetime,  结束-日期

 * @param {DateTime?} EndDatetime,  结束-日期

 * @param {string} Sentence,  语句

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function addAutoResponse(data) {
  return request({
    url: `${ClassName}/`,
    method: "post",
    data
  });
}

/**
 * PUT/api/v{version}/AutoResponse/{id} 欢迎语-修改实体
 * @export

 * @param {Guid} PersonalityId,  个性编号

 * @param {TimeSpan?} StartTime,  结束-时间

 * @param {TimeSpan?} EndTime,  结束-时间

 * @param {DateTime?} StartDatetime,  结束-日期

 * @param {DateTime?} EndDatetime,  结束-日期

 * @param {string} Sentence,  语句

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function updateWelcoming(id, data) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "put",
    data
  });
}

/**
 * DELETE/api/v{version}/AutoResponse/{id} 欢迎语-删除
 * @export
 * @returns
 */
export function deleteAutoResponseById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "delete"
  });
}

/**
 * /api/v{version}/AutoResponse/Import/{personalityId}  闲聊-导入
 */
export const uploadFileAboutAutoResponse = `${process.env.VUE_APP_BASE_API}${ClassName}/Import/`;
//----------KBS_WELCOMING结束----------
