//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------FaqPackage开始----------

import request from "@/utils/request";

const ClassName = "/FaqPackage";

/**
 *  知识包
 */

/**
 * GET/api/v{version}/FaqPackage 知识包-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {Guid} BusinessUnitId,  业务单位编号

 * @param {string} Name,  名称

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getQueryFaqPackagePageList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/FaqPackage/Query 知识包-查询列表

 * @param {Guid} BusinessUnitId,  业务单位编号

 * @param {string} Name,  名称

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getFaqPackageList(params) {
  return request({
    url: `${ClassName}/Query/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/FaqPackage/Select 知识包-查询键值列表

 * @param {Guid} BusinessUnitId,  业务单位编号

 * @param {string} Name,  名称

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getFaqPackageSelect(params) {
  return request({
    url: `${ClassName}/Select/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/FaqPackage/{id} 知识包-主键查询单条
 * @export
 * @returns
 */
export function getFaqPackageById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "get"
  });
}

/**
 * POST  /api/v{version}/FaqPackage  知识包-新增
 * @export

 * @param {Guid} BusinessUnitId,  业务单位编号

 * @param {string} Name,  名称

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function addFaqPackage(data) {
  return request({
    url: `${ClassName}/`,
    method: "post",
    data
  });
}

/**
 * PUT/api/v{version}/FaqPackage/{id} 知识包-修改实体
 * @export

 * @param {Guid} BusinessUnitId,  业务单位编号

 * @param {string} Name,  名称

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function updateFaqPackage(id, data) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "PUT",
    data
  });
}

/**
 * DELETE/api/v{version}/FaqPackage/{id} 知识包-删除
 * @export
 * @returns
 */
export function deleteFaqPackageById(id, data) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "delete",
    data
  });
}

//----------KBS_FAQ_PACKAGE结束----------
