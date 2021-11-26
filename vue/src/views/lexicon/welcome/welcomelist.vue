<template>
  <div class="app-container" v-if="$route.name == 'WelcomeDetail'">
    <div class="pany" style="margin-top:-15px">
      <el-row type="flex" class="row-bg" justify="space-between">
        <el-col :span="6">
          <el-button type="primary" plain @click="handleAdd">添加</el-button>
          <!--          <el-button type="info" plain disabled>导入</el-button>-->
        </el-col>
        <el-col :span="6">
          <div>
            <el-input placeholder="请输入关键词" class="searchword" v-model="searchword" @keyup.enter.native="seachKeyWords">
              <i slot="suffix" class="el-input__icon el-icon-search" @click="seachKeyWords"></i>
            </el-input>
          </div>
        </el-col>
      </el-row>

      <el-table
        v-loading="listLoading"
        :data="list"
        element-loading-text="Loading"
        fit
        highlight-current-row
      >
        <el-table-column align="center" label="#" width="95">
          <template slot-scope="scope">{{ (curPage - 1) * pageSize + scope.$index + 1 }}</template>
        </el-table-column>
        <el-table-column label="问候时间" width="160">
          <template slot-scope="scope">{{ scope.row.start_time}} - {{ scope.row.end_time }}</template>
        </el-table-column>
        <el-table-column label="问候日期" width="200">
          <template slot-scope="scope">{{ scope.row.start_datetime }} - {{ scope.row.end_datetime }}</template>
        </el-table-column>
        <el-table-column label="语句" align="center">
          <template slot-scope="scope">
            <span>{{ scope.row.sentence }}</span>
          </template>
        </el-table-column>
        <el-table-column label="个性" align="center" width="95">
          <template slot-scope="scope">
            <span>{{ scope.row.name }}</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="150">
          <template slot-scope="scope">
            <el-button size="mini" type="text" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
            <el-divider direction="vertical"></el-divider>
            <el-button size="mini" type="text" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        class="mgtp20"
        layout="prev, pager, next"
        :page-size="pageSize"
        prev-text="上一页"
        next-text="下一页"
        :total="totalCount"
        @current-change="handleCurrentChange"
      ></el-pagination>
    </div>
  </div>
</template>

<script>
  import {mapState} from "vuex";
  import {getQueryWelcomingPageList, deleteWelcomingById} from "@/api/expand/welcoming";
  import {formatTime} from "@/utils/index";
  import {formatDate} from "@/utils/index";

  export default {
    name: "welcomeList",
    data() {
      return {
        isEdit: false,
        curPage: 1,
        pageSize: 20,
        totalCount: 0,
        pageCount: 0,
        curEditForm: {},
        searchword: "",
        listLoading: true,
        list: [],
        personality: this.$route.params.personality,
        name: this.$route.params.name
      };
    },
    computed: {
      dialogTitle() {
        return this.isEdit == true ? '编辑' : '添加';
      },
    },
    mounted() {
      this.$route.meta.title = this.$route.params.name;
      if (this.$route.params.name) {
        localStorage.setItem("curCharacterName", this.$route.params.name);
      } else {
        this.name = localStorage.getItem("curCharacterName");
      }
    },
    created() {
      this.fetchData();
    },
    methods: {
      async fetchData() {
        this.listLoading = true;
        let data = {
          "personality": this.$route.params.personality,
          page: this.curPage,
          pageSize: this.pageSize,
        };
        if (this.searchword) {
          data = {
            // "Sentence.Operator": 8,
            "sentence": this.searchword,
            ...data
          };
        }
        let listData = await getQueryWelcomingPageList(data);
        this.totalCount = listData.data.totalCount;
        this.list = listData.data.data;
        // this.list.start_datetime = formatDate(this.list.start_datetime, "yyyy-MM-dd");
        this.listLoading = false;
      },
      seachKeyWords() {
        this.curPage = 1;
        this.fetchData();
      },

      handleAdd() {
        this.$router.push({
          name: "Addwelcome",
          params: {personality: this.personality, name: this.name}
        });
      },
      handleEdit(index, row) {
        // alert(1);
        //this.editType = "edit";
        this.editIndex = index;
        this.dialogVisible2 = true;
        this.$router.push({
          name: "Addwelcome",
          params: {
            isEdit: true,
            name: row.name,
            personality: row.personality,
            sentence: row.sentence,
            start_time: row.start_time,
            end_time: row.end_time,
            start_datetime: row.start_datetime,
            end_datetime: row.end_datetime,
            version: row.version,
            id: row.id
          }
        });
      },
      handleDelete(index, data) {
        deleteWelcomingById(data.id).then(() => {
          this.fetchData();
        });
      },
      handleCurrentChange(val) {
        //分页
        this.curPage = val;
        this.$nextTick(() => {
          window.scrollTo(0, 0);
        });
        this.fetchData();
      },
    }
  };
</script>

<style lang="scss" scoped>
</style>
