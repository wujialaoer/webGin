<template>
  <div class="msgflowBox">
    <div class="message-list-header">
      {{botName}}
    </div>
    <div class="msgflow" ref="msgflow" v-cloak>
      <div class="message-list" v-cloak>
        <template v-cloak>
          <div class="onemsg clearfix" :class="{'me':item.isSelf}" v-for="(item,index) in msglist"
               v-bind:key="item.seq">
            <span class="msgbody">
                 <div class="bubble" :class="{'bubble_primary right':item.isSelf,'left':item.isSelf != true}">
                  <!-- 消息体 -->
                    <pre v-html="item.content" v-if="!item.isSelf" @click="lookBigImg($event,index,item)"></pre>
                    <pre v-text="item.content" v-if="item.isSelf" @click="lookBigImg($event,index,item)"></pre>
                  </div>
            </span>
          </div>
        </template>
      </div>
      <!--弹出框-->
    </div>
    <div class="sendBox">
      <input @keydown.enter.exact.prevent="sendMsg" v-model="sendTxt" type="text" placeholder="请输入您要发送的信息">
      <img id="sendBtn" @click="sendMsg" src="~@/assets/img/lillybot_07send.png">
    </div>
  </div>
</template>

<script>
  import {assembleMsg} from "./msgConvert"; //消息解析
  import {getWelcoming, previewSendMsg} from "@/api/conversation";

  export default {
    props: ["welcomingId", "botManageId", "dateTime", "botName", "chatUrl"],
    data() {
      return {
        msglist: [],
        sendTxt: "",
        previewUser: "",
        faqTaskItem: ''
      };
    },
    watch: {
      chatUrl() {
        this.initWelcome();
      },
    },
    mounted() {
      if (this.botManageId) {
        this.initWelcome();
      }
    },
    methods: {
      async initWelcome() {
        this.msglist = [];
        let data = {
          botManageId: this.botManageId,
          welcomingId: this.welcomingId,
          dateTime: decodeURIComponent(this.dateTime),
        };
        let msgData = await getWelcoming(data);
        let msg = msgData.data.message;
        this.previewUser = msgData.data.previewUser;
        this.msglist.push(assembleMsg(msg, false));
      },
      async sendMsg() {
        let data = {
          botManageId: this.botManageId,
          userInput: this.sendTxt,
          previewUser: this.previewUser,
          faqTaskItem: this.nodeId,
          personality:this.welcomingId
        };
        console.log(data);
        if (this.sendTxt.replace(/(^\s*)|(\s*$)/g, "") == "") {
          setTimeout(function () {
            this.sendTxt.replace(/(^\s*)|(\s*$)/g, "");
          }, 10);
          return;
        }
        this.msglist.push(assembleMsg(data.userInput, true));
        this.sendTxt = "";
        setTimeout(() => {
          this.$refs.msgflow.scrollTop = this.$refs.msgflow.scrollHeight;
        }, 1);
        let answerMsgData = await previewSendMsg(data);
        let answerMsg = answerMsgData.data.result;
        console.log(answerMsgData.data.luisResult);
        this.faqTaskItem = data.faqTaskItem;
        if (answerMsg) {
          this.msglist.push(assembleMsg(answerMsg, false));
          console.warn(this.$refs);
          setTimeout(() => {
            this.$refs.msgflow.scrollTop = this.$refs.msgflow.scrollHeight;
          }, 100);
          //this.$refs.msgflow.scrollIntoView(false)
        }
      },

      lookBigImg(event, index, item) {
      }
    },
    filters: {
      FormatMsg(msg) {
        let html = "";
      },

    },
  };
</script>

<style lang="scss" scoped>
  @import "./chatroom.scss";

  .msgflowBox {
    min-height: 585px;
    max-height: 100%;
    background: #f5f5f5;
    display: flex;
    flex-flow: column nowrap;
  }

  .msgflow {
    flex: auto;
  }

  .sendBox {
    position: relative;
    height: 48px;
    flex: none;
    margin-bottom: 2%;
    display: flex;
    justify-content: center;

    input {
      border-radius: 40px;
      width: 95%;
      outline: none;
      border: none;
      padding: 0.3rem 1rem;
      margin: 0 auto;
    }

    #sendBtn {
      cursor: pointer;
      width: 2.4rem;
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      right: 1rem;
    }
  }

  .message-list-header {
    line-height: 45px;
    padding-left: 12px;
  }
</style>
