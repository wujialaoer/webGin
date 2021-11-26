const state = {
  curSampleIndex:"",
  curSampleItem:{},
  intentionList: []
};

const getters = {};

const actions = {};

const mutations = {
    setIntentionList(state, params){
        state.intentionList = params;
    },
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