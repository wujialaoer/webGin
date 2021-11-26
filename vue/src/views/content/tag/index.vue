<template>
  <div class="app-container page_tag">
    <div class="pany">
      <div class="oprate">
        <el-button type="success" size="mini" plain @click="openBuDialog">新建BU</el-button>
      </div>
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
          <span>{{ node.label }}</span>
          <span>
            <el-button
              v-if="node.level == 1"
              size="mini"
              type="primary"
              icon="el-icon-plus"
              plain
              @click="addTag(node,data)"
            >添加</el-button>
            <el-button
              v-if="node.level != 1"
              size="mini"
              type="primary"
              icon="el-icon-plus"
              plain
              @click="addTag(node, data)"
            >添加</el-button>
            <el-button
              v-if="node.level == 1"
              size="mini"
              type="warning"
              icon="el-icon-edit-outline"
              plain
              @click="editBu(node, data)"
            >编辑</el-button>
            <el-button
              v-if="node.level != 1"
              size="mini"
              type="warning"
              icon="el-icon-edit-outline"
              plain
              @click="editTag(node, data)"
            >编辑</el-button>
            <el-button
              size="mini"
              type="danger"
              v-if="node.level != 1"
              icon="el-icon-close"
              plain
              @click="deleteTag(node, data)"
            >删除</el-button>
          </span>
        </span>
      </el-tree>
    </div>
    <el-dialog
      v-el-drag-dialog
      :visible.sync="dialogTableVisible"
      :title="dialogTitle+'标签'"
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
        <el-form-item label="BU" prop="bu" v-if="!isEdit">
          <el-select v-model="ruleForm.bu" placeholder="请选择bu" disabled>
            <el-option label="HR" value="hr"></el-option>
            <el-option label="IT" value="it"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="标签名" prop="name">
          <el-input
            v-model="ruleForm.name"
            placeholder="请输入内容"
            ref="knInput"
            @keyup.enter.native="submitForm('ruleForm')"
          ></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="resetForm('ruleForm')">取 消</el-button>
        <el-button type="primary" @click="submitForm('ruleForm')">保存</el-button>
      </div>
    </el-dialog>
    <div>
      <span v-for="item in butaglist" :key="item.id">{{item.label}}</span>
    </div>
  </div>
</template>

<script>
  import elDragDialog from "@/directive/el-drag-dialog";
  import {setTimeout} from "timers";
  import {getTagList, addTag, updateTag, deleteTag} from "@/api/expand/businessTagManage";
  import {getFaqPackageList, addFaqPackage, updateFaqPackage, deleteFaqPackageById} from "@/api/generate/faqPackage";
  import {getBuFaqPackageList} from "@/api/expand/faqPackage";
  import {addBusinessUnit, updateBusinessUnit} from "@/api/generate/businessUnit";

  let id = 1000;

  export default {
    name: "knpackage",
    directives: {elDragDialog},
    data() {
      return {
        butaglist: new Set(),
        loading: true,
        list: [],
        isEdit: false,
        dialogTableVisible: false,
        filterText: "",
        curData: "",
        data2: [
          // {
          //   id: 1,
          //   label: "HR",
          //   children: [
          //     {
          //       id: 4,
          //       label: "小猪计划",
          //       children: [
          //         {
          //           id: 9,
          //           label: "弹性福利"
          //         },
          //         {
          //           id: 10,
          //           label: "社保"
          //         }
          //       ]
          //     }
          //   ]
          // },
          // {
          //   id: 2,
          //   label: "IT",
          //   children: [
          //     {
          //       id: 5,
          //       label: "招聘"
          //     }
          //   ]
          // }
        ],
        defaultProps: {
          children: "children",
          label: "label"
        },
        ruleForm: {
          bu: "",
          name: ""
        },
        rules: {
          bu: [{required: true, message: "请选择知识包", trigger: "change"}],
          name: [{required: true, message: "请选择知识类型", trigger: "change"}]
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
        let listData = await getTagList();
        console.log(listData);
        this.list = listData.data;
        this.loading = false;
      },
      addKn(data) {
        this.isEdit = false;
        console.warn(data);
        this.ruleForm.bu = data.label;
        this.curData = data;
        this.dialogTableVisible = true;
        this.$nextTick(() => {
          this.$refs.knInput.focus();
        });
      },
      addTag(node, data) {
        console.log(node, data);
        this.$prompt('请输入标签名', '新增标签', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputPattern: /\S+/,
          inputErrorMessage: '不能为空'
        }).then(({value}) => {
          addTag({tag_name: value.trim(), parent_id: data.id}).then(() => {
            this.fetchData();
          }, (err) => {

          });
        }).catch(() => {
        });
      },
      editKn(node, data) {
        this.isEdit = true;
        this.curData = data;
        this.dialogTableVisible = true;
        this.$nextTick(() => {
          this.$refs.knInput.focus();
        });
      },
      editTag(node, data) {
        this.$prompt('请输入标签名称', '编辑标签', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputValue: data.label,
          inputPattern: /\S+/,
          inputErrorMessage: '不能为空'
        }).then(({value}) => {
          updateTag(data.id, {tagName: value, parentId: data.parentId, version: data.version}).then(() => {
            this.fetchData();
          });
        }).catch(() => {
        });
      },
      deleteTag(node, data) {
        console.log(node, data);
        this.$confirm('此操作将永久删除, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          deleteTag(data.id).then(() => {
            this.fetchData();
          });
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });
        });
      },
      editBu(node, data) {
        console.log(node, data);
        this.$prompt('请输入BU名称', '编辑BU', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputValue: data.label,
          inputPattern: /\S+/,
          inputErrorMessage: '不能为空'
        }).then(({value}) => {
          updateBusinessUnit(data.id, {name: value, version: data.version}).then(() => {
            this.fetchData();
          });
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
            businessUnitId: data.id,
          };
          deleteFaqPackageById(data.id, params).then((resp) => {
            this.$message({
              type: 'success',
              message: '删除成功!'
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
        const newChild = {id: uuid.v1(), label: name, children: []};
        if (!data.children) {
          this.$set(data, "children", []);
        }
        data.children.push(newChild);
        let params = {
          businessUnitId: data.id,
          name: name
        };
        await addFaqPackage(params);
        return;
      },
      async edit(data, name) {
        let params = {
          name: name,
          "version": data.version,
          businessUnitId: data.id,
        };
        await updateFaqPackage(data.id, params);
        this.fetchData();
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
            console.log("error submit!!");
            return false;
          }
        });
      },
      resetForm(formName) {
        this.$refs.ruleForm.resetFields();
        this.dialogTableVisible = false;
      },
      openBuDialog() {
        this.$prompt('请输入BU名称', '新建BU', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputPattern: /\S+/,
          inputErrorMessage: '不能为空'
        }).then(({value}) => {
          addBusinessUnit({name: value}).then(() => {
            this.$message({
              type: 'success',
              message: '添加成功!'
            });
            this.fetchData();
          });
        }).catch(() => {
        });
      }
    }
  };
</script>

<style lang="scss">
  .page_tag {
    .oprate {
      margin-bottom: 10px;
    }

    .custom-tree-node {
      flex: 1;
      display: flex;
      align-items: center;
      justify-content: space-between;
      font-size: 14px;
      padding-right: 8px;
    }

    .filter-tree {
      /deep/ .el-button--mini {
        padding: 4px;
        font-size: 11px;
      }

      /deep/ .el-button [class*=el-icon-] + span {
        margin-left: 2px;
      }
    }

    ul.domtree, ul.domtree ul {
      margin: 0;
      padding: 0 0 0 2em;
    }

    ul.domtree li {
      list-style: none;
      position: relative;
    }

    ul.domtree li:before {
      position: absolute;
      content: '';
      top: -0.1em;
      left: -0.5em;
      width: 0.4em;
      height: 0.615em;
      border-style: none none solid solid;
      border-width: 0.05em;
    }

    ul.domtree li:not(:last-child):after {
      position: absolute;
      content: '';
      top: 0;
      left: -0.5em;
      bottom: 0;
      border-style: none none none solid;
      border-width: 0.05em;
    }
  }
</style>
