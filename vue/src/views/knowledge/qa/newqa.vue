<template>
  <div class="app-container page_newqa">
    <el-steps :active="step" finish-status="success" simple>
      <el-step title="选择类别"></el-step>
      <el-step title="编辑保存"></el-step>
    </el-steps>
    <div class="qaWrap">
      <flow :packageId="ruleForm.faq_package" :faqId="this.faqId" :isEdit="isEdit" :KNchildren="faqPackages"
            :faq_pkg="faq_data"
            v-if="step==1 && ruleForm.faq_type == '1'"></flow>
      <el-form
        v-if="step==1 && ruleForm.faq_type == '0'"
        :model="ruleForm2"
        :rules="rules2"
        ref="ruleForm2"
        label-width="55px"
        class="demo-ruleForm2"
      >
        <el-form-item label="问题" prop="problem">
          <el-input v-model="ruleForm2.problem"></el-input>
        </el-form-item>
        <el-form-item label="答案" prop="answer">
          <tinymce id="nodeContent" v-model="ruleForm2.answer" :height="300"/>
          <!-- <el-input type="textarea" :autosize="{ minRows: 2, maxRows: 12 }" v-model="ruleForm2.answer"></el-input> -->
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitSimple('ruleForm2')">保存</el-button>
          <el-button v-if="!isEdit" @click="lastStep">上一步</el-button>
          <el-button @click="resetForm(-1)">取消</el-button>
        </el-form-item>
      </el-form>
      <el-form
        v-if="step==0"
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="100px"
        class="demo-ruleForm"
      >
        <span class="star" style="font-size: 25px;color: red">*</span>
        <el-form-item label="知识应用" prop="bu">
          <el-select v-model="faqPackages" value-key="value" placeholder="请选择知识应用">
            <el-option
              v-for="item in knpOptions.data"
              :key="item.value"
              :value="item"
              :label="item.text"
            ></el-option>
          </el-select>
        </el-form-item>
        <span class="star" style="font-size: 25px;color:red">*</span>

        <el-form-item label="知识包" prop="faq_package">
          <el-select v-model="faq_data" placeholder="请选择知识包">
            <el-option
              v-for="item in faqPackages.children"
              :key="item.value"
              :value="item"
              :label="item.text"
            ></el-option>
          </el-select>
          <!--          <span class="required" style="font-size: 25px;color:red">*</span>-->
        </el-form-item>
        <span class="star" style="height: 20px;font-size: 25px;color:red">*</span>

        <el-form-item label="知识类型" prop="faq_type">
          <el-select v-model="ruleForm.faq_type" placeholder="请选择知识类型">
            <el-option
              v-for="item in typeOptions.data"
              :key="item.value"
              :value="item.value"
              :label="item.text"
            ></el-option>
          </el-select>
          <!--          <span class="required" style="font-size: 25px;color:red">*</span>-->
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="nextStep('ruleForm')" plain>下一步</el-button>
          <el-button @click="resetForm(-1)">取消</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
  import {mapMutations, mapState} from "vuex";
  import {getTypeSelect, addSimple, updateSimple, getSimplefqaById} from "@/api/expand/faq";
  import {getFaqPackageSelect} from "@/api/generate/faqPackage";
  import Tinymce from '@/components/Tinymce';
  import store from "../../../store";

  var timer = null;

  export default {
    name: "newQa",
    components: {
      flow: resolve => require(["@/views/flow/index"], resolve),
      Tinymce
    },

    data() {
      return {
        tinymceId: "nodeContent",
        isEdit: "",
        step: 0,
        faqId: "",
        version: "",
        answer: "",
        data: [],
        faqPackages: {
          'text': "",
          'value': "",
          'children': []
        },
        question: "",
        faq_data: {},
        ruleForm: {
          faq_package: "",
          faq_type: ""
        },
        rules: {
          // faq_package: [{required: true, message: "请选择知识包", trigger: "blur",  min: 1}],
          // faq_type: [{required: true, message: "请选择知识类型", trigger: "blur", type: 'string', min: 1}],
          // bu: [{required: true, message: "请选择知识应用", trigger: "blur", type: 'string', min: 1}]
        },
        ruleForm2: {
          problem: "",
          answer: ""
        },
        rules2: {
          problem: [
            {required: true, message: "请输入问题", trigger: "change"}
          ],
          answer: [{required: true, message: "请输入答案", trigger: "change"}]
        },
        typeOptions: []
      };
    },
    computed: {
      ...mapState({
        knpOptions: state => state.faq.knpOptions
      })
    },

    created() {
      this.fetchData();
      if (JSON.stringify(this.$route.params) == '{}' && this.knpOptions.length < 1) {
        this.$router.push({name: "Qa"});
      }
      if (this.$route.params.isEdit == true) {
        let params = this.$route.params;
        this.ruleForm.faq_package = params.faq_package;
        this.ruleForm.faq_type = params.faq_type;
        this.faqId = params.id;
        this.version = params.version;
        this.step = params.step;
        this.isEdit = params.isEdit;
        this.faqPackages = params.KNchildren;
        this.faq_data = params.faq_pkg;

        if(this.ruleForm.faq_type == '0'){
          getSimplefqaById(this.faqId).then((resp) => {
            let getSimpleFqaResult = resp;
            this.ruleForm2.problem = getSimpleFqaResult.problem;
            this.ruleForm2.answer = getSimpleFqaResult.answer;
            this.ruleForm2.faq_type = getSimpleFqaResult.faq_type;
            tinymce.activeEditor.setContent(this.ruleForm2.answer);
          });
        }
        // this.answer = getSimpleFqaResult.data.answer;
        // this.question = getSimpleFqaResult.data.problem;
        // console.log(getSimpleFqaResult);
      }
    },

    mounted() {
      //    this.$nextTick(()=>{
      //         this.ruleForm2.problem = this.question;
      //         this.ruleForm2.answer = this.answer;
      //     })
    },
    formValidator(rules, value, callback) {
      if (value.length < 1) {
        return callback(new Error('输入不可以为空'));
      }

    },
    beforeDestroy() {
      this.lastStep();
      timer = null;
    },
    methods: {
      ...mapMutations(["setfaqData"]),

      async fetchData() {
        // this.knpOptions = await getFaqPackageSelect();
        this.typeOptions = await getTypeSelect();
        //this.setKnpOptions(this.knpOptions);
      },
      nextStep(formName) {
        // console.log(formName);
        this.$refs[formName].validate(valid => {
          this.ruleForm.faq_package = this.faq_data.value;
          if (this.faqPackages == {} || this.ruleForm.faq_package == undefined || this.ruleForm.faq_type == '') {
            this.$message({
              message: '当前页选项均为必填',
              type: "warning",
              duration: 2 * 1000
            });
            return false;
          }
          if (valid) {
            this.step = 1;
          } else {
            return false;
          }
        });
      },
      submitSimple(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            if (this.isEdit == true) {
              let data = {
                id: this.faqId,
                problem: this.ruleForm2.problem,
                answer: this.ruleForm2.answer,
                version: this.version,
                faq_type: this.ruleForm2.faq_type,
                dis_answer: this.ruleForm2.answer,
                faq_package: this.ruleForm.faq_package
              };
              this.faqPackages =
                updateSimple(this.faqId, data).then((resp) => {

                  this.$message({
                    message: resp.message,
                    type: "success",
                    duration: 2 * 1000
                  });
                  var timer = setTimeout(() => {
                    this.$router.push({
                      name: 'Qa',
                      params: {KNchildren: this.faqPackages, faq_pkg: this.faq_data}
                    });
                  }, 1000);
                });

            } else {
              let data = {
                problem: this.ruleForm2.problem,
                answer: this.ruleForm2.answer,
                faq_package: this.ruleForm.faq_package,
                faq_type: 0,
                creation_id: window.sessionStorage.getItem('user_id'),
                last_modifier_id: window.sessionStorage.getItem('user_id'),
              };
              addSimple(data).then((resp) => {
                this.$message({
                  message: resp.message,
                  type: "success",
                  duration: 2 * 1000
                });
                var timer = setTimeout(() => {
                  this.$router.push({
                    name: 'Qa',
                    params: {KNchildren: this.faqPackages, faq_pkg: this.faq_data}
                  });
                }, 1000);
              });
            }

          } else {
            console.log("error submit!!");
            return false;
          }
        });
      },
      destroyTinymce() {
        const tinymce = window.tinymce.get(this.tinymceId);
        // this.$store.commit("setHasChange",false);
        //   if (this.fullscreen) {
        //     tinymce.execCommand('mceFullScreen')
        //   }
        if (tinymce) {
          tinymce.destroy();
        }
      },
      lastStep() {
        this.destroyTinymce();
        this.ruleForm2 = {
          problem: "",
          answer: ""
        };
        this.step = 0;
      },
      resetForm(step) {
        this.isEdit = false;
        this.$router.go(step);
      }
    }
  };
</script>

<style lang="scss" scoped>
  .page_newqa {
    .el-steps--simple {
      padding: 13px 18%;
    }

    .qaWrap {
      background: #fff;
      padding: 40px 30px;
    }

    .demo-ruleForm2 {
      width: 100%;
    }

    .demo-ruleForm {
      .star {
        position: absolute;
        left: 70px;
      }

    }

    .el-textarea__inner {
      min-height: 200px;
    }

    .el-select {
      width: 40%;
    }
  }
</style>
