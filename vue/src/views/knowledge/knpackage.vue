<template>
  <div class="app-container page_knpackage">
    <div class="pany">
      <!--      <div class="oprate">-->
      <!--        <el-button type="success" size="mini" plain @click="openBuDialog">新建知识应用</el-button>-->
      <!--      </div>-->
      <el-tree
        v-loading="loading"
        ref="tree2"
        :data="list"
        :props="defaultProps"
        :expand-on-click-node="true"
        :filter-node-method="filterNode"
        class="filter-tree"
        node-key="id"
        default-expand-all
      >
        <span class="custom-tree-node" slot-scope="{ node, data }">
          <span :class="{'level1':node.level == 1}">{{ node.label }}</span>
          <span>
            <el-button
              v-if="node.level == 1"
              size="mini"
              type="primary"
              icon="el-icon-plus"
              plain
              @click.stop="addKn(data)"
            >添加</el-button>
            <!--            <el-button-->
            <!--              v-if="node.level == 1"-->
            <!--              size="mini"-->
            <!--              type="warning"-->
            <!--              icon="el-icon-edit-outline"-->
            <!--              plain-->
            <!--              @click.stop="editBu(node, data)"-->
            <!--            >编辑</el-button>-->
            <el-button
              v-if="node.level != 1"
              size="mini"
              type="warning"
              icon="el-icon-edit-outline"
              plain
              @click.stop="editKn(node, data)"
            >编辑</el-button>
            <el-button
              size="mini"
              type="danger"
              v-if="node.level != 1"
              icon="el-icon-close"
              plain
              @click.stop="removeKn(node, data)"
            >删除</el-button>
          </span>
        </span>
      </el-tree>
    </div>
    <el-dialog
      v-el-drag-dialog
      :visible.sync="dialogTableVisible"
      :title="dialogTitle+'知识包'"
      @dragDialog="handleDrag"
    >
      <el-form
        :model="ruleForm"
        @close="resetForm"
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="知识应用" prop="bu" v-if="!isEdit">
          <el-select v-model="ruleForm.bu" placeholder="请选择知识应用" disabled>
            <el-option label="HR" value="hr"/>
            <el-option label="IT" value="it"/>
          </el-select>
        </el-form-item>
        <el-form-item label="知识包名" prop="name">
          <el-input
            v-model="ruleForm.name"
            placeholder="请输入内容"
            ref="knInput"
            @keyup.enter.native="submitForm('ruleForm')"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="resetForm('ruleForm')">取 消</el-button>
        <el-button type="primary" @click="submitForm('ruleForm')">保存</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import elDragDialog from "@/directive/el-drag-dialog";
  // import { setTimeout } from "timers";
  import {addFaqPackage, updateFaqPackage, deleteFaqPackageById} from "@/api/generate/faqPackage";
  import {getBuFaqPackageList} from "@/api/expand/faqPackage";
  import {addBusinessUnit, updateBusinessUnit} from "@/api/generate/businessUnit";
  import store from "../../store";

  let id = 1000;

  export default {
    name: "knpackage",
    directives: {elDragDialog},
    data() {
      return {
        loading: true,
        ruleForm: {
          bu: "",
          name: ""
        },
        isEdit: false,
        dialogTableVisible: false,
        filterText: "",
        curData: "",
        list: [],
        data2: [],
        defaultProps: {
          children: "children",
          label: "label"
        },
        rules: {
          bu: [{max: 15, required: true, message: "最长不能超过15", trigger: "change"}],
          name: [{max: 20, required: true, message: "最长不能超过20", trigger: "change"}]
        }
      };
    },
    computed: {
      dialogTitle() {
        return this.isEdit == true ? '编辑' : '添加';
      },
    },
    watch: {
      filterText(val) {
        this.$refs.tree2.filter(val);
      }
    },
    created() {
      this.fetchData();
    },
    methods: {
      async fetchData() {
        let listData = await getBuFaqPackageList();
        this.list = listData.data;
        this.loading = false;
      },
      addKn(data) {
        this.isEdit = false;
        this.ruleForm.bu = data.label;
        this.curData = data;
        this.dialogTableVisible = true;
        this.$nextTick(() => {
          this.$refs.knInput.focus();
        });
      },
      editKn(node, data) {
        this.isEdit = true;
        this.ruleForm.name = data.label;
        this.curData = data;
        this.dialogTableVisible = true;
        this.$nextTick(() => {
          this.$refs.knInput.focus();
        });
      },
      editBu(node, data) {
        this.$prompt('请输入知识应用名称', '编辑知识应用', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputValue: data.label,
          inputPattern: /\S+/,
          inputErrorMessage: '不能为空'
        }).then(({value}) => {
          if (value.length > 15) {
            this.$message({
              type: 'warning',
              message: '名称过长!'
            });
          } else {
            updateBusinessUnit(data.id, {name: value, version: data.version}).then(() => {
              this.fetchData();
            });
          }
        }).catch(() => {
        });
      },
      removeKn(node, data) {
        this.curData = data;
        this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let params = {
            "version": data.version,
            faqPks: data.id,
          };
          deleteFaqPackageById(data.id, params).then((resp) => {
            this.$message({
              type: 'success',
              message: resp.message
            });
            this.fetchData();
          });
        }).catch(() => {
          //   this.$message({
          //     type: 'info',
          //     message: '已取消删除'
          //   });
        });
      },
      async append(data, name) {
        // const newChild = {id: uuid.v1(), label: name, children: []};
        // if (!data.children) {
        //   this.$set(data, "children", []);
        // }
        // data.children.push(newChild);
        let params = {
          business_unit: data.id,
          name: name
        };
        addFaqPackage(params).then((resp) => {
          if (resp.code == 200) {
            this.$message({
              type: 'success',
              message: resp.message

            });
            this.fetchData();
            return;

          } else {
            this.$message({
              type: 'warning',
              message: resp.message
            });
            return;
          }
        });
      },
      async edit(data, name) {
        let params = {
          name: name,
          "version": data.version,
          id: data.id,
        };
        updateFaqPackage(data.id, params).then((resp) => {
          this.$message({
            type: 'success',
            message: resp.message
          });
          this.fetchData();
        });
        return;
      },
      handleDrag() {
        //this.$refs.select.blur();
      },
      filterNode(value, data) {
        if (!value) return true;
        return data.label.indexOf(value) !== -1;
      },
      submitForm(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            console.warn(this.ruleForm);
            if (this.isEdit == true) {
              this.edit(this.curData, this.ruleForm.name);
            } else {
              this.append(this.curData, this.ruleForm.name);
            }
            this.resetForm();
          } else {
            return false;
          }
        });
        this.fetchData();
      },
      resetForm(formName) {
        this.$refs.ruleForm.resetFields();
        this.dialogTableVisible = false;
      },
      openBuDialog() {
        this.$prompt('请输入知识应用名称', '新建知识应用', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputPattern: /\S+/,
          inputErrorMessage: '不能为空'
        }).then(({value}) => {
          if (value.length > 15) {
            this.$message({
              type: 'warning',
              message: '名称过长!'
            });
          } else {
            addBusinessUnit({name: value}).then((resp) => {
              this.$message({
                type: 'success',
                message: resp.message
              });
              this.fetchData();
            });
          }
        }).catch(() => {
        });
      },
    }
  };
</script>

<style lang="scss" scoped>
  .page_knpackage {

    ::v-deep .custom-tree-node {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: space-between;
      font-size: 14px;
      padding-right: 8px;
    }

    ::v-deep .el-tree-node__content {
      height: 36px;
    }
    .level1{
      color:#111;
    }
  }
</style>
