import Vue from "vue";

import "normalize.css/normalize.css"; // A modern alternative to CSS resets

import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
import locale from "element-ui/lib/locale/lang/zh-CN"; // lang i18n

import "@/styles/index.scss"; // global css

import App from "./App";
import store from "./store";
import router from './router';

import "@/icons"; // icon
import "@/permission"; // permission control

/**
 * If you don't want to use mock-server
 * you want to use mockjs for request interception
 * you can execute:
 *
 * import { mockXHR } from '../mock'
 * mockXHR()
 */
import axios from 'axios';
import '@/permission';
// set ElementUI lang to EN
Vue.use(ElementUI, {locale});
import VueQriously from 'vue-qriously';

Vue.use(VueQriously);

Vue.prototype.$axios = axios;
Vue.config.productionTip = false;


// console.log('env:', process.env);
new Vue({
  el: "#app",
  router,
  store,
  render: h => h(App)
});
