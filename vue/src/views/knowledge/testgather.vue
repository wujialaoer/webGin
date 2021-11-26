<template>
  <div class="app-container page_testgather">
    <div class="pany">
      <div>
        <!-- 新建样本 -->
        <el-row :gutter="20">
          <el-col :span="24">
            <div class="tablepanel">
              <div class="oprate">
                <el-select
                  clearable
                  v-model="KNchildren"
                  @change="selectOption"
                  placeholder="知识应用选择"
                >
                  <el-option
                    v-for="item in knpOptions.data"
                    :key="item.value"
                    :value="item"
                    :label="item.text"
                    @change="selectOption"
                  ></el-option>
                </el-select>
                <el-select
                  clearable
                  v-model="faq_data"
                  @change="selectOption"
                  style="margin-left: 10px;"
                  placeholder="知识包选择"
                >
                  <el-option
                    v-for="item in KNchildren.children"
                    :key="item.value"
                    :value="item"
                    :label="item.text"
                  ></el-option>
                </el-select>
                <el-input placeholder="输入关键词" class="searchword" v-model="searchword"
                          @keyup.enter.native="seachKeyWords" clearable>
                  <i slot="suffix" class="el-input__icon el-icon-search" @click="seachKeyWords"></i>
                </el-input>
              </div>
              <el-table
                class="tablelist"
                :data="importData"
                :row-key="getRowKeys"
                :expand-row-keys="expandArr"
                @selection-change="handleSelectionChange"
                @row-click="annotate2"
                @expand-change="handleExpandChange"
              >
                <el-table-column
                  prop="id"
                  label="序号"
                  width="50"
                >
                  <template slot-scope="scope">
                    {{ (curPage - 1) * pageSize + scope.$index + 1 }}
                  </template>
                </el-table-column>
                <el-table-column prop="id" width="50" type="expand">
                  <template slot-scope="scope">
                    <div class="trainWrap">
                      <div class="train-l">
                        <p>训练集</p>
                        <div class="trainProblemsList">
                          <div class="list-item" v-for="(item,index) in trainProblems" :key="index">
                            {{item}}
                          </div>
                        </div>
                      </div>
                      <div class="train-r">
                        <p>测试集</p>
                        <!-- @paste.native.stop.prevent="showPasteDialog($event)" -->
                        <el-tabs v-model="curTabPosition" class="frontEndList">
                          <el-input class="frontEndInput" v-model.trim="curInputSentence" ref="frontEndInput"
                                    placeholder="请输入测试语句"
                                    @paste.native.stop.prevent="showPasteDialog"
                                    @keydown.enter.native="submitMsg"></el-input>
                          <!--                          <el-tab-pane class="testSetlist" label="正">-->
                          <div class="sentence-item" v-for="(item,index) in testJusts"
                               @mouseover="showCtrl(index)"
                               @mouseleave="showCtrlIndex = null"
                               :key="item.id">
                                    <span class="wordWrap" v-show="!(index === curEditIndex)">{{index+1}}
                                        . {{item.problem}}</span>
                            <el-input
                              v-show="index === curEditIndex && curEditIndex!==''"
                              class="editInput"
                              suffix-icon="el-icon-bottom-left"
                              v-model.trim="curEditSentence"
                              placeholder
                              @keydown.enter.native="submitEditSentence(item,index,$event)"
                              minlength="5"
                              @focus="hideCtrl"
                              :ref="`input${index}`"
                              @blur="blurInput"
                            ></el-input>
                            <span class="ctrl_sentence" v-show="index == showCtrlIndex">
                                    <i
                                      @click="showSentenceEdit(item,index,$event)"
                                      class="sentence-icon el-icon-edit"
                                    ></i>
                                    <i
                                      @click="deleteSentence(item,index)"
                                      class="sentence-icon el-icon-delete"
                                    ></i>
                                  </span>
                          </div>
                        </el-tabs>
                      </div>
                    </div>
                  </template>
                </el-table-column>
                <el-table-column
                  prop="problem"
                  label="问题"
                  width="250"
                >
                  <template slot-scope="scope">
                    <div class="accordion">
                      <!-- <i class="icon el-icon-circle-plus-outline"></i> -->
                      <div>{{ scope.row.problem }}</div>
                    </div>
                  </template>
                </el-table-column>
                <el-table-column
                  prop="dis_answer"
                  label="答案"
                >
                  <template slot-scope="scope">
                    {{ scope.row.dis_answer }}
                    <el-tag size="mini" plain :type="scope.row.faq_type == 0?'success':''">{{ scope.row.faq_type |
                      typeFilter}}
                    </el-tag>
                  </template>
                </el-table-column>
                <el-table-column
                  prop="name"
                  label="知识包名称"
                  column-key="mark"
                  width="140"
                >
                </el-table-column>
                <el-table-column prop="creater" label="修改人" width="120">
                  <template slot-scope="scope">
                    <div class="accordion">
                      <!-- <i class="icon el-icon-circle-plus-outline"></i> -->
                      <div>{{ scope.row.creater }}</div>
                    </div>
                  </template>
                </el-table-column>
                <el-table-column prop="last_modification_time" label="修改时间" width="140">
                  <template slot-scope="scope">
                    <div class="accordion">
                      <!-- <i class="icon el-icon-circle-plus-outline"></i> -->
                      <div class="date">{{ scope.row.date }}</div>
                      <!-- <br> -->
                      <div class="time">{{ scope.row.time }}</div>
                    </div>
                  </template>
                </el-table-column>
              </el-table>
              <el-pagination
                class="mgtp20"
                layout="prev, pager, next"
                prev-text="上一页"
                next-text="下一页"
                :page-size="pageSize"
                :total="totalCount"
                @current-change="handleCurrentChange"
              >
              </el-pagination>
            </div>
          </el-col>
        </el-row>
        <el-dialog
          title="添加测试语句"
          :visible.sync="dialogVisible2"
          :before-close="handleClose2"
          width="40%"
          class="dialog-box"
          ref="showPasteDialog"
        >
          <el-form
            :model="ruleForm2"
            :rules="rules2"
            ref="ruleForm2"
            label-width="40px"
            class="demo-ruleForm2"
          >
            <div class="sentencelistBox">
              <el-form-item
                prop="text"
                v-for="(i,index) in pastelist"
                :key="index"
              >
                <el-input
                  v-model="pastelist[index]"
                  placeholder="请输入测试语句"
                  class="text ruleForm2-item"
                ></el-input>
              </el-form-item>
            </div>
            <el-form-item>
              <el-button
                type="primary"
                @click="submitForm('ruleForm2')"
                class="mgtp20"
              >提交
              </el-button>
            </el-form-item>
          </el-form>
        </el-dialog>
      </div>
    </div>
  </div>
</template>

<script>
  import {MessageBox, Message} from "element-ui";
  import {mapState, mapMutations} from "vuex";
  import {getFaqPackageSelect} from "@/api/generate/faqPackage";
  import {getQueryFaqPageList} from "@/api/generate/faq";
  import {addBatchFaqTest} from "@/api/expand/faq";
  import {
    getQueryFaqTestPageList,
    addFaqTest,
    getFaqTestById,
    updateFaqTest,
    deleteFaqTestById
  } from "@/api/generate/faqTest";

  export default {
    name: "testgather",
    data() {
      return {
        curPage: 1,
        pageSize: 20,
        totalCount: 0,
        pageCount: 0,
        listLoading: true,
        expandArr: [],
        getRowKeys(row) {
          return row.id;
        },
        sentenceList: [],
        trainProblems: [],
        testJusts: [],
        testBacks: [],
        pastelist: [],
        curTabPosition: "",
        curInputSentence: "",
        curEditSentence: "",
        curEditIndex: "",
        partOfSpeech: [
          {
            label: '名词',
            value: 'n',
            type: ''
          },
          {
            label: '动词',
            value: 'v',
            type: 'success'
          },
          {
            label: '形容词',
            value: 'a',
            type: 'danger'
          },
          {
            label: '代词',
            value: 'r',
            type: 'warning'
          },
          {
            label: '非语素字',
            value: 'x',
            type: 'info'
          },
        ],
        properInput: "",
        wordgatherInput: "",
        chart: null,
        className: "chart",
        id: "chart",
        width: "100%",
        height: "100%",
        showCtrl_sentence: false,
        showCtrlIndex: "",
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
        knpOptions: [],
        faq_data: {},
        intentOption: [],
        selectValue: "",
        searchword: "",
        importData: [],
        KNchildren: {},
        filterData: [], //原始数组备份 筛选用
        sentences: [],
        ruleForm2: {
          appId: "",
          text: "",
          intentsId: ""
        },
        rules2: {
          type: [{required: true, trigger: "blur", message: "请选择类型"}],
          intent: [{required: true, trigger: "blur", message: "请选择意图"}],
          content: [
            {required: true, message: "请输入样本内容", trigger: "blur"},
            {min: 0, max: 200, message: "长度在200个字以内", trigger: "blur"}
          ]
        },
        editType: "add",
        editIndex: 0,
        multipleSelection: [],
        //annotateArr: []
        key1: "",
        key2: "",
        annotation: "",
        entityList: [],
        changeFlag: false
      };
    },
    computed: {
      ...mapState({
        curSampleItem: state => state.intentionSample.curSampleItem
      }),
    },
    watch: {
      selectValue(newValue, oldValue) {
        console.warn(newValue);
        this.fetchData(newValue);
      },
      'KNchildren'(e) {
        if (this.changeFlag) {
          this.selectValue = '';
          this.faq_data = {};
          this.curPage = 1;
          this.fetchData();
        }
      },

    },
    filters: {
      typeFilter(status) {
        if (status == 0) {
          return "单轮";
        } else {
          return "多轮";
        }
      }
    },
    created() {
      this.fetchData();
    },
    methods: {
      ...mapMutations(['setKnpOptions']),
      async fetchData() {
        this.knpOptions = await getFaqPackageSelect();
        this.setKnpOptions(this.knpOptions);
        this.listLoading = true;
        let data = {
          page: this.curPage,
          pageSize: this.pageSize,
        };
        if (this.searchword) {
          data = {
            // "Problem.Operator": 8,
            "search": this.searchword,
            ...data
          };
        }
        //下拉框条件
        this.selectValue = this.faq_data.value;
        if (this.selectValue == "") {
        } else {
          data = {
            "business_unit": this.KNchildren.value,
            "faq_package": this.selectValue,
            ...data
          };
        }

        console.log(121234324,data);
        let tmp = await getQueryFaqPageList(data);
        this.importData = tmp.data.data;
        this.totalCount = tmp.data.totalCount;
        this.listLoading = false;
      },
      showPasteDialog(e) {
        console.warn(e);
        console.warn(e.clipboardData.items);
        this.pastelist = [];
        for (var i = 0, len = e.clipboardData.items.length; i < len; i++) {
          var item = e.clipboardData.items[i];
          if (item.kind === "string" && item.type == "text/plain") {
            item.getAsString(str => {
              // str 是获取到的字符串
              console.warn(str);
              this.pastelist = str.split(/\r\n|[\r\n]/);
              console.warn(this.pastelist);
            })
          }
        }
        this.dialogVisible2 = true;
        this.$nextTick(() => {
          this.$refs.frontEndInput.blur();
        })
      },
      handleExpandChange(row, expandedRows) {
        var that = this
        if (expandedRows.length) {
          that.expandArr = []
          if (row) {
            that.expandArr.push(row.id);
            that.getSentenceList(row.id);
            this.$nextTick(() => {
              this.$refs.frontEndInput.focus();
            });
          }
        } else {
          that.expandArr = [];
        }
      },
      async getSentenceList(id) {
        // let tmp = await getFAQTestSetList(id);
        let params = {
          faq_id: id,
        };
        let trainResult = await getFaqTestById(params);
        this.trainProblems = trainResult.data.trainProblems;
        this.testJusts = trainResult.data.testJusts;
        this.testBacks = trainResult.data.testBacks;
      },
      async selectOption(type) {
        this.changeFlag = type;
        this.curPage = 1;
        this.pageSize = 20;
        this.fetchData();
      },
      submitMsg(e) {
        let params = {
          faq: this.expandArr[0],
          problem: this.curInputSentence,
          test_type: parseInt(this.curTabPosition) + 1
        }
        if (!params.problem) {
          return
        }
        this.curInputSentence = '';
        addFaqTest(params).then((resp) => {
          this.curInputSentence = '';
          Message({
            message: "添加成功",
            type: "success",
            duration: 3 * 1000
          });
          this.getSentenceList(this.expandArr[0]);
        });
      },
      seachKeyWords() {
        this.curPage = 1;
        this.fetchData();
      },
      annotate2(row, column, event) {
        console.warn(row);
        console.warn(column);
        console.warn(event);
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
            let params = {
              faqId: this.expandArr[0],
              problems: this.pastelist,
              testType: parseInt(this.curTabPosition) + 1
            }
            addBatchFaqTest(params).then((resp) => {
              if (resp.message == "Success") {
                this.$message({
                  message: "添加成功",
                  type: "success",
                  duration: 3 * 1000
                });
                this.curInputSentence = "";
                this.getSentenceList(this.expandArr[0]);
                this.dialogVisible2 = false;
              }
            });
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
        this.curPage = val;
        this.$nextTick(() => {
          window.scrollTo(0, 0);
        });
        this.fetchData();
      },
      submitEditSentence(item, index, event) {
        console.warn(item, index, event);
        if (this.curEditSentence == item.problem || this.curEditSentence == "") {
          this.curEditIndex = "";
          this.curEditSentence = "";
          return;
        }
        let params = {
          faqId: this.expandArr[0],
          problem: this.curEditSentence,
          version: item.version,
          id: item.id
        };
        this.curEditSentence = '';
        updateFaqTest(item.id, params).then(() => {
          this.$notify({
            title: "成功",
            type: "success",
            customClass: "qa-Notify",
            duration: 2000
          });
          this.getSentenceList(this.expandArr[0]);
        });
        this.curEditIndex = "";
        this.curEditSentence = "";
      },
      hideCtrl() {
        this.showCtrlIndex = null
        //this.showCtrl_sentence = false;
      },
      showCtrl(index) {
        if (this.curEditIndex === "") {
          this.showCtrlIndex = index
        }
        //     console.log(e);
        //     console.log(item);
        //     console.log(index);
        //   if (this.curEditIndex === "") {
        //       this.showCtrlIndex = index;
        //     this.showCtrl_sentence = true;
        //   }
      },
      blurInput() {
        this.curEditIndex = "";
        this.curEditSentence = "";
      },
      showSentenceEdit(item, index, event) {
        this.curEditIndex = index;
        this.curEditSentence = item.problem;
        //$(".sentence-item:eq("+index+") .editInput")[0].focus();
        this.$nextTick(() => {
          console.warn(this.$refs);
          let $dom = this.$refs[`input${index}`];
          console.warn($dom);
          $dom[0].focus();
          this.hideCtrl();
        });
        console.warn(event);
        console.warn(index);
      },
      deleteSentence(item, index, event) {
        deleteFaqTestById(item.id).then(() => {
          this.getSentenceList(this.expandArr[0]);
        });
      },
    }
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>
  .annotation {
    span {
      transition: 0.4s all 0s ease;
    }

    span:hover {
      transform: scale(1.15) translateZ(0);
      display: inline-block;
      color: #f56c6c;
    }

    .is-annotated {
      color: #f56c6c;
    }
  }

  .ctrl_sentence {
    transition: 0.4s all 0s ease;
    //   display: none;
    margin-left: 20px;

    .sentence-icon {
      color: #999;
      margin-left: 10px;

      &:hover {
        cursor: pointer;
      }
    }
  }

  .page_testgather {
    .tablepanel .searchword {
      width: 240px;
      float: right;
    }

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

    .tablepanel {
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
        margin-top: 10px;
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
          color: #c4b4b4;
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

  .demo-ruleForm2 {
    .sentencelistBox {
      max-height: 400px;
      overflow: auto;
    }

    .el-form-item {
      margin-bottom: 0px;
    }

    .ruleForm2-item {
      display: list-item;
      list-style-type: disc;
    }

    /deep/ .el-input__inner {
      border: none;
      border-bottom: 1px dashed transparent;
      border-radius: 0;
      padding-left: 0;
      padding-top: 0 !important;
      margin-top: -10px;
      margin-bottom: 10px;

      &:hover {
        border-bottom: 1px dashed #DCDFE6;
      }
    }
  }

  .trainWrap {
    min-height: 400px;
    background: #f8fdff;
    padding: 20px;
    box-sizing: border-box;
    display: flex;

    .train-l {
      flex: 1.5;
      display: flex;
      flex-flow: column nowrap;
      margin-top: -16px;
      margin-right: 20px;

      .trainProblemsList {
        background: #f1f1f1;
        flex: auto;
        padding: 15px;
        overflow: auto;
        max-height: 332px;

        .list-item {
          margin: 10px;
        }
      }
    }

    .train-r {
      margin-top: -16px;
      display: flex;
      flex: 2;
      flex-flow: column nowrap;

      .frontEndList {
        background: #fff;
        flex: auto;
        padding: 15px;

        .list-item {
          margin: 10px;
        }

        /deep/ .el-tabs__item {
          width: 80px;
          text-align: center;
        }

        .testSetlist {
          overflow: auto;
          max-height: 208px
        }

        .sentence-item {
          margin-bottom: 10px;
        }
      }

      .frontEndInput /deep/ .el-input__inner {
        border: none;
        border-bottom: 1px dashed #DCDFE6;
        border-radius: 0;
        padding-left: 0;
        padding-top: 0 !important;
        margin-top: -10px;
        margin-bottom: 10px;
      }
    }
  }

    .date{
    display: block;
  }
  .time{
    display: block;
  }
</style>
