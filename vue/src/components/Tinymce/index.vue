<template>
  <div :class="{fullscreen:fullscreen}" class="tinymce-container" :style="{width:containerWidth}">
    <textarea :id="tinymceId" class="tinymce-textarea" />
    <!-- <div class="editor-custom-btn-container">
        <editor-image class="editor-upload-btn" @successCBK="imageSuccessCBK"></editor-image>
    </div> -->

  </div>
</template>

<script>
//import editorImage from './components/EditorImage';
import request from "@/utils/request";
import plugins from './plugins';
import toolbar from './toolbar';
import { mapState } from "vuex";
import {uploadImage} from "@/api/expand/faq";

export default {
  name: 'Tinymce',
  //components: { editorImage },
  props: {
    id: {
      type: String,
      default: function() {
        return 'vue-tinymce-' + +new Date() + ((Math.random() * 1000).toFixed(0) + '');
      }
    },
    value: {
      type: String,
      default: ''
    },
    toolbar: {
      type: Array,
      required: false,
      default() {
        return [];
      }
    },
    menubar: {
      type: String,
      default: 'file edit insert view format table'
    },
    height: {
      type: [Number, String],
      required: false,
      default: 260
    },
    width: {
      type: [Number, String],
      required: false,
      default: 'auto'
    }
  },
  data() {
    return {
      listObj:{},
      hasInit: false,
      tinymceId: this.id,
      fullscreen: false,
      languageTypeList: {
        'en': 'en',
        'zh': 'zh_CN'
      },
      uploadImgUrl: uploadImage,
      headers: {
          Authorization: 'JWT ' + sessionStorage.getItem('access_token')
        },
    };
  },
  computed: {
    ...mapState({
      hasChange: state => state.flow.hasChange,
    }),
    language() {
      return this.languageTypeList[this.$store.getters.language];
    },
    containerWidth() {
      const width = this.width;
      if (/^[\d]+(\.[\d]+)?$/.test(width)) { // matches `100`, `'100'`
        return `${width}px`;
      }
      return width;
    }
  },
  watch: {
    value(val) {
      if (!this.hasChange && this.hasInit) {
        this.$nextTick(() =>{
        console.warn(1111111);
          window.tinymce.get(this.tinymceId).setContent(val || '');});

      }
    },
    language() {
      this.destroyTinymce();
      this.$nextTick(() => this.initTinymce());
    }
  },
  mounted() {
    this.initTinymce();
  },
  activated() {
    this.initTinymce();
  },
  deactivated() {
    this.destroyTinymce();
  },
  destroyed() {
    this.destroyTinymce();
  },
  methods: {
    initTinymce() {
      const _this = this;
      window.tinymce.init({
        selector: `#${this.tinymceId}`,
        language: this.language,
        height: this.height,
        body_class: 'panel-body ',
        draggable_modal:true,
        branding: false,//去除右下角的'由tinymce驱动'
        object_resizing: "img",
        toolbar: this.toolbar.length > 0 ? this.toolbar : toolbar,
        fontsize_formats: "10px 12px 14px 16px 18px 22px 24px 36px",
        //menubar: this.menubar,
        menubar: "",
        plugins: plugins,
        images_upload_url: this.uploadImgUrl,
        images_upload_handler:this.hanldeUploadImg,
        images_upload_credentials:false,
        end_container_on_empty_block: false,   //空元素回车将其拆分
        powerpaste_word_import: 'clean', //此设置控制如何筛选从 microsoftword 粘贴的内容 clean  merge  prompt
        code_dialog_height: 350,
        code_dialog_width: 600,
        advlist_bullet_styles: 'square',
        advlist_number_styles: 'default',
        default_link_target: '_blank',
        link_title: false,
        forced_root_block:"",
        nonbreaking_force_tab: true, // inserting nonbreaking space &nbsp; need Nonbreaking Space Plugin
        init_instance_callback: editor => {
            _this.$store.commit("setTinymceId",_this.tinymceId);
          if (_this.value) {
            editor.setContent(_this.value);
          }
          _this.hasInit = true;
          editor.on('NodeChange Change KeyUp SetContent', () => {   //输入框任何操作都会触发
          console.warn(22222);
            this.$store.commit("setHasChange",true);
            this.$emit('input', editor.getContent());
          });
        },
        setup(editor) {
          editor.on('FullscreenStateChanged', (e) => {
            _this.fullscreen = e.state;
          });
        }
      });
    },
    destroyTinymce() {
      const tinymce = window.tinymce.get(this.tinymceId);
      if (this.fullscreen) {
        tinymce.execCommand('mceFullScreen');
      }

      if (tinymce) {
        tinymce.destroy();
      }
    },
    setContent(value) {
      window.tinymce.get(this.tinymceId).setContent(value);
    },
    getContent() {
      window.tinymce.get(this.tinymceId).getContent();
    },
    hanldeUploadImg(blobInfo, succFun, failFun){
        var file = blobInfo.blob();//转化为易于理解的file对象
        /* eslint-disable no-undef */
        let param = new FormData();  // 创建form对象
        param.append('file', file);  // 通过append向form对象添加数据
        param.append('up_type', 'img'); // 添加form表单中其他数据
        console.log(param.get('file')); // FormData私有类对象，访问不到，可以通过get判断值是否传进去
        let config = {
          headers: {
            'Content-Type': 'multipart/form-data',
            Authorization: 'JWT ' + sessionStorage.getItem('access_token')
        }};
        request({
          url: this.uploadImgUrl,
          method: "POST",
          data:param,
          ...config
        }).then((resp)=>{
          //this.handleSuccess(resp,file);
          succFun(process.env.VUE_APP_BASE_IMG_URL + resp.data.relativePaths[0]);

          console.log(resp);
        });
    },
  }
};
</script>

<style scoped>
.tinymce-container {
  position: relative;
  line-height: normal;
}
.mce-stack-layout{
    background:#fff !important;
}
.tinymce-container>>>.mce-fullscreen {
  z-index: 10000;
}
.tinymce-textarea {
  visibility: hidden;
  z-index: -1;
}
.editor-custom-btn-container {
  position: absolute;
  right: 4px;
  top: 4px;
  /*z-index: 2005;*/
}
.fullscreen .editor-custom-btn-container {
  z-index: 10000;
  position: fixed;
}
.editor-upload-btn {
  display: inline-block;
}

</style>
