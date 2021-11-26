<template>
  <div class="app-container">
    <div class="pany">
      <div class="oprate">
         <el-button plain type="primary" @click="addUserManage">添加知识管理员</el-button>

         <span style="margin-left:20px">当前知识应用:<span>{{this.form.name}}</span></span>
      </div>
    <!-- <h3 align="center">
      <span>当前知识应用:<span>{{this.form.name}}</span></span>
    </h3> -->

    <template>
      <el-table
      element-loading-text="Loading"
      fit
        highlight-current-row
        :data="tableData"
        style="width: 100%">
        <el-table-column
          prop="userId"
          label="账号"
          width="180">
        </el-table-column>
        <el-table-column
          prop="username"
          label="姓名"
          width="180">
        </el-table-column>
        <el-table-column
          prop="email"
          label="邮箱">
        </el-table-column>
        <el-table-column
          fixed="right"
          label="操作"
          width="120">
          <template slot-scope="scope">
            <el-button
              @click.native.prevent="deleteRow(scope.$index, scope.row)"
              type="text"
              size="small">
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </template>
    <el-dialog
      :title="dialogTitle+'管理员'"
      :visible.sync="dialogVisible"
      width="40%"
      class="dialog-box"
    >
      <!--      <span>请最少填写一项</span>-->
      <el-form
        :model="ruleForm"
        ref="ruleForm"
        label-width="70px"
        class="demo-ruleForm"
      >
        <el-form-item
          class="mgtp20"
          label="账号"
          prop="userId"
        >
          <el-input
            type="input"
            v-model="ruleForm.userId"
            placeholder="请输入账号"
            autofocus
            class="content"
            ref="input1"
          ></el-input>
        </el-form-item>
        <!--        <el-form-item-->
        <!--          class="mgtp20"-->
        <!--          label='邮箱'-->
        <!--          prop="email"-->
        <!--        >-->
        <!--          <el-input-->
        <!--            type="input"-->
        <!--            v-model="ruleForm.email"-->
        <!--            placeholder="请输入邮箱"-->
        <!--            autofocus-->
        <!--            class="content"-->
        <!--            ref="input1"-->
        <!--          ></el-input>-->
        <!--        </el-form-item>-->
        <el-form-item>
          <el-button
            type="primary"
            @click="submitForm('ruleForm')"
            class="mgtp20"
          >提交
          </el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
</div>
  </div>
</template>

<script>
  import {getUsersInfoList, deleteGroupUser, addGroupUser, updateGroupUser} from "@/api/user";

  export default {
    name: "knManage",
    data() {
      return {
        name: '',
        form: {},
        ruleForm: {
          userId: '',
          email: '',
          bu_unit: ''
        },
        tableData: [],
        dialogVisible: false,
        isEdit: false,
        bu_unit: ''
      };
    },
    computed: {
      dialogTitle() {
        return this.isEdit == true ? '编辑' : '添加';
      },
    },
    created() {
      this.form.name = this.$route.params.name;
      this.form.id = this.$route.params.id;
      this.fetchData();
    },
    methods: {
      async fetchData() {
        let listData = await getUsersInfoList({'bu_unit': this.form.id});
        this.tableData = listData.data.data;
        this.bu_unit = this.form.id;
      },
      addUserManage() {
        // this.ruleForm = {
        //   userId: "",
        //   username: '',
        //   bu_unit: ''
        // };
        this.isEdit = false;
        this.dialogVisible = true;
        this.$nextTick(() => {
          this.$refs.input1.focus();
        });

      },
      deleteRow(index, row) {
        const data = {
          bu_unit: this.form.id,
          user_id: row.user
        };
        deleteGroupUser(this.form.id, data).then(resp => {
          this.fetchData();
        });
      },
      submitForm(formName) {
        if (this.ruleForm.userId == '' && this.ruleForm.email == '') {
          this.$message({
            message: 'email,账号请至少填写一项',
            type: 'warning',
            duration: 3 * 1000
          });
          return false;

        } else {
          this.ruleForm.bu_unit = this.bu_unit;

          addGroupUser(this.ruleForm).then(resp => {
            if (resp.code == 200) {
              this.$message({
                message: resp.message,
                type: 'success',
                duration: 3 * 1000
              });
              this.fetchData();
              this.handleClose2();
            } else {
              this.$message({
                message: resp.message,
                type: 'warning',
                duration: 3 * 1000
              });
            }
          });

        }
      },
      handleClose2() {
        this.dialogVisible = false;
        this.$refs['ruleForm'].resetFields();

      },

    },
  };
</script>

<style scoped>
  .buh3 {

  }
  .oprate {
      margin-bottom: 18px;
    }
</style>
