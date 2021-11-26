<template>
  <div class="reportItemBox ele-card-body">
    <div class="chart-card-header">
      <div class="meta">
        <span class="chart-card-title">
          <slot name="title"></slot>
        </span>
        <span v-if="showExport" class="tool-export" @click="exportData">导出数据</span>
      </div>
      <el-select
        v-if="showFilter"
        class="tool-filter"
        size="mini"
        v-model="curFilterSelect"
        placeholder="请选择"
        @change="selectTrend"
      >
        <el-option
          v-for="item in filterOptions"
          :key="item.value"
          :label="item.label"
          :value="item.value"
        >
        </el-option>
      </el-select>
    </div>
    <div class="chart-card-content" :class="{ hasFilter: showFilter == true }">
      <div v-if="reportType == 'chart'" class="chartType" :id="reportId"></div>
      <div
        v-if="reportType == 'table1'"
        class="tableType"
        :id="reportId"
        :style="{ height: height, width: width }"
      >
        <el-table :show-header="false" :data="chartOption" style="width: 100%">
          <el-table-column prop="id" label="序号" width="100">
            <template slot-scope="scope">
              {{ scope.$index + 1 }}
            </template>
          </el-table-column>
          <el-table-column prop="question" label="问题"></el-table-column>
          <el-table-column prop="count" label="次数" width="100">
            <template slot-scope="scope"> {{ scope.row.count }}/次</template>
          </el-table-column>
        </el-table>
      </div>
      <div v-if="!reportType" class="tableType errData" :id="reportId">
        <div class="errDataText">
          暂无数据
        </div>
      </div>
    </div>
    <div class="chart-card-footer"></div>
  </div>
</template>

<script>
  import echarts from "echarts";
  import resize from "@/utils/mixins/resize";
  import {PullFaqLog} from '@/api/report';

  export default {
    mixins: [resize],
    name: "ReportItem",
    props: {
      chartOption: {
        type: [Object, Array]
      },
      reportType: {
        type: String,
        required: true,
        default: null
      },
      showReportCtrl: {
        type: Boolean,
        default: false
      },
      reportId: {
        type: String,
        default: ""
      },
      showExport: {
        type: Boolean,
        default: false
      },
      showFilter: {
        type: Boolean,
        default: true
      },
      filterOptions: {
        type: Array,
        default() {
          return [
            {
              value: 2,
              label: "最近七天"
            },
            {
              value: 1,
              label: "近一个月"
            }
          ];
        }
      },
      filterSelect: {
        type: Number,
        default: 2,
      },
      bot_manage: {
        type: String,
        required: true,
        default: null
      }
    },
    data() {
      return {
        chart: null,
        width: "100%",
        height: "100%",
        curFilterSelect: 2
      };
    },
    watch: {
      filterSelect(newValue) {
        this.curFilterSelect = newValue;
      },
      chartOption: {
        //监听的对象
        deep: true, //深度监听设置为 true
        handler: function (newV, oldV) {
          if (this.reportType == 'table1') {
            //this.initTable();
          } else {
            this.chart = echarts.init(document.getElementById(this.reportId));
            this.chart.setOption(this.chartOption);
          }

        }
      }
    },
    mounted() {
      if (this.reportType == "chart") {
        this.initReport();
      }
    },
    beforeDestroy() {
      if (!this.chart) {
        return;
      }
      this.chart.dispose();
      this.chart = null;
    },
    methods: {
      initReport() {
        this.chart = echarts.init(document.getElementById(this.reportId));
        this.chart.setOption(this.chartOption);
      },
      selectTrend() {
        if (this.reportId == "c1") {
          this.$emit("getTrendCallback", this.curFilterSelect);
        } else if (this.reportId == "c2") {
          this.$emit("getPackAgeCallback", this.curFilterSelect);
        } else if (this.reportId == "c3") {
          this.$emit("getHotCallback", this.curFilterSelect);
        }
      },
      exportData() {
        console.log(this.bot_manage);
        PullFaqLog({bot_manage: this.bot_manage, type: this.filterSelect}).then(res => {
          if (res.code == 200) {
            window.location.href = process.env.VUE_APP_BASE_IMG_URL + 'download?data=' + res.data.file_path + '&name=' + res.data.name;
            this.$message({
              message: '导出数据成功',
              type: "success",
              duration: 3000
            });

          } else {
            this.$message({
              message: '导出数据失败',
              type: "success",
              duration: 3000
            });
          }
        });
        console.log(typeof this.filterSelect);
      },
    }
  };
</script>

<style lang="scss" scoped>
  .reportItemBox {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    color: #000000a6;
    font-size: 14px;
    font-variant: tabular-nums;
    line-height: 1.5;
    list-style: none;
    -webkit-font-feature-settings: "tnum";
    font-feature-settings: "tnum";
    position: relative;
    background: #fff;
    border-radius: 2px;
    -webkit-transition: all 0.3s;
    transition: all 0.3s;
  }

  .ele-card-body {
    padding: 20px 24px 8px;
    margin-bottom: 20px;
  }

  .chart-card-header {
    position: relative;
    width: 100%;

    .meta {
      position: relative;
      overflow: hidden;
      width: 100%;
      color: rgba(0, 0, 0, 0.75);
      font-size: 15px;
      line-height: 22px;
      margin-bottom: 20px;
    }
  }

  .chart-card-action {
    cursor: pointer;
    position: absolute;
    top: 0;
    right: 0;
  }

  .chart-card-footer {
    // border-top: 1px solid #e8e8e8;
    padding-top: 9px;
    margin-top: 8px;

    > * {
      position: relative;
    }

    .field {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      margin: 0;
      margin-bottom: 10px;
      color: #4fb047;
    }
  }

  .chart-card-content {
    margin-bottom: 12px;
    position: relative;
    max-height: 400px;
    min-height: 250px;
    width: 100%;

    .content-fix {
      position: absolute;
      left: 0;
      bottom: 0;
      width: 100%;
    }
  }

  .total {
    overflow: hidden;
    text-overflow: ellipsis;
    word-break: break-all;
    white-space: nowrap;
    color: #000;
    margin-top: 4px;
    margin-bottom: 0;
    font-size: 30px;
    line-height: 38px;
    height: 38px;
  }

  .chartType {
    height: 400px;
  }

  .errData {
    height: 100%;

    .errDataText {
      position: absolute;
      top: 40%;
      left: 50%;
      transform: translate3d(-50%, -50%, 0);
    }
  }

  .chart-card-title {
    float: left;
  }

  .tool-filter {
    position: absolute;
    top: 40px;
  }

  .tool-export {
    float: right;
    font-size: 14px;
    color: #3c85d2;
    cursor: pointer;
  }

  .hasFilter {
    margin-top: 60px;
  }
</style>
