<template>
  <div class="app-container">
    <div class="pany">
      <el-row type="flex" class="row-bg" justify="space-between">
        <el-col :span="6">
          <el-button type="primary" plain @click="handleAdd">添加</el-button>
          <el-upload
            class="upload"
            :action="uploadUrl"
            :limit="1"
            :on-exceed="handleExceed"
            :on-success="handleUploadSuc"
            :on-error="handleUploadError"
            :file-list="fileList">
            <!--            <el-button type="button" plain>导入</el-button>-->
          </el-upload>

        </el-col>
        <el-col :span="6">
          <div>
            <el-input placeholder="请输入关键词" class="searchword" v-model="searchword" @keyup.enter.native="seachKeyWords">
              <i slot="suffix" class="el-input__icon el-icon-search" @click="seachKeyWords"/>
            </el-input>
          </div>
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
        <el-table-column label="专有词">
          <template slot-scope="scope">{{ scope.row.standard_name }}</template>
        </el-table-column>
        <!-- <el-table-column label="别名" align="center">
          <template slot-scope="scope"> -->
        <!-- <span>{{ scope.row.aliasName }}</span> -->
        <!-- <span v-for="(i,index) in scope.row.interpretationItems" :key="index">{{ i.aliasName }}<i v-if="index!=scope.row.interpretationItems.length-1">、</i></span>
      </template>
    </el-table-column> -->
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
      :title="dialogTitle + '专有名词'"
      :visible.sync="dialogVisible"
      :before-close="handleClose2"
      width="40%"
      class="dialog-box"
    >
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="90px"
        class="demo-ruleForm"
      >
        <el-form-item class="mgtp20" label="专有名词" prop="standard_name">
          <el-input
            type="input"
            v-model="ruleForm.standard_name"
            placeholder="请输入专有名词"
            autofocus
            class="content"
            ref="input1"
          />
          <span>{{ruleForm.standard_name.length}}/50</span>
        </el-form-item>
        <!-- <el-form-item class="mgtp20" label="别名" prop="interpretationItems">
          <el-tag
            :key="index"
            v-for="(tag,index) in ruleForm.interpretationItems"
            closable
            :disable-transitions="false"
            @close="handleClose(tag)"
            class="tagItem"
          >{{tag.aliasName}}</el-tag>
          <el-input
            class="input-new-tag"
            v-if="inputVisible"
            v-model="inputValue"
            ref="saveTagInput"
            size="small"
            @keyup.enter.native="handleInputConfirm"
            @blur="handleInputConfirm"
          ></el-input>
          <el-button v-else class="button-new-tag" size="small" @click="showInput">+ 新增</el-button>
        </el-form-item> -->
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')" class="mgtp20">提交</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
  import {
    getQueryInterpretationPageList,
    addInterpretation,
    updateInterpretation,
    deleteInterpretationById
  } from "@/api/generate/interpretation";
  import {uploadFileAboutInterpretation} from "@/api/expand/interpretation";

  export default {
    name: "page_Proper", //专有词典
    data() {
      return {
        fileList: [],
        uploadUrl: uploadFileAboutInterpretation,
        isEdit: false,
        curPage: 1,
        pageSize: 20,
        totalCount: 0,
        pageCount: 0,
        searchword: "",
        listLoading: true,
        list: [],
        dialogVisible: false,
        inputVisible: false,
        inputValue: "",
        ruleForm: {
          standard_name: "",
          //interpretationItems: []
        },
        curEditForm: {
          id: "",
          version: "",
          standard_name: "",
          //interpretationItems: []
        },
        rules: {
          standard_name: [
            {required: true, message: "请输入专有名词", trigger: "blur"},
            {min: 0, max: 50, message: "长度在50个字以内", trigger: "blur"}
          ]
        }
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
            // "StandardName.Operator": 8,
            "standard_name": this.searchword,
            ...data
          };
        }
        let listData = await getQueryInterpretationPageList(data);
        this.totalCount = listData.data.totalCount;
        this.list = listData.data.data;
        this.listLoading = false;
      },
      seachKeyWords() {
        this.curPage = 1;
        this.fetchData();
      },
      handleAdd() {
        this.isEdit = false;
        this.ruleForm = {
          standard_name: "",
          creation_id: window.sessionStorage.getItem('user_id'),
          last_modifier_id: window.sessionStorage.getItem('user_id')

          //interpretationItems: []
        };
        this.dialogVisible = true;
        this.$nextTick(() => {
          this.$refs.input1.focus();
        });
      },
      handleEdit(index, data) {
        this.isEdit = true;
        this.ruleForm.standard_name = this.curEditForm.standard_name = data.standard_name;
        //this.ruleForm.interpretationItems = this.curEditForm.interpretationItems = data.interpretationItems;
        this.curEditForm.version = data.version;
        this.curEditForm.id = data.id;
        this.dialogVisible = true;
        this.$nextTick(() => {
          this.$refs.input1.focus();
        });
      },
      handleDelete(index, data) {
        deleteInterpretationById(data.id).then((response) => {
          if (response.code == 200) {
            this.$message({
              message: response.message,
              type: 'success',
              duration: 3 * 1000
            });
            this.fetchData();
          } else {
            this.$message({
              message: response.message,
              type: 'warning',
              duration: 3 * 1000
            });
          }
          //this.$refs[formName].resetFields();
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
        // this.ruleForm.interpretationItems.splice(
        //   this.ruleForm.interpretationItems.indexOf(tag),
        //   1
        // );
      },
      handleClose2() {
        // this.ruleForm.interpretationItems = [];
        this.dialogVisible = false;
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
          this.ruleForm.interpretationItems.push({aliasName: inputValue});
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
            if (this.isEdit) {
              let params = {
                ...this.ruleForm,
                version: this.curEditForm.version,
                id: this.curEditForm.id
              };
              updateInterpretation(this.curEditForm.id, params).then((resp) => {
                if (resp.code == 200) {
                  this.$message({
                    message: resp.message,
                    type: 'success',
                    duration: 3 * 1000
                  });
                  this.fetchData();
                  this.handleClose2();
                  this.$refs[formName].resetFields();

                } else {
                  this.$message({
                    message: resp.message,
                    type: 'warning',
                    duration: 3 * 1000
                  });
                  this.fetchData();
                  this.handleClose2();
                  this.$refs[formName].resetFields();

                }
              });
            } else {
              console.warn(this.ruleForm);
              addInterpretation(this.ruleForm).then(resp => {
                if (resp.code == 200) {
                  this.$message({
                    message: resp.message,
                    type: 'success',
                    duration: 3 * 1000
                  });
                  this.fetchData();
                  this.handleClose2();
                  this.$refs[formName].resetFields();
                } else {
                  this.$message({
                    message: resp.message,
                    type: 'warning',
                    duration: 3 * 1000
                  });
                  this.fetchData();
                  this.handleClose2();
                  this.$refs[formName].resetFields();

                }
              });
            }
          } else {
            return false;
          }
        });
      },
    }
  };
</script>

<style lang="scss" scoped>
  .el-pagination {
    text-align: center;
    margin-top: 15px;
  }

  .tagItem + .tagItem {
    margin-left: 4px;
  }

  .upload {
    display: inline;
    margin-left: 10px;
  }

  /deep/ .el-upload-list {
    display: none;
  }
</style>
