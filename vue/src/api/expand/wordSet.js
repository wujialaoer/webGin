import request from "@/utils/request";

const ClassName = "/WordSet";

/**
 * POST /api/v{version}/Alias/Import 别名-导入
*/
export const uploadFileAboutWordSet = `${process.env.VUE_APP_BASE_API}${ClassName}/Import`;