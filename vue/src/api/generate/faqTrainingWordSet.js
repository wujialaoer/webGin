





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26 
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------FaqTrainingWordSet开始----------

import request from "@/utils/request";

const ClassName = "/FaqTrainingWordSet";

/**
 *  问答管理-训练集-词集合 
*/

/**
 * GET/api/v{version}/FaqTrainingWordSet 问答管理-训练集-词集合-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {Guid} FaqTrainingId,  问答管理-训练集编号

 * @param {Guid} WordSetId,  词集合编号

 * @param {string} Entity,  实体

 * @param {string} Word,  词

 * @param {int} Startindex,  开始位置

 * @param {int} Endindex,  结束位置

 * @returns
*/
export function getQueryFaqTrainingWordSetPageList(params) {
    return request({
      url: `${ClassName}`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FaqTrainingWordSet/Query 问答管理-训练集-词集合-查询列表

 * @param {Guid} FaqTrainingId,  问答管理-训练集编号

 * @param {Guid} WordSetId,  词集合编号

 * @param {string} Entity,  实体

 * @param {string} Word,  词

 * @param {int} Startindex,  开始位置

 * @param {int} Endindex,  结束位置

 * @returns
*/
export function getFaqTrainingWordSetList(params) {
    return request({
      url: `${ClassName}/Query`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FaqTrainingWordSet/Select 问答管理-训练集-词集合-查询键值列表

 * @param {Guid} FaqTrainingId,  问答管理-训练集编号

 * @param {Guid} WordSetId,  词集合编号

 * @param {string} Entity,  实体

 * @param {string} Word,  词

 * @param {int} Startindex,  开始位置

 * @param {int} Endindex,  结束位置

 * @returns
*/
export function getFaqTrainingWordSetSelect(params) {
    return request({
      url: `${ClassName}/Select`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FaqTrainingWordSet/{id} 问答管理-训练集-词集合-主键查询单条
 * @export
 * @returns
*/
export function getFaqTrainingWordSetById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/FaqTrainingWordSet  问答管理-训练集-词集合-新增
 * @export

 * @param {Guid} FaqTrainingId,  问答管理-训练集编号

 * @param {Guid} WordSetId,  词集合编号

 * @param {string} Entity,  实体

 * @param {string} Word,  词

 * @param {int} Startindex,  开始位置

 * @param {int} Endindex,  结束位置

 * @returns
*/
export function addFaqTrainingWordSet(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/FaqTrainingWordSet/{id} 问答管理-训练集-词集合-修改实体
 * @export

 * @param {Guid} FaqTrainingId,  问答管理-训练集编号

 * @param {Guid} WordSetId,  词集合编号

 * @param {string} Entity,  实体

 * @param {string} Word,  词

 * @param {int} Startindex,  开始位置

 * @param {int} Endindex,  结束位置

 * @returns
*/              
export function updateFaqTrainingWordSet(id,data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/FaqTrainingWordSet/{id} 问答管理-训练集-词集合-删除
 * @export
 * @returns
*/
export function deleteFaqTrainingWordSetById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete"
    });
}
//----------KBS_FAQ_TRAINING_WORD_SET结束----------