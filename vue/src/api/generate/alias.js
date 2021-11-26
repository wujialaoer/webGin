//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------Alias开始----------

import request from "@/utils/request";

const ClassName = "/Alias";

/**
 *  别名
 */

/**
 * GET/api/v{version}/Alias 别名-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} StandardName,  标准名

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getQueryAliasPageList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/Alias/Query 别名-查询列表

 * @param {string} StandardName,  标准名

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getAliasList(params) {
  return request({
    url: `${ClassName}/Query/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/Alias/Select 别名-查询键值列表

 * @param {string} StandardName,  标准名

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getAliasSelect(params) {
  return request({
    url: `${ClassName}/Select/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/Alias/{id} 别名-主键查询单条
 * @export
 * @returns
 */
export function getAliasById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "get"
  });
}

/**
 * POST  /api/v{version}/Alias  别名-新增
 * @export

 * @param {string} StandardName,  标准名

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function addAlias(data) {
  return request({
    url: `${ClassName}/`,
    method: "post",
    data
  });
}

/**
 * PUT/api/v{version}/Alias/{id} 别名-修改实体
 * @export

 * @param {string} StandardName,  标准名

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function updateAlias(id, data) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "put",
    data
  });
}

/**
 * DELETE/api/v{version}/Alias/{id} 别名-删除
 * @export
 * @returns
 */
export function deleteAliasById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "delete"
  });
}

//----------KBS_ALIAS结束----------
