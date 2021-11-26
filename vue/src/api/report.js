import request from "@/utils/request";

export function getReport(params) {
  return request({
    url: '/report/',
    method: 'get',
    params
  });

}

export function PullLog(data) {
  return request({
    url: `report/pullLog/`,
    method: "post",
    data
  });
}

export function PullFaqLog(data) {
  return request({
    url: `report/pullFaqLog/`,
    method: "post",
    data
  });
}
