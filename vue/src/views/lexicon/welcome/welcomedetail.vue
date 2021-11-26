<template>
  <div class="app-container" v-if="$route.name == 'WelcomeDetail'">
    <div class="pany" style="margin-top:-15px">
      <el-tabs v-model="activeName" @tab-click="handleClick" style="margin-top:-15px">
        <el-tab-pane label="问候语" name="first">
          <welcomelist></welcomelist>
        </el-tab-pane>
        <el-tab-pane label="闲聊" name="second">
          <autoresponselist></autoresponselist>
        </el-tab-pane>
      </el-tabs>
    </div>
  </div>
</template>

<script>
  export default {
    name: "WelcomeDetail",
    data() {
      return {
        activeName: "first",
      };
    },
    components: {
      welcomelist: resolve => require(["@/views/lexicon/welcome/welcomelist"], resolve),
      autoresponselist: resolve => require(["@/views/lexicon/welcome/autoresponselist"], resolve),
    },
    methods: {
      handleClick() {

      }
    }
  };
</script>

<style lang="scss" scoped>
  .pany {
    padding: 23px;
    box-sizing: border-box;
  }
</style>
