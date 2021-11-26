<template>
  <div class="app-container page_qa">
    <router-view></router-view>
    <div class="pany">
      <div>
        <!-- 新建样本 -->
        <el-row :gutter="20">
          <el-col :span="24">
            <div class="tablepanel">
              <div class="oprate">
                <el-button plain type="primary" @click="$router.push({name:'importjson'})">导入</el-button>
                <el-button plain type="primary" @click="$router.push({name:'ImportData'})">批量导入</el-button>
                <el-button type="success" plain @click="$router.push({name:'Newqa'})">新建</el-button>
                <el-select
                  clearable
                  v-model="KNchildren"
                  @change="selectOption"
                  style="margin-left: 10px;"
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
              <!-- <el-divider></el-divider> -->
              <el-table
                class="tablelist"
                :data="importData"
                :row-key="getRowKeys"
                :expand-row-keys="expandArr"
                @selection-change="handleSelectionChange"
                @row-click="annotate2"
                @expand-change="handleExpandChange"
                v-loading="listLoading"
              >
                <el-table-column prop="id" label="序号" width="50">
                  <template slot-scope="scope">{{ (curPage - 1) * pageSize + scope.$index + 1 }}</template>
                </el-table-column>
                <el-table-column prop="id" width="50" type="expand">
                  <template slot-scope="scope">
                    <div class="trainWrap">
                      <div class="train-l">
                        <p>词性类别:</p>
                        <el-tag
                          v-for="item in partOfSpeech"
                          :key="item.label"
                          :type="item.type"
                          effect="plain"
                        >{{ item.label }}
                        </el-tag>
                      </div>
                      <div class="train-r">
                        <div class="train-r-top">
                          <div class="train-r-top-l">
                            <section class="trainSentence variousInputBox">
                              <el-input
                                class="questionInput"
                                v-model.trim="curInputSentence"
                                ref="questionInput"
                                placeholder="请输入问题扩展的训练语句"
                                @keydown.enter.native="submitMsg"
                              ></el-input>
                              <div class="sentenceList">
                                <div
                                  class="sentence-item"
                                  v-for="(item,index) in sentenceList"
                                  :key="index"
                                  @mouseover="showCtrl(item)"
                                >
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
                                  <span class="wordWrap" v-show="!(index === curEditIndex)">
                                    {{item.serialNumber}}.<span
                                    class="word"
                                    v-for="(i,index2) in item.problemJson"
                                    :key="index2"
                                    :style="{color:partOfSpeechColor(i.flag)}"


                                  ><span :class="{'isEntity':i.isEntity == true && i.isDarkClor == true,
                                    'unProper':i.isEntity == true && i.isDarkClor == false,
                                    'canMark':i.flag!='x'}">{{i.word}}</span>

                                    </span>
                                  </span>
                                  <span class="ctrl_sentence" v-show="showCtrl_sentence">
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
                              </div>
                            </section>
                          </div>
                        </div>
                      </div>
                    </div>
                  </template>
                </el-table-column>
                <el-table-column prop="problem" label="问题" width="250">
                  <template slot-scope="scope">
                    <div class="accordion">
                      <!-- <i class="icon el-icon-circle-plus-outline"></i> -->
                      <div>{{ scope.row.problem }}</div>
                    </div>
                  </template>
                </el-table-column>
                <el-table-column prop="answer" label="答案">
                  <template slot-scope="scope">
                    {{ scope.row.dis_answer }}
                    <el-tag
                      size="mini"
                      plain
                      :type="scope.row.faq_type == 0?'success':''"
                    >{{ scope.row.faq_type | typeFilter}}
                    </el-tag>
                  </template>
                </el-table-column>
                <el-table-column prop="name" label="知识包名称" column-key="mark" width="140"></el-table-column>
                <el-table-column prop="creater" label="修改人" width="100">
                  <template slot-scope="scope">
                    <div class="accordion">
                      <!-- <i class="icon el-icon-circle-plus-outline"></i> -->
                      <div>{{ scope.row.creater }}</div>
                    </div>
                  </template>
                </el-table-column>
                <el-table-column prop="last_modification_time" label="修改时间" width="120">
                  <template slot-scope="scope">
                    <div class="dateandtime">
                      <!-- <i class="icon el-icon-circle-plus-outline"></i> -->
                      <div class="date">{{ scope.row.date }}</div>
                      <!-- <br> -->
                      <div class="time">{{ scope.row.time }}</div>
                    </div>
                  </template>
                </el-table-column>
                <el-table-column label="操作" width="50">
                  <template slot-scope="scope">
                    <el-dropdown trigger="click">
                      <span class="el-dropdown-link">
                        <i class="el-icon-more"></i>
                      </span>
                      <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item @click.native="handleEdit(scope.$index, scope.row)">编辑</el-dropdown-item>
                        <el-dropdown-item @click.native="exportFaq(scope.$index, scope.row)">导出</el-dropdown-item>
                        <el-dropdown-item @click.native="handleDelete(scope.$index, scope.row)">删除</el-dropdown-item>
                      </el-dropdown-menu>
                    </el-dropdown>
                  </template>
                </el-table-column>
              </el-table>
              <el-pagination
                class="mgtp20"
                layout="prev, pager, next"
                :page-size="pageSize"
                prev-text="上一页"
                next-text="下一页"
                :total="totalCount"
                @current-change="handleCurrentChange"
                :current-page.sync="curPage"
              ></el-pagination>
            </div>
          </el-col>
        </el-row>
      </div>
    </div>
    <el-dialog
      :visible.sync="dialogBuTagVisible"
      title="业务标签"
    >
      <div class="block">
        <el-cascader
          v-model="submitBuTagList"
          :options="buTagelist"
          :props="{ multiple: true, checkStrictly: true }"
          clearable></el-cascader>
      </div>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelBuTagDialog">取 消</el-button>
        <el-button type="primary" @click="saveBuTagList()">保存</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
  import {MessageBox, Message} from "element-ui";
  import echarts from "echarts";
  import {mapState, mapMutations} from "vuex";
  import {getFaqPackageSelect} from "@/api/generate/faqPackage";
  import {getQueryFaqPageList, deleteFaqById, ExportFaq, ImportFaqJson} from "@/api/generate/faq";
  import {getTagList} from "@/api/expand/businessTagManage";
  import {
    getTrainSetListByQustionId,
    addInterpretation,
    InterpretationAdd,
    addWordset,
    toggleSimpleEntity,
    addBusinessTag,
    deleteBusinessTag,
    deleteAutoTag,
    deleteProper
  } from "@/api/expand/faqTraining";
  import {
    addFaqTraining,
    updateFaqTraining,
    deleteFaqTrainingById
  } from "@/api/generate/faqTraining";
  // import { editFAQTrainingSet, deleteFAQTrainingSet } from "@/api/FAQTrainingSet";
  import {createTraining} from "@/api/utterance";
  import {setTimeout} from "timers";

  export default {
    name: "Qa",
    data() {
      return {
        curPage: 1,
        pageSize: 20,
        totalCount: 0,
        pageCount: 0,
        listLoading: true,
        expandArr: [],
        KNchildren: {},
        getRowKeys(row) {
          return row.id;
        },
        sentenceList: [],
        wordFreqList: [],
        properList: [],
        wordSetList: [],
        curInputSentence: "",
        curEditSentence: "",
        curEditIndex: "",
        partOfSpeech: [
          {label: "名词", value: "n", type: ""},
          {label: "动词", value: "v", type: "success"},
          {label: "形容词", value: "a", type: "danger"},
          {label: "代词", value: "r", type: "warning"},
          // { label: "非语素字", value: "x", type: "info" }
        ],
        properInput: "",
        keywordsInput: "",
        wordgatherInput: "",
        chart: null,
        className: "chart",
        id: "chart",
        width: "100%",
        height: "100%",
        showCtrl_sentence: false,
        appId: "3ddad951-93ff-4088-8b5f-f77edef13765",
        faqTaglist: [], //FAQ自动标签
        buTaglist: [], //业务标签
        inputVisible: false,
        inputValue: "",
        annotated: false,
        visibleMarkFilterBox: false,
        markFilterRange: [0, 1],
        dialogVisible2: true,
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
        intentOption: [],
        faq_data: {},
        selectValue: '',
        searchingRange: [0, 50],
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
        dialogBuTagVisible: false,
        loading: true,
        buTagelist: [],
        submitBuTagList: [],
        changeFlag: false,
        uploadUrl: ImportFaqJson,
        faq_package: '',
        headers: {
          Authorization: 'JWT ' + sessionStorage.getItem('access_token'),
        },
      };
    },
    computed: {
      ...mapState({
        curSampleItem: state => state.intentionSample.curSampleItem
      })
    },
    watch: {
      searchingRange(newValue, oldValue) {
        //   alert(1);
      },
      'KNchildren'(e) {
        if (this.changeFlag) {
          this.selectValue = '';
          this.faq_data = {};
          this.curPage = 1;
          this.fetchData();
        }
      },
      // 'faq_data'(e) {
      //   if (this.changeFlag) {
      //     this.selectValue = '';
      //     this.faq_data = {};
      //     this.curPage = 1;
      //     this.fetchData();
      //   }
      // },

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
      let paramss = this.$route.params;
      if (JSON.stringify(this.$route.params) == '{}') {
        this.fetchData();
      } else {
        let KN = JSON.parse(JSON.stringify(paramss.KNchildren));
        let faq_pkg = JSON.parse(JSON.stringify(paramss.faq_pkg));
        this.KNchildren.text = KN.text;
        this.KNchildren.value = KN.value;
        this.KNchildren.children = KN.children;
        this.faq_data.text = faq_pkg.text;
        this.faq_data.value = faq_pkg.value;
        console.debug(this.faq_data);
        // this.selectValue = this.faq_data.value;
        this.fetchData({'faq_package': this.selectValue});

      }
      // this.selectValue = '';
    },
    beforeDestroy() {
      if (!this.chart) {
        return;
      }
      this.chart.dispose();
      this.chart = null;
    },
    methods: {
      ...mapMutations(["setKnpOptions"]),
      handleCommand(command) {
        this.$message("click on item " + command);
      },

      async fetchData(params) {
        this.knpOptions = await getFaqPackageSelect();
        this.setKnpOptions(this.knpOptions);
        let data = {
          page: this.curPage,
          pageSize: this.pageSize,
        };
        //搜索条件
        if (this.searchword) {
          data = {
            // "Problem": 8,
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
        let listData = await getQueryFaqPageList(data);
        this.importData = listData.data.data;
        this.totalCount = listData.data.totalCount;
        this.listLoading = false;
      },
      //输入语句
      submitMsg(e) {
        let params = {
          faq: this.expandArr[0],
          problem: this.curInputSentence
        };
        if (params.problem == '') {
          return;
        }
        this.curInputSentence = '';
        addFaqTraining(params).then(resp => {
          if (resp.code == 400) {
            this.$notify.warning({
              title: resp.message,
              type: "danger",
              customClass: "qa-Notify",
              duration: 2000,
            });
          } else {
            this.$notify({
              title: resp.message,
              type: "success",
              customClass: "qa-Notify",
              duration: 2000,
            });
          }
          this.curInputSentence = "";
          this.getSentenceList(this.expandArr[0]);
        });
      },
      submitProper(event) {
        let params = {
          faq: this.expandArr[0],
          standard_name: this.properInput
        };
        if (params.standard_name == '') {
          return;
        }
        this.properInput = "";
        InterpretationAdd(params).then((resp) => {
          this.$notify({
            title: resp.message,
            type: "success",
            customClass: "qa-Notify",
            duration: 2000,
          });

          this.getSentenceList(this.expandArr[0]);
        });
        this.properInput = "";
        event.preventDefault(); // 阻止浏览器默认换行操作
        return false;
      },
      submitKeywords(event) {
        let params = {
          faq: this.expandArr[0],
          standard_name: this.keywordsInput
        };
        if (params.standard_name == '') {
          return;
        }
        this.keywordsInput = "";
        InterpretationAdd(params).then(() => {
          this.$notify({
            title: "成功",
            type: "success",
            customClass: "qa-Notify",
            duration: 2000
          });
          this.getSentenceList(this.expandArr[0]);
        });
        this.keywordsInput = "";
        event.preventDefault(); // 阻止浏览器默认换行操作
        return false;
      },
      submitWordgather() {
        let tmp = this.wordgatherInput;
        tmp = tmp.split(":");
        let wordSetItems = [];
        tmp[1].split("|").forEach(element => {
          wordSetItems.push({content: element});
        });

        let params = {
          id: this.expandArr[0],
          setName: tmp[0],
          wordSetItems: wordSetItems
        };
        if (params.wordSetItems.length < 1) {
          return;
        }
        addWordset(params).then(() => {
          this.$notify({
            title: "成功",
            type: "success",
            customClass: "qa-Notify",
            duration: 2000
          });
          this.getSentenceList(this.expandArr[0]);
        });
        this.wordgatherInput = "";
        event.preventDefault(); // 阻止浏览器默认换行操作
        return false;
      },
      async getSentenceList(id) {
        let listData = await getTrainSetListByQustionId(id);
        // this.properList = listData.data.interpretations;
        // this.wordSetList = listData.data.wordSetsOutDto;
        this.sentenceList = listData.data.sentence;
        // this.wordFreqList = listData.data.wordFrequencyCount;
        // this.faqTaglist = listData.data.automaticTagOutDto; //FAQ自动标签
        // this.buTaglist = listData.data.businessFaqTagOutDto; //业务标签
        // if (this.chart != null) {
        //   this.chart.dispose();
        // }
        // this.initChart();
      },
      //收缩展开时触发
      handleExpandChange(row, expandedRows) {
        var that = this;
        if (expandedRows.length) {
          that.curInputSentence = "";
          that.sentenceList = [];
          that.wordFreqList = [];
          that.expandArr = [];
          if (row) {
            that.expandArr.push(row.id);
            that.getSentenceList(row.id);
            this.$nextTick(() => {
              this.$refs.questionInput.focus();
            });
          }
        } else {
          that.expandArr = [];
        }
      },
      //词性
      partOfSpeechColor(partOfSpeech) {
        switch (partOfSpeech) {
          case "n":
            return "#409eff";
            break;
          case "a":
            return "#f56c6c";
            break;
          case "v":
            return "#67c23a";
            break;
          case "r":
            return "#e6a23c";
            break;
          case "x":
            return "#909399";
            break;
          default:
            break;
        }
      },
      showSentenceEdit(item, index, event) {
        this.curEditIndex = index;
        this.curEditSentence = item.problem;
        //$(".sentence-item:eq("+index+") .editInput")[0].focus();
        this.$nextTick(() => {
          let $dom = this.$refs[`input${index}`];
          $dom[0].focus();
          this.hideCtrl();
        });
      },
      deleteSentence(item, index, event) {
        deleteFaqTrainingById(item.id).then(() => {
          this.$notify({
            title: "成功",
            type: "success",
            customClass: "qa-Notify",
            duration: 2000
          });
          this.getSentenceList(this.expandArr[0]);
        });
      },
      blurInput() {
        this.curEditIndex = "";
        this.curEditSentence = "";
      },
      submitEditSentence(item, index, event) {
        if (this.curEditSentence == item.problem) {
          this.curEditIndex = "";
          this.curEditSentence = "";
          return;
        }
        let params = {
          knFaqId: this.expandArr[0],
          problem: this.curEditSentence,
          frId: item.id
        };
        updateFaqTraining(item.id, params).then(() => {
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
      editEntity(item, parent) {
        let params = {
          "faqTrainingId": parent.id,
          "startIndex": item.startIndex,
          "endIndex": item.endIndex,
          "entityId": item.entityId,
          "name": item.word
        };
        toggleSimpleEntity(params).then((resp) => {
          Message({
            message: "操作成功",
            type: "success",
            duration: 2 * 1000
          });
          this.getSentenceList(this.expandArr[0]);
        });
      },
      hideCtrl() {
        this.showCtrl_sentence = false;
      },
      showCtrl() {
        if (this.curEditIndex === "") {
          this.showCtrl_sentence = true;
        }
      },
      handleCloseBuTag(buTag) {
        deleteBusinessTag(buTag.id).then(() => {
          //this.buTaglist.splice(this.buTaglist.indexOf(buTag), 1);
          this.getSentenceList(this.expandArr[0]);
        });
      },
      handleCloseProper(properTag) {
        let params = {
          "faq": this.expandArr[0],
          "name": properTag,
          // id:
        };
        deleteProper(params).then((resp) => {
          this.getSentenceList(this.expandArr[0]);
          this.$notify({
            title: resp.message,
            type: "success",
            customClass: "qa-Notify",
            duration: 2000
          });
          // this.properList.splice(this.properList.indexOf(properTag), 1);

        });
        this.getTrainSetListByQustionId(params.faq);

      },
      handleCloseAutoTag(autoTag) {
        let tag_data = {
          "faq": autoTag.faqId,
          "tag_name": autoTag.tagName
        };
        deleteAutoTag(tag_data).then((resp) => {
          this.getSentenceList(this.expandArr[0]);
          //this.faqTaglist.splice(this.faqTaglist.indexOf(autoTag), 1);
        });
      },
      showInput() {
        this.dialogBuTagVisible = true;
        this.getTagList();
      },

      handleInputConfirm() {
        let inputValue = this.inputValue;
        if (inputValue) {
          this.dynamicTags.push(inputValue);
        }
        this.inputVisible = false;
        this.inputValue = "";
      },
      annotate2(row, column, event) {
        // console.warn(row);
        // console.warn(column);
        // console.warn(event);
      },
      annotate(item, index, text, scopeIndex) {
        if (index == this.key1.index) {
          this.key1 = {};
        } else if (this.key1 == "" && index != this.key1.index) {
          this.key1 = {
            name: item,
            index: index
          };
        } else {
          this.key2 = {
            name: item,
            index: index
          };
          this.annotation = {
            utteranceId: "", //语句
            entitiesId: "", //实体id
            text: text.substr(this.key1.index, this.key2.index), //实体文字
            startpos: this.key1.index,
            endpos: this.key2.index,
            entitiesTpye: ""
          };
          this.entityList.push(this.annotation);
          this.key1 = "";
          this.key2 = "";
        }
      },
      filterHandler(scope) {
        // console.warn("------------");
        // console.warn(scope);
        // console.warn(scope.row);
        // console.warn(scope.column);
        // const property = column["property"];
        // return row[property] === value;
      },
      submitForm(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            if (this.editType === "add") {
              this.ruleForm2.appId = this.appId;
              createTraining(this.ruleForm2).then(response => {
                // console.warn(response);
              });
              this.fetchData();
            }
            this.dialogVisible2 = false;
          } else {
            return false;
          }
        });
      },
      handleEdit(index, row) {
        // alert(1);
        //this.editType = "edit";
        // console.log(index, row);
        this.editIndex = index;
        this.dialogVisible2 = true;
        this.$router.push({
          name: "Newqa",
          params: {
            KNchildren: this.KNchildren,
            faq_pkg: this.faq_data,
            isEdit: true,
            step: 1,
            id: row.id,
            faq_type: row.faq_type,
            faq_package: row.faq_package,
            problem: row.problem,
            answer: row.answer,
            version: row.version
          }
        });
      },
      exportFaq(index, row) {
        ExportFaq({faq_id: row.id}).then(res => {
          if (res.code == 200) {
            window.location.href = process.env.VUE_APP_BASE_IMG_URL + '/download?data=' + res.data.file_path + '&name=' + res.data.name;
            this.$message({
              message: 'FAQ数据导出成功',
              type: "success",
              duration: 3000
            });

          } else {
            this.$message({
              message: 'FAQ数据导出失败',
              type: "warning",
              duration: 3000
            });
          }
        });
      },

      handleDelete(index, row) {
        // console.log(index, row);
        this.$confirm("确定删除此条问题").then(_ => {
          deleteFaqById(row.id).then((resp) => {
            this.$message({
              message: resp.message,
              type: "success",
              duration: 5000
            });
            this.fetchData();
          });
          //this.importData.splice(index, 1);
        });

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
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      handlePreview(file) {
        // console.log(file);
      },
      beforeAvatarUpload(file) {
        const isLt2M = file.size / 1024 / 1024 < 2;
        if (!isLt2M) {
          this.$message.error("上传头像图片大小不能超过 2MB!");
        }
        this.importData = file;
        this.example = {
          allAmount: file.length,
          test: 0,
          train: file.length
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
      seachKeyWords() {
        this.curPage = 1;
        this.fetchData();
      },
      selectOption(type) {
        this.changeFlag = type;
        this.curPage = 1;
        this.pageSize = 20;
        this.fetchData();
      },
      searchRange() {
        this.curPage = 1;
        this.fetchData();
        this.handleCurrentChange();
      },

      handleCurrentChange(val) {
        //分页
        this.curPage = val;
        this.$nextTick(() => {
          window.scrollTo(0, 0);
        });
        this.fetchData();
        // this.curPage = 1;
      },
      async getTagList() {
        let listData = await getTagList();
        this.buTagelist = listData.data;
        this.loading = false;
      },
      saveBuTagList() {
        let params = {
          "faqId": this.expandArr[0],
          "ids": this.submitBuTagList
        };
        addBusinessTag(params).then(() => {
          this.dialogBuTagVisible = false;
          Message({
            message: "新增成功",
            type: "success",
            duration: 2 * 1000
          });
        });
      },
      cancelBuTagDialog() {
        this.dialogBuTagVisible = false;
        this.submitBuTagList = [];
      },
      handleAvatarSuccess(res, file) {
        //获取上传图片地址
        if (res.code == 200) {
          this.$message({
            message: res.message,
            type: "success",
            duration: 3 * 1000
          });
        } else {
          this.$message({
            message: res.message,
            type: "warning",
            duration: 3 * 1000
          });
        }
      },

    }
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>
  @import "~@/assets/styles/slider.scss";
  @import "~@/assets/styles/qa.scss";

  .el-dropdown-link {
    cursor: pointer;
  }

  .page_qa {
    /deep/ .el-cascader {
      width: 100%;
      min-width: 50%;
    }
  }

  .date {
    display: block;
  }

  .time {
    display: block;
  }

  .faqTag {
    margin-top: 10px;
    margin-bottom: 10px;

    .el-tag + .el-tag {
      margin-left: 10px;
    }

    .el-tag + .button-new-tag {
      margin-left: 10px;

    }

    .button-new-tag {
      //height: 32px;
      // line-height: 30px;
      padding: 5px 10px;
    }

    .input-new-tag {
      width: 90px;

      padding-top: 0px;
      padding-bottom: 0px;
      margin-left: 10px;
      vertical-align: bottom;

      /deep/ .el-input__inner {
        height: 24px;
        line-height: 24px;
      }
    }
  }

  .ctrl_sentence {
    transition: 0.4s all 0s ease;
    display: none;
    margin-left: 20px;

    .sentence-icon {
      color: #999;
      margin-left: 10px;

      &:hover {
        cursor: pointer;
      }
    }
  }

  .accordion {
    display: flex;
    flex-flow: row nowrap;
    align-items: center;
  }

  .icon {
    color: #999;
    margin-right: 10px;
    cursor: pointer;
  }

  .trainWrap {
    min-height: 400px;
    background: #f8fdff;
    padding: 20px;
    box-sizing: border-box;
    display: flex;

    .train-l {
      width: 100px;

      .el-tag {
        display: block;
        width: 71px;
        text-align: center;
        margin-bottom: 10px;
        padding: 10px;
        box-sizing: border-box;
        height: auto;
        line-height: normal;
      }
    }

    .train-r {
      flex: auto;
      width: 100%;
    }

    .variousInputBox {
      height: 100%;
      padding: 16px;
      box-sizing: border-box;
      background: #fff;
      overflow: auto;
    }

    .train-r-top {
      height: 500px;
      margin-bottom: 20px;
      display: flex;

      .train-r-top-l {
        display: flex;
        flex-direction: column;
        flex: 3;

        .trainSentence {
          margin-right: 20px;
        }
      }

      .train-r-top-r {
        flex: 1;
        display: flex;
        flex-flow: column nowrap;

        .train-r-top-r-top,
        .train-r-top-r-bottom {
          display: flex;
          flex-flow: column nowrap;
          flex: auto;
          height: 50%;

          /deep/ .el-textarea__inner {
            height: 106px;
            border: none;
            font-family: serif;
          }
        }

        .train-r-top-r-bottom {
          display: none;
        }
      }
    }

    .train-r-bottom {
      height: 200px;
      background: #fff;
    }

    .questionInput {
      flex: none;
    }

    .sentenceList {
      flex: auto;
      overflow: auto;
    }

    .properInput,
    .wordSetInput {
      margin-top: 10px;
    }

    .addproperlist {
    }

    .questionInput /deep/ .el-input__inner,
    .properInput /deep/ .el-input__inner,
    .wordSetInput /deep/ .el-input__inner {
      border: none;
      border-bottom: 1px dashed #dcdfe6;
      border-radius: 0;
      padding-top: 0 !important;
      margin-top: -10px;
      padding-left: 8px;
    }

    .questionInput /deep/ .el-input__inner {
      padding-left: 0;
      margin-bottom: 10px;
    }

    .sentence-item {
      line-height: 2.4;
      transition: 0.4s all 0s ease;
      border-bottom: 1px dotted transparent;

      &:hover {
        background: #f5f7fa;
        border-bottom: 1px dotted #fafafa;

        .ctrl_sentence {
          display: inline !important;
        }
      }

      .wordWrap {
        //display: inline-block;
        .canMark {
          cursor: pointer;
        }

        .isEntity {
          cursor: pointer;
          background: #3192f9;
          padding: 4px 8px;
          color: #fff;
        }

        .isEntity.unProper {
          cursor: pointer;
          background: #3192f9;
          padding: 4px 8px;
          color: #fff;
        }

        .unProper {
          cursor: pointer;
          background: #00bcd4;
          padding: 4px 8px;
          color: #fff;
        }

        &:hover {
        }
      }

      // .wordWrap:hover {
      // }
      .word {
        position: relative;
        margin-right: 0.5em;

        &:after {
          content: "/";
          color: #999;
          margin-left: 0.5em;
        }
      }

      .word:nth-last-of-type(1) {
        &:after {
          content: "";
        }
      }
    }
  }
</style>
