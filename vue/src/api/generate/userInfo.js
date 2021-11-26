//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------UserInfo开始----------

import request from "@/utils/request";

const ClassName = "/UsersInfo";

/**
 *  用户信息
 */

/**
 * GET/api/v{version}/UserInfo 用户信息-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} UserName,  姓名

 * @param {string} NickName,  用户昵称

 * @param {string} Password,  密码

 * @param {string} Salt,  盐

 * @param {int} Role,  角色

 * @param {int} State,  用户状态

 * @param {string} Phonenumber,  手机号码

 * @param {string} Email,  邮箱

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getQueryUserInfoPageList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/UserInfo/Query 用户信息-查询列表

 * @param {string} UserName,  姓名

 * @param {string} NickName,  用户昵称

 * @param {string} Password,  密码

 * @param {string} Salt,  盐

 * @param {int} Role,  角色

 * @param {int} State,  用户状态

 * @param {string} Phonenumber,  手机号码

 * @param {string} Email,  邮箱

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getUserInfoList(params) {
  return request({
    url: `${ClassName}/Query`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/UserInfo/Select 用户信息-查询键值列表

 * @param {string} UserName,  姓名

 * @param {string} NickName,  用户昵称

 * @param {string} Password,  密码

 * @param {string} Salt,  盐

 * @param {int} Role,  角色

 * @param {int} State,  用户状态

 * @param {string} Phonenumber,  手机号码

 * @param {string} Email,  邮箱

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getUserInfoSelect(params) {
  return request({
    url: `${ClassName}/Select`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/UserInfo/{id} 用户信息-主键查询单条
 * @export
 * @returns
 */
export function getUserInfoById(id) {
  return request({
    url: `${ClassName}/${id}`,
    method: "get"
  });
}

/**
 * POST  /api/v{version}/UserInfo  用户信息-新增
 * @export

 * @param {string} UserName,  姓名

 * @param {string} NickName,  用户昵称

 * @param {string} Password,  密码

 * @param {string} Salt,  盐

 * @param {int} Role,  角色

 * @param {int} State,  用户状态

 * @param {string} Phonenumber,  手机号码

 * @param {string} Email,  邮箱

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function addUserInfo(data) {
  return request({
    url: `${ClassName}`,
    method: "post",
    data
  });
}

/**
 * PUT/api/v{version}/UserInfo/{id} 用户信息-修改实体
 * @export

 * @param {string} UserName,  姓名

 * @param {string} NickName,  用户昵称

 * @param {string} Password,  密码

 * @param {string} Salt,  盐

 * @param {int} Role,  角色

 * @param {int} State,  用户状态

 * @param {string} Phonenumber,  手机号码

 * @param {string} Email,  邮箱

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function updateUserInfo(id, data) {
  return request({
    url: `${ClassName}/${id}`,
    method: "put",
    data
  });
}

/**
 * DELETE/api/v{version}/UserInfo/{id} 用户信息-删除
 * @export
 * @returns
 */
export function deleteUserInfoById(id) {
  return request({
    url: `${ClassName}/${id}`,
    method: "delete"
  });
}

//----------KBS_USER_INFO结束----------
