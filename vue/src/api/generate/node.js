





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26 
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------Node开始----------

import request from "@/utils/request";

const ClassName = "/Node";

/**
 *  流程节点信息 
*/

/**
 * GET/api/v{version}/Node 流程节点信息-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {Guid} ProcessId,  流程编号

 * @param {int} NodeType,  节点类型

 * @param {string} NodeName,  节点名称

 * @param {double} Top,  上坐标

 * @param {double} Left,  左坐标

 * @param {string} Description,  描述

 * @param {string} Expression,  表达式

 * @returns
*/
export function getQueryNodePageList(params) {
    return request({
      url: `${ClassName}`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Node/Query 流程节点信息-查询列表

 * @param {Guid} ProcessId,  流程编号

 * @param {int} NodeType,  节点类型

 * @param {string} NodeName,  节点名称

 * @param {double} Top,  上坐标

 * @param {double} Left,  左坐标

 * @param {string} Description,  描述

 * @param {string} Expression,  表达式

 * @returns
*/
export function getNodeList(params) {
    return request({
      url: `${ClassName}/Query`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Node/Select 流程节点信息-查询键值列表

 * @param {Guid} ProcessId,  流程编号

 * @param {int} NodeType,  节点类型

 * @param {string} NodeName,  节点名称

 * @param {double} Top,  上坐标

 * @param {double} Left,  左坐标

 * @param {string} Description,  描述

 * @param {string} Expression,  表达式

 * @returns
*/
export function getNodeSelect(params) {
    return request({
      url: `${ClassName}/Select`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Node/{id} 流程节点信息-主键查询单条
 * @export
 * @returns
*/
export function getNodeById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/Node  流程节点信息-新增
 * @export

 * @param {Guid} ProcessId,  流程编号

 * @param {int} NodeType,  节点类型

 * @param {string} NodeName,  节点名称

 * @param {double} Top,  上坐标

 * @param {double} Left,  左坐标

 * @param {string} Description,  描述

 * @param {string} Expression,  表达式

 * @returns
*/
export function addNode(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/Node/{id} 流程节点信息-修改实体
 * @export

 * @param {Guid} ProcessId,  流程编号

 * @param {int} NodeType,  节点类型

 * @param {string} NodeName,  节点名称

 * @param {double} Top,  上坐标

 * @param {double} Left,  左坐标

 * @param {string} Description,  描述

 * @param {string} Expression,  表达式

 * @returns
*/
export function updateNode(id,data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/Node/{id} 流程节点信息-删除
 * @export
 * @returns
*/
export function deleteNodeById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete"
    });
}
//----------KBS_NODE结束----------