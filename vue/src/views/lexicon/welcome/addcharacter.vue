<template>
  <div class="app-container page_addcharacter">
    <div class="qaWrap">
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="75px"
        class="demo-ruleForm"
      >
        <el-form-item label="个性名" prop="name">
          <el-input v-model="ruleForm.name" placeholder="请输入个性" ref="input1"/>
        </el-form-item>
        <el-form-item>
          <el-button @click="resetForm(-1)">取消</el-button>
          <el-button
            type="primary"
            @click="submitForm('ruleForm')"
            :disabled="showLoading"
          >保存
          </el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>
<script>
  // import { mapState } from "vuex";
  import {addPersonality, updatePersonality} from "@/api/expand/personality";

  var timer = null;
  export default {
    name: "addCharacter",
    components: {
      // 注册所有组件
    },
    data() {
      return {
        showLoading: false,
        isEdit: false,
        ruleForm: {
          name: "",
          creation_id: window.sessionStorage.getItem('user_id'),
          last_modifier_id: window.sessionStorage.getItem('user_id')
        },
        rules: {
          name: [{required: true, message: "请输入个性名", trigger: "change"}]
        },
      };
    },
    beforeDestroy() {
      timer = null;
    },
    created() {
      this.ruleForm = {
        name: "",
        creation_id: window.sessionStorage.getItem('user_id'),
        last_modifier_id: window.sessionStorage.getItem('user_id'),
        is_delete: 0
      };
      if (this.$route.params.isEdit == true) {
        this.isEdit = true;
        this.ruleForm.name = this.$route.params.name;

      }
    },
    mounted() {
      this.$nextTick(() => {
        this.$refs.input1.focus();
      });
    },
    methods: {
      submitForm(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            this.showLoading = true;
            console.warn(this.ruleForm);
            let data = {
              ...this.ruleForm
            };
            if (this.isEdit == true) {
              updatePersonality(this.$route.params.id, data).then((resp) => {
                // this.$refs[formName].resetFields();
                this.showLoading = false;
                this.$message({
                  message: '恭喜你，修改成功',
                  type: 'success'
                });

                timer = setTimeout(() => {
                  this.resetForm(-1);
                }, 1000);


              });
            } else {
              addPersonality(data).then((resp) => {
                this.$refs[formName].resetFields();
                this.$message({
                  message: '恭喜你，添加成功',
                  type: 'success'
                });
                this.showLoading = false;
                timer = setTimeout(() => {
                  this.resetForm(-1);
                }, 1000);
              }, (err) => {
                console.warn(err);
                this.$message({
                  message: '操作失败',
                  type: 'error'
                });
                this.showLoading = false;
              });
            }


          } else {
            return false;
          }
        });
      },
      resetForm(step) {
        this.$router.go(step);
      }
    }
  };
</script>

<style lang="scss" scoped>
  .page_addcharacter {
    .el-steps--simple {
      padding: 13px 18%;
    }

    .el-select {
      width: 100%;
    }

    .qaWrap {
      background: #fff;
      padding: 40px 30px;
    }

    .demo-ruleForm {
      width: 40%;
      min-width: 320px;
    }

    .el-textarea__inner {
      min-height: 200px;
    }

  }
</style>
