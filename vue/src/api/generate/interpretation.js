





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------Interpretation开始----------

import request from "@/utils/request";

const ClassName = "/Interpretation";

/**
 *  专有词典
*/

/**
 * GET/api/v{version}/Interpretation 专有词典-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} StandardName,  标准名

 * @param {int?} Weight,  权重

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getQueryInterpretationPageList(params) {
    return request({
      url: `${ClassName}/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Interpretation/Query 专有词典-查询列表

 * @param {string} StandardName,  标准名

 * @param {int?} Weight,  权重

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getInterpretationList(params) {
    return request({
      url: `${ClassName}/Query/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Interpretation/Select 专有词典-查询键值列表

 * @param {string} StandardName,  标准名

 * @param {int?} Weight,  权重

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getInterpretationSelect(params) {
    return request({
      url: `${ClassName}/Select/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Interpretation/{id} 专有词典-主键查询单条
 * @export
 * @returns
*/
export function getInterpretationById(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/Interpretation  专有词典-新增
 * @export

 * @param {string} StandardName,  标准名

 * @param {int?} Weight,  权重

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function addInterpretation(data) {
    return request({
      url: `${ClassName}/`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/Interpretation/{id} 专有词典-修改实体
 * @export

 * @param {string} StandardName,  标准名

 * @param {int?} Weight,  权重

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function updateInterpretation(id,data) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/Interpretation/{id} 专有词典-删除
 * @export
 * @returns
*/
export function deleteInterpretationById(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "delete"
    });
}
//----------KBS_INTERPRETATION结束----------
