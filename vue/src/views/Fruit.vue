<template>
    <div style="padding: 10px">
        <!--    功能区域-->
        <div style="margin: 10px 0">
            <el-button type="primary" @click="add" v-if="user.role === 1">新增</el-button>
            <el-button type="success" style="margin-left: 5px" @click="load">刷新</el-button>
        </div>

        <!--    搜索区域-->
        <div style="margin: 10px 0">
            <el-input v-model="search1" placeholder="请输入水果名称" style="width: 12%" clearable></el-input>
            <el-button type="primary" style="margin-left: 5px" @click="load1">查询</el-button>
            &nbsp;&nbsp;
            <el-input v-model="search2" placeholder="请输入水果产地" style="width: 12%" clearable></el-input>
            <el-button type="primary" style="margin-left: 5px" @click="load2">查询</el-button>
            &nbsp;&nbsp;
            <el-input v-model="search3" placeholder="请输入最低价" style="width: 10%" clearable></el-input>
            -
            <el-input v-model="search4" placeholder="请输入最高价" style="width: 10%" clearable></el-input>
            <el-button type="primary" style="margin-left: 5px" @click="load3">查询</el-button>
        </div>

        <el-table
                v-loading="loading"
                :data="tableData"
                border
                stripe
                style="width: 100%">
            <el-table-column
                    prop="id"
                    label="ID"
                    sortable
            >
            </el-table-column>
            <el-table-column
                    prop="name"
                    label="名称">
            </el-table-column>
            <el-table-column
                    prop="price"
                    label="单价">
            </el-table-column>
            <el-table-column
                    prop="source"
                    label="产地">
            </el-table-column>
            <el-table-column
                    prop="productionDate"
                    label="生产日期">
            </el-table-column>
            <el-table-column
                    label="图片">
                <template #default="scope">
                    <el-image
                            style="width: 100px; height: 100px"
                            :src="scope.row.picture"
                            :preview-src-list="[scope.row.picture]">
                    </el-image>
                </template>
            </el-table-column>
            <el-table-column label="操作" v-if="user.role === 1">
                <template #default="scope">
                    <el-button size="mini" @click="handleEdit(scope.row)" v-if="user.role === 1">编辑</el-button>
                    <el-popconfirm title="确定删除吗？" @confirm="handleDelete(scope.row.id)" v-if="user.role === 1">
                        <template #reference>
                            <el-button size="mini" type="danger">删除</el-button>
                        </template>
                    </el-popconfirm>
                </template>
            </el-table-column>
        </el-table>

        <div style="margin: 10px 0">
            <el-pagination
                    @size-change="handleSizeChange"
                    @current-change="handleCurrentChange"
                    :current-page="currentPage"
                    :page-sizes="[5, 10, 20]"
                    :page-size="pageSize"
                    layout="total, sizes, prev, pager, next, jumper"
                    :total="total">
            </el-pagination>

            <el-dialog title="水果管理" v-model="dialogVisible" width="30%">
                <el-form :model="form" label-width="120px">
                    <el-form-item label="名称">
                        <el-input v-model="form.name" style="width: 80%"></el-input>
                    </el-form-item>
                    <el-form-item label="价格">
                        <el-input v-model="form.price" style="width: 80%"></el-input>
                    </el-form-item>
                    <el-form-item label="产地">
                        <el-input v-model="form.source" style="width: 80%"></el-input>
                    </el-form-item>
                    <el-form-item label="生产日期">
                        <el-date-picker v-model="form.productionDate" value-format="YYYY-MM-DD" type="date"
                                        style="width: 80%" clearable></el-date-picker>
                    </el-form-item>
                    <el-form-item label="图片">
                        <el-upload ref="upload" :action="filesUploadUrl" :on-success="filesUploadSuccess">
                            <el-button type="primary">点击上传</el-button>
                        </el-upload>
                    </el-form-item>
                </el-form>
                <template #footer>
          <span class="dialog-footer">
            <el-button @click="dialogVisible = false">取 消</el-button>
            <el-button type="primary" @click="save">确 定</el-button>
          </span>
                </template>
            </el-dialog>

        </div>
    </div>
</template>

<script>


    import request from "@/utils/request";

    export default {
        name: 'Fruit',
        components: {},
        data() {
            return {
                user: {},
                loading: true,
                form: {},
                dialogVisible: false,
                search1: '',
                search2: '',
                search3: '',
                search4: '',
                currentPage: 1,
                pageSize: 10,
                total: 0,
                tableData: [],
                filesUploadUrl: "http://" + window.server.filesUploadUrl + ":9090/files/upload"
            }
        },
        created() {
            let userStr = sessionStorage.getItem("user") || "{}"
            this.user = JSON.parse(userStr)
            // 请求服务端，确认当前登录用户的合法信息(相对安全，防止网页改user.role的值)
            request.get("/user/" + this.user.id).then(res => {
                if (res.code === '0') {
                    this.user = res.data
                }
            })

            this.load()
            this.load1()
            this.load2()
            this.load3()
        },
        methods: {
            filesUploadSuccess(res) {
                console.log(res)
                this.form.picture = res.data
            },
            load() {
                this.loading = true
                request.get("/fruit", {
                    params: {
                        pageNum: this.currentPage,
                        pageSize: this.pageSize
                    }
                }).then(res => {
                    this.loading = false
                    this.tableData = res.data.records
                    this.total = res.data.total
                })
            },
            load1() {
                this.loading = true
                request.get("/fruit", {
                    params: {
                        pageNum: this.currentPage,
                        pageSize: this.pageSize,
                        search1: this.search1
                    }
                }).then(res => {
                    this.loading = false
                    this.tableData = res.data.records
                    this.total = res.data.total
                })
            },
            load2() {
                this.loading = true
                request.get("/fruit", {
                    params: {
                        pageNum: this.currentPage,
                        pageSize: this.pageSize,
                        search2: this.search2
                    }
                }).then(res => {
                    this.loading = false
                    this.tableData = res.data.records
                    this.total = res.data.total
                })
            },
            load3() {
                this.loading = true
                request.get("/fruit", {
                    params: {
                        pageNum: this.currentPage,
                        pageSize: this.pageSize,
                        search3: this.search3,
                        search4: this.search4
                    }
                }).then(res => {
                    this.loading = false
                    this.tableData = res.data.records
                    this.total = res.data.total
                })
            },
            add() {
                this.dialogVisible = true
                this.form = {}
                if (this.$refs['upload']) {
                    this.$refs['upload'].clearFiles()  // 清除历史文件列表
                }
            },
            save() {
                if (this.form.id) {  // 更新
                    request.put("/fruit", this.form).then(res => {
                        console.log(res)
                        if (res.code === '0') {
                            this.$message({
                                type: "success",
                                message: "更新成功"
                            })
                        } else {
                            this.$message({
                                type: "error",
                                message: res.msg
                            })
                        }
                        this.load() // 刷新表格的数据
                        this.dialogVisible = false  // 关闭弹窗
                    })
                } else {  // 新增
                    request.post("/fruit", this.form).then(res => {
                        console.log(res)
                        if (res.code === '0') {
                            this.$message({
                                type: "success",
                                message: "新增成功"
                            })
                        } else {
                            this.$message({
                                type: "error",
                                message: res.msg
                            })
                        }

                        this.load() // 刷新表格的数据
                        this.dialogVisible = false  // 关闭弹窗
                    })
                }

            },
            handleEdit(row) {
                this.form = JSON.parse(JSON.stringify(row))
                this.dialogVisible = true
                //this.$nextTick()将回调延迟到下次 DOM 更新循环之后执行。
                this.$nextTick(() => {
                    if (this.$refs['upload']) {
                        this.$refs['upload'].clearFiles()  // 清除历史文件列表
                    }
                })

            },
            handleDelete(id) {
                console.log(id)
                request.delete("/fruit/" + id).then(res => {
                    if (res.code === '0') {
                        this.$message({
                            type: "success",
                            message: "删除成功"
                        })
                    } else {
                        this.$message({
                            type: "error",
                            message: res.msg
                        })
                    }
                    this.load()  // 删除之后重新加载表格的数据
                })
            },
            handleSizeChange(pageSize) {   // 改变当前每页的个数触发
                this.pageSize = pageSize
                this.load()
            },
            handleCurrentChange(pageNum) {  // 改变当前页码触发
                this.currentPage = pageNum
                this.load()
            }
        }
    }
</script>
