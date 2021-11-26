const state = {
tinymceId:"",
hasChange:false,
  data: {
    id: "",
    name: "",
    status: "",
    varList: [],
    nodeList: [
    //   {
    //     nodeId: "Start",
    //     type: "Root",
    //     name: "",
    //     entityLevel:"1",
    //     entityType:"测试",
    //     comment: "开始",
    //     status: "0",
    //     conditions: "",
    //     sourceAnchor: "",
    //     data: {
    //       nextNode: [
    //         {
    //           nodeId: "q21qqwewe3",
    //           name: "",
    //           type: "Handle",
    //           conditions: "你好111",
    //           sourceAnchor: "Right",
    //           entityLevel:"1",
    //             entityType:"",
    //             comment: "",
    //             status: "0",
    //         }
    //       ]
    //     },
    //     top: 50,
    //     left: 50
    //   },
    //   {
    //     nodeId: "Exit1",
    //     name: "",
    //     entityLevel:"1",
    //     entityType:"测试",
    //     type: "Exit",
    //     status: "1",
    //     comment: "结束",
    //     conditions: "",
    //     sourceAnchor: "",
    //     data: {
    //       nextNode: [
    //         {
    //           nodeId: "",
    //           name: "",
    //           conditions: "",
    //           type: "",
    //           sourceAnchor: "",
    //           entityLevel:"1",
    //           entityType:"",
    //           comment: "",
    //           status: "0",
    //         }
    //       ]
    //     },
    //     top: 422,
    //     left: 780
    //   },
    //   {
    //     nodeId: "q21qqwewe3",
    //     name: "",
    //     entityLevel:"1",
    //     entityType:"测试",
    //     type: "Handle",
    //     status: "1",
    //     comment: "处理1111",
    //     conditions: "",
    //     sourceAnchor: "",
    //     data: {
    //       nextNode: [
    //         {
    //           nodeId: "q213",
    //           name: "",
    //           conditions: "你好2222",
    //           sourceAnchor: "",
    //           type: "Handle",
    //                         entityLevel:"1",
    //             entityType:"",
    //             comment: "",
    //             status: "0",
    //         },
    //         {
    //           nodeId: "q21qwe3",
    //           name: "",
    //           conditions: "你好3333",
    //           sourceAnchor: "",
    //           type: "Handle",
    //                         entityLevel:"1",
    //             entityType:"",
    //             comment: "",
    //             status: "0",
    //         }
    //       ]
    //     },
    //     top: 122,
    //     left: 222
    //   },
    //   {
    //     nodeId: "q213",
    //     name: "",
    //     entityLevel:"1",
    //     entityType:"测试",
    //     type: "Handle",
    //     status: "1",
    //     comment: "处理22222",
    //     conditions: "",
    //     sourceAnchor: "",
    //     data: {
    //       nextNode: [
    //         {
    //           nodeId: "Exit1",
    //           name: "",
    //           conditions: "结束1",
    //           sourceAnchor: "Top",
    //           type: "Exit",
    //                         entityLevel:"1",
    //             entityType:"",
    //             comment: "",
    //             status: "0",
    //         }
    //       ]
    //     },
    //     top: 52,
    //     left: 602
    //   },
    //   {
    //     nodeId: "q21qwe3",
    //     name: "",
    //     entityLevel:"1",
    //     entityType:"测试",
    //     type: "Handle",
    //     status: "1",
    //     comment: "处理333333",
    //     conditions: "",
    //     sourceAnchor: "",
    //     data: {
    //       nextNode: [
    //         {
    //           nodeId: "Exit1",
    //           name: "",
    //           conditions: "结束2",
    //           sourceAnchor: "Left",
    //           type: "Exit",
    //                         entityLevel:"1",
    //             entityType:"",
    //             comment: "",
    //             status: "0",
    //         }
    //       ]
    //     },
    //     top: 322,
    //     left: 222
    //   }
    ]
  }
};

const getters = {};

const actions = {};

const mutations = {
    setNodeList(state, params) {
        state.data.nodeList = params;
      },
  addNode(state, params) {
    state.data.nodeList.push(params);
  },
  addNextNode(state, params) {
    let obj = state.data.nodeList.filter(function(item) {
      return item.nodeId == params.superId;
    });
    console.warn(obj);
    let nextNode = obj[0].data.nextNode;
    nextNode.push(params.nextNode);
  },
  setAllnextNode(state, params) {
    state.nodeList = params;
  },
  setCondition(state, params) {
    // let obj = state.data.nodeList.filter(function(item) {
    //     return item.id == params.id;
    // });
    // console.warn(obj);
    // let nextNode = obj[0].data.nextNode;
    // nextNode[0] = params.condition;
  },
  editNode(state, params) {
    let obj = state.data.nodeList.filter(function(item) {
      return item.nodeId == params.nodeId;
    });
    obj[0].name = params.name;
    obj[0].nodeContent = params.nodeContent;
    obj[0].guidelist = params.guidelist;
    console.warn(obj);
  },
  setTinymceId(state, params){
    state.tinymceId = params;
  },
  setHasChange(state, params){
    state.hasChange = params;
  }
};

export default {
  state,
  getters,
  actions,
  mutations
};
