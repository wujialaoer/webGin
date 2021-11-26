<template>
  <div class="app-container page_newqa">
    <div class="qaWrap">
    <el-form
      :model="ruleForm2"
      :rules="rules2"
      ref="ruleForm2"
      label-width="55px"
      class="demo-ruleForm2"
    >
    <el-form-item label="问题" prop="question">
        <el-input v-model="ruleForm2.question"></el-input>
    </el-form-item>
     <el-form-item label="答案" prop="answer">
    <el-input type="textarea" v-model="ruleForm2.answer"></el-input>
  </el-form-item>
    <el-form-item>
        <el-button
          type="primary"
          @click="submitForm('ruleForm')"
        >下一步</el-button>
        <el-button @click="lastStep">上一步</el-button>
        <el-button @click="resetForm(-1)">取消</el-button>
      </el-form-item>
    </el-form>
    <el-form
        v-if="step==1"
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      label-width="100px"
      class="demo-ruleForm"
    >
      <el-form-item
        label="知识包"
        prop="package"
      >
        <el-select
          v-model="ruleForm.package"
          placeholder="请选择知识包"
        >
          <el-option
            label="弹性福利"
            value="tanxing"
          ></el-option>
          <el-option
            label="小猪计划"
            value="xiaozhu"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item
        label="知识类型"
        prop="type"
      >
        <el-select
          v-model="ruleForm.type"
          placeholder="请选择知识类型"
        >
          <el-option
            label="简单知识"
            value="simple"
          ></el-option>
          <el-option
            label="多伦知识"
            value="complex"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          @click="submitForm('ruleForm')"
        >下一步</el-button>
        <el-button @click="resetForm(-1)">取消</el-button>
      </el-form-item>
    </el-form>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
    name: "IntentionSample",
  components: {
    // 注册所有组件
  },
  data() {
    return {
      step: 1,
      ruleForm: {
        package: "",
        type: ""
      },
      rules: {
        package: [
          { required: true, message: "请选择知识包", trigger: "change" }
        ],
        type: [{ required: true, message: "请选择知识类型", trigger: "change" }]
      },
      ruleForm2: {
        question: "",
        answer: ""
      },
      rules2: {
        question: [
          { required: true, message: "请输入问题", trigger : "change" }
        ],
        answer: [{ required: true, message: "请输入答案", trigger: "change" }]
      }
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          console.warn(this.ruleForm);
          alert("submit!");
          this.step = 2;
        } else {
          return false;
        }
      });
    },
    lastStep(){
        this.ruleForm2 = {
            question: "",
            answer: ""
        };
        this.step = 1;
    },
    resetForm(step) {
      this.$router.go(step);
    }
  }
};
</script>

<style lang="scss">
.page_newqa {
  .el-steps--simple {
    padding: 13px 18%;
  }
  .qaWrap {
    background: #fff;
    padding: 40px 30px;
  }
  .demo-ruleForm2{
      width:570px ;
  }
  .el-textarea__inner{
      min-height:200px;
    }

}
</style>
