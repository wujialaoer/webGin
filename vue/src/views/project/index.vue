<template>
  <div class="app-container page_projectManger">
    <div class="pany">
      <div class="pany-l fl">
        <div class="pany-title">项目管理</div>
      </div>
      <div class="pany-r fr">
        <el-button
          type="danger"
          size="medium"
          icon="el-icon-plus"
          @click="addProject"
        >新增项目</el-button>
      </div>
    </div>
    <div class="content">
      <el-collapse accordion>
        <el-collapse-item
          v-for="(item, index) in projectMangerList"
          :key="item.pid"
          :name="item.pid"
        >
          <template slot="title">
            <span class="projectName fl">{{item.projectName}}</span>
            <span class="projectIcon fr">
              <i
                class="header-icon el-icon-plus"
                @click.stop="addIntention(item.projectName,index)"
              ></i>
              <i
                class="header-icon el-icon-edit"
                @click.stop="editProject(item.projectName,index)"
              ></i>
              <i
                class="header-icon el-icon-close"
                @click.stop="dialogNewProject = true"
              ></i>
            </span>

          </template>
          <el-table
            :data="item.intention"
            style="width: 100%"
          >
            <el-table-column
              label="id"
              prop="id"
              align="center"
              width="110"
            >
            </el-table-column>
            <el-table-column
              label="名称"
              prop="name"
              align="center"
            >
            </el-table-column>
            <el-table-column label="操作">
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  @click="handleEdit(scope.$index, scope.row)"
                >编辑</el-button>
                <el-button
                  size="mini"
                  type="danger"
                  @click="handleDelete(scope.$index, scope.row)"
                >删除</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-collapse-item>
      </el-collapse>
    </div>
    <el-dialog
      :title="projectDialogTitleName"
      :visible.sync="dialogNewProject"
      :before-close="handleClose"
      width="40%"
      class="dialog-box"
    >
      <el-form
        :model="projectForm"
        :rules="projectFormRules"
        ref="projectForm"
        label-width="50px"
        class="demo-projectForm"
      >
        <el-form-item
          class="mgtp20"
          label="名称"
          prop="projectContent"
        >
          <el-input
            v-model="projectForm.projectContent"
            placeholder="请输入项目名称"
            class="content"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="projectSubmit('projectForm')"
            class="mgtp20"
          >保存</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-dialog
      :title="curProjectName+'·子项目'"
      :visible.sync="dialogIntention"
      :before-close="handleClose2"
      width="40%"
      class="dialog-box"
    >
      <el-form
        :model="intentionForm"
        :rules="intentionFormRules"
        ref="intentionForm"
        label-width="50px"
        class="demo-projectForm"
      >
        <el-form-item
          class="mgtp20"
          label="名称"
          prop="intentionName"
        >
          <el-input
            v-model="intentionForm.intentionName"
            placeholder="请输入分类名称"
            class="content"
          ></el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="intentionSubmit('intentionForm')"
            class="mgtp20"
          >保存</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "projectManger",
  data() {
    return {
      editType:"",
      tableData: [],
      curProjectName: "",
      curProjectNameIndex: "",
      dialogNewProject: false,
      dialogIntention: false,
      projectForm: {
        index: "",
        projectContent: ""
      },
      projectFormType: "", //  add  edit   delete
      projectDialogTitleName: "", //  add  edit   delete
      projectFormRules: {
        projectContent: [
          { required: true, message: "请输入项目名称", trigger: "blur" },
          { min: 0, max: 10, message: "长度在10个字以内", trigger: "blur" }
        ]
      },
      intentionForm: {
        projectName: "",
        intentionName: "",
        index: ""
      },
      intentionFormRules: {
        intentionName: [
          { required: true, message: "请输入分类名称", trigger: "blur" },
          { min: 0, max: 10, message: "长度在10个字以内", trigger: "blur" }
        ]
      }
    };
  },
  computed: {
    ...mapState({
      projectMangerList: state => state.projectManger.projectManger,
      breadcrumb: state => state.breadcrumb.breadcrumb
    })
  },
  mounted() {
    console.warn(this.projectMangerList);
  },
  methods: {
    addProject() {
      this.dialogNewProject = true;
      this.projectFormType = "add";
      this.projectDialogTitleName = "新增项目";
    },
    editProject(projectName, index) {
      this.dialogNewProject = true;
      this.projectFormType = "edit";
      this.projectDialogTitleName = "修改项目";
      this.projectForm.projectContent = projectName;
      this.projectForm.index = index;
    },
    projectSubmit(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          //  验证通过
          console.warn("验证通过", this.projectForm);
          if (this.projectFormType === "add") {
            this.$store.commit("addProjectManger", this.projectForm);
          } else if (this.projectFormType === "edit") {
            this.$store.commit("editProjectManger", this.projectForm);
          }
          this.handleClose();
        }
      });
    },

    addIntention(projectName, index) {
      this.editType = "add";
      this.curProjectName = projectName;
      this.curProjectNameIndex = index;
      this.intentionForm.projectName = this.curProjectName;
      this.intentionForm.index = this.curProjectNameIndex;
      this.dialogIntention = true;
    },
    intentionSubmit(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          console.warn("验证通过", this.intentionForm);//  验证通过
          console.warn(this.editType);//  验证通过
          if(this.editType == "add"){
            this.$store.commit("addIntention", this.intentionForm);
          }else if(this.editType == "edit"){
            this.$store.commit("editIntention", this.intentionForm);
          }
          this.handleClose2();
        }
      });
    },
    handleClose() {
      this.projectForm = {
        projectContent: ""
      };
      this.dialogNewProject = false;
    },
    handleClose2() {
      this.intentionForm = {
        intentionName: ""
      };
      this.dialogIntention = false;
    },
    handleEdit(index, row) {
      this.editType = "edit";
      this.curProjectName = row.parent;
      console.warn(row);
      let i = "";
      this.projectMangerList.forEach(function(item,index){
        if(item.projectName == row.parent){
          console.warn(index);
          i = index;
        }
      })
      // this.intentionForm.index = this.curProjectNameIndex;
      this.intentionForm= {
        projectName: row.parent,
        projectIndex: i,
        intentionName: row.name,
        index: index
      };

      this.editIndex = index;
      this.dialogIntention = true;
    },
    handleDelete(index, row) {
      this.$confirm("确定删除此条意图").then(_ => {
        this.importData.splice(index, 1);
      });
      console.log(index, row);
    }
  }
};
</script>

<style lang="scss">
.page_projectManger {
  .pany {
    width: 100%;
    height: 75px;
    background: rgba(255, 255, 255, 1);
    box-shadow: 0px 2px 5px 0px rgba(96, 144, 210, 0.05);
    border-radius: 4px;
    padding: 10px 18px;
    margin-bottom: 20px;
    .pany-title {
      width: 87px;
      height: 32px;
      font-size: 18px;
      margin-top: 4px;
      font-family: PingFangSC-Regular;
      font-weight: 400;
      color: rgba(30, 135, 228, 1);
      line-height: 23px;
    }
    .pany-l {
    }
    .pany-r {
      margin-top: 8px;
    }
    .el-breadcrumb__inner a,
    .el-breadcrumb__inner.is-link {
      color: #1e87e4;
    }
  }
  .content {
    width: 100%;
    .el-collapse {
      display: flex;
      flex-flow: row wrap;
      .el-collapse-item {
        width: 49%;
        margin-bottom: 14px;
      }
      .el-collapse-item:nth-child(2n) {
        margin-left: 2%;
      }
      .el-collapse-item__header {
        padding-left: 14px;
      }
    }
    .el-collapse-item__header.is-active {
      .projectName {
        color: #4693ff;
      }
    }
    .projectIcon {
      margin: 0 8px 0 auto;
      order: 3;
    }
    .header-icon {
      font-size: 16px;
      color: #999999;
      margin-left: 6px;
      margin-right: 6px;
      &:hover {
        color: #4693ff;
      }
    }
    .el-collapse-item__arrow {
      display: inline;
      margin: 0;
      margin-left: 6px;
      &.is-active {
        color: #4693ff;
      }
    }
    .el-table_1_column_1 {
      padding-left: 10px;
    }
  }
}
</style>
