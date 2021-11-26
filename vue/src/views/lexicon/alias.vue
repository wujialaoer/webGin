<template>
  <div class="app-container">
    <div class="pany">
      <el-row type="flex" class="row-bg" justify="space-between">
        <el-col :span="18" class="nav-bar-l">
          <el-button type="primary" plain @click="handleAdd">添加</el-button>
          <el-upload
            class="upload"
            :headers="headers"
            :action="uploadUrl"
            :limit="1"
            :data="fileType"
            :on-exceed="handleExceed"
            :on-success="handleUploadSuc"
            :file-list="fileList">
            <el-button type="primary" plain>导入</el-button>
          </el-upload>
          <el-link target="_blank" :href='template_url' :underline="false" style="margin-left:10px">
            <el-button type="primary">模板下载</el-button>
          </el-link>
        </el-col>
        <el-col :span="6">
          <el-input placeholder="请输入关键词" class="searchword" v-model="searchword" @keyup.enter.native="seachKeyWords">
            <i slot="suffix" class="el-input__icon el-icon-search" @click="seachKeyWords"/>
          </el-input>
        </el-col>
      </el-row>

      <el-table
        v-loading="listLoading"
        :data="list"
        element-loading-text="Loading"
        fit
        highlight-current-row
      >
        <el-table-column align="center" label="ID" width="95">
          <template slot-scope="scope">{{ (curPage - 1) * pageSize + scope.$index + 1 }}</template>
        </el-table-column>
        <el-table-column label="标准名" width="95">
          <template slot-scope="scope">{{ scope.row.standard_name }}</template>
        </el-table-column>
        <el-table-column label="别名" align="center">
          <template slot-scope="scope">
            <!-- <span>{{ scope.row.aliasName }}</span> -->
            <span v-for="(i,index) in scope.row.dis_aliasItems" :key="index">{{ i.aliasName }}<i
              v-if="index!=scope.row.dis_aliasItems.length-1"> | </i></span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="150">
          <template slot-scope="scope">
            <el-button size="mini" type="text" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
            <el-divider direction="vertical"/>
            <el-button size="mini" type="text" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        class="mgtp20"
        layout="prev, pager, next"
        :page-size="pageSize"
        prev-text="上一页"
        next-text="下一页"
        :total="totalCount"
        @current-change="handleCurrentChange"
      />
    </div>
    <el-dialog
      :title="dialogTitle + '别名'"
      :visible.sync="dialogVisible"
      :before-close="handleClose2"
      width="40%"
      class="dialog-box"
    >
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="70px"
        class="demo-ruleForm"
      >
        <el-form-item class="mgtp20" label="标准名" prop="standard_name">
          <el-input
            type="input"
            v-model="ruleForm.standard_name"
            placeholder="请输入标准名"
            autofocus
            class="content"
            ref="inpu1"
          />
          <span>{{ruleForm.standard_name.length}}/30</span>
        </el-form-item>
        <el-form-item class="mgtp20" label="别名" prop="aliasItems">
          <el-tag
            :key="index"
            v-for="(tag,index) in ruleForm.aliasItems"
            closable
            :disable-transitions="false"
            @close="handleClose(tag)"
          >{{tag.aliasName}}
          </el-tag>
          <el-input
            class="input-new-tag"
            v-if="inputVisible"
            v-model="inputValue"
            ref="saveTagInput"
            size="small"
            @keyup.enter.native="handleInputConfirm"
            @blur="handleInputConfirm"
          />
          <el-button v-else class="button-new-tag" size="small" @click="showInput">+ 新增</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')" class="mgtp20">提交</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
  //import { getAliasList ,addAlias } from "@/api/aliasName";
  import {getQueryAliasPageList, addAlias, updateAlias, deleteAliasById} from "@/api/generate/alias";
  import {uploadFileAboutAlias} from "@/api/expand/alias";

  export default {
    name: "page_alias",
    data() {
      return {
        fileList: [],
        fileType: {
          up_type: 'alias'
        },
        uploadUrl: uploadFileAboutAlias,  // http://127.0.0.1:12345/api/v1/Alias/Import/
        headers: {
          Authorization: 'JWT ' + sessionStorage.getItem('access_token'),
        },
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
          aliasItems: [],
          creation_id: '',
          last_modifier_id: ''
        },
        rules: {
          standard_name: [
            {required: true, message: "请输入标准词", trigger: "blur"},
            {min: 0, max: 30, message: "长度在30个字以内", trigger: "blur"}
          ],
          aliasItems: [{required: true, message: "请输入别名", trigger: "change"},
          ],
        },
        template_url: process.env.VUE_APP_BASE_IMG_URL + '/download_alias',

      };
    },
    computed: {
      dialogTitle() {
        return this.isEdit == true ? '编辑' : '添加';
      },
    },
    created() {
      this.fetchData();
    },
    methods: {
      async fetchData() {
        this.listLoading = true;
        let data = {
          page: this.curPage,
          pageSize: this.pageSize,
        };
        if (this.searchword) {
          data = {
            // "standardName.Operator": 8,
            "standard_name": this.searchword,
            ...data
          };
        }
        let listData = await getQueryAliasPageList(data);
        this.totalCount = listData.data.totalCount;
        this.list = listData.data.data;
        this.listLoading = false;
      },
      seachKeyWords() {
        this.curPage = 1;
        this.fetchData();
      },
      handleAdd() {
        this.ruleForm = {
          standard_name: "",
          aliasItems: []
        };
        this.isEdit = false;
        this.dialogVisible = true;
        this.$nextTick(() => {
          this.$refs.inpu1.focus();
        });

      },
      handleEdit(index, data) {
        this.isEdit = true;
        this.curEditForm = data;
        this.ruleForm = {
          standard_name: data.standard_name,
          aliasItems: data.dis_aliasItems,
          creation_id: window.sessionStorage.getItem('user_id'),
          last_modifier_id: window.sessionStorage.getItem('user_id')
        };
        this.dialogVisible = true;
        this.$nextTick(() => {
          this.$refs.inpu1.focus();
        });
      },
      handleDelete(index, data) {
        deleteAliasById(data.id).then((res) => {
          if (res.code == 200) {
            this.$message({
              message: res.message,
              type: "success",
              duration: 2000
            });
            this.fetchData();
          } else {
            this.$message({
              message: res.message,
              type: "warning",
              duration: 2000
            });
          }
        });
      },
      handleCurrentChange(val) {
        //分页
        this.curPage = val;
        this.$nextTick(() => {
          window.scrollTo(0, 0);
        });
        this.fetchData();
      },
      handleClose(tag) {
        this.ruleForm.aliasItems.splice(this.ruleForm.aliasItems.indexOf(tag), 1);
      },
      handleClose2() {
        this.dialogVisible = false;
        this.$refs['ruleForm'].resetFields();
      },
      showInput() {
        this.inputVisible = true;
        this.$nextTick(_ => {
          this.$refs.saveTagInput.$refs.input.focus();
        });
      },
      handleInputConfirm() {
        let inputValue = this.inputValue;
        if (inputValue) {
          var str = inputValue.trim();
          console.log('str', str);
          if (str == '') {
            this.$message({
              message: '别名不允许出现空格',
              type: 'warning'
            });
            return false;
          } else {
            this.ruleForm.aliasItems.push({aliasName: inputValue.trim()});
          }
        }
        this.inputVisible = false;
        this.inputValue = "";
      },
      handleExceed(files, fileList) {
        this.$message.warning(`当前限制选择 1 个文件，本次选择了 ${files.length} 个文件，共选择了 ${files.length + fileList.length} 个文件`);
      },
      handleUploadSuc() {
        this.$message({
          message: '上传成功',
          type: 'success'
        });
        this.fetchData();
        this.fileList = [];
      },
      handleUploadError() {
        this.fileList = [];
      },
      submitForm(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            if (this.isEdit == true) {
              let params = {
                ...this.ruleForm,
                version: this.curEditForm.version
              };
              updateAlias(this.curEditForm.id, params).then(resp => {
                if (resp.code == 200) {
                  this.$message({
                    message: "恭喜你，添加成功",
                    type: "success"
                  });
                  this.fetchData();
                  this.handleClose2();
                } else {
                  this.$message({
                    message: resp.message,
                    type: "warning"
                  });
                }
              });
            } else {
              addAlias(this.ruleForm).then(resp => {
                if (resp.code == 200) {
                  this.$message({
                    message: "恭喜你，添加成功",
                    type: "success"
                  });
                  this.fetchData();
                  this.handleClose2();
                } else {
                  this.$message({
                    message: resp.message,
                    type: "warning"
                  });
                }
              });
            }

          } else {
            return false;
          }
        });
      }
    }
  };
</script>

<style lang="scss" scoped>
  .el-tag + .el-tag {
    margin-left: 10px;
  }

  .button-new-tag {
    margin-left: 10px;
    height: 32px;
    line-height: 30px;
    padding-top: 0;
    padding-bottom: 0;
  }

  .input-new-tag {
    width: 90px;
    margin-left: 10px;
    vertical-align: bottom;
  }

  .upload {
    display: inline;
    margin-left: 10px;
  }

  /deep/ .el-upload-list {
    display: none;
  }

  .nav-bar-l {
    display: flex;
    align-items: center;
  }
</style>
