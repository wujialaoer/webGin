import request from "@/utils/request";

export function submitNodeLine(data) {
  return request({
    url: "/process/nodelist",
    method: "post",
    data
  });
}

export function createFlow(data) {
  return request({
    url: "/process",
    method: "post",
    data
  });
}

export function getFlowList() {
  return request({
    url: "/process",
    method: "get"
  });
}

export function getNodeLine(params) {
  return request({
    url: "/process/"+params,
    method: "get",
  });
}


