const state = {
    curProjectName: "",
    curIntentionName: "",
    projectManger: [
        {
            pid: "1",
            projectName: "IT部门",
            path: "/projectManger/1",
            intention: [
                {
                    id: "1",
                    name: "小猪计划",
                    path: "/projectManger/1/1",
                    parent:"IT部门"
                },
                {
                    id: "2",
                    name: "社保",
                    path: "/projectManger/1/2",
                    parent:"IT部门"
                },
                {
                    id: "3",
                    name: "股票",
                    path: "/projectManger/1/3",
                    parent:"IT部门"
                }
            ]
        },
        {
            pid: "2",
            projectName: "HR部门",
            path: "/projectManger/2",
            intention: [
                {
                    id: "1",
                    name: "小L计划",
                    path: "/projectManger/2/1",
                    parent:"HR部门"
                },
                {
                    id: "2",
                    name: "养老金",
                    path: "/projectManger/2/2",
                    parent:"HR部门"
                }
            ]
        }
    ]
};

const getters = {};

const actions = {};

const mutations = {
    setCurProjectName(state, params) {
        state.curProjectName = params;
    },
    setIntentionName(state, params) {
        state.curIntentionName = params;
    },
    setProjectManger(state, params) {
        state.projectManger = params;
    },
    addProjectManger(state, params) {
        let obj = {
            pid: (state.projectManger.length + 1).toString(),
            projectName: params.projectContent,
            intention: []
        };
        state.projectManger.push(obj);
    },
    editProjectManger(state, params) {
        console.warn(params);
        console.warn(state.projectManger);
        state.projectManger[params.index].projectName = params.projectContent;
    },
    addIntention(state, params) {
        let intention = state.projectManger[params.index];
        let obj = {
            id: intention.pid + "-" + (intention.intention.length + 1),
            name: params.intentionName
        };
        if (params.projectName === intention.projectName) {
            intention.intention.push(obj);
        }
    },
    editIntention(state, params){
      let intention = state.projectManger[params.projectIndex];
      intention.intention[params.index].name = params.intentionName;
    }
};

export default {
    state,
    getters,
    actions,
    mutations
};
