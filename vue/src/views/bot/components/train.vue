<template>
  <div>
    <!-- 新建样本 -->
    <el-row
      :gutter="20"
      class="row-bg" justify="space-between"
    >
      <el-col :span="12">
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
<!--              <el-button type="primary" plain>导入</el-button>-->
            </el-upload>
            <el-button
              type="success" plain
              @click="dialogVisible2 = true"
            >新建</el-button>
            <el-button
              type="danger" plain
              @click="multiDelete"
            >删除</el-button>
            <el-button type="warning" plain>评分</el-button>
            <el-select
              v-model="selectValue"
              @change="selectIntent"
              style="margin-left: 20px;"
              placeholder="请选择意图"
            >
              <el-option
                v-for="item in intentOption"
                :key="item.intentsId"
                :value="item.name"
              >
              </el-option>
            </el-select>
          </div>
        </div>
      </el-col>
        <el-col :offset="5" :span="7">
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
            class="tablelist"
            @selection-change="handleSelectionChange"
            @row-click="annotate2"
          >
            <el-table-column
              type="selection"
              width="55"
            >
            </el-table-column>
            <el-table-column
              prop="id"
              label="序号"
              width="50"
            >
              <template slot-scope="scope">
                {{ scope.$index }}
              </template>
            </el-table-column>
            <el-table-column
              prop="intentsName"
              label="意图名称"
              width="100"
            >
            </el-table-column>
            <el-table-column
              prop="text"
              width="320"
              label="内容"
            >
              <template slot-scope="scope">
                <!-- <p
                  v-if="annotated==false"
                  @mouseenter="labelHandler(scope.$index, scope.row.text)"
                > -->
                <p class="annotation"
                >
                    <span
                    v-for="(item,index) in labelHandler(scope.row.text)"
                    :key="index"
                    :class="{'is-annotated':index>=annotation.startpos && index<=annotation.endpos && scope.$index == scope.$index}"
                    @click="annotate(item,index,scope.row.text,scope.$index)"
                  >{{item}}</span>
                </p>
                <!-- <p
                  v-if="annotated"
                  @mouseleave="annotated = true"
                  class="annotation"
                > -->
                  <!-- <span
                    v-for="(item,index) in [...scope.row.text]"
                    :key="index"
                  >{{item}}</span> -->
                <!-- </p> -->
              </template>
            </el-table-column>
            <el-table-column
              prop="score"
              label="评分"
              column-key="mark"
            >
              <template
                slot="header"
                slot-scope="scope"
              >
                <span @click="visibleMarkFilterBox = !visibleMarkFilterBox">
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
              label="创建人"
              width="110"
              align="center"
            >
              <template slot-scope="scope">
                <span>{{ scope.row.createUserName }}</span>
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
              prop="type"
              label="状态"
              width="80"
            >
              <template slot-scope="scope">
                <el-tag :type="scope.row.stateName | statusFilter">{{ scope.row.stateName }}</el-tag>
              </template>
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
          label="意图"
          prop="intentsId"
        >
          <el-select
            v-model="ruleForm2.intentsId"
            placeholder="请选择样本意图"
          >
            <el-option
              v-for="item in intentOption"
              :key="item.intentsId"
              :label="item.name"
              :value="item.intentsId"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          class="mgtp20"
          label="内容"
          prop="text"
        >
          <el-input
            type="textarea"
            v-model="ruleForm2.text"
            placeholder="请输入样本内容"
            class="text"
          ></el-input>
          <span>{{ruleForm2.text.length}}/200</span>
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
import { getIntent } from "@/api/intent";
import { createTraining, getTrainingList } from "@/api/utterance";

export default {
  name: "train",
  data() {
    return {
      appId: "3ddad951-93ff-4088-8b5f-f77edef13765",
      annotated: false,
      visibleMarkFilterBox: false,
      markFilterRange: [0, 1],
      dialogVisible2: false,
      publicStatus: false,
      publicStatusText: "",
      publicStatusImgSrc: "",
      publishPop: false,
      example: {
        allAmount: 0,
        test: 0,
        train: 0
      },
      typeOption: ["测试集", "训练集"],
      intentOption: [],
      selectValue: "",
      searchword: "",
      importData: [],
      filterData: [], //原始数组备份 筛选用
      sentences: [],
      ruleForm2: {
        appId: "",
        text: "",
        intentsId: ""
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
      //annotateArr: []
      key1:"",
      key2:"",
      annotation:"",
      entityList:[],
    };
  },
  computed: {
    ...mapState({
      curSampleItem: state => state.intentionSample.curSampleItem
    }),
    dialogVisible2Title() {
      switch (this.editType) {
        case "add":
          return "新增语句";
          break;
        case "edit":
          return "编辑语句";
        default:
          break;
      }
    },

  },
  mounted() {
    //this.initData();
  },
  filters: {
    statusFilter(status) {
      const statusMap = {
        启用: "success",
        禁用: "danger"
      };
      return statusMap[status];
    },
  },
  methods: {
      seachKeyWords(){

      },
      annotate2(row, column, event){
          console.warn(row);
          console.warn(column);
          console.warn(event);
      },
    annotate(item,index,text,scopeIndex){
    if(index == this.key1.index){
            this.key1 = {};
        }else if(this.key1 == "" && index != this.key1.index){
            this.key1 = {
                name:item,
                index:index
            };
        }else{
            this.key2 = {
                name:item,
                index:index
            };
            this.annotation = {
                utteranceId:"", //语句
                entitiesId:"",  //实体id
                text:text.substr(this.key1.index, this.key2.index), //实体文字
                startpos:this.key1.index,
                endpos: this.key2.index,
                entitiesTpye:"",
            };
            console.warn(this.annotation);
            this.entityList.push(this.annotation);
            this.key1 = "";
            this.key2 = "";
        }

    },
    labelHandler(row) {
      //this.annotated = true;
      var arr = [...row];
      console.warn(arr);
      return arr;
    },
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
            this.ruleForm2.appId = this.appId;
            createTraining(this.ruleForm2).then(response => {
              console.warn(response);
            });
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
      getIntent().then(response => {
        console.warn(response);
        this.intentOption = response.data;
      });
      getTrainingList().then(response => {
        this.importData = response.data;
        this.filterData = [...this.importData];
        console.warn(this.importData);
        localStorage.setItem("sentences", JSON.stringify(this.importData));
      });

      //}
      //return JSON.parse(localStorage.getItem("sentences"));
    },
    handleClose2() {
      this.editType = "add";
      this.ruleForm2 = {
        appId: "",
        text: "",
        intentsId: ""
      };
      this.dialogVisible2 = false;
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

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss">
@import "~@/assets/styles/slider.scss";

.annotation {
  span {
    transition: 0.4s all 0s ease;
  }
  span:hover {
    transform: scale(1.15) translateZ(0);
    display: inline-block;
    color: #f56c6c;
  }
  .is-annotated{
    color: #f56c6c;
  }
}
.page_intentionSample {
  .corpustabs {
  }
  .box-card {
    margin-bottom: 10px;
  }
  input[type="file"] {
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
  .el-table {
    .cell {
      color: #666666;
    }
  }
  .el-table__header-wrapper,
  .el-table th {
    overflow: initial;
    .cell {
      font-weight: 400;
      color: #111111;
    }
    div {
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
      &:hover {
        background: linear-gradient(
          0deg,
          rgba(254, 113, 86, 1),
          rgba(254, 144, 70, 1)
        );
      }
    }
  }

  .tablepanel {
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
