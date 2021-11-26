<template>
  <div class="app-container page_system">
    <div class="pany">
      系统配置
    </div>
    <div class="pany">
      <el-form
        class="sysForm"
        ref="form"
        :model="form"
        label-width="200px"

      >
        <div class="formSubTitle">
          a. Luis相关信息
        </div>
        <el-form-item label="Luis创作终结点">
          <el-input placeholder="Luis Authoring_Endpoint" v-model="form.luis_authoring_endpoint"></el-input>
        </el-form-item>
        <el-form-item label="Luis创作Key">
          <el-input placeholder="Luis Authoring_Key" v-model="form.luis_authoring_key"></el-input>
        </el-form-item>
        <el-form-item label="Luis预测终结点">
          <el-input placeholder="Luis Authoring_Query" v-model="form.luis_authoring_query"></el-input>
        </el-form-item>
        <el-form-item label="Luis预测key">
          <el-input placeholder="Luis Authoring_PredictionKey" v-model="form.predictionKey"></el-input>
        </el-form-item>
        <div class="formSubTitle">
          b. 用于通过AAD授权，获取ARM token的内容
        </div>
        <el-form-item label="Azure AAD的租户ID">
          <el-input placeholder="telnet_id" v-model="form.telnet_id"></el-input>
        </el-form-item>
        <el-form-item label="Azure AAD的终结点地址">
          <el-input placeholder="telnet endpoint" v-model="form.telnet"></el-input>
        </el-form-item>
        <el-form-item label="Azure AAD的授权类型">
          <el-input placeholder="grant_type" v-model="form.grant_type"></el-input>
        </el-form-item>
        <el-form-item label="Azure AAD的客户端ID">
          <el-input placeholder="client_id" v-model="form.client_id"></el-input>
        </el-form-item>
        <el-form-item label="Azure AAD的客户端密钥">
          <el-input placeholder="client_secret" v-model="form.client_secret"></el-input>
        </el-form-item>
        <el-form-item label=" Azure AAD的资源地址">
          <el-input placeholder="resource" v-model="form.resource"></el-input>
        </el-form-item>
        <div class="formSubTitle">
          c. 用于Assign相应的Key给到Luis的参数信息
        </div>
        <el-form-item label=" Azure订阅ID">
          <el-input placeholder="azure_subscription_id" v-model="form.azure_subscription_id"></el-input>
        </el-form-item>
        <el-form-item label="Azure上相应的资源组ID">
          <el-input placeholder="Resource_group" v-model="form.resource_group"></el-input>
        </el-form-item>
        <el-form-item label="Azure上LUIS资源的名称">
          <el-input placeholder="Account_name" v-model="form.account_name"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="onSubmit(form)"
          >保存
          </el-button>
          <el-button>取消</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
  import {getConfig, updateConfig} from '@/api/config';

  export default {
    data() {
      return {
        form: {
          luis_authoring_endpoint: "",
          luis_authoring_key: "",
          luis_authoring_query: "",
          predictionKey: "",
          telnet_id: "",
          telnet: "",
          grant_type: "",
          client_id: "",
          client_secret: "",
          resource: "",
          azure_subscription_id: "",
          resource_group: "",
          account_name: "",
        },
        tableData: {},
      };
    },
    created() {
      this.fetchData();
    },
    methods: {
      async fetchData() {
        let listData = await getConfig();
        this.tableData = listData.data;
        this.form.luis_authoring_endpoint = this.tableData.luis_authoring_endpoint;
        this.form.luis_authoring_key = this.tableData.luis_authoring_key;
        this.form.luis_authoring_query = this.tableData.luis_authoring_query;
        this.form.predictionKey = this.tableData.predictionKey;
        this.form.telnet_id = this.tableData.telnet_id;
        this.form.telnet = this.tableData.telnet;
        this.form.grant_type = this.tableData.grant_type;
        this.form.client_id = this.tableData.client_id;
        this.form.client_secret = this.tableData.client_secret;
        this.form.resource = this.tableData.resource;
        this.form.azure_subscription_id = this.tableData.azure_subscription_id;
        this.form.resource_group = this.tableData.resource_group;
        this.form.account_name = this.tableData.account_name;
      },
      onSubmit() {
        console.log(this.form);
        updateConfig(this.form).then(res => {
          if (res.code == 200) {
            this.$message({
              message: res.message,
              type: "success",
              duration: 2000
            });
          } else {
            this.$message({
              message: res.message,
              type: "warning",
              duration: 2000
            });

          }
        });
      }
    }
  };
</script>

<style lang="scss" scoped>
  .sysForm {
    width: 50%;
  }

  .formSubTitle {
    font-weight: 700;
    border-left: 4px solid rgb(3, 169, 244);
    font-size: 16px;
    color: #067fb9;
    margin-top: 20px;
    margin-bottom: 20px;
    padding-left: 16px;
  }
</style>
