<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>员工列表</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css ">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div align="center" class="layui-form">
    <div class="demoTable">
        <div class="layui-inline">
            <input class="layui-input" style="width: 200px;" name="name" id="name" placeholder="请输入名字查找" autocomplete="off">
        </div>
        <div class="layui-input-inline">
            <select name="deptId" id="deptId"  lay-verify="required">
                <option value="0">请选择部门查找</option>
                <c:forEach items="${deptList}" var="dept">
                    <option value="${dept.deptno}">${dept.dName}</option>
                </c:forEach>
            </select>
        </div>
        <button class="layui-btn" style="width: 100px;background-color: skyblue;;margin-left: 10px;" data-type="reload">查询</button>
        <button class="layui-btn" style="width: 100px;background-color: skyblue;margin-left: 60px;" data-type="add">添加</button>
    </div>
    <table class="layui-hide" id="empList"  lay-filter="demo" lay-skin="nob"></table>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs"  lay-event="udp">修改</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs"  lay-event="del">删除</a>
</script>
<script>
    layui.use(['table','layer'], function(){
        var table = layui.table
            ,$ = layui.jquery
            ,layer = layui.layer;
        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        var active = {
            reload: function(){
                //获取查询框的值
                var name = $('#name').val();
                var deptno = $('#deptId').val();
                //执行重载
                table.reload('empList', {
                    url:'getEmpList'
                    ,where: {
                        ename: name
                        ,deptno:deptno
                    },
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                }, 'data');
            },
            add:function() {
                layer.open({
                    type: 2,
                    title: "新增员工",
                    content: "addEmp",
                    area: ['800px', '500px'],//设置弹框的宽高
                    shadeClose: true //点击遮罩是否关闭弹窗
                })
            }
        };

        table.render({
            elem: '#empList'//对应table的id属性
            ,url:'getEmpList'
            ,width: 1150
            ,height: 500
            ,cols: [[
                {type:'checkbox'}
                ,{type:'numbers',title: '序号'}
                ,{field:'empno',title:'员工编号',sort:true}
                ,{field:'ename',title: '员工姓名'}
                ,{field:'sex',title: '性别',templet:function (d) {
                        if(d.sex == 1) {
                            return "女";
                        } else {
                            return "男";
                        }
                    }}
                ,{field:'contact',title: '联系方式'}
                ,{field:'dname',title: '部门名称'}
                ,{field:'position',title: '职位'}
                ,{fixed:'right',title: '操作', align:'center', toolbar: '#barDemo'}
            ]]
            ,page: true
            ,limit:10
            ,limits:[10,20,40,50]
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": 0, //解析接口状态
                    "msg": '', //解析提示文本
                    "count": res.count, //解析数据长度
                    "data": res.list //解析数据列表
                };
            }
            ,id: 'empList'
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event == 'udp'){
                layer.open({
                    type:2,
                    content:'updEmp?empno=' + data.empno,
                    title:"修改信息",
                    area:['800px','500px'],//设置弹框的宽高
                }),
                    table.reload("empList",  {
                        url:"getEmpList"
                    })
            } else if(obj.event == 'del'){
                //删除消息
                layer.confirm('确定删除吗', '删除指令', function(){
                    $.ajax({
                        type: "post",
                        url: "delEmpById",
                        data: {
                            empno:data.empno
                        },
                        dataType: "text",
                        success: function(data) {
                            layer.msg(data);
                            table.reload("empList",  {
                                url: "getEmpFList"
                            })
                        },
                        error: function (data) {
                            layer.msg("执行失败");
                        }
                    })
                })
            }
        });
    });
</script>
</body>
</html>
