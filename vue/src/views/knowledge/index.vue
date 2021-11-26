<template>
    <div class="app-container page_knowledge">
        <div class="pany">
            <div class="tip">
                <p>问答管理数据分析页</p>
            </div>
            <!-- <el-tabs
            v-model="activeName"
            class="corpustabs"
            >
            <el-tab-pane
                v-for="item in tabMapOptions"
                :key="item.key"
                :label="item.label"
                :name="item.key"
            >
                <keep-alive>
                <component v-bind:is="item.key"></component>
                <tab-pane
                    v-if="activeName==item.key"
                    :type="item.key"
                />
                </keep-alive>
            </el-tab-pane>
            </el-tabs> -->
        </div>
    </div>
</template>

<script>
    export default {
    name: "page_knowledge",
    components: {
    // 注册所有组件
        knpackage: resolve => require(["./components/k-knpackage"], resolve),
        qa: resolve => require(["./components/k-qa"], resolve),
        quoteanlay: resolve => require(["./components/k-quoteanlay"], resolve),
        testgather: resolve => require(["./components/k-testgather"], resolve),
  },
        data() {
        return {
            tabMapOptions: [
                { label: "知识包", key: "knpackage" },
                { label: "问答管理", key: "qa" },
                { label: "引用分析", key: "quoteanlay" },
                { label: "测试集", key: "testgather" },
            ],
            activeName: 'knpackage'
        };
        },
        methods: {
        handleClick(tab, event) {
            console.log(tab, event);
        }
        }
    }
</script>

<style lang="scss" scoped>
    .page_knowledge{
        .pany{
            width: 100%;
            min-height: calc(100vh - 90px);
            background: rgba(255, 255, 255, 1);
            box-shadow: 0px 2px 5px 0px rgba(96, 144, 210, 0.05);
            border-radius: 4px;
            padding: 10px 18px;
            margin-bottom: 0px;
        }
}
</style>