<template>
  <div class="app-container page_intentionSample">
    <el-card
      class="box-card"
      shadow="never"
      :body-style="{overflow:'hidden'}"
    >
      <el-col :span="10">
        <div
          class="pany-title"
          style="color: #1e87e4;font-size: 18px;"
        >
          xxx项目xxx分类预料管理
        </div>

      </el-col>
      <el-col
        :span="6"
        :offset="8"
      >
        <el-button
          class="fr"
          type="success"
          size="medium"
          @click="dialogVisible=true"
        >发布</el-button>
        <el-button
          class="fr"
          type="danger"
          size="medium"
          @click="dialogVisible=true"
          :style="{'margin-right':'10px'}"
        >预览</el-button>

      </el-col>

    </el-card>
    <el-row
      :gutter="20"
      v-if="false"
    >
      <el-col :span="8">
        <div class="example">
          <div class="icon">
            <img
              src="~@/assets/img/bot_09_chart01.png"
              alt=""
            >
          </div>
          <div class="introBox">
            <span class="intro">{{example.allAmount}}</span>
            <p class="title">样本总量</p>
          </div>

        </div>
      </el-col>
      <el-col :span="8">
        <div class="example">
          <div class="icon">
            <img
              src="~@/assets/img/bot_09_chart02.png"
              alt=""
            >
          </div>
          <div class="introBox">
            <span class="intro">{{example.test}}</span>
            <p class="title">测试样本</p>
          </div>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="example">
          <button @click="publish">发布</button>
          <div class="icon">
            <img
              src="~@/assets/img/bot_09_chart03.png"
              alt=""
            >
          </div>
          <div class="introBox">
            <span class="intro">{{example.train}}</span>
            <p class="title">训练样本</p>
          </div>
        </div>
      </el-col>
    </el-row>
    <!--  -->
    <el-tabs
      v-model="activeName"
      style="margin-top:15px;"
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
</template>

<script>
export default {
  name: "IntentionSample",
  components: {
    // 注册所有组件
    train: resolve => require(["./components/train"], resolve),
    test: resolve => require(["./components/test"], resolve),
    intention: resolve => require(["./components/intention"], resolve),
    entity: resolve => require(["./components/entity"], resolve),
    process: resolve => require(["./components/process"], resolve),
    phrace: resolve => require(["./components/phrace"], resolve)
  },
  data() {
    return {
    activeName: 'train',
      tabMapOptions: [
        { label: "训练集", key: "train" },
        { label: "测试集", key: "test" },
        { label: "意图", key: "intention" },
        { label: "实体", key: "entity" },
        { label: "流程", key: "process" },
        { label: "短语列表", key: "phrace" }
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
<style lang="scss">
.page_intentionSample {
    .el-tabs__header{
        margin-bottom:0;
    }
    .el-tabs__nav{
        background:#fff;
    }
}
</style>