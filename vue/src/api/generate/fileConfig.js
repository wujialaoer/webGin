





//--------------------------------------------------------------------
//     此代码由T4模板自动生成
//	   生成时间 2019-10-15 11:06:26 
//     对此文件的更改可能会导致不正确的行为，并且如果重新生成代码，这些更改将会丢失。
//--------------------------------------------------------------------
//----------FileConfig开始----------

import request from "@/utils/request";

const ClassName = "/FileConfig";

/**
 *  文件上传配置 
*/

/**
 * GET/api/v{version}/FileConfig 文件上传配置-查询分页列表
 * @param {int} page,      当前页
 * @param {int} pageSize,  显示总页
 * @param {string} order,  排序字段默认ID

 * @param {string} BizeType,  业务类型

 * @param {string} FileTypeLimit,  上传文件类型

 * @param {double?} FileSizeLimit,  上传文件类型

 * @param {string} Path,  路径

 * @param {string} Description,  描述

 * @param {string} ResourceRealm,  访问资源路径

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getQueryFileConfigPageList(params) {
    return request({
      url: `${ClassName}`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FileConfig/Query 文件上传配置-查询列表

 * @param {string} BizeType,  业务类型

 * @param {string} FileTypeLimit,  上传文件类型

 * @param {double?} FileSizeLimit,  上传文件类型

 * @param {string} Path,  路径

 * @param {string} Description,  描述

 * @param {string} ResourceRealm,  访问资源路径

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getFileConfigList(params) {
    return request({
      url: `${ClassName}/Query`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FileConfig/Select 文件上传配置-查询键值列表

 * @param {string} BizeType,  业务类型

 * @param {string} FileTypeLimit,  上传文件类型

 * @param {double?} FileSizeLimit,  上传文件类型

 * @param {string} Path,  路径

 * @param {string} Description,  描述

 * @param {string} ResourceRealm,  访问资源路径

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function getFileConfigSelect(params) {
    return request({
      url: `${ClassName}/Select`,
      method: "get",
	  params
    });
}
/**
 * GET/api/v{version}/FileConfig/{id} 文件上传配置-主键查询单条
 * @export
 * @returns
*/
export function getFileConfigById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "get"
    });
}
/**
 * POST  /api/v{version}/FileConfig  文件上传配置-新增
 * @export

 * @param {string} BizeType,  业务类型

 * @param {string} FileTypeLimit,  上传文件类型

 * @param {double?} FileSizeLimit,  上传文件类型

 * @param {string} Path,  路径

 * @param {string} Description,  描述

 * @param {string} ResourceRealm,  访问资源路径

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function addFileConfig(data) {
    return request({
      url: `${ClassName}`,
      method: "post",
      data
    });
}
/**
 * PUT/api/v{version}/FileConfig/{id} 文件上传配置-修改实体
 * @export

 * @param {string} BizeType,  业务类型

 * @param {string} FileTypeLimit,  上传文件类型

 * @param {double?} FileSizeLimit,  上传文件类型

 * @param {string} Path,  路径

 * @param {string} Description,  描述

 * @param {string} ResourceRealm,  访问资源路径

 * @param {DateTime?} CreationTime,  创建时间

 * @param {string} CreatorId,  创建用户

 * @param {DateTime?} LastModificationTime,  最后修改时间

 * @param {string} LastModifierId,  最后修改用户

 * @param {byte[]} Version,  版本号

 * @returns
*/
export function updateFileConfig(id,data) {
    return request({
      url: `${ClassName}/${id}`,
      method: "put",
	  data
    });
}
/**
 * DELETE/api/v{version}/FileConfig/{id} 文件上传配置-删除
 * @export
 * @returns
*/
export function deleteFileConfigById(id) {
    return request({
      url: `${ClassName}/${id}`,
      method: "delete"
    });
}
//----------SYS_FILE_CONFIG结束----------