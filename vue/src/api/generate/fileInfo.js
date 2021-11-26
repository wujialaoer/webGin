





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26 
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------FileInfo开始----------

import request from "@/utils/request";

const ClassName = "/FileInfo";

/**
 *  系统-上传内容详细信息 
*/

/**
 * GET/api/v{version}/FileInfo 系统-上传内容详细信息-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} BizeType,  业务类型

 * @param {string} BizeId,  业务id，如发送文件的用户ID等

 * @param {string} OriginalName,  文件原名称

 * @param {string} NewName,  文件新名称(随机码)

 * @param {string} FileType,  文件类型

 * @param {double} FileSize,  文件大小

 * @param {string} FilePath,  文件服务器存储绝对路径

 * @param {string} RelativePath,  文件相对路径，域名+此字段为该资源的请求地址

 * @param {string} ThumbnailPath,  文件相对路径，略缩图

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getQueryFileInfoPageList(params) {
    return request({
      url: `${ClassName}`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FileInfo/Query 系统-上传内容详细信息-查询列表

 * @param {string} BizeType,  业务类型

 * @param {string} BizeId,  业务id，如发送文件的用户ID等

 * @param {string} OriginalName,  文件原名称

 * @param {string} NewName,  文件新名称(随机码)

 * @param {string} FileType,  文件类型

 * @param {double} FileSize,  文件大小

 * @param {string} FilePath,  文件服务器存储绝对路径

 * @param {string} RelativePath,  文件相对路径，域名+此字段为该资源的请求地址

 * @param {string} ThumbnailPath,  文件相对路径，略缩图

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getFileInfoList(params) {
    return request({
      url: `${ClassName}/Query`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FileInfo/Select 系统-上传内容详细信息-查询键值列表

 * @param {string} BizeType,  业务类型

 * @param {string} BizeId,  业务id，如发送文件的用户ID等

 * @param {string} OriginalName,  文件原名称

 * @param {string} NewName,  文件新名称(随机码)

 * @param {string} FileType,  文件类型

 * @param {double} FileSize,  文件大小

 * @param {string} FilePath,  文件服务器存储绝对路径

 * @param {string} RelativePath,  文件相对路径，域名+此字段为该资源的请求地址

 * @param {string} ThumbnailPath,  文件相对路径，略缩图

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getFileInfoSelect(params) {
    return request({
      url: `${ClassName}/Select`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FileInfo/{id} 系统-上传内容详细信息-主键查询单条
 * @export
 * @returns
*/
export function getFileInfoById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/FileInfo  系统-上传内容详细信息-新增
 * @export

 * @param {string} BizeType,  业务类型

 * @param {string} BizeId,  业务id，如发送文件的用户ID等

 * @param {string} OriginalName,  文件原名称

 * @param {string} NewName,  文件新名称(随机码)

 * @param {string} FileType,  文件类型

 * @param {double} FileSize,  文件大小

 * @param {string} FilePath,  文件服务器存储绝对路径

 * @param {string} RelativePath,  文件相对路径，域名+此字段为该资源的请求地址

 * @param {string} ThumbnailPath,  文件相对路径，略缩图

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function addFileInfo(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/FileInfo/{id} 系统-上传内容详细信息-修改实体
 * @export

 * @param {string} BizeType,  业务类型

 * @param {string} BizeId,  业务id，如发送文件的用户ID等

 * @param {string} OriginalName,  文件原名称

 * @param {string} NewName,  文件新名称(随机码)

 * @param {string} FileType,  文件类型

 * @param {double} FileSize,  文件大小

 * @param {string} FilePath,  文件服务器存储绝对路径

 * @param {string} RelativePath,  文件相对路径，域名+此字段为该资源的请求地址

 * @param {string} ThumbnailPath,  文件相对路径，略缩图

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function updateFileInfo(id,data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/FileInfo/{id} 系统-上传内容详细信息-删除
 * @export
 * @returns
*/
export function deleteFileInfoById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete"
    });
}
//----------SYS_FILE_INFO结束----------