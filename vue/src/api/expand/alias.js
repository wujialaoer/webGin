import request from "@/utils/request";

const ClassName = "/Alias";

/**
 * POST /api/v{version}/Alias/Import 别名-导入
 */
export const uploadFileAboutAlias = `${process.env.VUE_APP_BASE_API}${ClassName}/Import/`;
