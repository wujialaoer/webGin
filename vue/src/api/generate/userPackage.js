





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26 
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------UserPackage开始----------

import request from "@/utils/request";

const ClassName = "/UserPackage";

/**
 *  用户知识包权限 
*/

/**
 * GET/api/v{version}/UserPackage 用户知识包权限-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {Guid} UserId,  用户信息编号

 * @param {Guid} FaqPackageId,  知识包编号

 * @returns
*/
export function getQueryUserPackagePageList(params) {
    return request({
      url: `${ClassName}`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/UserPackage/Query 用户知识包权限-查询列表

 * @param {Guid} UserId,  用户信息编号

 * @param {Guid} FaqPackageId,  知识包编号

 * @returns
*/
export function getUserPackageList(params) {
    return request({
      url: `${ClassName}/Query`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/UserPackage/Select 用户知识包权限-查询键值列表

 * @param {Guid} UserId,  用户信息编号

 * @param {Guid} FaqPackageId,  知识包编号

 * @returns
*/
export function getUserPackageSelect(params) {
    return request({
      url: `${ClassName}/Select`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/UserPackage/{id} 用户知识包权限-主键查询单条
 * @export
 * @returns
*/
export function getUserPackageById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/UserPackage  用户知识包权限-新增
 * @export

 * @param {Guid} UserId,  用户信息编号

 * @param {Guid} FaqPackageId,  知识包编号

 * @returns
*/
export function addUserPackage(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/UserPackage/{id} 用户知识包权限-修改实体
 * @export

 * @param {Guid} UserId,  用户信息编号

 * @param {Guid} FaqPackageId,  知识包编号

 * @returns
*/
export function updateUserPackage(id,data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/UserPackage/{id} 用户知识包权限-删除
 * @export
 * @returns
*/
export function deleteUserPackageById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete"
    });
}
//----------KBS_USER_PACKAGE结束----------