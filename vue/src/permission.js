import router from './router';
import store from './store';
import {Message} from 'element-ui';
import NProgress from 'nprogress' ;// progress bar
import 'nprogress/nprogress.css'; // progress bar style
import {getToken} from '@/utils/auth'; // get token from cookie
import getPageTitle from '@/utils/get-page-title';

NProgress.configure({showSpinner: false});// NProgress Configuration

const whiteList = ['/login', '/chat']; // no redirect whitelist

router.beforeEach(async (to, from, next) => {
  // start progress bar
  NProgress.start();

  // set page title
  document.title = getPageTitle(to.meta.title);

  // determine whether the user has logged in
  const hasToken = getToken();

  if (hasToken) {
    if (to.path === '/login') {
      // if is logged in, redirect to the home page
      next({path: '/'});
      NProgress.done();
    } else {
      if (store.getters.roles.length === 0) {
        store.dispatch('user/getInfo').then(res => { // 拉取用户信息
          window.sessionStorage.setItem('user_id', res.user_id);
          console.log('res',res)
          const roles = res.role; // note: roles must be a array! such as: ['editor','develop']
          console.log(roles)
          store.dispatch('GenerateRoutes', {roles}).then(() => { // 根据roles权限生成可访问的路由表
            router.selfaddRoutes(store.getters.addRouters); // 动态添加可访问路由表
            next({...to, replace: true}); // hack方法 确保addRoutes已完成 ,set the replace: true so the navigation will not leave a history record
          });
        }).catch((err) => {
          store.dispatch('user/resetToken').then(() => {
            Message.error(err || 'Verification failed, please login again');
            next({path: '/'});
          });
        });
      } else {
        next();
      }

      // const hasGetUserInfo = store.getters.name;
      // if (hasGetUserInfo) {
      //   next();
      // } else {
      //   try {
      //     // get user info
      //     const userInfo = await store.dispatch('user/getInfo');
      //     window.localStorage.setItem('user_id', userInfo.user_id);
      //     next();
      //   } catch (error) {
      //     // remove token and go to login page to re-login
      //     await store.dispatch('user/resetToken');
      //     Message.error(error || 'Has Error');
      //     next(`/login?redirect=${to.path}`);
      //     NProgress.done();
      //   }
    }
    // }
  } else {
    /* has no token*/

    if (whiteList.indexOf(to.path) !== -1) {
      // in the free login whitelist, go directly
      next();
    } else {
      // other pages that do not have permission to access are redirected to the login page.
      next(`/login?redirect=${to.path}`);
      NProgress.done();
    }
  }
});

router.afterEach(() => {
  NProgress.done(); // 结束Progress
});
