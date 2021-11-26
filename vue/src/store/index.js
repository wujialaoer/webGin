import Vue from "vue";
import Vuex from "vuex";
import getters from "./getters";
import app from "./modules/app";
import settings from "./modules/settings";
import user from "./modules/user";
import intention from "./modules/intention";
import flow from "./modules/flow";
import projectManger from "./modules/projectManger";
import intentionSample from "./modules/intentionSample";
import faq from "./modules/faq";
import permission from "./modules/permission";

Vue.use(Vuex);

const store = new Vuex.Store({
  modules: {
    app,
    settings,
    user,
    intention,
    flow,
    projectManger,
    intentionSample,
    faq,
    permission
  },
  getters
});

export default store;
