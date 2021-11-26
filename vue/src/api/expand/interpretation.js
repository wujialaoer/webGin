import request from "@/utils/request";

const ClassName = "/Interpretation";

/**
 * POST /api/v{version}/Interpretation/Import 专有词典-导入
*/
export const uploadFileAboutInterpretation = `${process.env.VUE_APP_BASE_API}${ClassName}/Import/`;
