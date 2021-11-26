<template>
  <div class="app-container page_intentionSample">
    <el-row :gutter="20">
      <el-col :span="8">
        <div class="example">
          <div class="icon">
            <img
              src="~@/assets/img/bot_09_chart01.png"
              alt=""
            >
          </div>
          <div class="introBox">
            <span class="intro">{{example.allAmount}}</span>
            <p class="title">样本总量</p>
          </div>

        </div>
      </el-col>
      <el-col :span="8">
        <div class="example">
          <div class="icon">
            <img
              src="~@/assets/img/bot_09_chart02.png"
              alt=""
            >
          </div>
          <div class="introBox">
            <span class="intro">{{example.test}}</span>
            <p class="title">测试样本</p>
          </div>
        </div>
      </el-col>
      <el-col :span="8">
        <div class="example">
          <button @click="publish">发布</button>
          <div class="icon">
            <img
              src="~@/assets/img/bot_09_chart03.png"
              alt=""
            >
          </div>
          <div class="introBox">
            <span class="intro">{{example.train}}</span>
            <p class="title">训练样本</p>
          </div>
        </div>
      </el-col>
    </el-row>
    <!-- 新建样本 -->
    <el-row
      :gutter="20"
      class="mgtp20"
    >
      <el-col :span="24">
        <div class="tablepanel">
          <div class="oprate">
            <el-upload
              style="margin-right:10px;display: inline-block;"
              action="https://jsonplaceholder.typicode.com/posts/"
              :on-preview="handlePreview"
              multiple
              :limit="3"
              :on-exceed="handleExceed"
              :before-upload="beforeAvatarUpload"
              :show-file-list="false"
            >
<!--              <el-button type="primary" disabled>导入</el-button>-->
            </el-upload>
            <el-button
              type="success"
              @click="dialogVisible2 = true"
            >新建</el-button>
            <el-button
              type="danger"
              @click="multiDelete"
            >删除</el-button>
            <el-button type="warning">评分</el-button>
            <el-select
              v-model="selectValue"
              @change="selectIntent"
              style="margin-left: 20px;"
              placeholder="请选择意图"
            >
              <el-option
                v-for="item in intentOption"
                :key="item.index"
                :value="item"
              >
              </el-option>
            </el-select>
            <el-input placeholder="请输入关键词" class="searchword" v-model="searchword">
              <i slot="suffix" class="el-input__icon el-icon-search" @click="seachKeyWords"></i>
            </el-input>
          </div>
          <el-table
            :data="importData"
            border
            class="tablelist"
            @selection-change="handleSelectionChange"
          >
            <el-table-column
              type="selection"
              width="55"
            >
            </el-table-column>
            <el-table-column
              prop="id"
              label="序号"
              width="80"
            >
            </el-table-column>
            <el-table-column
              prop="type"
              label="类型"
              width="80"
            >
            </el-table-column>
            <el-table-column
              prop="content"
              width="420"
              label="内容"
            >
            </el-table-column>
            <el-table-column
              prop="mark"
              label="评分"
              width="200"
              column-key="mark"
            >
              <template
                slot="header"
                slot-scope="scope"
              >
                <span @click="visibleMarkFilterBox = true">
                  <span v-if="JSON.stringify(markFilterRange) == JSON.stringify([0,1])">评分</span>
                  <span v-else>
                    {{markFilterRange[0].toFixed(2)}} - {{markFilterRange[1].toFixed(2)}}
                  </span>
                  <i class="el-icon-caret-bottom"></i>
                </span>
                <div
                  v-if="visibleMarkFilterBox"
                  class="markFilterBox block"
                >
                  <div class="slider-header clearfix">
                    <span class="fl slider-header-l">范围选择</span>
                    <span
                      class="fr slider-header-r"
                      @click="filterIntent(scope)"
                    >确认</span>
                  </div>
                  <div class="showRange">
                    <span>{{markFilterRange[0]}}</span>-
                    <span>{{markFilterRange[1]}}</span>
                  </div>
                  <el-slider
                    v-model="markFilterRange"
                    range
                    :step="Number('0.1')"
                    :show-stops=false
                    :max="1"
                  >
                    <!-- :step="parseFloat(0.1)" -->
                  </el-slider>
                </div>
              </template>
            </el-table-column>
            <el-table-column
              prop="result"
              label="预期结果"
              width="150"
            >
            </el-table-column>
            <el-table-column label="操作">
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
      :title="dialogVisible2Title"
      :visible.sync="dialogVisible2"
      :before-close="handleClose2"
      width="40%"
      class="dialog-box"
    >
      <el-form
        :model="ruleForm2"
        :rules="rules2"
        ref="ruleForm2"
        label-width="50px"
        class="demo-ruleForm2"
      >
        <el-form-item
          label="类型"
          prop="type"
        >
          <el-select
            v-model="ruleForm2.type"
            placeholder="请选择样本类型"
          >
            <el-option
              v-for="item in typeOption"
              :key="item.index"
              :value="item"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          label="意图"
          prop="intent"
        >
          <el-select
            v-model="ruleForm2.intent"
            placeholder="请选择样本意图"
          >
            <el-option
              v-for="item in intentOption"
              :key="item.index"
              :value="item"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          class="mgtp20"
          label="内容"
          prop="content"
        >
          <el-input
            type="textarea"
            v-model="ruleForm2.content"
            placeholder="请输入样本内容"
            class="content"
          ></el-input>
          <span>{{ruleForm2.content.length}}/200</span>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="submitForm('ruleForm2')"
            class="mgtp20"
          >保存</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
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
import { tableData } from "@/components/tableData";

export default {
  name: "IntentionSample",
  data() {
    return {
      visibleMarkFilterBox: false,
      markFilterRange: [0, 1],
      dialogVisible2: false,
      publicStatus:false,
      publicStatusText:"",
      publicStatusImgSrc:"",
      publishPop: false,
      example: {
        allAmount: 0,
        test: 0,
        train: 0
      },
      typeOption: ["测试集", "训练集"],
      intentOption: ["申请或领用电脑", "招聘新员工", "开收入证明"],
      selectValue: "",
      searchword: "",
      importData: [],
      filterData: [],   //原始数组备份 筛选用
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
      multipleSelection: []
    };
  },
  computed: {
    ...mapState({
      curSampleItem: state => state.intentionSample.curSampleItem,
    }),
    dialogVisible2Title(){
      switch (this.editType) {
        case "add":
          return "新增意图"
          break;
        case "edit":
          return "编辑意图"
        default:
          break;
      }
    }
  },
  mounted(){
    this.initData();
  },
  methods: {
    filterHandler(scope) {
      console.warn("------------");
      console.warn(scope);
      console.warn(scope.row);
      console.warn(scope.column);
      // const property = column["property"];
      // return row[property] === value;
    },
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          if (this.editType === "add") {
            this.ruleForm2.id = (tableData.length + 1).toString();
            this.ruleForm2.mark = "";
            this.ruleForm2.time = this.currentDate();
            this.ruleForm2.result = tableData.result;
            this.importData.push(this.ruleForm2);
            var sentensesArray = JSON.parse(localStorage.getItem("sentences"));
            console.log(sentensesArray);
            sentensesArray.push(this.ruleForm2);
            console.log(sentensesArray);
            localStorage.setItem("sentences", JSON.stringify(sentensesArray));
          } else {
            this.importData.splice(this.editIndex, 1, this.ruleForm2);
          }
          this.dialogVisible2 = false;
        } else {
          return false;
        }
      });
    },
    handleEdit(index, row) {
      this.editType = "edit";
      this.ruleForm2 = {
        id: row.id,
        type: row.type,
        intent: row.intent,
        content: row.content,
        mark: row.mark,
        result: row.result,
        time: row.time
      };
      this.editIndex = index;
      this.dialogVisible2 = true;
    },
    handleDelete(index, row) {
      this.$confirm("确定删除此条意图").then(_ => {
        this.importData.splice(index, 1);
      });
      console.log(index, row);
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
        console.warn(tableData);
        console.warn(this.importData);
        localStorage.setItem("sentences", JSON.stringify(this.importData));
      //}
      //return JSON.parse(localStorage.getItem("sentences"));
    },
    handleClose2() {
      this.editType = "add";
      this.ruleForm2 = {
        id: "",
        type: "",
        intent: "",
        content: "",
        mark: "",
        time: "",
        result: ""
      };
      this.dialogVisible2 = false;
    },
    publish() {
      this.publicStatus = !this.publicStatus;
      if(this.publicStatus){
        this.publicStatusText = "发布成功";
        this.publicStatusImgSrc = require("@/assets/img/bot_12_success.png");
      }else{
        this.publicStatusText = "发布失败";
        this.publicStatusImgSrc = require("@/assets/img/bot_13_failure.png");
      }
      this.publishPop = true;
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    handlePreview(file) {
      console.log(file);
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
      this.markFilterRange = [0,1];
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
      this.filterData = [...this.importData];  //  保存原始数组
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
    handleCurrentChange(val){//分页
      console.log(`当前页: ${val}`);
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss">
@import "~@/assets/styles/slider.scss";

.page_intentionSample {
  input[type=file]{
    display: none;
  }
  .showRange {
    line-height: initial;
    color: #ccc;
    span {
      margin-right: 4px;
      color: #4693ff;
    }
  }
  .el-slider {
    //margin-top: 16px;
  }
  .slider-header {
    overflow: hidden;
    line-height: 30px;
    .slider-header-l {
      font-size: 12px;
      font-family: MicrosoftYaHei;
      font-weight: 400;
      color: rgba(153, 153, 153, 1);
      margin-top: 5px;
    }
    .slider-header-r {
      padding: 0px 6px;
      border: 1px solid #ccc;
      font-size: 11px;
      font-family: MicrosoftYaHei;
      font-weight: 400;
      color: rgba(102, 102, 102, 1);
      border-radius: 9px;
      line-height: 20px;
      margin-top: 10px;
      cursor: pointer;
    }
  }
  .el-table{
    .cell{
      color:#666666;
    }
  }
  .el-table__header-wrapper,
  .el-table th {
    overflow: initial;
    .cell{
      font-weight: 400;
      color:#111111;
    }
    div{
          display: block;
    overflow: initial;
    padding-left: 0px;
    padding-right: 0px;
    }
  }

  .el-slider__runway {
    display: block;
    .el-slider__button-wrapper {
      padding-left: 10px;
      padding-right: 10px;
      top: -6px;
      .el-slider__button {
        padding-left: 0px;
        padding-right: 0px;
        top: -5px;
        background: rgba(255, 255, 255, 1);
      }
    }
  }
  .markFilterBox {
    padding-left: 10px !important;
    padding-right: 10px !important;
    position: absolute;
    width: 100%;
    left: 0;
    bottom: -103px;
    height: 90px;
    box-shadow: 0px 5px 6px 0px rgba(36, 59, 91, 0.15);
    border-radius: 0px 0px 4px 4px;
    background: #fff;
    z-index: 999;
  }
  .publish-box {
    .el-dialog__title {
      display: none;
    }

    .popClose {
      width: 180px;
      margin-top: 20px;
    }
  }
  .dialog-box {
    .el-dialog__header {
      margin: 20px;
      padding: 20px 0;
      border-bottom: 1px solid #eee;

      .el-dialog__title {
        border-left: 3px solid #4693ff;
        padding-left: 10px;
        height: 20px;
        display: block;
        line-height: 20px;
      }
    }
    .el-form-item.is-required:not(.is-no-asterisk) > .el-form-item__label {
      font-weight: bold;
    }
    .el-form-item.is-required:not(.is-no-asterisk)
      > .el-form-item__label:before {
      content: "";
    }

    .el-input__inner {
      border-color: transparent;
      background: #f1f2f7;
    }
    .content textarea {
      border-color: transparent;
      background: #f1f2f7;
      resize: none;
      height: 200px;
    }
    .content + span {
      position: absolute;
      top: 160px;
      right: 15px;
      color: #999;
    }
  }

  .example {
    background: #fff;
    border-radius: 5px;
    padding: 25px;
    display: flex;
    justify-content: center;
    position: relative;
    &:after {
      content: "";
      clear: both;
      display: block;
    }

    .intro {
      font-size: 23px;
      font-family: MicrosoftYaHei;
      font-weight: 400;
      color: rgba(102, 102, 102, 1);
    }
    .title {
      font-size: 14px;
      font-family: MicrosoftYaHei;
      font-weight: 400;
      color: rgba(102, 102, 102, 1);
    }
    .introBox {
      display: flex;
      flex-flow: column;
      justify-content: center;
    }
    .icon {
      width: 64px;
      height: 64px;
      margin-right: 20px;
      img {
        width: 100%;
        height: 100%;
        display: block;
      }
    }

    button {
      color: #fff;
      cursor: pointer;
      width: 45px;
      height: 23px;
      background: linear-gradient(
        0deg,
        rgba(254, 144, 70, 1),
        rgba(254, 113, 86, 1)
      );
      box-shadow: 0px 5px 6px 0px rgba(254, 86, 113, 0.35);
      border-radius: 4px;
      position: absolute;
      right: 38px;
      top: 25px;
      border: none;
      &:hover{
        background: linear-gradient(
        0deg,
        rgba(254, 113, 86, 1),
        rgba(254, 144, 70, 1)
      );
      }
    }
  }

  .tablepanel {
    margin-top: 10px;
    background: #fff;
    border-radius: 5px;
    padding: 20px;

    .el-upload-list {
      display: none;
    }
    .searchword {
      width: 240px;
      float: right;

      input {
        border: none;
        background: #f1f2f7;
      }
    }

    .el-table td,
    .el-table th {
      text-align: center;
    }

    .tablelist {
      width: 100%;
      margin-top: 30px;
      color: #333;
      overflow: initial;
      .el-button {
        color: #666666;
      }
      .el-button + .el-button {
        margin-left: 0;
      }

      th {
        font-weight: bold;
        color: #333;
      }
    }

    .el-pagination {
      text-align: center;

      button {
        border: 1px solid #d9d9d9;
        border-radius: 5px;
        margin: 5px;
        line-height: 2;
        padding: 0 12px;
      }
      .number {
        background: white;
        border: 1px solid #d9d9d9;
        border-radius: 5px;
        margin: 5px;
        line-height: 2;
        color: #666666;
      }
      .number.active {
        background: #4693ff;
        color: #fff;
        border: 1px solid #4693ff;
      }
      .el-icon-more {
        margin: 5px;
      }
    }
  }
}
</style>
