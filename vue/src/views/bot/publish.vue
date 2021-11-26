<template>
  <div class="app-container">
    <!-- <div class="pany"> -->
    <el-card
      class="box-card"
      shadow="never"
      :body-style="{overflow:'hidden'}"
    >
      <el-col :span="10">
        <el-select
          v-model="selectBotValue"
          @change="selectIntent"
          placeholder="Bot选择"
        >
          <el-option
            v-for="item in botOption.data"
            :key="item.value"
            :label="item.text"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </el-col>
      <el-col
        :span="6"
        :offset="8"
      >
        <el-button
          class="fr"
          type="success"
          size="medium"
          plain
        >发布
        </el-button>
        <!-- @click="publishBot" -->
      </el-col>

    </el-card>
    <!-- </div> -->
  </div>
</template>

<script>
  import {getBotManageSelect} from "@/api/generate/botManage";
  import {publishBot} from "@/api/expand/botManage";

  export default {
    data() {
      return {
        botOption: [],
        selectBotValue: "",
      }
    },
    created() {
      this.initOption();
    },
    methods: {
      async initOption() {
        this.botOption = await getBotManageSelect();
        console.warn(this.botOption);
      },
      publishBot() {
        let data = {
          id: this.selectBotValue
        }
        publishBot(data).then((resp) => {
          if (resp.code == 200) {
            this.$message({
              message: resp.message,
              type: "success",
              duration: 2000
            });
            this.fetchData();
          } else {
            this.$message({
              message: resp.message,
              type: "warning",
              duration: 2000
            });
            this.fetchData();

          }
        });
      },
      selectIntent(val) {
        // let obj = {};
        // obj = this.botOption.data.find((item)=>{
        //     return item.value === val;//比如：选项2
        // });
        // this.curBotName = obj.text;
        // console.warn(obj);
      }
    }
  }
</script>

<style lang="scss" scoped>

</style>
