import request from "@/utils/request";

const ClassName = "/ReportForm";

export function getReportForm(params) {
  return request({
    url: `${ClassName}/`,
    method: "get",
    params
  });
}

export function getTrend(params) {
  return request({
    url: `${ClassName}/Trend/`,
    method: "get",
    params
  });
}

export function getPackAge(params) {
  return request({
    url: `${ClassName}/PackAge/`,
    method: "get",
    params
  });
}

export function getHot(params) {
  return request({
    url: `${ClassName}/Hot/`,
    method: "get",
    params
  });
}
