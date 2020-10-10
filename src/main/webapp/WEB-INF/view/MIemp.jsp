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
        <button class="layui-btn" style="width: 100px;background-color: skyblue;;margin-left: 10px;" data-type="add">订餐</button>
    </div>
    <table class="layui-hide" id="MIList"  lay-filter="demo" lay-skin="nob"></table>
</div>
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
            add: function(){
                var myDate = new Date();
                var hours = myDate.getHours();
                if(!((hours > 9 && hours < 11) || (hours > 14 && hours < 16))) {
                    layer.msg("不在订餐时间以内，暂时无法订餐");
                    return;
                }
                layer.open({
                    type: 2,
                    title: "新增",
                    content: "addMealInfo",
                    area: ['800px', '500px'],//设置弹框的宽高
                    shadeClose: true //点击遮罩是否关闭弹窗
                })
            },
        };
        table.render({
            elem: '#MIList'//对应table的id属性
            ,url:'getMIemp'
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
    });
</script>
</body>
</html>



