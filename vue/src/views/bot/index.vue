<template>
  <div class="app-container page_bot">
    <div class="tipsBox">
      <p class="title">重要提示：</p>
      <p class="text">
        1. 当您创建完成一个新的Bot，目前系统可以自动Assign一个付费的Key。若发现所有的问题都无法被正确预测，可能是预测失败导致。请联系您的系统管理员帮您检查相应的APP是否已经被成功Assign。
      </p>
      <p class="text">2. 当相应的Bot上出现小红点符号，意味着Bot可能需要重新训练发布才可以应用到最新的知识修改。否则，您通过批量测试、预览和会话所体验的会话将不是最新的知识。</p>
    </div>
    <el-row :gutter="30">
      <el-col :span="6" :xs="24" :sm="12" :md="8" :lg="6">
        <div class="add" @click="$router.push({name:'Addbot',
        params:{isEdist:false}})">
          <img src="~@/assets/img/bot_07_add.png" alt/> 新增Bot
        </div>
      </el-col>
      <el-col :span="6" :xs="24" :sm="12" :md="8" :lg="6" v-for="(item, index) in list" :key="index" class="bot-item">
        <div class="intention" :style="{borderColor: color[index%7]}">
          <div class="title">
            <span class="botname" :title="item.name">
              {{item.name}}
            </span>
            <div class="trainbox">
              <!-- <span
                class="trainstate"
                :class="{'istrain':item.trainType == 2}"
              >{{item.trainType | trainStatusFilter}}</span> -->
              <el-button
                :loading="item.showBtnLoading"
                type="primary"
                plain
                :disabled="item.train_type =='1' "
                size="mini"
                @click.stop="trainBot(item)"
              >{{item.train_type | trainStatusFilter}}
              </el-button>
              <!--              <el-button-->
              <!--                type="success"-->
              <!--                plain-->
              <!--                :disabled="item.train_type=='2' || item.plush_type=='1'"-->
              <!--                size="mini"-->
              <!--                @click.stop="publishBot(item.id)"-->
              <!--              >{{item.plush_type | publishStatusFilter}}-->
              <!--              </el-button>-->
            </div>
          </div>
          <div class="dig">
            <span style="font-size:14px;color:#999">知识包
              <span class="required"
                    v-if="item.train_type=='2'"
                    style="font-size: 25px;color:red">*</span>
            </span>
            <p>
              {{item.count}}
            </p>
          </div>
          <div>

          </div>
          <!-- <div class="trainResult" @click="showResultDialog(item)">提交测试 →</div> -->
          <div class="trainResult" >
            <div class="ctrlBtnWrap">
              <el-button
                type="success"
                plain
                size="mini"
                @click.stop="showResultDialog(item)"
              >批量测试
              </el-button>
              <el-button
                type="warning"
                plain
                size="mini"
                @click.stop="handleGetKey(item, index)"
              >客户端对接
              </el-button>
            </div>
            <div class="ctrlBtnWrap">
              <el-button
                type="info"
                plain
                size="mini"
                @click.stop="handleEdit(item, index)"
              >编辑
              </el-button>
              <!-- <el-button
                type="danger"
                plain
                size="mini"
              >删除
              </el-button> -->
            </div>

            </div>

          <a class="dotCtrl">
            <img src="~@/assets/img/bot_06_more.png" alt/>
            <div class="ctrl-btn-box">
              <el-button size="mini" class="ctrl-btn edit" @click.stop="handleEdit(item, index)">编辑</el-button>
              <el-button
                size="mini"
                class="ctrl-btn delete"
                @click.stop="deleteItem(item, index)"
              >删除
              </el-button>
            </div>
          </a>
        </div>
      </el-col>
    </el-row>
    <el-dialog
      :visible.sync="dialogVisible"
      title="选择"
      close-on-click-modal
    >
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="120px"
        class="demo-ruleForm"
      >
        <el-form-item label="Bot名" prop="name">
          <el-input v-model="ruleForm.name" disabled placeholder="小猪计划"></el-input>
          <el-input v-model="ruleForm.id" v-show="false"></el-input>
        </el-form-item>
        <el-form-item label="选择知识包" prop="knPacksIds">
          <!-- <el-checkbox :indeterminate="isIndeterminate" v-model="checkAll" @change="handleCheckAllChange">全选</el-checkbox> -->
          <el-checkbox-group v-model="ruleForm.knPacksIds">
            <el-checkbox
              :label="item"
              v-for="(item ,index) in knpOptions"
              :key="index"
              :value="item.id"
            >{{item.name}}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item>
          <el-button @click="resetForm('ruleForm')">取 消</el-button>
          <el-button type="primary" @click="submitForm('ruleForm')">提交测试</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
    <el-dialog
      :visible.sync="dialogVisible2"
      close-on-click-modal
      custom-class="dockerBox"
    >
    <div class="dialogTitle">您可能用到的参数信息如下：</div>
    <el-table
    class="tableClass"
    :data="tableData1"
    border
    >
    border>
    <el-table-column
      prop="key"
      label="参数"
      width="120">
    </el-table-column>
    <el-table-column
      prop="val"
      label="值"
      >
    </el-table-column>
    <el-table-column
      prop="copy"
      label="复制"
      width="80"
      >
      <template slot-scope="scope">
        <el-tooltip class="item" effect="dark" content="点击复制" placement="right">
         <el-button class="btn-copy btn-clip" size="small"
         :data-clipboard-text="scope.row.val"
         icon="el-icon-copy-document"></el-button>
    </el-tooltip>
        </template>
    </el-table-column>
  </el-table>
    <div class="dialogTitle">KBS为您提供如下API接口，供您自行开发和对接客户端：</div>
    <div class="apiBox">
    <div class="dialogSubTitle">1. 问候语</div>
    <ul>
      <li class="subTitleLi" v-for="item in tableData1_1" :key="item.key">
        <span class="subTitle2">{{item.key}}</span>   {{item.val}}
      </li>
    </ul>
    <el-table
    :data="tableData1_2"
    :row-class-name="tableRowClassName"
    border
    class="tableClass">
    <el-table-column
      prop="key"
      label="参数"
      width="120">
    </el-table-column>
    <el-table-column
      prop="required"
      label="是否必填"
      width="80"
      >
    </el-table-column>
     <el-table-column
      prop="desc"
      label="描述"
      >
    </el-table-column>
  </el-table>
  <div class="dialogSubTitle">2. 置顶词</div>
    <ul>
      <li class="subTitleLi" v-for="item in tableData2_1" :key="item.key">
        <span class="subTitle2">{{item.key}}</span>   {{item.val}}
      </li>
    </ul>

    <el-table
    :data="tableData2_2"
    :row-class-name="tableRowClassName"
    border
    class="tableClass">
    <el-table-column
      prop="key"
      label="参数"
      width="120">
    </el-table-column>
    <el-table-column
      prop="required"
      label="是否必填"
      width="80"
      >
    </el-table-column>
     <el-table-column
      prop="desc"
      label="描述"
      >
    </el-table-column>
  </el-table>
  <div class="dialogSubTitle">3. 会话</div>
  <ul>
      <li class="subTitleLi" v-for="item in tableData3_1" :key="item.key">
        <span class="subTitle2">{{item.key}}</span>   {{item.val}}
      </li>
    </ul>
    <el-table
    :data="tableData3_2"
    :row-class-name="tableRowClassName"
    border
    class="tableClass">
    <el-table-column
      prop="key"
      label="参数"
      width="120">
    </el-table-column>
    <el-table-column
      prop="required"
      label="是否必填"
      width="80"
      >
    </el-table-column>
     <el-table-column
      prop="desc"
      label="描述"
      >
    </el-table-column>
  </el-table>
        </div>
    </el-dialog>
    <el-row :gutter="30">
      <router-view/>
    </el-row>
  </div>
</template>

<script>
  import {mapState} from "vuex";
  import {getBotCountList, trainBot, publishBot,} from "@/api/expand/botManage";
  import {updateBotManage, getBotManageById, deleteBotManageById} from "@/api/generate/botManage";
  import {getFaqPackageSelect} from "@/api/generate/faqPackage";
  import {submitFAQTest, TrainStatusALL} from "@/api/expand/testManage";
  import ClipboardJS from "clipboard";

  var clipboard = null;

  export default {
    name: "page_bot",
    data() {
      return {
        formLabelWidth:"130px",
        showBtnLoading: false,
        list: [],
        busUnit: '',
        disabled: false,
        knpOptions: [],
        dialogVisible: false,
        dialogVisible2:false,
        curClickObj:{},
        curBotId:"",
        curWelId:"",
        show: true,
        code: 0,
        projectLists: [{label: "", value: ""}],
        color: [
          "#2BCCC0",
          "#FE7156",
          "#4693FF",
          "#F9C22D",
          "#24BEE3",
          "#5FCC7C",
          "#FB8421"
        ],
        ruleForm: {
          id: "",
          name: "",
          knPacksIds: [],
        },
        rules: {
          name: [{required: true, message: "请输入bot名称", trigger: "change"}],
          knPacksIds: [
            {required: true, message: "请选择知识包", trigger: "change"}
          ],
        },
        editType: "add",
        editIndex: 0,
        isIndeterminate: true,
        checkAll: false,
      };
    },
    computed: {
      ...mapState({}),
        tableData1(){
          var arr = [
            {key:'HOST',val:process.env.VUE_APP_BASE_URL},
            {key:'botManageId',val:this.curClickObj.id},
              {key:'welcomingId',val:this.curClickObj.welcoming_id_man}
          ];
          return arr;
        },
        tableData1_1(){
          var arr = [
            {key:'API：',val:`${process.env.VUE_APP_BASE_URL}api/v1/Conversation/Welcoming?botManageId=${this.curClickObj.id}&welcomingId=${this.curClickObj.welcoming_id_man}&dateTime=`},
            {key:'传值方式：',val:'GET'},
            {key:'请求参数：',val:''}
          ];
          return arr;
        },
        tableData1_2(){
          var arr = [
            {key:'botManageId',required:`必填`,desc:"知识管理平台的bot ID"},
            {key:'welcomingId',required:`非必填`,desc:"知识管理平台中管理的相应个性的ID。如果您填写，则是用您指定的个性ID，如果您不填写，则默认使用Bot创建时候选择的第一个个性的ID"},
            {key:'dateTime',required:`非必填`,desc:"客户端时间"}
          ];
          return arr;
        },
        tableData2_1(){
          var arr = [
            {key:'API：',val:`${process.env.VUE_APP_BASE_URL}api/v1/get_glossary/?botManage=${this.curClickObj.id}`},
            {key:'传值方式：',val:'GET'},
            {key:'请求参数：',val:''}
          ];
          return arr;
        },
        tableData2_2(){
          var arr = [{key:'botManageId',required:`必填`,desc:"知识管理平台的bot ID"}];
          return arr;
        },
        tableData3_1(){
          var arr = [
          {key:'API：',val:`${process.env.VUE_APP_BASE_URL}api/v1/Conversation/`},
          {key:'传值方式：',val:'POST'},
          {key:"请求头：",val:"application/json"},
          {key:'请求参数：',val:''},
          ];
          return arr;
        },
        tableData3_2(){
          var arr = [
            {key:'botManageId',required:`必填`,desc:"知识管理平台的bot ID"},
            {key:'userInput',required:`必填`,desc:"用户输入的问题"},
            {key:'previewUser',required:`必填`,desc:"用户的SessionID。用于区分不同用户会话的唯一标识"},
            {key:'userId',required:`非必填`,desc:"用户的账号名"}
          ];
          return arr;
        },

    },
    created() {
      this.fetchData();
    },
    mounted(){
      this.initClipBoard();
    },
    beforeDestroy(){
      clipboard.destroy();
    },
    filters: {
      trainStatusFilter(status) {
        if (status == 0) {
          return "已训练";
        } else if (status == 1) {
          return "已训练";
        } else if (status == 2) {
          return "训练发布";
        } else if (status == 3) {
          return "训练失败";
        }
      },

      publishStatusFilter(status) {
        if (status == 0) {
          return "已发布";
        } else if (status == 1) {
          return "已发布";
        } else if (status == 2) {
          return "发布";
        } else if (status == 3) {
          return "发布失败";
        }
      }
    },
    methods: {
      async fetchData() {
        let listData = await getBotCountList();
        // let FaqPackageData = await getFaqPackageSelect();
        // this.knpOptions = FaqPackageData.data;
        // this.list = listData.data;
        this.list = listData.data.map((item) => {
          item.showBtnLoading = false;
          return item;
        });
      },
      tableRowClassName({row, rowIndex}) {
        if (rowIndex % 2 === 0) {
          return 'warning-row';
        } else if (rowIndex % 2 != 0) {
          return 'success-row';
        }
        return '';
      },
      initClipBoard(){
      clipboard = new ClipboardJS('.btn-clip');
      clipboard.on('success', (e)=>{
          console.info('Action:', e.action);
          console.info('Text:', e.text);
          console.info('Trigger:', e.trigger);
           this.$message.success('复制成功');
          e.clearSelection();
      });
    },
      handleCheckAllChange(val) {
        this.ruleForm.knPacksIds = val ? this.knpOptions : [];
        this.isIndeterminate = false;
      },
      handleCheckedCitiesChange(value) {
        let checkedCount = value.length;
        this.checkAll = checkedCount === this.knpOptions.length;
        this.isIndeterminate = checkedCount > 0 && checkedCount < this.knpOptions.length;
      },
      showResultDialog(bot) {
        this.dialogVisible = true;
        this.ruleForm.name = bot.name;
        this.ruleForm.id = bot.id;
        getBotManageById(this.ruleForm.id).then((resp) => {
          this.ruleForm.buName = resp.businessUnitName;
          this.ruleForm.welcomingIdMan = resp.welcoming_id_man;
          this.ruleForm.welcomingIdWom = resp.welcoming_id_wom;
          this.ruleForm.guideLanguage = resp.guide_language;
          this.ruleForm.overTimeRemind = resp.over_time_remind;
          this.knpOptions = resp.botManagePacksDtos;
          // resp.botManagePacksDtos.forEach(item => {
          //   this.ruleForm.knPacksIds.push(item.faqPackageId);
          // });
        });

      },
      trainBot(item) {
        item.showBtnLoading = true;
        let data = {
          id: item.id
        };
        this.$message({
          message: '训练耗时较长,请稍等....',
          type: "success",
          duration: 2000
        });
        trainBot(data).then(res => {
          if (res.code == 404) {
            this.$message({
              message: res.message,
              type: "warning",
              duration: 2 * 1000
            });
            return;
          }
          return;

        });
        var count = 0;
        var timer = setInterval(() => {
          TrainStatusALL({taskId: item.id, types: '1'}).then(res => {
            if (res.code == 200) {
              this.$message({
                message: res.message,
                type: "success",
                duration: 2 * 1000
              });
              item.showBtnLoading = false;
              this.fetchData();
              clearInterval(timer);
              return true;
            }
            if (count > 100) {
              this.$message({
                message: '请求超时',
                type: "warning",
                duration: 2 * 1000
              });
              item.showBtnLoading = false;
              clearInterval(timer);
              return;
            }
            count++;
          });
        }, 5 * 1000);

      },
      publishBot(id) {
        let data = {
          id: id
        };
        publishBot(data).then((resp) => {
          if (resp.code == 200) {
            this.$message({
              message: resp.message,
              type: "success",
              duration: 2 * 1000
            });
          } else {
            this.$message({
              message: resp.message,
              type: "warning",
              duration: 2000
            });
          }
          this.fetchData();
        });
      },
      addIntention() {
        this.dialogNewProject = true;
        this.projectFormType = "add";
        this.projectDialogTitleName = "新增意图";
      },
      deleteItem(item, index) {
        this.$confirm(item.name + "的删除操作是不可逆的,无法撤消你将要执行的操作", '警告', {
          type: 'warning',
          cancelButtonClass: "btn-cancel", confirmButtonClass: "btn-confirm"
        }).then(_ => {
          deleteBotManageById(item.id).then((resp) => {
            this.fetchData();
          }, () => {

          });
          // this.intentionList.splice(index, 1);
        });
      },
      handleEdit(item, index) {
        this.$router.push({
          name: 'Addbot',
          params: {isEdit: true, id: item.id, name: item.name}
        });
      },
      handleGetKey(item, index){
        this.dialogVisible2 = true;
        console.log(item);
        this.curClickObj = item;
        this.curBotId = item.id;
        this.curWelId = item.welcoming_id_man;
      },
      resetForm(formName) {
        this.$refs.ruleForm.resetFields();
        this.dialogVisible = false;
      },
      handleClose() {
        this.ruleForm = {
          title: "",
          intro: ""
        };
        this.dialogVisible = false;
      },
      submitForm(formName) {
        this.$refs[formName].validate(valid => {
            if (valid) {
              let botManagePacksDtos = [];
              this.ruleForm.knPacksIds.forEach(item => {
                botManagePacksDtos.push(
                  item.faqPackageId
                );
              });
              let data = {
                id: this.ruleForm.id,
                name: this.ruleForm.name,
                faqPackages: botManagePacksDtos,
              };
              this.$message({
                message: "批量测试任务已下发,耗时较长,请稍等......",
                type: "success",
                duration: 2 * 1000
              });

              submitFAQTest(data);
              this.dialogVisible = false;
              var count = 0;
              var timer = setInterval(() => {
                TrainStatusALL({taskId: data.id, types: '2'}).then(res => {

                  if (res.code == 200) {
                    this.$message({
                      message: res.message,
                      type: "success",
                      duration: 2 * 1000
                    });
                    this.fetchData();
                    clearInterval(timer);
                    return true;
                  }
                  if (count > 100) {
                    this.$message({
                      message: '请求超时',
                      type: "warning",
                      duration: 2 * 1000
                    });
                    clearInterval(timer);
                    return;
                  }
                  count++;
                });
              }, 5 * 1000);

            } else {
              return false;
            }
          }
        );
      },
    }
  }
  ;
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>
.ctrlBtnWrap{
  display: flex;
    align-items: center;
}
  .box-card {
    margin-bottom: 20px;

    .el-card__body {
      overflow: hidden;
    }
  }

  .el-message-box {
    text-align: center;
    position: relative;

    p {
      font-weight: bold;
      line-height: 100px;
    }

    .el-message-box__btns {
      position: relative;
      height: 45px;
    }

    .el-message-box__btns {
      button {
        width: 160px;
        margin-bottom: 10px;
        position: absolute;
        height: 35px;
        top: -5px;
      }

      .el-button--default.el-button--primary {
        left: 30px;
        background: #4693ff;
      }

      .el-button--default {
        right: 30px;
        border: none;
        background: #fe7156;
        color: #fff;
      }
    }
  }

  .page_bot {

    .tipsBox {
      width: 100%;
      background: rgba(255, 255, 255, 1);
      box-shadow: 0px 2px 5px 0px rgba(96, 144, 210, 0.05);
      border-radius: 4px;
      padding: 10px 18px;
      margin-bottom: 20px;

      .title {

      }

      .text {
        font-size: 14px;
        color: #333;
      }
    }

    .pany {
      width: 100%;
      height: 75px;
      background: rgba(255, 255, 255, 1);
      box-shadow: 0px 2px 5px 0px rgba(96, 144, 210, 0.05);
      border-radius: 4px;
      padding: 10px 18px;
      margin-bottom: 20px;

      .pany-title {
        width: 87px;
        height: 32px;
        font-size: 18px;
        margin-top: 4px;
        font-family: PingFangSC-Regular;
        font-weight: 500;
        color: rgba(30, 135, 228, 1);
        line-height: 23px;
      }

      .el-breadcrumb__inner a,
      .el-breadcrumb__inner.is-link {
        color: #1e87e4;
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

      .title .el-input__inner {
        border-color: transparent;
        background: #f1f2f7;
        width: 300px;
      }

      .title + span {
        position: absolute;
        top: 0px;
        left: 315px;
        color: #999999;
      }

      .intro textarea {
        border-color: transparent;
        background: #f1f2f7;
        resize: none;
        height: 200px;
      }

      .intro + span {
        position: absolute;
        top: 160px;
        right: 15px;
        color: #999;
      }
    }

    .bot-item {
      min-width: 25%;
    }

    .add {
      background: #fff;
      margin-bottom: 20px;
      height: 180px;
      padding: 15px;
      border-radius: 5px;
      text-align: center;
      color: #666;
      line-height: 150px;

      img {
        margin-right: 8px;
        position: relative;
        top: 2px;
      }
    }

    .intention {
      background: #fff;
      margin-bottom: 20px;
      height: 180px;
      border-radius: 5px;
      position: relative;
      overflow: hidden;

      .title {
        padding: 10px 15px;
        border-bottom: 1px dashed #eee;
        display: flex;
        justify-content: space-between;
      }

      .botname {
        line-height: 1.7;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
      }

      .trainbox {
        margin-right: 15px;
      }

      .trainstate {
        font-size: 12px;
        color: #f75454;
      }

      .istrain {
        color: #409eff;
      }

      .dig {
        padding: 15px;
      }

      .trainResult {
        border-top:1px solid #eeeeee;
        position: absolute;
        bottom: 0;
        text-align: center;
        width: 100%;
        height: 50px;
        line-height: 46px;
        color: #fff;
        display: flex;
        flex-flow: row nowrap;
        justify-content: space-between;
        padding:0px 12px;
      }

      p {
        margin-top: 8px;
        font-size: 18px;
      }

      .intro {
        font-size: 14px;
        color: #aaaaaa;
        display: block;
        width: 85%;
        margin-top: 8px;
      }

      .dotCtrl {
        position: absolute;
        right: 15px;
        top: 15px;

        &:hover .ctrl-btn-box {
          display: block;
        }
      }

      .ctrl-btn-box {
        position: absolute;
        right: 0px;
        bottom: -20px;
        width: 50px;
        height: 40px;
        display: none;
      }

      .ctrl-btn {
        padding: 5px 8px;
        border: none;
        box-shadow: 0px 2px 6px 0px rgba(96, 144, 210, 0.15);
        font-size: 14px;
      }

      .edit {
        color: #4693ff;
      }

      .delete {
        margin-left: 0;
      }
    }

    .list {
      background: #fff;
      border-radius: 5px;

      .listitem {
        border-bottom: 1px solid #eee;
        line-height: 80px;
        height: 80px;
        position: relative;
        // box-shadow:0px -1px 0px 0px rgba(238,238,238,1);

        &:last-child {
          border: none;
        }

        img {
          width: 40px;
          height: 40px;
          border-radius: 50%;
          /* margin: 10px; */
          /* display: inline-block; */
          position: absolute;
          top: 20px;
          left: 15px;
        }

        p {
          color: #555555;
          padding-left: 70px;
        }

        a {
          color: #4693ff;
        }

        span {
          position: absolute;
          right: 30px;
          top: 0;
          color: #888;
        }
      }
    }

    .el-breadcrumb__inner a,
    .el-breadcrumb__inner.is-link {
      font-weight: 400;
    }

    .el-breadcrumb__item:last-child .el-breadcrumb__inner,
    .el-breadcrumb__item:last-child .el-breadcrumb__inner a,
    .el-breadcrumb__item:last-child .el-breadcrumb__inner a:hover,
    .el-breadcrumb__item:last-child .el-breadcrumb__inner:hover {
      color: #9aabb4;
    }
  }

  .btn-copy{
    &:hover,&:active{
      color: rgb(255, 255, 255);
      background-color: rgb(39, 174, 96);
      border-color: rgb(39, 174, 96);
    }
  }
  .dialogTitle{
    color:#318864;
    margin-top:12px;
    margin-bottom:12px;
  }
  .dialogSubTitle{
    font-size:12px;
    color:#067fb9;
    margin-top:10px;
    margin-bottom:10px;
  }
  ::v-deep .dockerBox{
    width:60%;
    .el-dialog__body{
      overflow: auto;
      max-height: 550px;
    }
     .el-dialog__header{
      padding: 0 !important;
    }
    .el-table td, .el-table th{
      padding:5px 0px;
    }
    .el-table .warning-row {
      background: #fff;
    }

    .el-table .success-row {
      background: #fbfbfb;
    }
    .subTitleLi{
      margin-bottom:10px;
    }
    .subTitle2{
      font-weight: 700;
    }
    .tableClass{
      width: 55%;margin-left:40px;margin-bottom:20px;
    }
  }

</style>
