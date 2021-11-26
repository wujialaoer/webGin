<template>
  <div class="app-container page_importData">
    <el-card class="box-card">
      <div class="title">
        批量导入问答管理注意事项:
      </div>
      <div class="text item">1、每一条知识必须是唯一含义</div>
      <div class="text item">2、上传的文件必须是有效的,每行记录唯一，不可有合并的单元格，模板的每一列都必须填写。</div>
      <div class="text item">3、只能是简单的知识,且问题和答案不可以为图片、视频、文件等形式。</div>
      <div class="text item">4、若需要在答案中呈现富文本，需要上传后再对相应内容做编辑。</div>
      <div class="text item">5、只能通过系统提供的模板上传。</div>
      <div class="footer">
        <el-button @click="resetForm(-1)" class="btn-cancel">取 消</el-button>
        <el-upload
          style="margin-right:10px;display: inline-block;"
          :headers="headers"
          :action="uploadUrl"
          :on-preview="handlePreview"
          multiple
          :limit="3"
          :data="fileType"
          :on-exceed="handleExceed"
          :before-upload="beforeAvatarUpload"
          :on-success="handleAvatarSuccess"
          :show-file-list="false"
        >
          <el-button plain type="primary">导入</el-button>

        </el-upload>
        <el-link target="_blank" :href='template_url' :underline="false" style="margin-left:15px">
          <el-button type="primary">模板下载</el-button>
        </el-link>
      </div>

    </el-card>
  </div>
</template>

<script>
  import {ImportFaq} from "@/api/generate/faq";
  import {setTimeout} from "timers";

  var timer = null;

  export default {
    name: 'importData',
    data() {
      return {
        fileList: [],
        fileType: {
          up_type: 'faq'
        },
        uploadUrl: ImportFaq,
        headers: {
          Authorization: 'JWT ' + sessionStorage.getItem('access_token'),
        },
        template_url: process.env.VUE_APP_BASE_IMG_URL + '/download_template',
        isEdit: false,
        curPage: 1,
        pageSize: 20,
        totalCount: 0,
        pageCount: 0,
        curEditForm: {},
        searchword: "",
        listLoading: true,
        list: [],
        dialogVisible: false,
        inputVisible: false,
        inputValue: "",
        ruleForm: {
          standard_name: "",
          aliasItems: []
        },
        rules: {
          standard_name: [
            {required: true, message: "请输入标准词", trigger: "blur"},
            {min: 0, max: 30, message: "长度在30个字以内", trigger: "blur"}
          ]
        }
      };
    },

    methods: {
      down_temp() {

      },
      handleAvatarSuccess(res, file) {
        //获取上传图片地址
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
      resetForm(step) {
        this.$router.go(step);
      },
      handlePreview(file) {
        // console.log(file);
      },
      beforeAvatarUpload(file) {
        const isLt2M = file.size / 1024 / 1024 < 2;
        if (!isLt2M) {
          this.$message.error("上传头像图片大小不能超过 2MB!");
        }
        this.importData = file;
        this.example = {
          allAmount: file.length,
          test: 0,
          train: file.length
        };
        return isLt2M;
      },
      handleExceed(files, fileList) {
        this.$message.warning(
          `当前限制选择 3 个文件，本次选择了 ${
            files.length
          } 个文件，共选择了 ${files.length + fileList.length} 个文件`
        );
      },

    },
  };
</script>

<style lang="scss" scoped>
  .title {
    font-size: 16px;
    font-weight: 500;
    margin-bottom: 20px;
  }

  .item {
    font-size: 14px;
    margin-bottom: 12px;
  }

  .btn-cancel {
    margin-right: 15px;
  }

  .footer {
    margin-top: 20px;
  }
</style>
