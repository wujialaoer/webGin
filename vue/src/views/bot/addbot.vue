<template>
  <div class="app-container page_addbot">
    <div class="qaWrap">
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="120px"
        class="demo-ruleForm"
      >
        <el-form-item label="请选择知识应用" v-if="isEdit===true" prop="buName">
          <span>{{this.ruleForm.buName}}</span>
        </el-form-item>
        <el-form-item label="请选择知识应用" v-if="isEdit===false" prop="buName">
          <el-select v-model="busUnit" clearable placeholder="请选择知识应用" @change="selectOption">
            <el-option
              v-for="(item, index) in knpOptions"
              :key="index"
              :value="item.children"
              :label="item.text"
            >
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="Bot命名" prop="name">
          <el-input v-model="ruleForm.name" placeholder="请输入内容"></el-input>
        </el-form-item>
        <el-form-item label="选择知识包" v-if="isEdit===true" prop="knPacksIds">
          <el-checkbox-group v-model="ruleForm.knPacksIds" clearable @change="selectOption">
            <el-checkbox
              v-for="(item ,index) in busUnit"
              :label="item.faqPackageId"
              :key="index"
            >{{item.name}}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="选择知识包" v-if="isEdit===false" prop="knPacksIds">
          <el-checkbox-group v-model="ruleForm.knPacksIds" clearable @change="selectOption">
            <el-checkbox
              v-for="(item ,index) in busUnit"
              :label="item.value"
              :key="index"
            >{{item.text}}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="请选择置顶词" prop="glossary">
          <el-checkbox-group v-model="ruleForm.se_glossary" clearable @change="selectOption">
            <el-checkbox
              v-for="(item ,index) in glossary"
              :label="item.id"
              :key="index"
            >{{item.noun}}
            </el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="个性1" prop="welcomingIdMan">
          <el-select v-model="ruleForm.welcomingIdMan" placeholder="请为男性选择个性">
            <el-option
              v-for="(item, index) in welOptions"
              :key="index"
              :value="item.value"
              :label="item.text"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="个性2" prop="welcomingIdWom">
          <el-select v-model="ruleForm.welcomingIdWom" placeholder="请为女性选择个性">
            <el-option
              v-for="(item, index) in welOptions"
              :key="index"
              :value="item.value"
              :label="item.text"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="引导语" prop="guideLanguage">
          <el-input type="textarea" v-model="ruleForm.guideLanguage" placeholder="请输入内容"></el-input>
        </el-form-item>
        <el-form-item label="超时提醒" prop="overTimeRemind">
          <el-input type="textarea" v-model="ruleForm.overTimeRemind" placeholder="请输入内容"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button @click="resetForm(-1)">取消</el-button>
          <el-button type="primary" @click="submitForm('ruleForm')">保存</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
  import {mapState} from "vuex";
  import {getFaqPackageSelect} from "@/api/generate/faqPackage";
  import {getPersonalitySelect} from "@/api/expand/personality";
  import {addBotManage, getBotManageById, updateBotManage, getBotGlossary} from "@/api/generate/botManage";
  import {getQueryGlossaryIsDefault} from "@/api/generate/glossary";

  var timer = null;
  export default {
    name: "addBot",
    components: {
      // 注册所有组件
    },
    data() {
      return {
        isEdit: false,
        knpOptions: [],
        welOptions: [],
        checkList: [],
        //  {}
        busUnit: [],
        glossary: [],
        step: 1,
        ruleForm: {
          buName: '',
          bUid: '',
          name: "",
          knPacksIds: [],
          se_glossary: [],
          welcomingIdMan: "",
          welcomingIdWom: "",
          guideLanguage: "",
          overTimeRemind: "",
        },
        rules: {
          name: [{required: true, message: "请输入bot名称", trigger: "change"}],
          knPacksIds: [{required: true, message: "请选择知识包", trigger: "blur", type: 'array', min: 1}],
          welcomingIdMan: [
            {required: true, message: "请为男性选择个性", trigger: "change"}
          ],
          welcomingIdWom: [
            {required: true, message: "请为女性选择个性", trigger: "change"}
          ],
          guideLanguage: [
            {required: true, message: "引导语", trigger: "change"}
          ],
          overTimeRemind: [
            {required: true, message: "超时提醒", trigger: "change"}
          ]
        },
        id: this.$route.params.id,
        changeFlag: false

      };
    },
    watch: {
      'busUnit'(e) {
        if (this.isEdit == false && this.changeFlag) {
          this.ruleForm.knPacksIds = [];
        }
      },
    },

    created() {
      this.fetchData();
      if (this.$route.params.isEdit == true) {
        this.ruleForm.name = this.$route.params.name;
        this.isEdit = true;

        getBotManageById(this.$route.params.id).then((resp) => {
          this.ruleForm.buName = resp.businessUnitName;
          this.ruleForm.welcomingIdMan = resp.welcoming_id_man;
          this.ruleForm.welcomingIdWom = resp.welcoming_id_wom;
          this.ruleForm.guideLanguage = resp.guide_language;
          this.ruleForm.overTimeRemind = resp.over_time_remind;
          resp.botManagePacksDtos.forEach(item => {
            this.ruleForm.knPacksIds.push(item.faqPackageId);
          });
          this.busUnit = resp.all_pkgs;
        });
        getBotGlossary({'bot_manage': this.$route.params.id}).then((resp) => {
          resp.data.forEach(item => {
            this.ruleForm.se_glossary.push(item.gl_id);
          });
        });
      }
    },
    beforeDestroy() {
      timer = null;
    },
    methods: {
      async fetchData() {
        let FaqPackageData = await getFaqPackageSelect();
        let welcomlData = await getPersonalitySelect();
        let glos = await getQueryGlossaryIsDefault();
        this.knpOptions = FaqPackageData.data;
        this.welOptions = welcomlData.data;
        this.glossary = glos.data;
      },

      submitForm(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            let botManagePacksDtos = [];

            this.ruleForm.knPacksIds.forEach(element => {
              botManagePacksDtos.push({faqPackageId: element});
            });
            if (botManagePacksDtos.length === 0) {
              this.$message({
                message: '知识包数量最少为1',
                type: "warning"
              });
              return false;
            }

            let data = {
              name: this.ruleForm.name,
              botManagePacksDtos: botManagePacksDtos,
              welcoming_id_man: this.ruleForm.welcomingIdMan,
              welcoming_id_wom: this.ruleForm.welcomingIdWom,
              guide_language: this.ruleForm.guideLanguage,
              over_time_remind: this.ruleForm.overTimeRemind,
              train_type: 2,
              plush_type: 2,
              se_glossary: this.ruleForm.se_glossary
            };
            if (this.isEdit == true) {
              data.id = this.id;
              updateBotManage(this.id, data).then((resp) => {
                if (resp.code == 200) {
                  this.$message({
                    message: resp.message,
                    type: "success"
                  });

                  timer = setTimeout(() => {
                    this.resetForm(-1);
                  }, 1000);
                }
              });
            } else {
              addBotManage(data).then(
                resp => {
                  if (resp.code == 200) {
                    this.$message({
                      message: resp.message,
                      type: "success"
                    });

                    timer = setTimeout(() => {
                      this.resetForm(-1);
                    }, 1000);

                  }
                },
                err => {
                  console.warn(err);
                }
              );
            }

          } else {
            return false;
          }
        });
      },
      selectOption(type) {
        this.changeFlag = type;
        this.curPage = 1;
        this.fetchData();
      },

      resetForm(step) {
        this.$router.go(step);
      }
    }
  };
</script>

<style lang="scss">
  .page_addbot {
    .el-steps--simple {
      padding: 13px 18%;
    }

    .qaWrap {
      background: #fff;
      padding: 40px 30px;
    }

    .demo-ruleForm {
      width: 570px;
    }

    .el-textarea__inner {
      min-height: 200px;
    }
  }
</style>
