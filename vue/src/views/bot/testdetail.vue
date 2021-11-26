<template>
  <div class="app-container page_testdetail">
    <div class="pany">
      <el-row type="flex" class="row-bg" justify="space-between">
        <el-col :span="16">
          <el-select
            v-model="Botchildren"
            @change="selectOption"
            style="margin-left: 10px;"
            placeholder="BOT选择"
          >
            <el-option
              v-for="item in knpOptions.data"
              :key="item.id"
              :value="item.id"
              :label="item.name"
              @change="selectOption"
            ></el-option>
          </el-select>

          <el-select
            clearable
            v-model="problem_type"
            @change="selectOption"
            style="margin-left: 10px;"
            placeholder="测试类型选择"
          >
            <el-option
              v-for="item in problem_types"
              :key="item.label"
              :value="item.label"
              :label="item.text"
              @change="selectOption"
            ></el-option>
          </el-select>
          <el-select
            clearable
            v-model="test_result"
            @change="selectOption"
            style="margin-left: 10px;"
            placeholder="测试结果选择"
          >
            <el-option
              v-for="item in test_results"
              :key="item.label"
              :value="item.label"
              :label="item.text"
              @change="selectOption"
            ></el-option>
          </el-select>
        </el-col>

        <el-col :span="6">
          <el-input placeholder="请输入关键词" class="searchword" v-model="searchword" @keyup.enter.native="seachKeyWords">
            <i slot="suffix" class="el-input__icon el-icon-search" @click="seachKeyWords"/>
          </el-input>
        </el-col>
      </el-row>
      <el-table
        v-loading="listLoading"
        element-loading-text="Loading"
        :data="list"
        class="tablelist"
        fit
        highlight-current-row
        @selection-change="handleSelectionChange"
      >
        <el-table-column
          prop="id"
          label="序号"
          width="50"
        >
          <template slot-scope="scope">{{ (curPage - 1) * pageSize + scope.$index + 1 }}</template>
        </el-table-column>
        <el-table-column
          prop="sentence"
          label="样本"
        >
        </el-table-column>
        <el-table-column
          prop="actual_answer"
          label="实际答案"
        >
          <template slot-scope="scope">
            <el-popover
              placement="top-start"
              title="答案预览"
              width="200"
              trigger="click"
              popper-class="testDetail-pop"
            >
              <div v-html="scope.row.actual_answer"></div>
              <span slot="reference">{{scope.row.dis_actual_answer}}</span>
            </el-popover>
            <el-tooltip placement="bottom">
            </el-tooltip>
          </template>
        </el-table-column>
        <el-table-column
          prop="actual_intention"
          label="实际意图"
        >
        </el-table-column>
        <el-table-column
          prop="expect_intention"
          label="预期意图"
        >

        </el-table-column>
        <el-table-column
          prop="problem_type"
          label="测试类型"
          width="80"
        >
          <template slot-scope="scope">
            <el-tag size="small">{{scope.row.problem_type|testTypeFilter}}</el-tag>
          </template>
        </el-table-column>
        <el-table-column
          prop="actual_score"
          label="评分"
          width="50"
        >
          <template slot-scope="scope" v-if="scope.row.actual_score!=null">
            {{scope.row.actual_score.toFixed(2)}}
          </template>
        </el-table-column>
        <el-table-column
          prop="test_result"
          label="测试结果"
          width="80"
        >
          <template slot-scope="scope">
            <el-tag size="small" v-if="scope.row.test_result == 0" type="success">成功</el-tag>
            <el-tag size="small" v-if="scope.row.test_result == 1" type="danger">失败</el-tag>
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
      ></el-pagination>
    </div>
  </div>
</template>

<script>
  import {mapState} from "vuex";
  import {getTestDetailList} from "@/api/expand/testDetail";
  import {getBotCountList} from "@/api/expand/botManage";


  export default {
    name: "TestResult",
    data() {
      return {
        listLoading: false,
        curPage: 1,
        pageSize: 20,
        totalCount: 0,
        pageCount: 0,
        selectValue: "",
        searchword: "",
        list: [],
        filterData: [], //原始数组备份 筛选用
        multipleSelection: [],
        faq_data: {},
        Botchildren: '',
        problem_type: '',
        test_result: '',
        problem_types: [{
          label: 1,
          text: '原始问题'
        },
          {
            label: 2,
            text: '测试语句'
          },
          {
            label: 3,
            text: '训练语句'
          }],
        test_results: [{
          label: 0,
          text: '成功'
        },
          {
            label: 1,
            text: '失败'
          },
        ],
        knpOptions: [],
      };
    },
    computed: {
      ...mapState({
        curSampleItem: state => state.intentionSample.curSampleItem
      }),
    },
    watch: {
      searchingRange(newValue, oldValue) {
        //   alert(1);
      },
      // 'Botchildren'(e) {
      //   if (this.changeFlag) {
      //     this.selectValue = '';
      //     this.faq_data = {};
      //     this.curPage = 1;
      //     this.fetchData();
      //   }
      // },

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
      testTypeFilter(status) {
        if (status == 1) {
          return "原始问题";
        } else if (status == 2) {
          return "测试语句";
        } else if (status == 3) {
          return "训练语句";
        }
      },

    },
    methods: {
      async fetchData() {
        this.knpOptions = await getBotCountList();
        if (JSON.stringify(this.$route.params) !== '{}') {
          this.Botchildren = this.$route.params.bot_manage;
          let data = {
            page: this.curPage,
            pageSize: this.pageSize,
            bot_manage: this.$route.params.bot_manage,
            problem_type: this.problem_type,
            test_result: this.test_result,

          };
          if (this.searchword) {
            data = {
              // "Problem": 8,
              "search": this.searchword,
              ...data
            };
          }
          let listData = await getTestDetailList(data);
          this.totalCount = listData.data.totalCount;
          this.list = listData.data.data;
          this.listLoading = false;
        } else {
          let data = {
            page: this.curPage,
            pageSize: this.pageSize,
            problem_type: this.problem_type,
            test_result: this.test_result,
          };
          this.selectValue = this.Botchildren;
          console.log(this.searchword);
          if (this.searchword) {
            data = {
              "search": this.searchword,
              ...data
            };
          } else if (this.selectValue) {
            data = {
              bot_manage: this.selectValue,
              ...data
            };
          } else if (this.searchword && this.selectValue) {
            data = {
              bot_manage: this.selectValue,
              "search": this.searchword,
              ...data
            };
          }
          console.log(2, data);

          let listData = await getTestDetailList(data);
          this.totalCount = listData.data.totalCount;
          this.list = listData.data.data;
          this.listLoading = false;

        }
        // this.listLoading = true;

      },
      seachKeyWords() {
        this.curPage = 1;
        this.fetchData();
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
      handleSelectionChange(val) {
        this.multipleSelection = val;
      },
      handleCurrentChange(val) {
        //分页
        this.curPage = val;
        this.fetchData();
      },
      selectOption(type) {
        this.changeFlag = type;
        this.curPage = 1;
        this.pageSize = 20;
        this.fetchData();
      },

    }
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>
  .page_testdetail {
    /deep/ .el-popover__reference {
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
    }
  }

</style>
