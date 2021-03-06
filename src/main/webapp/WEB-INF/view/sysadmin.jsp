<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>金桥学员成长跟踪系统</title>
    <link rel="stylesheet" href="../../static/css/index.css">
    <link rel="stylesheet" href="../../static/layui/css/layui.css"  media="all">
    <script src="../../static/layui/layui.js" charset="utf-8"></script>
    <script src="../../static/js/jquery-3.3.1.js"></script>
    <%--<script>
        $(function () {
            $("#btn1").click(function () {
                $("#left").animate({width:'toggle'},200);
            })
        })
    </script>--%>
</head>
<body>
<div id="container">
    <div id="header">
        <a href="#"><img src="../../static/images/header.png" alt=""></a>
        <ul class="layui-nav" style="height: 60px;float: right;background-color: #265160">
            <li class="layui-nav-item">
                <a href="javascript:">sysadmin</a>
                <dl class="layui-nav-child" style="background-color: #009688">
                    <dd><a href="logout">退出</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">&nbsp;&nbsp;</li>
        </ul>
    </div>
    <div id="right">
        <div id="body">
            <iframe src="MIsys" name="main" scrolling="no"></iframe>
        </div>
        <div id="footer">
            @2020&nbsp;&nbsp;金桥教务查询系统&nbsp;&nbsp;
        </div>
    </div>
    <script type="text/html" id="barDemo">
        <a class="layui-btn layui-btn-primary layui-btn-xs"  lay-event="udp">确认</a>
    </script>
</div>
    <script>
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use(['element','layer'], function(){
            var element = layui.element,
                layer = layui.layer,
                $ = layui.jquery;
            //监听导航点击
            element.on('nav(demo)', function(elem){
            });
            $("#updSelf").click(function () {
                layer.open({
                    type:2,
                    content:"",
                    title:"修改个人资料",
                    area:['800px','600px'],//设置弹框的宽高
                })
            })
            $("#updSelfPwd").click(function () {
                layer.open({
                    type:2,
                    content:"",
                    title:"修改密码",
                    area:['800px','600px'],//设置弹框的宽高
                })
            })
        });
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
                    //执行重载
                    table.reload('deptList', {
                        url:'getDeptList'
                        ,where: {
                            name: name                    },
                        page: {
                            curr: 1 //重新从第 1 页开始
                        }
                    }, 'data');
                },
                add:function() {
                    layer.open({
                        type: 2,
                        title: "新增部门",
                        content: "addDept",
                        area: ['800px', '500px'],//设置弹框的宽高
                        shadeClose: true //点击遮罩是否关闭弹窗
                    })
                }
            };

            table.render({
                elem: ''//对应table的id属性
                ,url:'getList'//后台订餐表数据
                ,width: 1150
                ,height: 500
                ,cols: [[
                    {type:'checkbox'}
                    ,{type:'numbers',title: '序号'}
                    ,{field:'',title:'',sort:true}
                    ,{field:'dName',title: '部门名称'}
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
                ,id: ''
            });
            //监听工具条
            table.on('tool(demo)', function(obj){
                var data = obj.data;
                if(obj.event == 'udp'){
                    layer.open({
                        type:2,
                        content:'跳转后台controller修改状态信息',
                        title:"修改信息",
                        area:['800px','500px'],//设置弹框的宽高
                    }),
                    table.reload("表格id",  {
                        url:"后台订餐表数据"
                    })
                }
            });
        });
    </script>
</body>
</html>

