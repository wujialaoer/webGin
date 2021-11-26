<template>
    <div>
    <div v-if="$route.fullPath == '/lexicon/welcome'" class="app-container page_knowledge">
        <!-- <el-card class="box-card" shadow="never"> -->
            <el-tabs
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
            </el-tabs>
        <!-- </el-card> -->

    </div>
     <router-view></router-view>
    </div>
</template>

<script>
    export default {
    components: {
    // 注册所有组件
    lexitime: resolve => require(["./components/lexi-time"], resolve),
    lexidate: resolve => require(["./components/lexi-date"], resolve),
  },
    mounted(){
        console.warn(this);
    },
        data() {
        return {
            tabMapOptions: [
                { label: "时间", key: "lexitime" },
                { label: "日期", key: "lexidate" },
            ],
            activeName: 'lexitime'
        };
        },
        methods: {
        handleClick(tab, event) {
        }
        }
    };
</script>

<style lang="scss" scoped>
/deep/ .el-tabs__header{
    padding: 0px 20px;
}
</style>
