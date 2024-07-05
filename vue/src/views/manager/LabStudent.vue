<template>
  <div>
    <div class="search">
      <el-select v-model="typeId" placeholder="请选择会议室分类" style="width: 200px">
        <el-option v-for="item in typeData" :label="item.name" :value="item.id"></el-option>
      </el-select>
      <el-input placeholder="请输入会议室编号" style="width: 200px; margin-left: 5px" v-model="name"></el-input>
      <el-button type="info" plain style="margin-left: 10px" @click="load(1)">查询</el-button>
      <el-button type="warning" plain style="margin-left: 10px" @click="reset">重置</el-button>
    </div>
    <div class="table">
      <div>
        <el-row :gutter="20">
          <el-col :span="5" v-for="item in tableData">
            <div style="background-color: #ecf7fc" class="card">
              <div style="color: #474849">会议室编号：
                <span style="font-size: 16px; font-weight: 550; color: #FF7E12">{{ item.name }}</span>
              </div>
              <div style="color: #474849; margin-top: 10px">名称：{{ item.descr }}</div>
              <div style="color: #474849; margin-top: 5px">类型：{{ item.typeName }}</div>
              <div style="color: #474849; margin-top: 5px">状态：
                <span style="font-weight: 550; color: #3c9e25" v-if="item.status === '空闲中'">{{ item.status }}</span>
                <span style="font-weight: 550; color: red" v-else>{{ item.status }}</span>
              </div>
              <div style="color: #474849; margin-top: 10px">开放时间：{{ item.start }} - {{ item.end }}</div>
              <div style="margin-top: 15px">
                <el-button type="primary" size="mini" @click="reserve(item)" :disabled="item.status === '使用中'">预约</el-button>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
      <div class="pagination">
        <el-pagination
            background
            @current-change="handleCurrentChange"
            :current-page="pageNum"
            :page-sizes="[5, 10, 20]"
            :page-size="pageSize"
            layout="total, prev, pager, next"
            :total="total">
        </el-pagination>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Lab",
  data() {
    return {
      tableData: [],  // 所有的数据
      pageNum: 1,   // 当前的页码
      pageSize: 10,  // 每页显示的个数
      total: 0,
      name: null,
      typeId: null,
      form: {},
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      rules: {},
      typeData: []
    }
  },
  created() {
    this.load(1)
    this.loadType()
  },
  methods: {
    reserve(item) {
      let data = {
        labId: item.id,
        labadminId: item.labadminId,
        studentId: this.user.id,
        status: '待审核',
        dostatus: '待审核'
      }
      this.$request.post('/reserve/add', data).then(res => {
        if (res.code === '200') {
          this.$message.success('操作成功，等待管理员审核')
          this.load(1)
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    loadType() {
      this.$request.get('/type/selectAll').then(res => {
        if (res.code === '200') {
          this.typeData = res.data
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    load(pageNum) {  // 分页查询
      if (pageNum) this.pageNum = pageNum
      this.$request.get('/lab/selectPage', {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          name: this.name,
          typeId: this.typeId,
        }
      }).then(res => {
        this.tableData = res.data?.list
        this.total = res.data?.total
      })
    },
    reset() {
      this.name = null
      this.typeId = null
      this.load(1)
    },
    handleCurrentChange(pageNum) {
      this.load(pageNum)
    },
  }
}
</script>

<style scoped>
.el-col-5{
  width: 20%;
  max-width: 20%;
  padding: 10px 10px;
}
</style>
