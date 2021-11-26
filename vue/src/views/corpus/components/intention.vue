<template>
  <div class="app-container">
    <el-row>
      <el-col :span="10">
        <el-select
          v-model="curSelProject"
          placeholder="请选择"
        >
          <el-option
            v-for="item in projectLists"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </el-col>
      <el-col
        :span="2"
        :offset="12"
      >
        <el-button
          type="primary"
          class="fr"
          @click="dialogVisible = true"
        >新建</el-button>
      </el-col>
    </el-row>
    <el-table
      v-loading="listLoading"
      :data="list"
      element-loading-text="Loading"
      @current-change="handleCurrentChange"
      border
      fit
      highlight-current-row
    >
      <el-table-column
        align="center"
        label="ID"
        width="95 "
      >
        <template slot-scope="scope">
          {{ scope.$index }}
        </template>
      </el-table-column>
      <el-table-column label="意图" align="center">
        <template slot-scope="scope">
          {{ scope.row.name }}
        </template>
      </el-table-column>
      <el-table-column label="例句" align="center">
        <template slot-scope="scope">
          {{ scope.row.exampleSentence }}
        </template>
      </el-table-column>
      <el-table-column
        label="创建人"
        width="110"
        align="center"
      >
        <template slot-scope="scope">
          <span>{{ scope.row.createUserName }}</span>
        </template>
      </el-table-column>
      <el-table-column
        class-name="status-col"
        label="状态"
        width="110"
        align="center"
      >
        <template slot-scope="scope">
          <el-tag :type="scope.row.stateName | statusFilter">{{ scope.row.stateName}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        align="center"
        prop="created_at"
        label="时间"
        width="200"
      >
        <template slot-scope="scope">
          <i class="el-icon-time" />
          <span>{{ scope.row.createTime }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        width="150"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            @click="handleEdit(scope.$index, scope.row)"
          >编辑</el-button>
          <el-divider direction="vertical"></el-divider>
          <el-button
            size="mini"
            type="text"
            @click="handleDelete(scope.$index, scope.row)"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-dialog
      title="新建流程"
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
        <el-form-item
          lass="mgtp20"
          label="项目名"
          prop="projectName"
        >
          <el-select
            v-model="ruleForm.projectName"
            placeholder="请选择"
          >
            <el-option
              v-for="item in projectLists"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          lass="mgtp20"
          label="内容"
          prop="appName"
        >
          <el-select
            v-model="ruleForm.appName"
            placeholder="请选择"
          >
            <el-option
              v-for="item in appLists"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          class="mgtp20"
          label="内容"
          prop="processName"
        >
          <el-input
            type="input"
            v-model="ruleForm.processName"
            placeholder="请输入流程内容"
            class="content"
          ></el-input>
          <span>{{ruleForm.processName.length}}/10</span>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="submitForm('ruleForm')"
            class="mgtp20"
          >提交</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import { getIntent } from "@/api/intent";
import { Message } from "element-ui";
export default {
name: "intention",
  data() {
    return {
      currentRow: null,
      list: null,
      listLoading: true,
      dialogVisible: false,
      curSelProject: "默认",
      curSelApp: "默认",
      projectLists: [{ label: "", value: "" }],
      appLists: [{ label: "", value: "" }],
      ruleForm: {
        projectName: "",
        appName: "",
        processName: ""
      },
      rules: {
        type: [{ required: true, trigger: "blur", message: "请选择类型" }],
        intent: [{ required: true, trigger: "blur", message: "请选择意图" }],
        content: [
          { required: true, message: "请输入样本内容", trigger: "blur" },
          { min: 0, max: 200, message: "长度在200个字以内", trigger: "blur" }
        ]
      }
    };
  },
  filters: {
    statusFilter(status) {
      const statusMap = {
        "启用": "success",
        "禁用": "danger"
      };
      return statusMap["启用"];
    }
  },

  mounted() {
    this.fetchData();
  },
  methods: {
    handleClose() {
      this.ruleForm.processName = "";
      this.dialogVisible = false;
    },
    handleCurrentChange(val) {
      //选中当前表格行
      if (val != null) {
        this.currentRow = val;
        console.warn(this.currentRow);
        this.$router.push({
          name: "FlowEdit",
          params: { id: this.currentRow.processId }
        });
        //this.$store.commit("SET_printProfile",this.profile);
      }
    },
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          console.warn(this.ruleForm);
          createFlow(this.ruleForm).then(resp => {
            console.warn(resp);
            Message({
              message: "创建成功",
              type: "success",
              duration: 5 * 1000
            });
            this.fetchData();
            this.handleClose();
            this.$refs[formName].resetFields();
          });
        } else {
          return false;
        }
      });
    },
    fetchData() {
      this.listLoading = true;
      getIntent().then(response => {    
        console.warn(response);
        this.list = response.data;
        this.$store.commit("setIntentionList",this.list);
        this.listLoading = false;
      });
    }
  }
};
</script>
<style lang="scss">
.el-row {
  margin-bottom: 20px;
}
</style>
