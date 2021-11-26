





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------FilterWords开始----------

import request from "@/utils/request";

const ClassName = "/FilterWords";

/**
 *  过滤词
*/

/**
 * GET/api/v{version}/FilterWords 过滤词-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} Word,  过滤词

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getQueryFilterWordsPageList(params) {
    return request({
      url: `${ClassName}/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FilterWords/Query 过滤词-查询列表

 * @param {string} Word,  过滤词

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getFilterWordsList(params) {
    return request({
      url: `${ClassName}/Query/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FilterWords/Select 过滤词-查询键值列表

 * @param {string} Word,  过滤词

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getFilterWordsSelect(params) {
    return request({
      url: `${ClassName}/Select/`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FilterWords/{id} 过滤词-主键查询单条
 * @export
 * @returns
*/
export function getFilterWordsById(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/FilterWords  过滤词-新增
 * @export

 * @param {string} Word,  过滤词

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function addFilterWords(data) {
    return request({
      url: `${ClassName}/`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/FilterWords/{id} 过滤词-修改实体
 * @export

 * @param {string} Word,  过滤词

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function updateFilterWords(id,data) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/FilterWords/{id} 过滤词-删除
 * @export
 * @returns
*/
export function deleteFilterWordsById(id) {
    return request({
      url: `${ClassName}/${id}/`,
      method: "delete"
    });
}
//----------KBS_FILTER_WORDS结束----------
