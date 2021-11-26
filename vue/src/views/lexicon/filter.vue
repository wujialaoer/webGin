<template>
  <div class="app-container page_filterWord">
    <div class="pany">
      <el-row type="flex" class="row-bg" justify="space-between">
        <el-col :span="6">
          <el-button type="primary" @click="handleAdd" plain>添加</el-button>
          <!--          <el-button type="info" v-if="false" plain disabled>导入</el-button>-->
        </el-col>
        <el-col :span="6">
          <el-input placeholder="请输入关键词" class="searchword" v-model="searchword" @keyup.enter.native="seachKeyWords">
            <i slot="suffix" class="el-input__icon el-icon-search" @click="seachKeyWords"/>
          </el-input>
        </el-col>
      </el-row>

      <el-table
        v-loading="listLoading"
        element-loading-text="Loading"
        :data="list"
        fit
        highlight-current-row
      >
        <el-table-column align="center" label="#" width="95">
          <template slot-scope="scope">{{ (curPage - 1) * pageSize + scope.$index + 1 }}</template>
        </el-table-column>
        <el-table-column label="过滤词">
          <template slot-scope="scope">{{ scope.row.word }}</template>
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
      <el-dialog
        :title="dialogTitle + '过滤词'"
        :visible.sync="dialogVisible"
        :before-close="handleClose"
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
          <el-form-item class="mgtp20" label="过滤词" prop="word">
            <el-input
              type="input"
              v-model="ruleForm.word"
              placeholder="请输入过滤词"
              autofocus
              class="content"
              ref="inputfilterword"
              @keyup.enter.native="submitForm('ruleForm')"
            />
            <span>{{ruleForm.word.length}}/30</span>
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="submitForm('ruleForm')" class="mgtp20">提交</el-button>
          </el-form-item>
        </el-form>
      </el-dialog>
    </div>
  </div>
</template>

<script>
  import {
    getQueryFilterWordsPageList,
    addFilterWords,
    updateFilterWords,
    deleteFilterWordsById
  } from "@/api/generate/filterWords";

  export default {
    name: "page_filterWord",
    data() {
      return {
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
        ruleForm: {
          word: ""
        },
        rules: {
          word: [
            {required: true, message: "请输入过滤词", trigger: "blur"},
            {min: 0, max: 30, message: "长度在30个字以内", trigger: "blur"}
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
            // "Word.Operator": 8,
            "word": this.searchword,
            ...data
          };
        }
        let listData = await getQueryFilterWordsPageList(data);
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
          word: "",
        };
        this.isEdit = false;
        this.dialogVisible = true;
        this.$nextTick(() => {
          this.$refs.inputfilterword.focus();
        });
      },
      handleEdit(index, data) {
        this.isEdit = true;
        this.curEditForm = data;
        this.ruleForm = {
          word: data.word,
          creation_id: window.sessionStorage.getItem('user_id'),
          last_modifier_id: window.sessionStorage.getItem('user_id')
        };
        this.dialogVisible = true;
        this.$nextTick(() => {
          this.$refs.inputfilterword.focus();
        });
      },
      handleDelete(index, data) {
        deleteFilterWordsById(data.id).then((res) => {
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
      handleClose() {
        this.dialogVisible = false;
        this.$refs["ruleForm"].resetFields();
      },
      submitForm(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            if (this.isEdit == true) {
              let params = {
                ...this.ruleForm,
                version: this.curEditForm.version
              };
              updateFilterWords(this.curEditForm.id, params).then((resp) => {
                if (resp.code = 200) {
                  this.$message({
                    message: "过滤词已更新",
                    type: "success"
                  });
                  this.fetchData();
                  this.handleClose();
                } else {
                  this.$message({
                    message: "过滤词更新失败",
                    type: "warning"
                  });

                }
              });
            } else {
              addFilterWords(this.ruleForm).then(resp => {
                this.$message({
                  message: "恭喜你，添加成功",
                  type: "success"
                });
                this.fetchData();
                this.handleClose();
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
</style>
