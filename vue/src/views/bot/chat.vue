<template>
  <div class="chatWrap">
    <custom :botManageId="curBotManageId" :welcomingId="curWelcomingId" :dateTime="curDateTime"
            :botName="curBotName"></custom>
  </div>
</template>

<script>
  import custom from "@/components/Custom";

  export default {
    data() {
      return {
        curBotManageId: "",
        curWelcomingId: "",
        curDateTime: "",
        curBotName: "",
      };
    },
    components: {custom},
    created() {
      let data = this.$route.query;
      this.curWelcomingId = data.welcomingId;
      this.curBotManageId = data.botManageId;
      this.curDateTime = data.dateTime;
      this.curBotName = data.curBotName + '会话体验';
    },
    mounted() {
      this.$route.meta.title = this.curBotName;
      document.title = 'BOT预览';
    }
  };
</script>

<style lang="scss" scoped>
  .chatWrap {
    max-width: 500px;
    margin: 0 auto;
    height: 100%;
  }

  @media screen and (min-width: 768px) {
    .chatWrap {
      max-width: 100%;
      margin: 0 auto;
    }
  }

  @media screen and (min-width: 1024px) {
    .chatWrap {
      max-width: 500px;
      margin: 0 auto;
    }
  }
</style>
