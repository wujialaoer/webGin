<template>
  <div class="upload-container">
    <el-button :style="{background:color,borderColor:color}" icon="el-icon-upload" size="mini" type="primary"
               @click="dialogVisible=true">
      upload
    </el-button>
    <el-dialog
      :modal="false"
      :visible.sync="dialogVisible">
      <el-upload
        :multiple="true"
        :file-list="fileList"
        :headers="headers"
        :data="fileType"
        :show-file-list="true"
        :on-remove="handleRemove"
        :on-success="handleSuccess"
        :before-upload="beforeUpload"
        class="editor-slide-upload"
        :action="uploadImgUrl"
        list-type="picture-card"
      >
        <!-- :action="https://httpbin.org/post" -->
        <el-button size="small" type="primary">
          Click upload
        </el-button>
      </el-upload>
      <el-button @click="dialogVisible = false">
        Cancel
      </el-button>
      <el-button type="primary" @click="handleSubmit">
        Confirm
      </el-button>
    </el-dialog>
  </div>
</template>

<script>
  // import { getToken } from 'api/qiniu'
  import {uploadImage} from "@/api/expand/faq"

  export default {
    name: 'EditorSlideUpload',
    props: {
      color: {
        type: String,
        default: '#1890ff'
      }
    },
    data() {
      return {
        dialogVisible: false,
        listObj: {},
        fileList: [],
        fileType: {
          up_type: 'img'
        },
        headers: {
          Authorization: 'JWT ' + sessionStorage.getItem('access_token')
        },
        uploadImgUrl: uploadImage
      }
    },
    methods: {
      checkAllSuccess() {
        return Object.keys(this.listObj).every(item => this.listObj[item].hasSuccess)
      },
      handleSubmit() {
        const arr = Object.keys(this.listObj).map(v => this.listObj[v])
        if (!this.checkAllSuccess()) {
          this.$message('请耐心等待图片上传成功,如果网络有问题请稍后重试.Please wait for all images to be uploaded successfully. If there is a network problem, please refresh the page and upload again!')
          return
        }
        this.$emit('successCBK', arr)
        this.listObj = {}
        this.fileList = []
        this.dialogVisible = false
      },
      handleSuccess(resp, file) {
        const uid = file.uid
        const objKeyArr = Object.keys(this.listObj)
        for (let i = 0, len = objKeyArr.length; i < len; i++) {
          if (this.listObj[objKeyArr[i]].uid === uid) {
            this.listObj[objKeyArr[i]].url = process.env.VUE_APP_BASE_IMG_URL + resp.data.relativePaths[0]
            this.listObj[objKeyArr[i]].hasSuccess = true
            return
          }
        }
      },
      handleRemove(file) {
        const uid = file.uid
        const objKeyArr = Object.keys(this.listObj)
        for (let i = 0, len = objKeyArr.length; i < len; i++) {
          if (this.listObj[objKeyArr[i]].uid === uid) {
            delete this.listObj[objKeyArr[i]]
            return
          }
        }
      },
      beforeUpload(file) {
        const _self = this
        const _URL = window.URL || window.webkitURL
        const fileName = file.uid
        this.listObj[fileName] = {}
        return new Promise((resolve, reject) => {
          const img = new Image();
          img.src = _URL.createObjectURL(file);
          img.onload = function () {
            _self.listObj[fileName] = {hasSuccess: false, uid: file.uid, width: this.width, height: this.height}
          }
          resolve(true);
        })
      }
    }
  }
</script>

<style lang="scss" scoped>
  .editor-slide-upload {
    margin-bottom: 20px;

    /deep/ .el-upload--picture-card {
      width: 100%;
    }
  }
</style>
