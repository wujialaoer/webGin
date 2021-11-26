//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------Faq开始----------

import request from "@/utils/request";

const ClassName = "/Faq";

/**
 *  问答管理
 */

/**
 * GET/api/v{version}/Faq 问答管理-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID
 * @param {Guid} FaqPackageId,  知识包编号
 * @param {string} Problem,  问题
 * @param {string} Answer,  答案
 * @param {int} FaqType,  类型
 * @param {DateTime?} CreationTime,  创建时间
 * @param {string} CreatorId,  创建用户
 * @param {DateTime?} LastModificationTime,  最后修改时间
 * @param {string} LastModifierId,  最后修改用户
 * @param {number} StartCount,  筛选语句范围开始
 * @param {number} EndCount,  筛选语句范围结束
 * @param {byte[]} Version,  版本号
 * @returns
 */
export function getQueryFaqPageList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/Faq/Query 问答管理-查询列表

 * @param {Guid} FaqPackageId,  知识包编号

 * @param {string} Problem,  问题

 * @param {string} Answer,  答案

 * @param {int} FaqType,  类型

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getFaqList(params) {
  return request({
    url: `${ClassName}/Query/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/Faq/Select 问答管理-查询键值列表

 * @param {Guid} FaqPackageId,  知识包编号

 * @param {string} Problem,  问题

 * @param {string} Answer,  答案

 * @param {int} FaqType,  类型

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getFaqSelect(params) {
  return request({
    url: `${ClassName}/Select/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/Faq/{id} 问答管理-主键查询单条
 * @export
 * @returns
 */
export function getFaqById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "get"
  });
}

/**
 * POST  /api/v{version}/Faq  问答管理-新增
 * @export

 * @param {Guid} FaqPackageId,  知识包编号

 * @param {string} Problem,  问题

 * @param {string} Answer,  答案

 * @param {int} FaqType,  类型

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function addFaq(data) {
  return request({
    url: `${ClassName}/`,
    method: "post",
    data
  });
}

/**
 * PUT/api/v{version}/Faq/{id} 问答管理-修改实体
 * @export

 * @param {Guid} FaqPackageId,  知识包编号

 * @param {string} Problem,  问题

 * @param {string} Answer,  答案

 * @param {int} FaqType,  类型

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function updateFaq(id, data) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "put",
    data
  });
}

/**
 * DELETE/api/v{version}/Faq/{id} 问答管理-删除
 * @export
 * @returns
 */
export function deleteFaqById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "delete"
  });
}

export function ExportFaq(data) {
  return request({
    url: `${ClassName}/export/`,
    method: "post",
    data
  });
}

export const ImportFaq = `${process.env.VUE_APP_BASE_API}${ClassName}/Import/`;
export const ImportFaqJson = `${process.env.VUE_APP_BASE_API}${ClassName}/importJson/`;

//----------KBS_FAQ结束----------
