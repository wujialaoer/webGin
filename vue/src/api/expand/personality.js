//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-11-06 11:19:29
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------Personality开始----------

import request from "@/utils/request";

const ClassName = "/Personality";

/**
 *  个性
 */


/**
 * GET /api/v{version}/Personality/Count  个性 - 统计
 */
export function getPersonalityList() {
  return request({
    url: `${ClassName}/Count/`,
    method: "get",
  });
}

/**
 * GET/api/v{version}/Personality 个性-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} Name,  个性名

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getQueryPersonalityPageList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

// /**
//  * GET/api/v{version}/Personality/Query 个性-查询列表

//  * @param {string} Name,  个性名

//  * @param {DateTime?} CreationTime,  创建时间

//  * @param {string} CreatorId,  创建用户

//  * @param {DateTime?} LastModificationTime,  最后修改时间

//  * @param {string} LastModifierId,  最后修改用户

//  * @param {byte[]} Version,  版本号

//  * @returns
// */
// export function getPersonalityList(params) {
//     return request({
//       url: `${ClassName}/Query`,
//       method: "get",
// 	  params
//     });
// }

/**
 * GET/api/v{version}/Personality/Select 个性-查询键值列表

 * @param {string} Name,  个性名

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getPersonalitySelect(params) {
  return request({
    url: `${ClassName}/Select`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/Personality/{id} 个性-主键查询单条
 * @export
 * @returns
 */
export function getPersonalityById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "get"
  });
}

/**
 * POST  /api/v{version}/Personality  个性-新增
 * @export

 * @param {string} Name,  个性名

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function addPersonality(data) {
  return request({
    url: `${ClassName}/`,
    method: "post",
    data
  });
}

/**
 * PUT/api/v{version}/Personality/{id} 个性-修改实体
 * @export

 * @param {string} Name,  个性名

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function updatePersonality(id, data) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "put",
    data
  });
}

/**
 * DELETE/api/v{version}/Personality/{id} 个性-删除
 * @export
 * @returns
 */
export function deletePersonalityById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "delete"
  });
}

//----------KBS_PERSONALITY结束----------
