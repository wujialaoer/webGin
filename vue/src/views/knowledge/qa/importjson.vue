<template>
  <div class="app-container page_newqa">
    <el-card class="box-card">

      <div class="qaWrap">
        <el-form
          :model="ruleForm"
          :rules="rules"
          :hide-required-asterisk="false"
          ref="ruleForm"
          label-width="100px"
          class="demo-ruleForm"
        >
          <el-form-item label="知识应用" prop="faqPackages" @change="selectOption">
            <el-select v-model="ruleForm.faqPackages" value-key="value" placeholder="请选择知识应用">
              <el-option
                v-for="item in knpOptions.data"
                :key="item.value"
                :value="item"
                :label="item.text"
              ></el-option>
            </el-select>
          </el-form-item>
          <el-form-item label="知识包" prop="faq_data">
            <el-select v-model="ruleForm.faq_data" placeholder="请选择知识包" @change="selectOption">
              <el-option
                v-for="item in ruleForm.faqPackages.children"
                :key="item.value"
                :value="item"
                :label="item.text"
              ></el-option>
            </el-select>
            <!--          <span class="required" style="font-size: 25px;color:red">*</span>-->
          </el-form-item>
        </el-form>
      </div>
      <div class="footer">
        <el-button @click="resetForm(-1)" class="btn-cancel">取 消</el-button>
        <el-button plain type="primary" @click="hanldebeforeUploadClick('ruleForm')">导入</el-button>
        <el-upload
          ref="uploadBtn"
          class="uploadBtn"
          :headers="headers"
          :action="uploadUrl"
          multiple
          :limit="3"
          :data="faq_data"
          :on-success="handleAvatarSuccess"
          :show-file-list="false"
        >
          <el-button plain type="primary">导入</el-button>
        </el-upload>
      </div>
    </el-card>
  </div>

</template>

<script>
  import {mapState} from "vuex";
  import {ImportFaqJson} from "@/api/generate/faq";
  import {setTimeout} from "timers";

  export default {
    name: "importjson",
    data() {
      return {
        faqPackages: {
          'text': "",
          'value': "",
          'children': []
        },
        faq_data: {},
        ruleForm: {
          faqPackages: "",
          faq_data: ""
        },
        rules: {
          faqPackages: [
            {required: true, message: "请输入知识应用", trigger: "change"}
          ],
          faq_data: [
            {required: true, message: "请输入知识包", trigger: "change"}
          ]
        },
        uploadUrl: ImportFaqJson,
        headers: {
          Authorization: 'JWT ' + sessionStorage.getItem('access_token'),
        },
        showUploadBtn:false,
      };
    },
    computed: {
      ...mapState({
        knpOptions: state => state.faq.knpOptions
      })
    },
    methods: {
      selectOption(item) {
        this.faq_data = item;
        console.log(item);
      },
      resetForm(step) {
        this.$router.go(step);
      },
      hanldebeforeUploadClick(formName){
        this.$refs[formName].validate(valid => {
          if (valid) {
            //验证成功后自动触发点击上传按钮
            $('.uploadBtn .el-upload__input').click();
          }else{
          }
        });
      },
      handleAvatarSuccess(res, file) {
        if (res.code == 200) {
          this.$message({
            message: res.message,
            type: "success",
            duration: 3 * 1000
          });
          var timer = setTimeout(() => {
            this.$router.push({name: "Qa"});
            // this.resetForm(-1);
          }, 1000);
        } else {
          this.$message({
            message: res.message,
            type: "warning",
            duration: 3 * 1000
          });
        }
      },

    },

  };
</script>

<style lang="scss" scoped>
  .page_newqa {

    .qaWrap {
      background: #fff;
      padding: 40px 30px;
    }


    .demo-ruleForm {
      .star {
        position: absolute;
        left: 100px;
      }

    }


    .el-select {
      width: 20%;
      min-width:260px;
    }

    .uploadBtn{
      display:none;
    }
  }
</style>
