<template>
    <div class="app-container page_shootStatement">
        <el-card class="box-card">
        <el-table
            :data="importData"
            class="tablelist"
            @selection-change="handleSelectionChange"
            @row-click="annotate2"
          >
            <el-table-column
              prop="id"
              label="#"
              width="100"
            >
              <template slot-scope="scope">
                {{ scope.$index }}
              </template>
            </el-table-column>
            <el-table-column
              prop="intentsName"
              label="训练语句"
            >
            </el-table-column>
            <el-table-column
              prop="text"
              width="100"
              label="知识包名"
            >
            </el-table-column>
          </el-table>
          <el-pagination
            class="mgtp20"
            layout="prev, pager, next"
            prev-text="上一页"
            next-text="下一页"
            :total="importData.length"
            @current-change="handleCurrentChange"
          >
          </el-pagination>
        <div class="footer">
            <el-button @click="resetForm(-1)" class="btn-cancel">返回</el-button>
        </div>
        </el-card>
    </div>
</template>
<script>
    export default {
        name:'shootStatement',
        data(){
            return{
                importData: [],
            }
        },
        methods:{
            handleCurrentChange(val){
                this.curPage = val;
                this.fetchData();
            },
            resetForm(step) {
                this.$router.go(step);
            }
        },
    }
</script>

<style lang="scss" scoped>
.title{
    font-size:16px;
    font-weight: 500;
    margin-bottom:20px;
}
.item{
    font-size:14px;
    margin-bottom:12px;
}
.btn-cancel{
    margin-right:15px;
}
.footer{
    margin-top:20px;
}
</style>
