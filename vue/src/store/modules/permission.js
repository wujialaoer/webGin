import {constantRoutes} from '@/router';

/**
 * ͨ通过meta.role判断是否与当前用户权限匹配
 * @param roles
 * @param route
 */


function hasPermission(roles, route) {
  if (route.meta && route.meta.roles) {
    return roles.some(role => route.meta.roles.indexOf(role) >= 0);
  } else {
    return true;
  }
}

/**
 * 由于路由的默认路径写死造成的bug,临时解决方案
 * bug:[服务监控]有权限,但是默认子路由(服务管理)没有权限,会导致进入服务监控页面显示404
 * 临时方案:若发生此情况,修改[服务监控]的默认路径到[运维工具]
 * @param route
 * @param roles
 * @param parent
 */

/**
 * 递归过滤异步路由表，返回符合用户角色权限的路由表
 * @param constantRoutes
 * @param roles
 */
function filterAsyncRouter(constantRoutes, roles) {
  const accessedRouters = constantRoutes.filter(route => {
    if (hasPermission(roles, route)) {
      if (route.children && route.children.length) {
        route.children = filterAsyncRouter(route.children, roles, route);
      }
      return true;
    }
    return false;
  });
  return accessedRouters;
}


const permission = {
  state: {
    routers: constantRoutes,
    addRouters: []
  },
  mutations: {
    SET_ROUTERS: (state, routers) => {
      state.addRouters = routers;
      state.routers = constantRoutes.concat(routers);
    }
  },
  actions: {
    GenerateRoutes({commit}, data) {
      return new Promise((resolve, reject) => {
        console.log('data',data)
        const roles = data.roles;
        let accessedRouters = [];
        if (roles.indexOf('Sadmin') >= 0) {
          accessedRouters = constantRoutes;
        } else {
          accessedRouters = filterAsyncRouter(constantRoutes, roles);
        }

        commit('SET_ROUTERS', accessedRouters);
        resolve();
        // getDisplay().then(response => {

        // }).catch(error => {
        //   reject(error);
        // });
      });
    }
  }
};

export default permission;
