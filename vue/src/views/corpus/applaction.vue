<template>
  <div class="app-container page_intention">
    <el-card class="box-card" shadow="never">

      <el-col :span="10">
        <el-select
          v-model="curSelProject"
          placeholder="请选择"
        >
          <el-option
            v-for="item in projectLists"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
        <el-select
          v-model="curSelApp"
          placeholder="请选择"
        >
          <el-option
            v-for="item in appLists"
            :key="item.value"
            :label="item.label"
            :value="item.value"
          >
          </el-option>
        </el-select>
      </el-col>
      <el-col
        :span="3"
        :offset="11"
      >
        <el-button
          class="fr"
          type="danger"
          size="medium"
          icon="el-icon-plus"
          @click="dialogVisible=true"
        >新增应用</el-button>
      </el-col>
    </el-card>
    <el-row :gutter="20">
      <el-col
        :span="6"
        v-for="(item, index) in appLists"
        :key="index"
      >
        <div
          class="intention"
          :style="{borderColor: color[index%7]}"
          @click="toCorpus(item, index)"
        >
          <p class="title">{{item.title}}</p>
          <div class="intro">
            意图：{{item.inten}}
            <el-divider direction="vertical"></el-divider>
            实体：{{item.entity}}
          </div>

          <a>
            <el-badge
              :value="item.unread"
              class="item"
            >
              <img
                src="~@/assets/img/bot_06_more.png"
                alt=""
              >
            </el-badge>

          </a>
          <el-button
            size="mini"
            class="edit"
            @click.stop="edit(item, index)"
          >编辑</el-button>
          <el-button
            size="mini"
            class="delete"
            @click.stop="deleteItem(item, index)"
          >删除</el-button>

        </div>
      </el-col>
      <el-col :span="6">
        <div
          class="add"
          @click="dialogVisible=true"
        >
          <img
            src="~@/assets/img/bot_07_add.png"
            alt=""
          >
          新增应用
        </div>
      </el-col>
    </el-row>
    <el-dialog
      title="新增应用"
      :visible.sync="dialogVisible"
      :before-close="handleClose"
      width="40%"
      class="dialog-box"
    >
      <el-form
        :model="ruleForm"
        :rules="rules"
        ref="ruleForm"
        label-width="50px"
        class="demo-ruleForm"
      >
        <el-form-item
          label="名称"
          prop="title"
        >
          <el-input
            v-model="ruleForm.title"
            class="title"
            placeholder="请输入意图名称"
          ></el-input>
          <span>18个字以内</span>
        </el-form-item>
        <el-form-item
          class="mgtp20"
          label="描述"
          prop="intro"
        >
          <el-input
            type="textarea"
            v-model="ruleForm.intro"
            class="intro"
          ></el-input>
          <span>{{ruleForm.intro.length}}/24</span>
        </el-form-item>
        <el-form-item>
          <el-button
            type="primary"
            @click="submitForm('ruleForm')"
            class="mgtp20"
          >保存</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "page_intention",
  data() {
    return {
      curIntention: "",
      dialogVisible: false,
      curSelProject: "默认",
      curSelApp: "默认",
      projectLists: [{ label: "", value: "" }],
      color: [
        "#2BCCC0",
        "#FE7156",
        "#4693FF",
        "#F9C22D",
        "#24BEE3",
        "#5FCC7C",
        "#FB8421"
      ],
      eventList: [
        {
          headImg: require("@/assets/img/headimg.jpg"),
          name: "Admin",
          place: "简单问候",
          event: "10条训练样本",
          time: "刚刚"
        }
      ],
      ruleForm: {
        title: "",
        intro: ""
      },
      rules: {
        title: [
          { required: true, message: "请输入意图名称", trigger: "blur" },
          { min: 0, max: 18, message: "长度在18个字以内", trigger: "blur" }
        ],
        intro: [
          { required: true, message: "请填写活动形式", trigger: "blur" },
          { min: 0, max: 24, message: "长度在24个字以内", trigger: "blur" }
        ]
      },
      editType: "add",
      editIndex: 0
    };
  },
  computed: {
    ...mapState({
      projectMangerList: state => state.projectManger.projectManger,
      curIntentionName: state => state.projectManger.curIntentionName,
      curProjectName: state => state.projectManger.curProjectName,
      appLists: state => state.intentionSample.appLists
    })
  },
  created() {},
  mounted() {
    console.warn(this.$route);
  },
  methods: {
    toCorpus(item, index) {
      //let curPath = this.$router.currentRoute;
      //console.warn(`${curPath.path}/${item.sid}`);
      //   this.$store.commit("setCurSampleIndex", index);
      //   this.$store.commit("setCurSampleItem", item);
      //this.$router.push({ path: `${curPath.path}/${item.sid}`})
      this.$router.push({
        path: "/corpus/index"
        //path: `${curPath.path}/detail`,
        //query: { sid: item.sid }
      });
    },
    addIntention() {
      this.dialogNewProject = true;
      this.projectFormType = "add";
      this.projectDialogTitleName = "新增意图";
    },
    submitForm(formName) {
      this.$refs[formName].validate(valid => {
        if (valid) {
          if (this.editType === "add") {
            this.intentionList.push(this.ruleForm);
          } else {
            this.intentionList.splice(this.editIndex, 1, this.ruleForm);
          }
          this.dialogVisible = false;
        } else {
          return false;
        }
      });
    },
    deleteItem(item, index) {
      this.$confirm("确定删除 " + item.title + "意图").then(_ => {
        this.intentionList.splice(index, 1);
      });
    },
    edit(item, index) {
      this.editType = "edit";
      this.ruleForm = {
        title: item.title,
        intro: item.intro
      };
      this.editIndex = index;
      this.dialogVisible = true;
    },
    handleClose() {
      this.editType = "add";
      this.ruleForm = {
        title: "",
        intro: ""
      };
      this.dialogVisible = false;
    }
  }
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss">
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
.page_intention {
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
    .pany-l {
    }
    .pany-r {
      margin-top: 8px;
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

  .add {
    background: #fff;
    margin-bottom: 15px;
    height: 100px;
    padding: 15px;
    border-radius: 5px;
    text-align: center;
    color: #666;
    line-height: 70px;

    img {
      margin-right: 8px;
      position: relative;
      top: 2px;
    }
  }

  .intention {
    background: #fff;
    margin-bottom: 15px;
    height: 100px;
    padding: 15px;
    border-radius: 5px;
    border-left: 5px solid #2bccc0;
    position: relative;

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

    a {
      position: absolute;
      right: 15px;
      top: 15px;
    }

    &:hover .el-button--mini {
      display: block;
    }

    .el-button--mini {
      padding: 5px 8px;
      // padding-top: 0;
      border: none;
      box-shadow: 0px 2px 6px 0px rgba(96, 144, 210, 0.15);
      position: absolute;
      right: 5px;
      bottom: 5px;
      font-size: 14px;
      display: none;
    }
    .edit {
      right: 5px;
      bottom: 29px;
      color: #4693ff;
      border-bottom: 1px solid #eee;
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
</style>
