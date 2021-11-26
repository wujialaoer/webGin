<template>
  <div class="app-container page_trainresult">
    <!--  -->
    <div class="pany">
        <div class="accuracyRate">
            ⦿ 训练准确率 99.99%
        </div>
        <el-tabs
        v-model="activeName"
        type="card"
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
    </div>
  </div>
</template>

<script>
export default {
  name: "page_trainresult",
  components: {
    // 注册所有组件
    phrace: resolve => require(["./components/phrace"], resolve),
    train: resolve => require(["./components/train"], resolve),
    test: resolve => require(["./components/test"], resolve),
  },
  data() {
    return {
    activeName: 'test',
      tabMapOptions: [
        { label: "问答", key: "phrace" },
        { label: "训练集", key: "train" },
        { label: "测试集", key: "test" },
      ],
    example: {
        allAmount: 0,
        test: 0,
        train: 0
      },
    };
  }
};
</script>
<style lang="scss" scoped>
.page_trainresult {
    position: relative;
    .accuracyRate{
        position: absolute;
        right: 44px;
        top: 41px;
        color: #f44336;
    }
    .el-tabs__header{
        margin-bottom:0;
    }
    .el-tabs__nav{
        background:#fff;
    }
}
</style>