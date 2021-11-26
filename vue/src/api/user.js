import request from "@/utils/request";

export function login(username, password) {
  const data = {
    username,
    password
  };
  return request({
    url: '/user/login/',
    method: 'post',
    data
  });
}

export function getInfo(token) {
  return request({
    url: '/user/info/',
    method: 'post',
    data: {token}
  });
}

export function logout() {
  return request({
    url: '/user/logout/',
    method: 'post'
  });
}

export function loginByUsername(username, password) {
  const data = {
    username,
    password
  };
  return request({
    url: '/user/token/',
    method: 'post',
    data
  });
}

// 获取用户信息
export function getUsersInfoList(params) {
  return request({
    url: '/usergroups/',
    method: 'get',
    params
  });
}


export function deleteGroupUser(id, data) {
  return request({
    url: `usergroups/${id}`,
    method: "delete",
    data
  });
}

export function updateGroupUser(id, data) {
  return request({
    url: `usergroups/${id}`,
    method: "put",
    data
  });
}

export function addGroupUser(data) {
  return request({
    url: `usergroups/`,
    method: "post",
    data
  });
}

export function updatePWD(data) {
  return request({
    url: `/updatePwd`,
    method: "post",
    data
  });
}
