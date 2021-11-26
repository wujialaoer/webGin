<template>
  <div v-if="$route.name == 'WelcomeDetail'">
    <div class="pany" style="margin-top:-15px">
      <el-row type="flex" class="row-bg" justify="space-between">
        <el-col :span="6">
          <el-button type="primary" plain @click="handleAdd">添加</el-button>
<!--          <el-upload-->
<!--            style="margin-left:10px;display: inline-block;"-->
<!--            :action="uploadUrl"-->
<!--            :headers="headers"-->
<!--            :limit="1"-->
<!--            :on-success="handleUploadSuc"-->
<!--            :show-file-list="false"-->
<!--          >-->
<!--            <el-button type="info" plain>导入</el-button>-->
<!--          </el-upload>-->
        </el-col>
        <el-col :span="6">
          <div>
            <el-input placeholder="请输入关键词" class="searchword" v-model="searchword">
              <i slot="suffix" class="el-input__icon el-icon-search" @click="seachKeyWords"></i>
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
        <el-table-column align="center" label="#" width="95">
          <template slot-scope="scope">{{ (curPage - 1) * pageSize + scope.$index + 1 }}</template>
        </el-table-column>
        <el-table-column label="问题" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.problem }}</span>
          </template>
        </el-table-column>
        <el-table-column label="答案" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.answer }}</span>
          </template>
        </el-table-column>
        <el-table-column label="个性" align="center" width="95">
          <template slot-scope="scope">
            <span>{{ scope.row.name }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="150">
          <template slot-scope="scope">
            <!-- <el-button size="mini" type="text" @click="handleEdit(scope.$index, scope.row)">编辑</el-button> -->
            <el-divider direction="vertical"></el-divider>
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
      ></el-pagination>
    </div>
    <el-dialog :visible.sync="dialogVisible" title="新增闲聊">
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="120px"
        class="demo-ruleForm"
      >
        <el-form-item label="闲聊问题" prop="autoResQuestion">
          <el-input
            v-model="ruleForm.autoResQuestion"
            placeholder="小猪计划"
          ></el-input>
          <el-input v-model="ruleForm.id" v-show="false"></el-input>
        </el-form-item>
        <el-form-item label="闲聊答案" prop="autoResAnswer">
          <el-input
            type="textarea"
            v-model="ruleForm.autoResAnswer"
            placeholder="小猪计划"
          ></el-input>
          <el-input v-model="ruleForm.id" v-show="false"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button @click="resetForm('ruleForm')">取 消</el-button>
          <el-button type="primary" @click="submitForm('ruleForm')"
          >保存
          </el-button
          >
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
  import {
    getQueryAutoResponsePageList,
    addAutoResponse,
    deleteAutoResponseById,
    uploadFileAboutAutoResponse
  } from "@/api/expand/autoresponse";

  export default {
    name: "AutoResponese",
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
        personality: this.$route.params.personality,
        name: this.$route.params.name,
        dialogVisible: false,
        ruleForm: {
          autoResQuestion: "",
          autoResAnswer: "",
        },
        rules: {
          autoResQuestion: [
            {required: true, message: "请输入闲聊问题", trigger: "blur"},
          ],
          autoResAnswer: [
            {required: true, message: "请输入闲聊答案", trigger: "blur"},
          ]
        },
        uploadUrl: uploadFileAboutAutoResponse + this.$route.params.personalityId,
        headers: {
          Authorization: 'JWT ' + sessionStorage.getItem('access_token'),
        },
      };
    },
    computed: {
      dialogTitle() {
        return this.isEdit == true ? '编辑' : '添加';
      },
    },
    mounted() {
      console.log(this.$route.params.name);
      this.$route.meta.title = this.$route.params.name;
      if (this.$route.params.name) {
        localStorage.setItem("curCharacterName", this.$route.params.name);
      } else {
        this.name = localStorage.getItem("curCharacterName");
      }
      console.log(this.name);
    },
    created() {
      this.fetchData();
    },
    methods: {
      async fetchData() {
        this.listLoading = true;
        let data = {
          personality: this.$route.params.personality,
          page: this.curPage,
          pageSize: this.pageSize,
        };
        if (this.searchword) {
          data = {
            search: this.searchword,
            ...data
          };
        }
        let listData = await getQueryAutoResponsePageList(data);
        this.totalCount = listData.data.totalCount;
        this.list = listData.data.data;
        this.listLoading = false;
      },
      seachKeyWords() {
        this.curPage = 1;
        this.fetchData();
      },

      handleAdd() {
        this.dialogVisible = true;
      },
      handleEdit(index, row) {
        // alert(1);
        //this.editType = "edit";
        console.log(index, row);
        this.editIndex = index;
        this.dialogVisible2 = true;
        this.$router.push({
          name: "Addwelcome",
          params: {
            isEdit: true,
            name: row.name,
            personality: row.personality,
            sentence: row.sentence,
            start_time: row.start_time,
            end_time: row.end_time,
            start_datetime: row.start_datetime,
            end_datetime: row.end_datetime,
            id: row.id
          }
        });
      },
      submitForm(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            let params = {
              personality: this.personality,
              problem: this.ruleForm.autoResQuestion,
              answer: this.ruleForm.autoResAnswer
            };
            addAutoResponse(params).then(() => {
              this.dialogVisible = false;
              this.fetchData();
            });
          }
        });
      },
      resetForm(formName) {
        this.$refs.ruleForm.resetFields();
        this.dialogVisible = false;
      },
      handleDelete(index, data) {
        console.log(data);
        deleteAutoResponseById(data.id).then((res) => {
          if (res.code == 200) {
            this.$message({
              message: '删除成功',
              type: 'success',
              duration: 2000
            });
            this.fetchData();
          } else {
            this.$message({
              message: '删除失败',
              type: 'warning',
              duration: 2000
            });
          }
        });
      },
      handleCurrentChange(val) {
        //分页
        console.log(`当前页: ${val}`);
        this.curPage = val;
        this.fetchData();
      },
      handleUploadSuc() {
        this.$message({
          message: '上传成功',
          type: 'success'
        });
        this.fetchData();
        this.fileList = [];
      },
    }
  };
</script>

<style lang="scss" scoped>
  .pany {
    padding: 18px 0px;
  }
</style>
