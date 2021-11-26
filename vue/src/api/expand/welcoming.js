





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-11-06 11:19:29
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------Welcoming开始----------

import request from "@/utils/request";

const ClassName = "/Welcoming";

/**
 *  欢迎语
*/

/**
 * GET/api/v{version}/Welcoming 欢迎语-查询分页列表
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
export function getQueryWelcomingPageList(params) {
    return request({
      url: `${ClassName}/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Welcoming/Query 欢迎语-查询列表

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
export function getWelcomingList(params) {
    return request({
      url: `${ClassName}/Query/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Welcoming/Select 欢迎语-查询键值列表

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
export function getWelcomingSelect(params) {
    return request({
      url: `${ClassName}/Select/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Welcoming/{id} 欢迎语-主键查询单条
 * @export
 * @returns
*/
export function getWelcomingById(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/Welcoming  欢迎语-新增
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
export function addWelcoming(data) {
    return request({
      url: `${ClassName}/`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/Welcoming/{id} 欢迎语-修改实体
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
export function updateWelcoming(id,data) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/Welcoming/{id} 欢迎语-删除
 * @export
 * @returns
*/
export function deleteWelcomingById(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "delete"
    });
}
//----------KBS_WELCOMING结束----------
