import {login, logout, getInfo, loginByUsername} from "@/api/user";
import {getToken, setToken, removeToken} from "@/utils/auth";

const state = {
  token: getToken(),
  name: "",
  roles: [],
  avatar: "",
};

const mutations = {
  SET_TOKEN: (state, token) => {
    state.token = token;
  },

  SET_NAME: (state, name) => {
    state.name = name;
  },

  SET_ROLES: (state, roles) => {
    state.roles = roles;
  },

  SET_AVATAR: (state, avatar) => {
    state.avatar = avatar;
  }
};

const actions = {
  // user login
  login({commit}, userInfo) {
    const username = userInfo.username.trim();
    return new Promise((resolve, reject) => {
      login(username, userInfo.password).then(response => {
        const data = response.data;
        commit('SET_TOKEN', data.token);
        resolve();
      }).catch(error => {
        reject(error);
      });
    });
  },

  // get user info
  getInfo({commit, state}) {
    return new Promise((resolve, reject) => {
      getInfo(state.token).then(response => {
        const data = response;
        const roles = data.role;
        commit('SET_ROLES', roles);

        data.avatar =
          "/static/images/webwxgeticon.jpeg";
        commit('SET_NAME', data.username);
        commit('SET_AVATAR', data.avatar);
        resolve(response);
      }).catch(error => {
        reject(error);
      });
    });
  },
  // 用户名登录
  LoginByUsername({commit}, userInfo) {
    console.log(userInfo);
    const username = userInfo.username.trim();
    return new Promise((resolve, reject) => {

      loginByUsername(username, userInfo.password).then(response => {
        const data = response;

        commit('SET_TOKEN', data.token);
        setToken(data.token);
        resolve();
      }).catch(error => {
        // error.message = '用户名或密码错误!';
        reject(error);
      });
    });
  },

  // 登出
  logout({commit, state}) {
    return new Promise((resolve, reject) => {
      logout(state.token).then(() => {
        commit('SET_TOKEN', '');
        commit('SET_ROLES', []);
        removeToken();
        resolve();
      }).catch(error => {
        reject(error);
      });
    });
  },

  // 前端 登出
  resetToken({commit}) {
    return new Promise(resolve => {
      commit('SET_TOKEN', '');
      removeToken();
      resolve();
    });
  }
};

export default {
  namespaced: true,
  state,
  mutations,
  actions
};
