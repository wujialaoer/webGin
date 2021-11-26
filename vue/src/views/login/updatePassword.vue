<template>
  <div class="app-container">
    <!--    <h4 style="color: red">请注意密码强度</h4>-->
    <div class="pany">
    <el-form
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      label-width="150px"
      class="demo-ruleForm"
    >
      <el-form-item label="当前密码" prop="old_P">
        <el-input style="width: 50%" :type="passwordType" v-model="ruleForm.old_P" placeholder="请输入原密码"></el-input>
      </el-form-item>
      <el-form-item label="新密码" prop="new_p">
        <el-input style="width: 50%" :type="passwordType" v-model="ruleForm.new_p" placeholder="请输入新密码"></el-input>
      </el-form-item>
      <el-form-item label="再次输入新密码" prop="cor_p">
        <el-input style="width: 50%" :type="passwordType" v-model="ruleForm.cor_p" placeholder="再次输入新密码"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="updatePas">确定</el-button>
      </el-form-item>
    </el-form>
    </div>
  </div>
</template>

<script>
  import {updatePWD} from "@/api/user";

  export default {
    name: "updatePassword",
    data() {
      const validatePassword = (rule, value, callback) => {
        if (value.length < 6) {
          callback(new Error("The password can not be less than 6 digits"));
        } else {
          callback();
        }
      };
      return {
        ruleForm: {
          old_P: "",
          new_p: "",
          cor_p: ""
        },
        rules: {
          old_P: [{required: true, trigger: "blur", validator: validatePassword}],
          new_p: [{required: true, trigger: "blur", validator: validatePassword}],
          cor_p: [{required: true, trigger: "blur", validator: validatePassword}]
        },
        passwordType: "password",
      };
    },
    methods: {
      updatePas() {
        console.log(this.ruleForm);
        updatePWD(this.ruleForm).then((res) => {
          if (res.code == 200) {
            this.$message({
              message: res.message,
              type: "success",
              duration: 3000
            });
            this.$store.dispatch('user/logout');
            this.$router.push('/login');
          } else {
            this.$message({
              message: res.message,
              type: "warning",
              duration: 3000
            });

          }
        });
      },
    }
  };
</script>

<style lang="scss" scoped>
  .pany{
    padding-top:40px;
  }
</style>
