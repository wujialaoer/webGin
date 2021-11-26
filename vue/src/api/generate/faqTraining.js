import request from "@/utils/request";

const ClassName = "/FaqTraining";

/**
 *  问答管理-训练集
 */

/**
 * GET/api/v{version}/FaqTraining 问答管理-训练集-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {string} ProblemParticiple,  问题-分词

 * @param {string} ProblemJson,  问题-分词处理JSON数据

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getQueryFaqTrainingPageList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/FaqTraining/Query 问答管理-训练集-查询列表

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {string} ProblemParticiple,  问题-分词

 * @param {string} ProblemJson,  问题-分词处理JSON数据

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getFaqTrainingList(params) {
  return request({
    url: `${ClassName}/Query/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/FaqTraining/Select 问答管理-训练集-查询键值列表

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {string} ProblemParticiple,  问题-分词

 * @param {string} ProblemJson,  问题-分词处理JSON数据

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function getFaqTrainingSelect(params) {
  return request({
    url: `${ClassName}/Select/`,
    method: "get",
    params
  });
}

/**
 * GET/api/v{version}/FaqTraining/{id} 问答管理-训练集-主键查询单条
 * @export
 * @returns
 */
export function getFaqTrainingById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "get"
  });
}

/**
 * POST  /api/v{version}/FaqTraining  问答管理-训练集-新增
 * @export

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {string} ProblemParticiple,  问题-分词

 * @param {string} ProblemJson,  问题-分词处理JSON数据

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function addFaqTraining(data) {
  return request({
    url: `${ClassName}/`,
    method: "post",
    data
  });
}

/**
 * PUT/api/v{version}/FaqTraining/{id} 问答管理-训练集-修改实体
 * @export

 * @param {Guid} FaqId,  问答管理编号

 * @param {string} Problem,  问题

 * @param {string} ProblemParticiple,  问题-分词

 * @param {string} ProblemJson,  问题-分词处理JSON数据

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
 */
export function updateFaqTraining(id, data) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "put",
    data
  });
}

/**
 * DELETE/api/v{version}/FaqTraining/{id} 问答管理-训练集-删除
 * @export
 * @returns
 */
export function deleteFaqTrainingById(id) {
  return request({
    url: `${ClassName}/${id}/`,
    method: "delete"
  });
}

//----------KBS_FAQ_TRAINING结束----------
