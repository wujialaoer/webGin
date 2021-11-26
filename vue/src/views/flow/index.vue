<template>
  <div class="container-fluid">
    <el-row>
      <el-col :span="4">
        <div class="grid-content flow_aside">
          <h1>{{flowName}}</h1>
          <el-divider></el-divider>
          <div class="btnlist">
            <div class="btnBox">
              <a
                class="btn btn-success btn-controler"
                href="javascript:;"
                data-type="Root"
                role="button"
              >
                <i
                  class="fa fa-navicon"
                  aria-hidden="true"
                ></i>
                开始</a>
            </div>
            <div class="btnBox">
              <a
                class="btn btn-danger btn-controler"
                href="javascript:;"
                data-type="Exit"
                role="button"
              >
                <i
                  class="fa fa-navicon"
                  aria-hidden="true"
                ></i>
                结束</a>
            </div>
            <div class="btnBox">
              <a
                class="btn btn-primary btn-controler"
                href="javascript:;"
                data-type="Problem"
                role="button"
              >
                <i
                  class="fa fa-navicon"
                  aria-hidden="true"
                ></i>
                提问</a>
            </div>
            <div class="btnBox">
              <a
                class="btn btn-warning btn-controler"
                href="javascript:;"
                data-type="Option"
                role="button"
              >
                <i
                  class="fa fa-navicon"
                  aria-hidden="true"
                ></i>
                引导</a>
            </div>
            <div class="btnBox">
              <a
                class="btn btn-info btn-controler"
                href="javascript:;"
                data-type="Answer"
                role="button"
              >
                <i
                  class="fa fa-navicon"
                  aria-hidden="true"
                ></i>
                回答</a>
            </div>
          </div>
          <el-divider></el-divider>
          <el-button
            v-if="!isEdit"
            type="primary"
            @click="submit"
            class="mgtp20"
          >保存
          </el-button>
          <el-button
            v-if="isEdit == true"
            type="primary"
            @click="editflow"
            class="mgtp20"
          >保存
          </el-button>
        </div>
      </el-col>
      <el-col :span="20">
        <div class="grid-content bg-purple-dark">
          <div
            class="col-md-10 bg-success min-height"
            id="drop-bg"
          >
            <div
              v-for="item in nodeList"
              :key="item.nodeId"
              :data-type="item.type"
              :data-name="item.name"
              :id="item.nodeId"
              class="pa"
              :class="'pa-'+item.type"
              :style="{'top':item.top+'px','left':item.left+'px'}"
            >
              <!--  -->
              <a
                v-if="item.type == 'Root'"
                class='btn btn-success'
                href='#'
                role='button'
              > {{item.nodeContent}}
                <!-- <span
                  class="delete-node pull-right"
                  data-type="deleteNode"
                  :data-id="item.nodeId"
                >X</span> -->
              </a>
              <!--  -->
              <a
                v-if="item.type == 'Exit'"
                class='btn btn-danger'
                href='#'
                role='button'
              > {{item.nodeContent}}
                <!-- <span
                  class="delete-node pull-right"
                  data-type="deleteNode"
                  :data-id="item.nodeId"
                >X</span> -->
              </a>
              <!-- handle btn -->
              <a
                v-if="item.type == 'Problem'"
                class='btn btn-primary'
                href='#'
                role='button'
                @dblclick="selectNode(item)"
                v-html="item.nodeContent"
              >
              </a>
              <a
                v-if="item.type == 'Option'"
                class='btn btn-warning'
                href='#'
                role='button'
                @dblclick="selectNode(item)"
                v-html="item.nodeContent"
              >
              </a>
              <a
                v-if="item.type == 'Answer'"
                class='btn btn-info'
                href='#'
                role='button'
                @dblclick="selectNode(item)"
                v-html="item.nodeContent"
              >
              </a>
              <span
                class="delete-node el-icon-circle-close"
                data-type="deleteNode"
                :data-id="item.nodeId"
              ></span>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>

    <el-dialog
      v-el-drag-dialog
      :title="filterSpace(curEditNode.type)"
      :visible.sync="dialogVisible1"
      :before-close="handleClose1"
      width="60%"
      class="dialog-box"
    >
      <el-form
        :model="ruleForm1"
        :rules="rules1"
        ref="ruleForm1"
        class="demo-ruleForm1"
      >
        <input
          type="hidden"
          v-model="ruleForm1.nodeId"
        >
        <!--        <el-form-item-->
        <!--          class="mgtp20"-->
        <!--          label="标题"-->
        <!--          prop="name"-->
        <!--        >-->
        <!--          <el-input-->
        <!--            id="name"-->
        <!--            type="input"-->
        <!--            v-model="ruleForm1.name"-->
        <!--            placeholder="请输入节点名"-->
        <!--            class="content"-->
        <!--          ></el-input>-->
        <!--        </el-form-item>-->
        <!-- <el-form-item
          class="mgtp20"
          prop="nodeContent"
        > -->
          <tinymce id="nodeContent" v-model="ruleForm1.nodeContent" :height="300"/>
        <!-- </el-form-item> -->
        <!-- <el-form-item
            v-if="curEditNode.type == 'Option'"
            v-for="(item, index) in ruleForm1.guidelist"
            :label="'引导' + index"
            :key="item.key"
            :prop="'guidelist.' + index + '.value'"
            :rules="{
                required: true, message: '引导条件不能为空', trigger: 'blur'
            }"
        >
            <div class="guide-item">
                <el-input :id="'guidelist.' + index + '.value'" v-model="item.value"></el-input>
                <el-button style="margin-left:10px" @click.prevent="removeGuide(item)">删除</el-button>
            </div>
        </el-form-item> -->
        <!-- <el-form-item> -->
          <!--          <el-button-->
          <!--            v-if="curEditNode.type == 'Option'"-->
          <!--            type="primary"-->
          <!--            @click="addGuide('ruleForm1')"-->
          <!--            class="mgtp20"-->
          <!--          >新增引导-->
          <!--          </el-button>-->
          <el-button
            type="primary"
            @click="submitForm('ruleForm1')"
            class="mgtp20"
          >保存
          </el-button>
        <!-- </el-form-item> -->
      </el-form>
    </el-dialog>
    <el-dialog
      title="'条件'"
      :visible.sync="dialogVisible2"
      :before-close="handleClose2"
      width="40%"
      class="dialog-box"
    >
      <el-form
        :model="ruleForm2"
        :rules="rules2"
        ref="ruleForm2"
        label-width="50px"
        class="demo-ruleForm2"
      >
        <input
          type="hidden"
          v-model="ruleForm2.id"
        >
        <el-form-item
          class="mgtp20"
          label="内容"
          prop="nodeContent"
        >
          <el-input
            type="input"
            v-model="ruleForm2.nodeContent"
            placeholder="请输入样本内容"
            class="content"
          ></el-input>
          <span>{{ruleForm2.conditions.length}}/30</span>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="conditions('ruleForm2')"
            class="mgtp20"
          >保存
          </el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
  import {mapState} from "vuex";
  import {getMultipleRounds, getAllMultipleRounds, addMultipleRounds, editMultipleRounds} from "@/api/expand/faq";
  import elDragDialog from "@/directive/el-drag-dialog";
  import {filterHTMLTag} from "@/utils";
  import {Message} from "element-ui";
  import Tinymce from '@/components/Tinymce';
  import flow from "@/components/Flow/index";

  const BTN_QUESTION = "提问";
  const BTN_ANSWER = "回答";
  const BTN_OPTION = "引导";

  export default {
    name: "FlowEdit",
    directives: {elDragDialog},
    components: {Tinymce},
    data() {
      return {
        dialogVisible1: false,
        dialogVisible2: false,
        curEditNode: {},
        ruleForm1: {
          nodeId: "",
          name: "",
          nodeContent: "",
          guidelist: [{value: ''}]
        },
        rules1: {
          nodeContent: [
            {required: true, message: "请输入样本内容", trigger: "blur"},
            //   { min: 0, max: 500, message: "长度在500个字以内", trigger: "blur" }
          ]
        },
        ruleForm2: {
          conditions: ""
        },
        rules2: {
          conditions: [
            {required: true, message: "请输入样本内容", trigger: "blur"},
            {min: 0, max: 30, message: "长度在30个字以内", trigger: "blur"}
          ]
        },
        questionlist: [],
        answerlist: [],
        problem: '',
        answer: ''
        //nodeList:data.nodeList,
      };
    },
    props: ["packageId", "faqId", "isEdit", 'faq_pkg', 'KNchildren'],
    computed: {
      ...mapState({
        nodedata: state => state.flow.data,
        nodeList: state => state.flow.data.nodeList,
        tinymceId: state => state.flow.tinymceId,
      }),
      flowName() {
        if (this.isEdit) {
          return '编辑流程';
        } else {
          return '新增流程';
        }
      }
    },
    watch: {
      nodeList(newValue, oldValue) {
        //alert(1);
        console.warn(newValue);
        let node = newValue[newValue.length - 1];
        this.$nextTick(function () {
          flow.initSetNode(node);
        });
      }
    },
    beforeMount() {
    },
    mounted() {

      if (this.isEdit == false) {
        getAllMultipleRounds().then(response => {
          let resp = response;
          if (resp.data.faqPackageId == null) {
            jsPlumb.batch(() => {
              flow.init();
            });
            return;
          }
        });
      } else {
        getMultipleRounds(this.faqId).then(resp => {
          // if (resp.data == [] || this.isEdit == false || resp.data.nodeList.length < 1) {
          //   jsPlumb.batch(() => {
          //     flow.init();
          //   });
          //   return;
          // }
          jsPlumb.batch(() => {
            this.packageId = resp.data.faqPackageId;
            //this.flowName = resp.data.problem;
            this.questionlist[0] = resp.data.problem;
            this.answerlist[0] = resp.data.answer;
            this.$store.commit("setNodeList", resp.data.nodeList);
            this.$nextTick(function () {
              flow.init({...this.nodedata});
            });
          });
        });

      }
    },
    destroyed() {
      this.$store.commit("setNodeList", []);
      //flow.firstInstance.reset()
      //   jsPlumb.empty("drop-bg");
    },
    methods: {
      filterSpace(type){
        let text = "";
        switch (type) {
          case "Problem":
            text = "提问";
            break;
          case "Option":
            text = "引导";
            break;
          case "Answer":
            text = "回答";
            break;
          default:
            break;
        }
        return `请编辑${text}内容`;

      },
      removeGuide(item) {
        var index = this.ruleForm1.guidelist.indexOf(item)
        if (index !== -1) {
          this.ruleForm1.guidelist.splice(index, 1)
        }
      },
      addGuide() {
        this.ruleForm1.guidelist.push({
          value: '',
          key: Date.now()
        });
      },
      destroyTinymce() {
        const tinymce = window.tinymce.get(this.tinymceId);
        this.$store.commit("setHasChange", false);
        if (this.fullscreen) {
          tinymce.execCommand('mceFullScreen');
        }

        if (tinymce) {
          tinymce.destroy();
        }
      },
      submit() {
        let params = {
          // faqId: "",
          faqPackageId: this.packageId,
          problem: this.questionlist[0],
          answer: this.answerlist[0],
          nodeList: flow.getLine(),
          faq_type: 1
        };
        console.warn('addparams', this.answerlist);
        addMultipleRounds(params).then(response => {
          if (response.code == 200) {
            Message({
              message: response.message,
              type: "success",
              duration: 5 * 1000
            });
            var timer = setTimeout(() => {
              this.$router.push({
                name: 'Qa',
                params: {KNchildren: this.KNchildren, faq_pkg: this.faq_pkg}
              });
            }, 1000);

          } else {
            Message({
              message: response.message,
              type: "warning",
              duration: 5 * 1000
            });

          }
        });
      },
      editflow() {
        // console.log('this.$route.params', this.$route.params);
        let params = {
          faqId: this.faqId,
          faqPackageId: this.packageId,
          problem: this.questionlist[0],
          answer: this.answerlist[0],
          nodeList: flow.getLine()
        };

        editMultipleRounds(this.faqId, params).then(response => {
          Message({
            message: response.message,
            type: "success",
            duration: 5 * 1000
          });
          var timer = setTimeout(() => {
            this.$router.push({
              name: 'Qa',
              params: {KNchildren: this.KNchildren, faq_pkg: this.faq_pkg}
            });
          }, 1000);

        });
      },
      selectNode(item) {
        console.warn(item);
        this.curEditNode = item;
        this.ruleForm1.name = this.curEditNode.name;
        this.ruleForm1.nodeId = this.curEditNode.nodeId;
        //this.ruleForm1.nodeContent = this.curEditNode.nodeContent;
        this.ruleForm1.nodeContent = this.filterNodeContent(this.curEditNode.nodeContent);
        this.ruleForm1.guidelist = this.curEditNode.guidelist ? this.curEditNode.guidelist : [{
          value: '',
          key: Date.now()
        }];
        this.dialogVisible1 = true;
      },
      filterNodeContent(nodeContent){
        if(nodeContent.trim() == BTN_QUESTION || nodeContent.trim() == BTN_ANSWER || nodeContent.trim() == BTN_OPTION){
          return "";
        }else{
          return nodeContent;
        }

      },
      handleClose1() {
        this.dialogVisible1 = false;
        this.$store.commit("setHasChange", false);
        //this.destroyTinymce()
      },
      handleClose2() {
        this.dialogVisible2 = false;
      },
      submitForm(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            console.warn(this.ruleForm1);
            this.$store.commit("editNode", this.ruleForm1);
            this.dialogVisible1 = false;
            //this.resetForm();
            this.$store.commit("setHasChange", false);
            if (this.curEditNode.type == 'Problem') {
              this.questionlist.push(filterHTMLTag(this.curEditNode.nodeContent));
            } else if (this.curEditNode.type == 'Option') {
              this.answerlist.push(filterHTMLTag(this.curEditNode.nodeContent));
            }
          } else {
            this.$store.commit("setHasChange", false);
            return false;
          }
        });
      },
      submitFormCondition(formName) {
        this.$refs[formName].validate(valid => {
          if (valid) {
            console.warn(this.ruleForm2);
            this.$store.commit("editNode", this.ruleForm1);
            this.dialogVisible2 = false;
            //this.resetForm();
          } else {
            return false;
          }
        });
      },
      // resetForm(formName) {
      //   this.ruleForm1 = {
      //     nodeId: "",
      //     name: "",
      //     nodeContent: "",
      //   };
      //   this.$store.commit("setHasChange", false);
      //
      // },
      resetForm(step) {
        this.$router.go(step);
      },
    }
  };
</script>

<style lang="scss" scoped>
  @import "~@/components/Flow/index.scss";

  .demo-ruleForm1 {
    width: 100%;
  }

  .navbar {
    margin-bottom: 0px;
  }

  /deep/ .el-dialog__body {
    padding: 30px 20px;
    color: #606266;
    font-size: 14px;
    word-break: break-all;
    max-height: 660px;
    overflow-y: auto;
  }

  .container-fluid {
    h1 {
      text-align: center;
    }

    margin: -40px -30px;

    .btnlist {
      margin: 100px 0px;
      display: flex;
      flex-flow: column nowrap;
      align-items: center;
    }

    .btnBox {
      margin-bottom: 10px;
    }

    .btn {
      display: inline-block;
    }

    .pa-Problem, .pa-Option, .pa-Answer {
      width: 200px;

      .btn {
        white-space: normal;
        width: 100%;
        text-align: justify;

        /deep/ p {
          overflow: hidden;
          text-overflow: ellipsis;
          display: -webkit-box;
          -webkit-line-clamp: 3;
          -webkit-box-orient: vertical;
          img{
            max-width:100%;
            height:auto;
          }
        }
      }
    }

    .overlayTextBg {
      background: #dff0d8;
      padding: 0px 4px;
    }
  }

  .tox-silver-sink {
    z-index: 9999 !important;
  }

  .guide-item {
    display: flex;
    flex-flow: row nowrap;
  }

  /deep/ ._jsPlumb_endpoint_anchor {
    transition: height 2s linear 0s;
    transform-origin: center;
  }
</style>
