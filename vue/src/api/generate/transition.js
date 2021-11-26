





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26 
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------Transition开始----------

import request from "@/utils/request";

const ClassName = "/Transition";

/**
 *  流程动作定义 
*/

/**
 * GET/api/v{version}/Transition 流程动作定义-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {Guid} ProcessId,  流程编号

 * @param {Guid} FromNodeId,  开始节点编号

 * @param {Guid} ToNodeId,  到达节点编号

 * @param {string} CondExpression,  条件表达式

 * @param {string} Variable,  变量参数

 * @returns
*/
export function getQueryTransitionPageList(params) {
    return request({
      url: `${ClassName}`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Transition/Query 流程动作定义-查询列表

 * @param {Guid} ProcessId,  流程编号

 * @param {Guid} FromNodeId,  开始节点编号

 * @param {Guid} ToNodeId,  到达节点编号

 * @param {string} CondExpression,  条件表达式

 * @param {string} Variable,  变量参数

 * @returns
*/
export function getTransitionList(params) {
    return request({
      url: `${ClassName}/Query`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Transition/Select 流程动作定义-查询键值列表

 * @param {Guid} ProcessId,  流程编号

 * @param {Guid} FromNodeId,  开始节点编号

 * @param {Guid} ToNodeId,  到达节点编号

 * @param {string} CondExpression,  条件表达式

 * @param {string} Variable,  变量参数

 * @returns
*/
export function getTransitionSelect(params) {
    return request({
      url: `${ClassName}/Select`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Transition/{id} 流程动作定义-主键查询单条
 * @export
 * @returns
*/
export function getTransitionById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/Transition  流程动作定义-新增
 * @export

 * @param {Guid} ProcessId,  流程编号

 * @param {Guid} FromNodeId,  开始节点编号

 * @param {Guid} ToNodeId,  到达节点编号

 * @param {string} CondExpression,  条件表达式

 * @param {string} Variable,  变量参数

 * @returns
*/
export function addTransition(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/Transition/{id} 流程动作定义-修改实体
 * @export

 * @param {Guid} ProcessId,  流程编号

 * @param {Guid} FromNodeId,  开始节点编号

 * @param {Guid} ToNodeId,  到达节点编号

 * @param {string} CondExpression,  条件表达式

 * @param {string} Variable,  变量参数

 * @returns
*/
export function updateTransition(id,data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/Transition/{id} 流程动作定义-删除
 * @export
 * @returns
*/
export function deleteTransitionById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete"
    });
}
//----------KBS_TRANSITION结束----------