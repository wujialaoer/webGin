import request from "@/utils/request";

const ClassName = "/TestResult";

/**
 * GET /api/v{version}/TestResult
 */
export function getTestResultList(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

export function BatchPullLog(data) {
  return request({
    url: `batchTest/`,
    method: "post",
    data
  });
}
