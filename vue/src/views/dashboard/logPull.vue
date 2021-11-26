<template>
  <div class="app-container page_knpackage">
    <el-form ref="ruleForm" :rules="rules" :model="ruleForm" label-width="80px">
      <el-form-item prop="botId" label="Bot名">
        <el-select v-model="ruleForm.botId" placeholder="请选择Bot">
          <el-option
            v-for="item in list"
            :key="item.id"
            :value="item.id"
            :label="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item prop="datetime" label="时间区间">
        <el-date-picker
          v-model="ruleForm.datetime"
          type="daterange"
          range-separator="至"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
          format="yyyy-MM-dd"
          @change="selectDate"
          :picker-options="pickerOptions0"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')">下拉日志</el-button>
      </el-form-item>
    </el-form>
  </div>

</template>

<script>
  import {getBotCountList} from "@/api/expand/botManage";
  import {formatDate} from "@/utils/index";
  import {PullLog} from '@/api/report';

  export default {
    name: "logPull",
    data() {
      return {
        loading: true,
        ruleForm: {
          botId: null,
          datetime: null,
          start_datetime: null,
          end_datetime: null
        },
        list: [],
        rules: {
          datetime: [{required: true, trigger: "blur", message: "请选择时间"}],
          botId: [{required: true, trigger: "blur", message: "请选择BOT"}]
        },
        pickerOptions0: {
          disabledDate(time) {
            return time.getTime() > Date.now() - 8.64e7;
          }
        },
      };
    },
    created() {
      this.fetchData();
    },
    methods: {
      async fetchData() {
        let listData = await getBotCountList();
        console.log(listData);
        this.list = listData.data;
        this.loading = false;
      },
      selectDate(c) {
        this.ruleForm.datetime = c;
      },
      uuid() {
        var s = [];
        var hexDigits = "0123456789abcdef";
        for (var i = 0; i < 36; i++) {
          s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
        }
        s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
        s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the clock_seq_hi_and_reserved to 01
        s[8] = s[13] = s[18] = s[23] = "-";

        var uuid = s.join("");
        return uuid;
      },

      submitForm(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            const task_id = this.uuid();
            console.log('this.ruleForm', this.ruleForm);
            console.log('343345345354', this.uuid());
            this.ruleForm.start_datetime = formatDate(this.ruleForm.datetime[0], "yyyy-MM-dd 00:00:00");
            this.ruleForm.end_datetime = formatDate(this.ruleForm.datetime[1], "yyyy-MM-dd");
            this.ruleForm.task_id = task_id;
            PullLog(this.ruleForm).then(res => {
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


          }
        });

      },
      // selectOption() {
      //   console.log(this.ruleForm.botId);
      // },
    },

  };
</script>

<style scoped>

</style>
