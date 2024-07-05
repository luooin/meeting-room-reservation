<template>
  <div>
    <div class="search">
      <el-select v-model="status" placeholder="请选择审核状态" style="width: 200px">
        <el-option label="待审核" value="待审核"></el-option>
        <el-option label="审核通过" value="审核通过"></el-option>
        <el-option label="审核不通过" value="审核不通过"></el-option>
      </el-select>
      <el-button type="info" plain style="margin-left: 10px" @click="load(1)">查询</el-button>
      <el-button type="warning" plain style="margin-left: 10px" @click="reset">重置</el-button>
    </div>

    <div class="table">
      <el-table :data="tableData" stripe>
        <el-table-column prop="id" label="序号" width="80" align="center" sortable></el-table-column>
        <el-table-column prop="labName" label="会议室" show-overflow-tooltip></el-table-column>
        <el-table-column prop="labadminName" label="会议室管理员" show-overflow-tooltip></el-table-column>
        <el-table-column prop="studentName" label="预约人" show-overflow-tooltip></el-table-column>
        <el-table-column prop="time" label="操作时间"></el-table-column>
        <el-table-column prop="start" label="使用时间段">
          <template v-slot="scope">
            {{scope.row.start}} ~ {{scope.row.end}}
          </template>
        </el-table-column>
        <el-table-column prop="status" label="预约状态"></el-table-column>
        <el-table-column prop="dostatus" label="使用状态"></el-table-column>

        <el-table-column label="操作" width="180" align="center">
          <template v-slot="scope">
            <el-button plain type="warning" size="mini" @click="del(scope.row.id)" v-if="user.role === 'STUDENT' && scope.row.status === '待审核'">取消预约</el-button>
            <el-button plain type="warning" size="mini" @click="changeStatus(scope.row, '审核通过')" v-if="user.role !== 'STUDENT' && scope.row.status === '待审核'">通过</el-button>
            <el-button plain type="warning" size="mini" @click="changeStatus(scope.row, '审核不通过')" v-if="user.role !== 'STUDENT' && scope.row.status === '待审核'">不通过</el-button>
            <el-button plain type="warning" size="mini" @click="changeStatus(scope.row, '已结束')" v-if="user.role !== 'STUDENT' && scope.row.dostatus === '使用中'">结束使用</el-button>
            <el-button plain type="warning" size="mini" @click="initDialog(scope.row)" v-if="user.role === 'STUDENT' && scope.row.dostatus === '已结束'">我要报修</el-button>
          </template>
        </el-table-column>
      </el-table>

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

    <el-dialog title="报修反馈信息" :visible.sync="fromVisible" width="40%" :close-on-click-modal="false" destroy-on-close>
      <el-form label-width="100px" style="padding-right: 50px" :model="form" :rules="rules" ref="formRef">
        <el-form-item prop="name" label="报修说明">
          <el-input type="textarea" :rows="5" v-model="form.name" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="fromVisible = false">取 消</el-button>
        <el-button type="primary" @click="submit">确 定</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
export default {
  name: "Reserve",
  data() {
    return {
      tableData: [],  // 所有的数据
      pageNum: 1,   // 当前的页码
      pageSize: 10,  // 每页显示的个数
      total: 0,
      status: null,
      fromVisible: false,
      form: {},
      user: JSON.parse(localStorage.getItem('xm-user') || '{}'),
      rules: {
        name: [
          {required: true, message: '请填写报修说明', trigger: 'blur'},
        ]
      },
      ids: []
    }
  },
  created() {
    this.load(1)
  },
  methods: {
    initDialog(row) {
      this.form = JSON.parse(JSON.stringify(row))
      this.fromVisible = true
    },
    submit() {
      // 提交报修信息
      let data = {
        name: this.form.name,
        studentId: this.user.id,
        labId: this.form.labId,
        labadminId: this.form.labadminId,
        status: '待处理'
      }
      this.$request.post('/fix/add', data).then(res => {
        if (res.code === '200') {
          this.$message.success('操作成功')
          this.fromVisible = false
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    changeStatus(row, status) {
      let data = JSON.parse(JSON.stringify(row))
      if ('审核通过' === status) {
        data.dostatus = '使用中'
        data.status = status
      }
      if ('审核不通过' === status) {
        data.dostatus = status
        data.status = status
      }
      if ('已结束' === status) {
        data.dostatus = '已结束'
      }
      this.$request.put('/reserve/update', data).then(res => {
        if (res.code === '200') {
          this.$message.success('操作成功')
          this.load(1)
        } else {
          this.$message.error(res.msg)
        }
      })
    },
    del(id) {   // 单个删除
      this.$confirm('您确定取消预约吗？', '灵魂拷问', {type: "warning"}).then(response => {
        this.$request.delete('/reserve/delete/' + id).then(res => {
          if (res.code === '200') {   // 表示操作成功
            this.$message.success('操作成功')
            this.load(1)
          } else {
            this.$message.error(res.msg)  // 弹出错误的信息
          }
        })
      }).catch(() => {
      })
    },
    load(pageNum) {  // 分页查询
      if (pageNum) this.pageNum = pageNum
      this.$request.get('/reserve/selectPage', {
        params: {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          status: this.status,
        }
      }).then(res => {
        this.tableData = res.data?.list
        this.total = res.data?.total
      })
    },
    reset() {
      this.status = null
      this.load(1)
    },
    handleCurrentChange(pageNum) {
      this.load(pageNum)
    },
  }
}
</script>

<style scoped>

</style>
