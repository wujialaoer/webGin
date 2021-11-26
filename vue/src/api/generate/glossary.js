//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------Glossary开始----------

import request from "@/utils/request";

const ClassName = "/Glossary";

/**
 *  名词解释
 */

/**
 * GET/api/v{version}/Glossary 名词解释-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} Noun,  名词

 * @param {string} Explain,  名称解释

 * @param {bool} Choice,  选择

 * @param {string} Transliteration,  转义

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getQueryGlossaryPageList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}


export function getQueryGlossaryIsDefault(params) {
  return request({
    url: `glossaryIsDefault/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/Glossary/Query 名词解释-查询列表

 * @param {string} Noun,  名词

 * @param {string} Explain,  名称解释

 * @param {bool} Choice,  选择

 * @param {string} Transliteration,  转义

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getGlossaryList(params) {
  return request({
    url: `${ClassName}/Query/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/Glossary/Select 名词解释-查询键值列表

 * @param {string} Noun,  名词

 * @param {string} Explain,  名称解释

 * @param {bool} Choice,  选择

 * @param {string} Transliteration,  转义

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getGlossarySelect(params) {
  return request({
    url: `${ClassName}/Select/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/Glossary/{id} 名词解释-主键查询单条
 * @export
 * @returns
 */
export function getGlossaryById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "get"
  });
}

/**
 * POST  /api/v{version}/Glossary  名词解释-新增
 * @export

 * @param {string} Noun,  名词

 * @param {string} Explain,  名称解释

 * @param {bool} Choice,  选择

 * @param {string} Transliteration,  转义

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function addGlossary(data) {
  return request({
    url: `${ClassName}/`,
    method: "post",
    data
  });
}

/**
 * PUT/api/v{version}/Glossary/{id} 名词解释-修改实体
 * @export

 * @param {string} Noun,  名词

 * @param {string} Explain,  名称解释

 * @param {bool} Choice,  选择

 * @param {string} Transliteration,  转义

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function updateGlossary(id, data) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "put",
    data
  });
}

/**
 * DELETE/api/v{version}/Glossary/{id} 名词解释-删除
 * @export
 * @returns
 */
export function deleteGlossaryById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "delete"
  });
}

//----------KBS_GLOSSARY结束----------


