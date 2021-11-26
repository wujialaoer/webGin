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
            <!--            <el-button type="info" plain disabled>导入</el-button>-->
          </el-upload>
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
          <template slot-scope="scope">{{ (curPage - 1) * pageSize + scope.$index + 1}}</template>
        </el-table-column>
        <el-table-column label="集合名称" width="95">
          <template slot-scope="scope">{{ scope.row.setName }}</template>
        </el-table-column>
        <el-table-column label="内容(每个词用'|'分隔)" align="center">
          <template slot-scope="scope">
            <span v-for="(i,index) in scope.row.wordSetItems" :key="index">{{ i.content }}<i
              v-if="index!=scope.row.wordSetItems.length-1"> | </i></span>
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
      :title="dialogTitle + '词集合'"
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
        <el-form-item class="mgtp20" label="词集合" prop="setName">
          <el-input
            type="input"
            v-model="ruleForm.setName"
            placeholder="请输入词集合"
            autofocus
            class="content"
            ref="input1"
          />
          <span>{{ruleForm.setName.length}}/10</span>
        </el-form-item>
        <el-form-item class="mgtp20" label="内容" prop="wordSetItems">
          <el-tag
            :key="index"
            v-for="(tag,index) in ruleForm.wordSetItems"
            closable
            :disable-transitions="false"
            @close="handleClose(tag)"
          >{{tag.content}}
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
  import {getQueryWordSetPageList, updateWordSet, deleteWordSetById, addWordSet} from "@/api/generate/wordSet";
  import {uploadFileAboutWordSet} from "@/api/expand/wordSet";

  export default {
    name: "Wordgather",
    data() {
      return {
        fileList: [],
        uploadUrl: uploadFileAboutWordSet,
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
          setName: "",
          wordSetItems: []
        },
        rules: {
          setName: [
            {required: true, message: "请输入过滤词", trigger: "blur"},
            {min: 0, max: 10, message: "长度在10个字以内", trigger: "blur"}
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
            // "setName.Operator": 8,
            "set_name": this.searchword,
            ...data
          };
        }
        let listData = await getQueryWordSetPageList(data);
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
          setName: "",
          wordSetItems: []
        };
        this.isEdit = false;
        this.dialogVisible = true;
        this.$nextTick(() => {
          this.$refs.input1.focus();
        });
      },
      handleEdit(index, data) {
        this.isEdit = true;
        this.curEditForm = data;
        this.ruleForm = {
          setName: data.setName,
          wordSetItems: data.wordSetItems
        };
        this.dialogVisible = true;
        this.$nextTick(() => {
          this.$refs.input1.focus();
        });
      },
      handleDelete(index, data) {
        deleteWordSetById(data.id).then(() => {
          this.fetchData();
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
        this.ruleForm.wordSetItems.splice(this.ruleForm.wordSetItems.indexOf(tag), 1);
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
          this.ruleForm.wordSetItems.push({content: inputValue});
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
              updateWordSet(this.curEditForm.id, params).then(resp => {
                this.fetchData();
                this.handleClose2();
              });
            } else {
              addWordSet(this.ruleForm).then(resp => {
                console.warn(resp);
                this.$message({
                  message: "恭喜你，添加成功",
                  type: "success"
                });
                this.fetchData();
                this.handleClose2();
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
</style>
