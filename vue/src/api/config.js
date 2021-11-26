import request from "@/utils/request";

export function getConfig(params) {
  return request({
    url: `config/`,
    method: "get",
    params
  });
}


export  function updateConfig(data) {
    return request({
      url: `config/`,
      method: "post",
      data
    });
}
