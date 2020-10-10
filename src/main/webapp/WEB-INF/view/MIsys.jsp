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
        <div class="layui-input-inline">
            <select name="deptId" id="deptId"  lay-verify="required">
                <option value="0">请选择部门查找</option>
                <c:forEach items="${deptList}" var="dept">
                    <option value="${dept.deptno}">${dept.dName}</option>
                </c:forEach>
            </select>
        </div>
        <button class="layui-btn" style="width: 100px;background-color: skyblue;;margin-left: 10px;" data-type="reload">查询</button>
    </div>
    <table class="layui-hide" id="MIList"  lay-filter="demo" lay-skin="nob"></table>
</div>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs"  lay-event="udp">确认</a>
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
                var deptno = $('#deptId').val();
                //执行重载
                table.reload('MIList', {
                    url:'getMIsys'
                    ,where: {
                        deptno:deptno
                    },
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                }, 'data');
            },
        };

        table.render({
            elem: '#MIList'//对应table的id属性
            ,url:'getMIsys'
            ,width: 1150
            ,height: 500
            ,cols: [[
                {type:'checkbox'}
                ,{type:'numbers',title: '序号'}
                ,{field:'oNum',title:'订单编号',sort:true}
                ,{field:'aTime',title: '订餐时间'}
                ,{field:'aNum',title: '订餐人'}
                ,{field:'mId',title: '餐品编号'}
                ,{field:'oType',title: '类别',templet:function (d) {
                        if(d.sex == 1) {
                            return "晚餐";
                        } else {
                            return "午餐";
                        }
                    }}
                ,{field:'amount',title: '数量'}
                ,{field:'total',title: '价格'}
                ,{field:'state',title: '状态'}
                ,{field:'remarks',title: '备注'}
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
            ,id: 'MIList'
        });
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event == 'udp'){
                $.ajax({
                    type: "post",
                    url: 'updMI',
                    data: {
                        oNum:data.oNum,
                        state:2
                    },
                    dataType: "text",
                    success: function(data) {
                        layer.msg(data);
                        table.reload("MIList",  {
                            url: "getMIsys"
                        })
                    },
                    error: function (data) {
                        layer.msg("执行失败");
                    }
                })
            }
        });
    });
</script>
</body>
</html>

