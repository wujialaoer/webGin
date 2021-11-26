<template>
  <div class="app-container page_dashboard">
    <div class="pany">
      <div>
        <!-- 新建样本 -->
        <el-row :gutter="20">
          <el-col :span="24">
            <div class="tablepanel">
              <div class="oprate">
                <el-select
                  v-model="bot_manage"
                  @change="selectOption"
                  style="margin-left: 10px;"
                  placeholder="BOT选择"
                >
                  <el-option
                    v-for="item in botOption"
                    :key="item.value"
                    :label="item.text"
                    :value="item.value"
                  ></el-option>
                </el-select>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </div>

    <el-row :gutter="20">
      <el-col
        v-for="item in dataCountList"
        :key="item.type"
        :sm="24"
        :md="12"
        :lg="6"
        :xl="6"
      >
        <chart-card
          :total="item.total"
          :title="item.title"
          :percent="item.percent"
        >驱蚊器翁
        </chart-card
        >
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :sm="24" :md="12" :lg="12" :xl="12">
        <report-item
          reportType="chart"
          :chartOption="chart1"
          reportId="c1"
          :bot_manage="bot_manage"
          :filterSelect="type1"
          :showReportCtrl="true"
          @getTrendCallback="getTrendCallback"
        >
          <div slot="title">访问人次/问答次数 趋势</div>
        </report-item>
      </el-col>
      <el-col :sm="24" :md="12" :lg="12" :xl="12">
        <report-item
          reportType="chart"
          :chartOption="chart2"
          reportId="c2"
          :bot_manage="bot_manage"
          :filterSelect="type2"
          :showReportCtrl="true"
          @getPackAgeCallback="getPackAgeCallback"
        >
          <div slot="title">问答类型占比</div>
        </report-item>
      </el-col>
      <el-col :sm="24" :md="12" :lg="12" :xl="12">
        <report-item
          reportType="table1"
          :chartOption="table1"
          reportId="c3"
          :bot_manage="bot_manage"
          :filterSelect="type3"
          :showReportCtrl="true"
          :showExport="true"
          @getHotCallback="getHotCallback"
        >
          <div slot="title">热门问题排行榜</div>
        </report-item>
      </el-col>
      <!-- <el-col :sm="24" :md="12" :lg="12" :xl="12">
        <report-item
          reportType=""
          :chartOption="table1"
          reportId="c4"
          :showReportCtrl="true"
        >
          <div slot="title">热门问题排行榜</div>
        </report-item>
      </el-col> -->
    </el-row>
  </div>
</template>

<script>
  import {mapGetters} from "vuex";
  import {chart1, chart2, table1} from "./chartdata";
  import ChartCard from "./components/ChartCard";
  import ReportItem from "./components/ReportItem";
  import {getReportForm, getTrend, getPackAge, getHot} from "@/api/reportForm";
  import permission from '@/directive/permission/index'; // 权限判断指令
  import {getBotManageSelect} from "@/api/generate/botManage";


  export default {
    name: "Dashboard",
    directives: {permission},
    components: {
      ChartCard,
      ReportItem
    },
    data() {
      return {
        dataCountList: [
          // {
          //   total: "895",
          //   title: "累计访问人次",
          //   percent: "+4%"
          // },
          // {
          //   total: "895",
          //   title: "累计访问人次",
          //   percent: "+4%"
          // },
          // {
          //   total: "895",
          //   title: "累计访问人次",
          //   percent: "+4%"
          // },
          // {
          //   total: "895",
          //   title: "累计访问人次",
          //   percent: "+4%"
          // }
        ],
        chart1: chart1,
        chart2: chart2,
        table1: table1,
        className: "chart",
        id: "chart",
        width: "100%",
        height: "100%",
        KNchildren: [],
        bot_manage: '',
        botOption: [],
        type1: 2,   //1月   2
        type2: 2,
        type3: 2,
      };
    },
    computed: {
      ...mapGetters(["name", "roles"])
    },
    beforeCreate() {

    },
    created() {
      if (this.roles.length == 1 && this.roles[0] == 'USER') {
        this.to401();
      }
      this.getBotManage();
    },
    mounted() {
    },
    beforeDestroy() {
      if (!this.chart) {
        return;
      }
      this.chart.dispose();
      this.chart = null;
    },
    watch: {
      bot_manage(newValue, oldValue) {
        this.changeBotManage();
      },
    },
    methods: {
      to401() {
        this.$router.push({
          path: '/401'
        });
      },
      getTrendCallback(type) {
        this.type1 = type;
        this.getTrend(this.bot_manage, type);
      },
      getPackAgeCallback(type) {
        this.type2 = type;
        this.getPackAge(this.bot_manage, type);
      },
      getHotCallback(type) {
        this.type3 = type;
        this.getHot(this.bot_manage, type);
      },
      async getTrend(bot_manage, type) {
        let params = {bot_manage: bot_manage, type: type};
        let resp = await getTrend(params);
        this.chart1.xAxis[0].data = resp.data.xData;
        this.chart1.series[0].data = resp.data.yNmberData;
        this.chart1.series[1].data = resp.data.ySecondData;
      },
      async getPackAge(bot_manage, type) {
        let params = {bot_manage: bot_manage, type: type};
        let resp = await getPackAge(params);
        this.chart2.series[0].data = resp.data.value;
        this.chart2.legend.data = resp.data.name;
      },
      async getReportForm(bot_manage) {
        let resp = await getReportForm({bot_manage: this.bot_manage});
        this.dataCountList = resp.data.value;
      },
      async getHot(bot_manage, type) {
        let params = {bot_manage: bot_manage, type: type};
        let resp = await getHot(params);
        this.table1 = resp.data.value;
      },
      async getBotManage() {
        var result = await getBotManageSelect();
        this.botOption = result.data;
        this.bot_manage = this.botOption[0].value;
      },
      selectOption(result) {
        console.log(result);
      },
      changeBotManage() {
        this.type1 = 2;
        this.type2 = 2;
        this.type3 = 2;
        this.getReportForm(this.bot_manage);
        this.getTrend(this.bot_manage, this.type1);
        this.getPackAge(this.bot_manage, this.type2);
        this.getHot(this.bot_manage, this.type3);
      },
    }
  };
</script>

<style lang="scss" scoped>
  .dashboard {
    &-container {
      position: relative;
      width: 100%;
      height: calc(100vh);
    }

    &-text {
      font-size: 30px;
      line-height: 46px;
    }
  }

  .chartList {
    // margin-top:20px;
  }
</style>
