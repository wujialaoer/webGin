<template>
  <div class="app-container page_knpackage">
    <div class="pany">
      <div class="oprate">
        <el-button type="success" size="mini" plain @click="openBuDialog">新建知识应用</el-button>
      </div>
      <el-table
        element-loading-text="Loading"
        :data="list"
        fit
        highlight-current-row
      >
        <el-table-column label="知识应用名称">
          <template slot-scope="scope">{{ scope.row.label }}</template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="150">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" plain @click="editBu(scope.$index, scope.row)">编辑</el-button>
          </template>
        </el-table-column>
        <el-table-column label="知识管理员" align="center" width="150">
          <template slot-scope="scope">
            <el-button size="mini" type="primary" plain
                       @click="$router.push({name:'knManage',params:{id:scope.row.id,name:scope.row.label}})">
              知识管理员
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>
  import elDragDialog from "@/directive/el-drag-dialog";
  // import { setTimeout } from "timers";
  import {getBuFaqPackageList} from "@/api/expand/faqPackage";
  import {addBusinessUnit, updateBusinessUnit} from "@/api/generate/businessUnit";

  let id = 1000;

  export default {
    name: "knAppMan",
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
        value: '',
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
      editBu(node, data) {
        this.$prompt('请输入知识应用名称', '编辑知识应用', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          inputValue: data.label,
          inputPattern: /\S+/,
          inputErrorMessage: '不能为空'
        }).then(({value}) => {
          updateBusinessUnit(data.id, {name: value, id: data.id}).then((resp) => {
            if (resp.code == 200) {
              this.$message({
                message: resp.message,
                type: "success",
                duration: 2000
              });
              this.fetchData();
            } else {
              this.$message({
                message: resp.message,
                type: "warning",
                duration: 2000
              });

            }
          });
        }).catch(() => {
        });
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
              if (resp.code == 200) {
                this.$message({
                  type: 'success',
                  message: resp.message,
                  duration: 2000
                });
                this.fetchData();
              } else {
                this.$message({
                  type: 'warning',
                  message: resp.message,
                  duration: 2000
                });

              }
            });
          }
        }).catch(() => {
        });
      }
    }
  };
</script>

<style lang="scss">
  .page_knpackage {
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

    .el-tree-node__content {
      height: 36px;
    }
  }
</style>
