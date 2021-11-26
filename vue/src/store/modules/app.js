import Cookies from "js-cookie";

const state = {
  sidebar: {
    opened: Cookies.get("sidebarStatus")
      ? !!+Cookies.get("sidebarStatus")
      : true,
    withoutAnimation: false
  },
  device: "desktop",
  routeIndex: 0,
  language: "zh"
};

const mutations = {
  TOGGLE_SIDEBAR: state => {
    state.sidebar.opened = !state.sidebar.opened;
    state.sidebar.withoutAnimation = false;
    if (state.sidebar.opened) {
      Cookies.set("sidebarStatus", 1);
    } else {
      Cookies.set("sidebarStatus", 0);
    }
  },
  CLOSE_SIDEBAR: (state, withoutAnimation) => {
    Cookies.set("sidebarStatus", 0);
    state.sidebar.opened = false;
    state.sidebar.withoutAnimation = withoutAnimation;
  },
  TOGGLE_DEVICE: (state, device) => {
    state.device = device;
  },
  CHANGE_ROUTEINDEX: (state, index) => {
    state.routeIndex = index;
  },

};

const actions = {
  toggleSideBar({commit}) {
    commit("TOGGLE_SIDEBAR");
  },
  closeSideBar({commit}, {withoutAnimation}) {
    commit("CLOSE_SIDEBAR", withoutAnimation);
  },
  toggleDevice({commit}, device) {
    commit("TOGGLE_DEVICE", device);
  },
  CloseSideBar({commit}, {withoutAnimation}) {
    commit('CLOSE_SIDEBAR', withoutAnimation);
  },
  ToggleDevice({commit}, device) {
    commit('TOGGLE_DEVICE', device);
  },
  ChangeRouteIndex({commit}, index) {
    commit('CHANGE_ROUTEINDEX', index);
  },
  ChangeClusterName({commit}, name) {
    commit('CHANGE_CLUSTERNAME', name);
  }


};

export default {
  namespaced: true,
  state,
  mutations,
  actions
};
