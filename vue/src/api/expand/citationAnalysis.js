import request from "@/utils/request";

const ClassName = "/CitationAnalysis";

/**
 * GET /api/v{version}/CitationAnalysis/{wordSetId}  命中语句
 * @returns
*/
export function getHitById(wordSetId) {
    return request({
      url: `${ClassName}/${wordSetId}`,
      method: "GET",
    });
}

/**
 * GET  /api/v{version}/CitationAnalysis  引用分析统计
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

 * @param {byte[]} Version,  版本号
 * @returns
*/
export function getCitationAnalysis(data) {
    return request({
      url: `${ClassName}`,
      method: "GET",
      params:data
    });
}
