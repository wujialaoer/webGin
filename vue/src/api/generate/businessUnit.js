





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------BusinessUnit开始----------

import request from "@/utils/request";

const ClassName = "/BusinessUnit";

/**
 *  业务单位
*/

/**
 * GET/api/v{version}/BusinessUnit 业务单位-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} Name,  名称

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getQueryBusinessUnitPageList(params) {
    return request({
      url: `${ClassName}/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/BusinessUnit/Query 业务单位-查询列表

 * @param {string} Name,  名称

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getBusinessUnitList(params) {
    return request({
      url: `${ClassName}/Query/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/BusinessUnit/Select 业务单位-查询键值列表

 * @param {string} Name,  名称

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getBusinessUnitSelect(params) {
    return request({
      url: `${ClassName}/Select/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/BusinessUnit/{id} 业务单位-主键查询单条
 * @export
 * @returns
*/
export function getBusinessUnitById(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/BusinessUnit  业务单位-新增
 * @export

 * @param {string} Name,  名称

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function addBusinessUnit(data) {
    return request({
      url: `${ClassName}/`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/BusinessUnit/{id} 业务单位-修改实体
 * @export

 * @param {string} Name,  名称

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function updateBusinessUnit(id,data) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/BusinessUnit/{id} 业务单位-删除
 * @export
 * @returns
*/
export function deleteBusinessUnitById(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "delete"
    });
}
//----------KBS_BUSINESS_UNIT结束----------
