<template>
  <div class="app-container page_testresult">
    <div class="pany">
      <!-- 新建样本 -->
      <el-row
        v-if="false"
        :gutter="20"
        class="row-bg" justify="space-between"
      >
        <el-col :span="12">
          <div class="tablepanel">
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
        v-loading="listLoading"
        element-loading-text="Loading"
        :data="list"
        class="tablelist"
        fit
        highlight-current-row
        @selection-change="handleSelectionChange"
      >
        <!-- <el-table-column
          type="selection"
          width="55"
        >
        </el-table-column> -->
        <!-- 删除功能暂时未定 -->
        <el-table-column
          prop="id"
          label="序号"
          width="50"
        >
          <template slot-scope="scope">{{ (curPage - 1) * pageSize + scope.$index + 1 }}</template>
        </el-table-column>
        <el-table-column
          prop="bot_name"
          label="bot名称"
          width="130"
        >
        </el-table-column>
        <el-table-column
          prop="last_modification_time"
          width="160"
          label="时间"
        >
        </el-table-column>
        <el-table-column
          width="90"
          prop="creater"
          label="创建人"
        >
        </el-table-column>
        <el-table-column
          prop="test_accuracy"
          label="原始问题准确率"
          align="center"
        >

        </el-table-column>
        <el-table-column
          align="center"
          prop="training_set_accuracy"
          label="训练集准确率"
        >
        </el-table-column>
        <el-table-column
          prop="test_set_accuracy"
          label="测试集准确率"
        >
        </el-table-column>
        <el-table-column
          prop="overall_accuracy"
          label="总体准确率"
        >
        </el-table-column>
        <!-- <el-table-column
          prop="type"
          label="状态"
          width="100"
        >
        </el-table-column> -->
<el-table-column
          prop="type"
          label="操作"
          width="150"
        >
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              @click="handleLookDetail(scope.row.bot_manage)"
            >查看详情
            </el-button>
            <el-button
              size="mini"
              type="text"
              @click="handleExport(scope.row)"
            >导出
            </el-button>
          </template>

        </el-table-column>        <!-- <el-table-column label="操作">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button>
          </template>
        </el-table-column> -->
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
  import {getTestResultList,BatchPullLog} from "@/api/expand/testResult";

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
      };
    },
    computed: {
      ...mapState({
        //   curSampleItem: state => state.intentionSample.curSampleItem
      }),
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
      async fetchData() {
        this.listLoading = true;
        let listData = await getTestResultList();
        this.totalCount = listData.data.totalCount;
        this.list = listData.data.data;
        this.listLoading = false;

      },
      seachKeyWords() {
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
      handleLookDetail(bot_manage) {
        console.log('row', bot_manage);
        this.$router.push({
          name: "TestDetail", params: {bot_manage: bot_manage}
        });
      },
      handleExport(item) {
        console.log(item.id);
        console.log(item.task_id);
        BatchPullLog({test_id: item.id, task_id: item.task_id}).then(res => {
          if (res.code == 200) {
            window.location.href = process.env.VUE_APP_BASE_IMG_URL + res.data.file_path;
            this.$message({
              message: res.message,
              type: "success",
              duration: 3000
            });

          } else {
            this.$message({
              message: res.message,
              type: "warning",
              duration: 3000
            });
          }
        });

      },
    }
  };
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>

</style>
