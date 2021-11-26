<template>
  <div class="page_preview">
    <section class="absoluteBox">
        <div class="pany">

          <el-select
            v-model="selectBotValue"
            @change="selectIntent"
            placeholder="Bot选择"
          >
            <el-option
              v-for="item in botOption.data"
              :key="item.value"
              :label="item.text"
              :value="item.value"
            >
            </el-option>
          </el-select>
          <el-select
            v-model="selectCharacterValue"
            placeholder="个性选择"
          >
            <el-option
              v-for="item in characterOption.data"
              :key="item.value"
              :label="item.text"
              :value="item.value"
            >
            </el-option>
          </el-select>
          <el-date-picker
            v-model="selectTimeValue"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="选择日期时间">
          </el-date-picker>
          <el-button
            type="primary"
            plain
            class="previewBtn"
            @click="livePreview"
          >实时预览
          </el-button>
        </div>
        <div class="phone">
          <custom :botManageId="curBotManageId" :welcomingId="curWelcomingId" :dateTime="curDateTime"
                  :botName="curBotName" :chatUrl="chatUrl"></custom>
        </div>
        <div class="qrBox">
            <qriously  class="qrcode" :value="chatUrl" :size="size" :backgroundAlpha="backgroundAlpha"/>
            <p><a class="qrUrl" :href="chatUrl">{{chatUrl}}</a> </p>
        </div>
    </section>
    <el-tooltip
      placement="top"
      content="返回顶部"
    >
      <back-to-top
        :custom-style="myBackToTopStyle"
        :visibility-height="300"
        :back-position="50"
        transition-name="fade"
      />
    </el-tooltip>

  </div>
</template>

<script>
  import BackToTop from "@/components/BackToTop";
  import custom from "@/components/Custom";
  import qs from "qs";
  import {getBotManageSelect} from "@/api/generate/botManage";
  import {getWelcomingSelect} from "@/api/generate/welcoming";
  import {getPersonalitySelect} from "@/api/expand/personality";
  import {getQRCode} from "@/api/conversation";


  export default {
    components: {BackToTop, custom},
    data() {
      return {
        chatUrl: "",
        size: 200, // 二维码大小 默认 100
        backgroundAlpha: 1, // 背景透明度，默认透明 0
        myBackToTopStyle: {
          right: "50px",
          bottom: "50px",
          width: "40px",
          height: "40px",
          "border-radius": "4px",
          "line-height": "45px", // 请保持与高度一致以垂直居中 Please keep consistent with height to center vertically
          background: "#e7eaf1" // 按钮的背景颜色 The background color of the button
        },
        selectBotValue: "",
        selectCharacterValue: "",
        selectTimeValue: "",
        botOption: [],
        characterOption: [],
        //customParms:{},
        curWelcomingId: "",
        curBotName: "",
        curBotManageId: "",
        curDateTime: "",
      };
    },
    created() {
      this.initOption();
      this.initUrl();
    },
    methods: {
      async livePreview() {
        let data = {
          botManageId: this.selectBotValue,
          welcomingId: this.selectCharacterValue,
          dateTime: this.selectTimeValue,
          curBotName: this.curBotName,
          //url:this.chatUrl
        };
        //this.customParms = await getQRCode(data);
        this.curWelcomingId = this.selectCharacterValue;
        this.curBotManageId = this.selectBotValue;
        this.curDateTime = this.selectTimeValue;
        this.initUrl();
        this.chatUrl = `${this.chatUrl}?${qs.stringify(data)}`;
      },
      async initOption() {
        this.botOption = await getBotManageSelect();
        this.characterOption = await getPersonalitySelect();
      },
      initUrl() {
        if (process.env.NODE_ENV === "development") {
          this.chatUrl = `${process.env.VUE_APP_BASE_URL}#chat`; // 可以自定义，必填项。
        } else if (process.env.NODE_ENV === "production") {
          this.chatUrl = `${process.env.VUE_APP_BASE_URL}#chat`; // 可以自定义，必填项。
        }
      },
      selectIntent(val) {
        let obj = {};
        obj = this.botOption.data.find((item) => {
          return item.value === val;//比如：选项2
        });
        this.curBotName = obj.text;
      }
    },
  };
</script>

<style lang="scss" scoped>
  .page_preview {
    width:100%;
    padding: 20px;
    position: relative;
    // .absoluteBox{
    //   width:1000px;
    //   height:400px;
    //   position: absolute;
    //   left:50%;
    //   top:40%;
    //   transform: translate3d(-50%,-50%,0);
    // }
    .pany {
      width:260px;
      height: 300px;
      float: left;
      margin-right:60px;
      .el-select {
        width: 100%;
        margin-bottom: 20px;
      }

      /deep/ .previewBtn {
        margin-top: 20px;
      }

      /deep/ .el-date-editor.el-input {
        width: 100%;
      }
    }

  }

  .phone {
    width: 365px;
    height: 750px;
    float: left;
    //margin: 20px 20px 0;
    background-image: url("~@/assets/img/phoneBg.png");
    background-repeat: no-repeat;
    background-size: 100%;
    padding: 17px 17px;
    box-sizing: border-box;
    transform: scale(0.7);
    transform-origin: top left;
  }

  .demo-page {
    width: 100%;
    height: 580px;
    background-color: #fff;
  }
  .qrBox{
    width: 265px;
    float: left;
  }
  .qrUrl{
    word-break: break-all;
  }

  .qrcode {
  width: 200px;
  transition: 1s all ease 0s;
  }

  .msgflowBox {
    overflow:hidden;
    border-radius: 36px;
    background: #f1f2f7;
    max-height: 715px !important;
  }

  @media screen and (min-width: 414px) {
    html {
      font-size: 16px;
    }
  }

  @media screen and (max-width: 414px) {

  }

  @media screen and (min-width: 414px) {
    html {
      font-size: 16px;
    }
  }
</style>
