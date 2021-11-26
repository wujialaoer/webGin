import request from "@/utils/request";

const ClassName = "/TestDetail";

/**
 * GET /api/v{version}/TestDetail
*/
export function getTestDetailList(params) {
    return request({
      url: `${ClassName}/`,
      method: "get",
      params
    });
}
