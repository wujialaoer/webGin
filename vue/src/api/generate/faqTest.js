//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------FaqTest开始----------

import request from "@/utils/request";

const ClassName = "/FaqTest";

/**
 *  问答管理-测试集
 */

/**
 * GET/api/v{version}/FaqTest 问答管理-测试集-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {int} TestType,  类型

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getQueryFaqTestPageList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/FaqTest/Query 问答管理-测试集-查询列表

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {int} TestType,  类型

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getFaqTestList(params) {
  return request({
    url: `${ClassName}/Query/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/FaqTest/Select 问答管理-测试集-查询键值列表

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {int} TestType,  类型

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getFaqTestSelect(params) {
  return request({
    url: `${ClassName}/Select/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/FaqTest/{id} 问答管理-测试集-主键查询单条
 * @export
 * @returns
 */
export function getFaqTestById(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

/**
 * POST  /api/v{version}/FaqTest  问答管理-测试集-新增
 * @export

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {int} TestType,  类型

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function addFaqTest(data) {
  return request({
    url: `${ClassName}/`,
    method: "post",
    data
  });
}

/**
 * PUT/api/v{version}/FaqTest/{id} 问答管理-测试集-修改实体
 * @export

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {int} TestType,  类型

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function updateFaqTest(id, data) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "put",
    data
  });
}

/**
 * DELETE/api/v{version}/FaqTest/{id} 问答管理-测试集-删除
 * @export
 * @returns
 */
export function deleteFaqTestById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "delete"
  });
}

//----------KBS_FAQ_TEST结束----------
