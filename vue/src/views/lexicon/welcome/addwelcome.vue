<template>
  <div class="app-container page_addcharacter" v-if="$route.name == 'Addwelcome'">
    <div class="qaWrap">
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <el-form-item label="个性" prop="name">
          <el-input type="txtName" v-model="ruleForm.name" disabled/>
          <!-- <el-input type="txtId" v-model="ruleForm.welcomingId"></el-input> -->
        </el-form-item>

        <el-form-item label="选择" prop="chara" class="displayflex">
          <el-switch
            v-model="state"
            active-value="0"
            inactive-value="1"
            @change="changeStatus($event,state)"
            style="display: block;margin-left:-100px;"
            active-color="#13ce66"
            inactive-color="#ff4949"
            active-text="按时间"
            inactive-text="按日期"
          />
        </el-form-item>

        <el-form-item label prop="time" v-if="showTime">
          <el-time-picker
            is-range
            v-model="ruleForm.time"
            range-separator="至"
            start-placeholder="开始时间"
            end-placeholder="结束时间"
            placeholder="选择时间范围"
            @change="selectTime"
          />
        </el-form-item>

        <el-form-item label prop="datetime" v-if="showDate">
          <el-date-picker
            v-model="ruleForm.datetime"
            type="daterange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            format="yyyy-MM-dd"
            @change="selectDate"
          />
        </el-form-item>

        <el-form-item label="语句" prop="sentence">
          <el-input type="textarea" v-model="ruleForm.sentence" placeholder="活泼" :rows="4"/>
        </el-form-item>
        <el-form-item>
          <el-button @click="resetForm(0)">取消</el-button>
          <el-button type="primary" @click="submitForm('ruleForm')">保存</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
  import {addWelcoming} from "@/api/generate/welcoming";
  import {updateWelcoming} from "@/api/expand/welcoming";
  import {mapState} from "vuex";
  import {formatDate} from "@/utils/index";

  export default {
    name: "addWelcome",
    components: {
      // 注册所有组件
    },
    data() {
      return {
        isEdit: "",
        state: "0",
        tabPosition: "left",
        time_change: false,
        date_change: false,
        step: 0,
        showTime: true,
        showDate: false,
        curEditId: "",
        id: '',
        end_date: '',
        start_date: '',
        ruleForm: {
          time: "",
          datetime: "",
          personality: "",
          name: "",
          sentence: "",
          start_time: null,
          end_time: null,
          start_datetime: null,
          end_datetime: null
        },
        rules: {
          sentence: [{required: true, message: "请输入语句", trigger: "change"}],
          time: [{required: true, message: "请输入时间", trigger: "change"}],
          datetime: [{required: true, message: "请输入日期", trigger: "change"}]
        },
        options: [],
        personality: "",
      };
    },
    watch: {
      'ruleForm.time'() {
        if (this.time_change) {
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
    created() {
      if (!this.$route.params.name) {
        this.$router.push({
          name: "Welcome",
        });
      }
      if (this.$route.params.isEdit == true) {
        let params = this.$route.params;
        this.version = params.version;
        this.isEdit = params.isEdit;
        this.curEditId = params.id;
        this.ruleForm.sentence = params.sentence;
        this.ruleForm.start_time = params.start_time;
        this.ruleForm.end_time = params.end_time;
        this.ruleForm.start_datetime = params.start_datetime;
        this.ruleForm.end_datetime = params.end_datetime;
      }
    },
    mounted() {
      let params = this.$route.params;
      this.personality = params.personality;
      this.ruleForm.personality = params.personality;
      this.name = this.ruleForm.name = params.name;
    },
    methods: {
      changeStatus: function ($event, state) {
        if (state == 0) {
          this.showTime = true;
          this.showDate = false;
          this.ruleForm.datetime = "";
        } else {
          this.showTime = false;
          this.showDate = true;
          this.ruleForm.time = "";
        }
      },
      selectTime(c) {
        console.log(c);
        if (!c) {
          return;
        }
        this.ruleForm.time = c;
        console.log(formatDate(this.ruleForm.time[0], "hh:mm:ss"));
        console.log(formatDate(this.ruleForm.time[1], "hh:mm:ss"));
      },
      selectDate(c) {
        this.ruleForm.datetime = c;
        console.log('datetime', this.ruleForm.datetime);
        console.log(formatDate(this.ruleForm.datetime[0], "yyyy-MM-dd"));
        console.log(formatDate(this.ruleForm.datetime[1], "yyyy-MM-dd"));
      },
      submitForm(formName) {
        if (this.ruleForm.time.length == 2) {
          this.ruleForm.start_time = formatDate(this.ruleForm.time[0], "hh:mm:ss");
          this.ruleForm.end_time = formatDate(this.ruleForm.time[1], "hh:mm:ss");
          this.ruleForm.start_datetime = null;
          this.ruleForm.end_datetime = null;
        }
        if (this.ruleForm.datetime.length == 2) {
          this.ruleForm.start_datetime = formatDate(
            this.ruleForm.datetime[0],
            "yyyy-MM-dd 00:00:00"
          );
          this.ruleForm.end_datetime = formatDate(this.ruleForm.datetime[1], "yyyy-MM-dd 00:00:00");
          this.ruleForm.start_time = null;
          this.ruleForm.end_time = null;
        }
        if (this.ruleForm.end_datetime != null) {
          this.end_date = this.ruleForm.end_datetime;
          this.start_date = this.ruleForm.start_datetime;
        } else {
          this.end_date = null;
          this.start_date = null;

        }

        this.$refs[formName].validate(valid => {
          if (valid) {
            if (this.isEdit == true) {
              let params = {
                ...this.ruleForm,
                end_datetime: this.end_date,
                start_datetime: this.start_date,
                version: this.version,
              };
              updateWelcoming(this.curEditId, params).then(resp => {
                this.$refs[formName].resetFields();
                this.$message({
                  message: "修改成功",
                  type: "success"
                });
                this.$router.push({
                  name: "Welcomelist",
                  params: {personality: this.personality, name: this.name}
                });
              });
            } else {
              let params = {
                ...this.ruleForm,
              };
              addWelcoming(params).then(resp => {
                console.warn(resp);
                this.$message({
                  message: "恭喜你，添加成功",
                  type: "success"
                });
                this.$refs[formName].resetFields();
                this.$router.push({
                  name: "WelcomeDetail",
                  params: {personality: this.personality, name: this.name}
                });
              });
            }
          } else {
            return false;
          }
        });
      },
      resetForm(step) {
        this.$router.go(step);
      }
    }
  };
</script>

<style lang="scss" scoped>
  .page_addcharacter {
    .el-steps--simple {
      padding: 13px 18%;
    }

    .el-select {
      width: 100%;
    }

    .qaWrap {
      background: #fff;
      padding: 40px 30px;
    }

    .demo-ruleForm {
      width: 40%;
      min-width: 320px;
    }

    .el-textarea__inner {
      min-height: 200px;
    }

    .displayflex {
      display: flex;
      align-items: center;
    }

    /deep/ .el-date-editor .el-range-separator {
      width: 7%;
    }
  }
</style>
