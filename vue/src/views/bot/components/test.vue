<template>
  <div>
    <!-- 新建样本 -->
    <el-row
      :gutter="20"
    >
      <el-col :span="24">
        <div class="tablepanel">
          <el-row type="flex" class="row-bg" justify="space-between">
            <el-col :span="6">
            <el-select
              v-model="selectValue"
              @change="selectIntent"
              placeholder="知识包选择"
            >
              <el-option
                v-for="item in intentOption"
                :key="item.intentsId"
                :value="item.name"
              >
              </el-option>
            </el-select>
            </el-col>
            <el-col :span="7">
                <el-input
                    placeholder="请输入关键词"
                    class="searchword"
                    v-model="searchword"
                    >
                    <i slot="suffix" class="el-input__icon el-icon-search" @click="seachKeyWords"></i>
                    </el-input>
            </el-col>
        </el-row>
          <el-table
            :data="importData"
            border
            class="tablelist"
            @selection-change="handleSelectionChange"
          >
            <el-table-column
              prop="id"
              label="#"
              width="50"
            >
            </el-table-column>
            <el-table-column
              prop="type"
              label="问题(测试集)"
              width="120"
            >
            </el-table-column>
            <el-table-column
              prop="content"
              label="预期答案"
            >
              <template slot-scope="scope">
                <div class="phraceTags">
                  <el-tag
                    :key="tag"
                    :type="tagType[scope.$index%5]"
                    v-for="(tag,index) in scope.row.content"
                    closable
                    :disable-transitions="false"
                    @close="handleClose(tag,scope.row.content)"
                  >
                    {{tag}}
                  </el-tag>
                  <el-input
                    class="input-new-tag"
                    v-if="inputVisible == true && scope.$index == inputVisibleIndex"
                    v-model="inputValue"
                    ref="saveTagInput"
                    size="small"
                    @keyup.enter.native="handleInputConfirm(scope.row.content)"
                    @blur="handleInputConfirm(scope.row.content)"
                  >
                  </el-input>
                  <el-button
                    v-else
                    class="button-new-tag"
                    size="small"
                    @click="showInput(scope.$index, scope.row)"
                  >+ New Tag</el-button>
                </div>

              </template>
            </el-table-column>
            <el-table-column
              prop="status"
              label="答案"
              width="250"
            >
              <template slot-scope="scope">
                <el-tag :type="scope.row.status">{{ scope.row.status }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column label="知识包"  width="120">
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  type="text"
                  @click="handleEdit(scope.$index, scope.row)"
                >编辑</el-button>
                |
                <el-button
                  size="mini"
                  type="text"
                  @click="handleDelete(scope.$index, scope.row)"
                >删除</el-button>
              </template>
            </el-table-column>
          </el-table>
          <el-pagination
            class="mgtp20"
            layout="prev, pager, next"
            prev-text="上一页"
            next-text="下一页"
            :total="importData.length"
            @current-change="handleCurrentChange"
          >
          </el-pagination>
        </div>
      </el-col>
    </el-row>
    <el-dialog
      :visible.sync="publishPop"
      width="30%"
      class="publish-box"
    >
      <div style="text-align:center">
        <img
          :src="publicStatusImgSrc"
          alt=""
        >
        <p>{{publicStatusText}}</p>
        <el-button
          type="primary"
          class="popClose"
          @click="publishPop = false"
        >确定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { mapState } from "vuex";
import { tableData } from "./phraceData";
export default {
  name: "test",
  data() {
    return {
        inputVisibleIndex:"",
      inputVisible: false,
      inputValue: "",
      visibleMarkFilterBox: false,
      markFilterRange: [0, 1],
      publicStatus: false,
      publicStatusText: "",
      publicStatusImgSrc: "",
      publishPop: false,

      selectValue: "",
      searchword: "",
      importData: [],
      intentOption: [],
      filterData: [], //原始数组备份 筛选用
      sentences: [],
      ruleForm2: {
        id: "",
        type: "",
        intent: "",
        content: "",
        mark: "",
        result: "",
        time: ""
      },
      rules2: {
        type: [{ required: true, trigger: "blur", message: "请选择类型" }],
        intent: [{ required: true, trigger: "blur", message: "请选择意图" }],
        content: [
          { required: true, message: "请输入样本内容", trigger: "blur" },
          { min: 0, max: 200, message: "长度在200个字以内", trigger: "blur" }
        ]
      },
      editType: "add",
      editIndex: 0,
      multipleSelection: [],
      tagType:["",'success','info','warning' ,'danger' ]
    };
  },
  computed: {
    ...mapState({
      curSampleItem: state => state.intentionSample.curSampleItem
    })
  },
  mounted() {
    //this.initData();
  },
  methods: {
    seachKeyWords(){},
    handleClose(tag,content) {
      content.splice(content.indexOf(tag), 1);
    },
    showInput(index, row) {
      this.inputVisible = true;
      this.inputVisibleIndex = index;
      this.$nextTick(_ => {
        this.$refs.saveTagInput.$refs.input.focus();
      });
    },
    handleInputConfirm(content) {
      let inputValue = this.inputValue;
      if (inputValue) {
        content.push(inputValue);
      }
      this.inputVisible = false;
      this.inputValue = "";
    },

    filterHandler(scope) {
      // console.warn(scope);
      // console.warn(scope.row);
      // console.warn(scope.column);
      // const property = column["property"];
      // return row[property] === value;
    },
    handleDelete(index, row) {
      this.$confirm("确定删除此条意图").then(_ => {
        this.importData.splice(index, 1);
      });
    },
    multiDelete() {
      this.$confirm("确定删除" + this.multipleSelection.length + "条意图").then(
        _ => {
          this.importData = [];
        }
      );
    },
    currentDate() {
      var date = new Date();
      return (
        date.getFullYear().toString() +
        "-" +
        (date.getMonth() + 1).toString() +
        "-" +
        date.getDate().toString()
      );
    },
    initData() {
      //if (localStorage.getItem("sentences") === null) {
      this.importData = tableData;
      this.filterData = [...this.importData];
      localStorage.setItem("sentences", JSON.stringify(this.importData));
      //}
      //return JSON.parse(localStorage.getItem("sentences"));
    },
    publish() {
      this.publicStatus = !this.publicStatus;
      if (this.publicStatus) {
        this.publicStatusText = "发布成功";
        this.publicStatusImgSrc = require("@/assets/img/bot_12_success.png");
      } else {
        this.publicStatusText = "发布失败";
        this.publicStatusImgSrc = require("@/assets/img/bot_13_failure.png");
      }
      this.publishPop = true;
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    handlePreview(file) {
    },
    beforeAvatarUpload(file) {
      const isLt2M = file.size / 1024 / 1024 < 2;
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      this.importData = tableData;
      this.example = {
        allAmount: tableData.length,
        test: 0,
        train: tableData.length
      };
      return isLt2M;
    },
    handleExceed(files, fileList) {
      this.$message.warning(
        `当前限制选择 3 个文件，本次选择了 ${
          files.length
        } 个文件，共选择了 ${files.length + fileList.length} 个文件`
      );
    },
    selectIntent(name) {
      //筛选条目
      this.markFilterRange = [0, 1];
      this.importData = [];
      this.example = {
        allAmount: tableData.length,
        test: 0,
        train: tableData.length
      };
      tableData.forEach(element => {
        if (element.intent === name) {
          this.importData.push(element);
        }
      });
      this.filterData = [...this.importData]; //  保存原始数组
    },
    filterIntent(range) {
      let range0 = this.markFilterRange[0];
      let range1 = this.markFilterRange[1];
      this.importData = [];
      this.filterData.forEach(element => {
        console.warn(Number(element.mark));
        console.warn(range0);
        console.warn(range1);
        if (
          Number(element.mark) >= range0 &&
          Number(element.mark) <= range1 &&
          element.mark != ""
        ) {
          this.importData.push(element);
          console.warn(this.importData);
        }
      });
      this.visibleMarkFilterBox = false;
    },
    handleCurrentChange(val) {
      //分页
    }
  }
};
</script>

<style lang="scss" scoped>
.phraceTags {
  display: flex;
  flex-flow: row wrap;
  justify-content: flex-start;
  .el-tag {
    margin-bottom: 10px;
  }
}
.el-tag{
  margin-right: 10px;
}
.button-new-tag {
  height: 32px;
  line-height: 30px;
  padding-top: 0;
  padding-bottom: 0;
}
.input-new-tag {
  width: 90px;
  vertical-align: bottom;
}
</style>
