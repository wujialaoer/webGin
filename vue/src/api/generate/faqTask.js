





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26 
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------FaqTask开始----------

import request from "@/utils/request";

const ClassName = "/FaqTask";

/**
 *  任务工作信息 
*/

/**
 * GET/api/v{version}/FaqTask 任务工作信息-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {Guid} ProcessId,  流程编号

 * @param {Guid} RootNodeId,  开始工作项节点编号

 * @param {int} TaskStatus,  任务状态

 * @param {DateTime} BeginTime,  发起时间

 * @param {DateTime?} FinishTime,  完成时间

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getQueryFaqTaskPageList(params) {
    return request({
      url: `${ClassName}`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FaqTask/Query 任务工作信息-查询列表

 * @param {Guid} ProcessId,  流程编号

 * @param {Guid} RootNodeId,  开始工作项节点编号

 * @param {int} TaskStatus,  任务状态

 * @param {DateTime} BeginTime,  发起时间

 * @param {DateTime?} FinishTime,  完成时间

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getFaqTaskList(params) {
    return request({
      url: `${ClassName}/Query`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FaqTask/Select 任务工作信息-查询键值列表

 * @param {Guid} ProcessId,  流程编号

 * @param {Guid} RootNodeId,  开始工作项节点编号

 * @param {int} TaskStatus,  任务状态

 * @param {DateTime} BeginTime,  发起时间

 * @param {DateTime?} FinishTime,  完成时间

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getFaqTaskSelect(params) {
    return request({
      url: `${ClassName}/Select`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FaqTask/{id} 任务工作信息-主键查询单条
 * @export
 * @returns
*/
export function getFaqTaskById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/FaqTask  任务工作信息-新增
 * @export

 * @param {Guid} ProcessId,  流程编号

 * @param {Guid} RootNodeId,  开始工作项节点编号

 * @param {int} TaskStatus,  任务状态

 * @param {DateTime} BeginTime,  发起时间

 * @param {DateTime?} FinishTime,  完成时间

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function addFaqTask(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/FaqTask/{id} 任务工作信息-修改实体
 * @export

 * @param {Guid} ProcessId,  流程编号

 * @param {Guid} RootNodeId,  开始工作项节点编号

 * @param {int} TaskStatus,  任务状态

 * @param {DateTime} BeginTime,  发起时间

 * @param {DateTime?} FinishTime,  完成时间

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function updateFaqTask(id,data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/FaqTask/{id} 任务工作信息-删除
 * @export
 * @returns
*/
export function deleteFaqTaskById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete"
    });
}
//----------KBS_FAQ_TASK结束----------