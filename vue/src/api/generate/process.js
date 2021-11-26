





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26 
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------Process开始----------

import request from "@/utils/request";

const ClassName = "/Process";

/**
 *  流程定义 
*/

/**
 * GET/api/v{version}/Process 流程定义-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} ProcessName,  流程名称

 * @param {Guid?} StartNode,  开始节点编号

 * @param {Guid?} EndNode,  结束节点编号

 * @param {Guid?} FaqId,  问答管理编号

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getQueryProcessPageList(params) {
    return request({
      url: `${ClassName}`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Process/Query 流程定义-查询列表

 * @param {string} ProcessName,  流程名称

 * @param {Guid?} StartNode,  开始节点编号

 * @param {Guid?} EndNode,  结束节点编号

 * @param {Guid?} FaqId,  问答管理编号

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getProcessList(params) {
    return request({
      url: `${ClassName}/Query`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Process/Select 流程定义-查询键值列表

 * @param {string} ProcessName,  流程名称

 * @param {Guid?} StartNode,  开始节点编号

 * @param {Guid?} EndNode,  结束节点编号

 * @param {Guid?} FaqId,  问答管理编号

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getProcessSelect(params) {
    return request({
      url: `${ClassName}/Select`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/Process/{id} 流程定义-主键查询单条
 * @export
 * @returns
*/
export function getProcessById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/Process  流程定义-新增
 * @export

 * @param {string} ProcessName,  流程名称

 * @param {Guid?} StartNode,  开始节点编号

 * @param {Guid?} EndNode,  结束节点编号

 * @param {Guid?} FaqId,  问答管理编号

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function addProcess(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/Process/{id} 流程定义-修改实体
 * @export

 * @param {string} ProcessName,  流程名称

 * @param {Guid?} StartNode,  开始节点编号

 * @param {Guid?} EndNode,  结束节点编号

 * @param {Guid?} FaqId,  问答管理编号

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function updateProcess(id,data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/Process/{id} 流程定义-删除
 * @export
 * @returns
*/
export function deleteProcessById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete"
    });
}
//----------KBS_PROCESS结束----------