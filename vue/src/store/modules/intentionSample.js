const state = {
  curSampleIndex:"",
  curSampleItem:{},
  appLists: [
    {
      sid:"1",
      title: "小猪计划",
      intro: "简单问候意图",
      inten:"5213",
      entity:"123",
      unread:"3",
    },
    {
      sid:"2",
      title: "社保",
      intro: "无意义意图，提供闲聊功能",
      inten:"312",
      entity:"3123",
      unread:"2",
    },
    {
        sid:"3",
        title: "股票",
        intro: "无意义意图，提供闲聊功能",
        inten:"1231",
        entity:"3123",
        unread:"3",
      }
  ],
};

const getters = {};

const actions = {};

const mutations = {
  setCurSampleIndex(state, params) {
    state.curSampleIndex = params;
  },
  setCurSampleItem(state, params){
    state.curSampleItem = params;
  }
  
};

export default {
  state,
  getters,
  actions,
  mutations
};