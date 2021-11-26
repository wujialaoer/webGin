<template>
    <div class="app-container page_qa">
        <div class="pany">
  <div>
    <!-- 新建样本 -->
    <el-row :gutter="20">
      <el-col :span="24">
        <div class="tablepanel" v-show="!showHitlist">
          <div class="oprate">
            <div class="sliderBox fl">
                <div class="text">命中数量</div>
                <el-slider
                class="slider"
                    v-model="searchingRange"
                    range
                    :show-stops="false"
                    @change="searchRange"
                    :max="50">
                </el-slider>
            </div>
            <el-input placeholder="请输入关键词" class="searchword" v-model="searchword">
              <i slot="suffix" class="el-input__icon el-icon-search" @click="seachKeyWords"></i>
            </el-input>
          </div>
          <el-table
            v-loading="listLoading"
            :data="list"
            element-loading-text="Loading"
            fit
            highlight-current-row
            class="tablelist"
            @selection-change="handleSelectionChange"
            @row-click="annotate2"
          >
            <el-table-column
              prop="wordSetId"
              label="序号"
              width="100"
            >
              <template slot-scope="scope">

                {{ (curPage - 1) * pageSize + scope.$index + 1 }}
              </template>
            </el-table-column>
            <el-table-column
              prop="entity"
              label="引用词"
            >
            </el-table-column>
            <el-table-column
              prop="count"
              width="100"
              label="命中语句"
            >
            <template slot-scope="scope">
                <span class="hitCount" @click="toHitPage(scope.row)">{{scope.row.count}}</span>
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
        <div class="hitlistTableBox" v-show="showHitlist">
        <el-table
            v-loading="listLoading"
            :data="hitList"
            element-loading-text="Loading"
            fit
            highlight-current-row
            class="tablelist"
            @selection-change="handleSelectionChange"
            @row-click="annotate2"
          >
            <el-table-column
              prop="faqId"
              label="序号"
              width="100"
            >
              <template slot-scope="scope">
                {{ (curPage - 1) * pageSize + scope.$index + 1}}
              </template>
            </el-table-column>
            <el-table-column
              prop="problem"
              label="训练语句"
            >
             <template slot-scope="scope">
                <span :alt="scope.row.entity">
                    <span v-for="(i,index) in scope.row.problem" :key="index" :class="{'hitCount':index>=scope.row.startindex && index <=scope.row.endindex}">{{i}}</span>
                </span>
              </template>
            </el-table-column>
            <el-table-column
              prop="packageName"
              width="100"
              label="知识包"
            >
            </el-table-column>
          </el-table>
          <el-button-group class="mgtp20">
            <el-button plain @click="hideHitlist">返回</el-button>
          </el-button-group>
        </div>
      </el-col>
    </el-row>
  </div>
        </div>
    </div>
</template>

<script>
import { mapState } from "vuex";
import { getHitById, getCitationAnalysis } from "@/api/expand/citationAnalysis";

export default {
  name: "quoteanlay",
  data() {
    return {
        isEdit:false,
        curPage:1,
        pageSize:20,
        totalCount:0,
        pageCount:0,
      searchword: "",
      listLoading: true,
      list: [],
      hitList:[],
      searchingRange:[0,50],
      showHitlist:false,
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
    this.fetchData();
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
      annotate2(row, column, event){
          console.warn(row);
          console.warn(column);
          console.warn(event);
      },
    async fetchData() {
        this.listLoading = true;
        let data ={
            page:this.curPage,
            pageSize:this.pageSize,
            Junction:"and"
        }
        if(this.searchword){
            data = {
                "Entity.Operator": 8,
                "Entity.Value": this.searchword,
                ...data
            }
        }
        // 滑块筛选
        if(this.searchingRange[0] == '0' && this.searchingRange[1] == '50'){
        }else{
            data = {
                StartCount: this.searchingRange[0],
                EndCount: this.searchingRange[1],
                ...data
            };
        }
      let tmp = await getCitationAnalysis(data);
      this.totalCount = tmp.data.totalCount;
      this.list = tmp.data.data;
      this.listLoading = false;
    },
    seachKeyWords() {
        this.curPage = 1;
        this.fetchData();
    },
    searchRange(){
        this.curPage = 1;
        this.fetchData();
    },
    toHitPage(item){
       this.showHitlist = true;
       getHitById(item.wordSetId).then((resp)=>{
           this.hitList = resp.data;
       });
    },
    hideHitlist(){
        this.showHitlist = false;
    },
    handleSelectionChange(val) {
      this.multipleSelection = val;
    },
    handleCurrentChange(val) {
      //分页
      this.curPage = val;
      this.fetchData();
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>

.hitCount{
    color:#005b8b;
    cursor: pointer;
    text-decoration: underline;
    text-align: center;
    font-style: italic;
}
.oprate{
    overflow:hidden;
}

.sliderBox{
    width:300px;
    float:left;
    margin-right:20px;
    color:#666;
    font-size:15px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    .text{
        float: left;
    }
    .slider{
        float: left;
        width:200px;
    }
}
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
.page_qa {
    .tablepanel .searchword{
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
