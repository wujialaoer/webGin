<template>
  <div class="page_nounexplain app-container">
    <div class="pany">
      <el-row
        type="flex"
        class="row-bg"
        justify="space-between"
      >
        <el-col :span="6">
          <el-button
            type="primary"
            plain
            @click="handleAdd()"
          >添加
          </el-button>
          <el-upload
            class="upload"
            :action="uploadUrl"
            :limit="1"
            :headers="headers"
            :data="fileType"
            :on-exceed="handleExceed"
            :on-success="handleUploadSuc"
            :on-error="handleUploadError"
            :file-list="fileList">
            <!--            <el-button type="info" plain disabled>导入</el-button>-->
          </el-upload>
        </el-col>
        <el-col :span="6">
          <el-input
            placeholder="请输入关键词"
            class="searchword"
            v-model="searchword"
            @keyup.enter.native="seachKeyWords"
          >
            <i
              slot="suffix"
              class="el-input__icon el-icon-search"
              @click="seachKeyWords"
            ></i>
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
        <el-table-column
          align="left"
          label="ID"
          width="95"
        >
          <template slot-scope="scope">
            {{ (curPage - 1) * pageSize + scope.$index + 1 }}
          </template>
        </el-table-column>
        <el-table-column
          label="名词"
          width="125"
        >
          <template slot-scope="scope">
            {{ scope.row.noun }}
          </template>
        </el-table-column>
        <el-table-column
          label="名词解释"
          align="left"
        >
          <template slot-scope="scope">
            <span>{{ scope.row.explain }}</span>
          </template>
        </el-table-column>
        <el-table-column
          label="转义(把用户输入的名词转换为固定语句)"
          align="left"
        >
          <template slot-scope="scope">
            {{ scope.row.transliteration }}
          </template>
        </el-table-column>
        <el-table-column
          label="操作"
          align="left"
          width="150"
        >
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              @click="handleEdit(scope.$index, scope.row)"
            >编辑
            </el-button>
            <el-divider direction="vertical"></el-divider>
            <el-button
              size="mini"
              type="text"
              @click="handleDelete(scope.$index, scope.row)"
            >删除
            </el-button>
          </template>
        </el-table-column>

      </el-table>
      <el-pagination
        class="mgtp20"
        layout="prev, pager, next"
        prev-text="上一页"
        next-text="下一页"
        :total="totalCount"
        :page-size="pageSize"
        @current-change="handleCurrentChange"
      ></el-pagination>
    </div>
    <el-dialog
      :title="dialogTitle + '名词解释'"
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
        <el-form-item
          class="mgtp20"
          label="名词"
          prop="noun"
        >
          <el-input
            type="input"
            v-model="ruleForm.noun"
            placeholder="请输入名词"
            autofocus
            class="content"
            ref="input1"
          ></el-input>
          <span>{{ruleForm.noun.length}}/50</span>
        </el-form-item>
        <el-form-item
          class="mgtp20"
          label="解释"
          prop="explain"
        >
        <tinymce id="nodeContent" v-model="ruleForm.explain" :height="300"/>
          <!-- <el-input
            type="textarea"
            v-model="ruleForm.explain"
            placeholder="请输入解释"
            autofocus
            class="content"
          ></el-input>
          <span>{{ruleForm.explain.length}}/1000</span> -->
        </el-form-item>
        <el-form-item
          class="mgtp20"
          label="转义"
          prop="transliteration"
        >
          <el-input
            type="input"
            v-model="ruleForm.transliteration"
            placeholder="请输入转义"
            autofocus
            class="content"
          ></el-input>
          <span>{{ruleForm.transliteration.length}}/200</span>
        </el-form-item>
        <el-form-item v-if="isEdit===false"
                      class="mgtp20"
                      label="置顶"
                      prop="is_default"
        >
          <el-select v-model="value" clearable placeholder="请选择">
            <el-option
              v-for="item in is_defaults"
              :key="item.text"
              :label="item.text"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item v-if="isEdit===true"
                      class="mgtp20"
                      label="置顶"
                      prop="is_default"
        >
          <el-select v-model="value2" clearable placeholder="请选择">
            <el-option
              v-for="item in is_defaults"
              :key="item.value"
              :label="item.text"
              :value="item.value">
            </el-option>
          </el-select>
        </el-form-item>
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
</template>

<script>
  import {getQueryGlossaryPageList, addGlossary, updateGlossary, deleteGlossaryById} from "@/api/generate/glossary";
  import {uploadFileAboutGlossary} from "@/api/expand/glossary";
  import Tinymce from '@/components/Tinymce';

  export default {
    name: "Nounexplain",
    components: {
      Tinymce
    },
    data() {

      return {
        tinymceId: "nodeContent",
        is_defaults: [
          {text: "不置顶", value: 0},
          {text: "置顶", value: 1},
        ],
        fileList: [],
        uploadUrl: uploadFileAboutGlossary,
        fileType: {
          up_type: 'alias'
        },
        headers: {
          Authorization: 'JWT ' + sessionStorage.getItem('access_token'),
        },

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
        value: '不置顶',
        value2: '不置顶',
        ruleForm: {
          noun: "",
          explain: "",
          transliteration: "",
          is_default: 0
        },
        rules: {
          noun: [
            {required: true, message: "请输入名词", trigger: "blur"},
            {min: 0, max: 50, message: "长度在50个字以内", trigger: "blur"}
          ],
          explain: [
            {min: 0, max: 1000, message: "长度在1000个字以内", trigger: "blur"}
          ],
          transliteration: [
            //   { required: true, message: "请输入转义语句", trigger: "blur" },
            {min: 0, max: 200, message: "长度在200个字以内", trigger: "blur"}
          ]
        },
        changeFlag: 0,
      };
    },
    computed: {
      dialogTitle() {
        return this.isEdit == true ? '编辑' : '添加';
      },
    },
    watch: {
      'value2'(e) {
        this.changeFlag = e;
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
            // "Noun.Operator": 8,
            "noun": this.searchword,
            ...data
          };
        }
        let listData = await getQueryGlossaryPageList(data);
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
          noun: "",
          explain: "",
          transliteration: ""
        };
        this.isEdit = false;
        this.dialogVisible = true;
        this.$nextTick(() => {
          this.$refs.input1.focus();
          window.tinymce.activeEditor.setContent(this.ruleForm.explain);
        });
      },
      handleEdit(index, data) {
        this.isEdit = true;
        this.curEditForm = data;
        if (data.is_default === 0) {
          this.value2 = '不置顶';
        } else {
          this.value2 = '置顶';
        }
        this.ruleForm.noun = data.noun;
        this.ruleForm.explain = data.explain ? data.explain : '';
        this.ruleForm.transliteration = data.transliteration ? data.transliteration : "";
        this.ruleForm.is_default = this.changeFlag;
        this.ruleForm.creation_id = window.sessionStorage.getItem('user_id');
        this.ruleForm.last_modifier_id = window.sessionStorage.getItem('user_id');

        this.dialogVisible = true;
        this.$nextTick(() => {
          window.tinymce.activeEditor.setContent(this.ruleForm.explain);
          //this.$refs.input1.focus();
        });
      },
      handleDelete(index, data) {
        deleteGlossaryById(data.id).then((resp) => {
          this.$message({
            message: resp.message,
            type: 'success',
            duration: 3 * 1000
          });
          this.fetchData();
        });
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
            this.ruleForm.id = this.curEditForm.id;
            if (this.value == '不置顶') {
              this.ruleForm.is_default = 0;
            } else {
              this.ruleForm.is_default = 1;
            }
            if (this.isEdit == true) {
              if (this.value2 == '不置顶') {
                this.ruleForm.is_default = 0;
              } else {
                this.ruleForm.is_default = 1;
              }
              let params = {
                ...this.ruleForm,
                version: this.curEditForm.version
              };
              if (this.ruleForm.transliteration == '' && this.ruleForm.explain == '') {
                this.$message.warning('转义和解释最少输入一个');
                return false;
              } else {

                updateGlossary(this.curEditForm.id, params).then(resp => {
                  if (resp.code == 200) {
                    this.$message({
                      message: resp.message,
                      type: "success",
                      duration: 5 * 1000
                    });
                    this.fetchData();
                    this.handleClose2();
                  } else {
                    this.$message({
                      message: resp.message,
                      type: "warning",
                      duration: 5 * 1000
                    });

                  }
                });
              }

            } else {
              let params = {
                ...this.ruleForm,
              };
              if (this.ruleForm.transliteration == '' && this.ruleForm.explain == '') {
                this.$message.warning('转义和解释最少输入一个');
                return false;
              } else {
                addGlossary(params).then(resp => {
                  if (resp.code == 200) {
                    this.$message({
                      message: resp.message,
                      type: "success",
                      duration: 5 * 1000
                    });
                    this.fetchData();
                    this.handleClose2();

                  } else {
                    this.$message({
                      message: resp.message,
                      type: "warning",
                      duration: 5 * 1000
                    });
                  }
                });

              }
            }
            this.$refs[formName].resetFields();
            this.value = '不置顶';
          } else {
            return false;
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
      handleClose2() {
        this.dialogVisible = false;
        this.$refs['ruleForm'].resetFields();

      },
      destroyTinymce() {
        var tinymce = window.tinymce.get(this.tinymceId);
        if (tinymce) {
          tinymce.destroy();
        }
      },
    }
  };
</script>

<style lang="scss" scoped>
  .page_nounexplain {
    .demo-ruleForm {
      width: 100%;
    }
  }

  .upload {
    display: inline;
    margin-left: 10px;
  }

  /deep/ .el-upload-list {
    display: none;
  }
</style>
