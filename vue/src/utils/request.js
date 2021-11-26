import axios from "axios";
import {MessageBox} from "element-ui";
import store from "@/store";
import {getToken} from "@/utils/auth";
import qs from 'qs';
// create an axios instance
const service = axios.create({
  baseURL: process.env.VUE_APP_BASE_API, // url = base url + request url
  // withCredentials: false, // send cookies when cross-domain requests
  timeout: 60000 * 60 * 6, // request timeout
});

axios.interceptors.request.use((config) => {
  if (config.method === 'post') {
    // axios.defaults.headers['Content-Type'] = 'application/x-www-form-urlencoded';
    config.data = qs.stringify(config.data);
  }
  return config;
}, (error) => {
  return Promise.reject(error);
});

// request interceptor
service.interceptors.request.use(
  config => {
    if (store.getters.token) {
      config.headers['Authorization'] = getToken(); // 让每个请求携带自定义token 请根据实际情况自行修改
    }
    return config;
  },
  error => {
    // do something with request error
    return Promise.reject(error);
  }
);

// response interceptor
service.interceptors.response.use(
  /**
   * If you want to get http information such as headers or status
   * Please return  response => response
   */

  /**
   * Determine the request status by custom code
   * Here is just an example
   * You can also judge the status by HTTP Status Code
   */
  response => {
    const code = response.status;
    const codeList = [200, 201, 202, 203, 204, 205, 206];
    if (codeList.indexOf(code) >= 0) {
      return response.data;
    } else {
      return response;
    }
  },
  error => {
    if (error.response) {
      const code = error.response.status;
      if (code === 401) {
        MessageBox.confirm(
          '你已被登出，可以取消继续留在该页面，或者重新登录',
          '确定登出',
          {
            confirmButtonText: '重新登录',
            cancelButtonText: '取消',
            type: 'warning'
          }
        ).then(() => {
          store.dispatch('user/resetToken').then(() => {
            location.reload(); // 为了重新实例化vue-router对象 避免bug
          });
        });
      }
    }
    return Promise.reject(error);
  }
);

export default service;
