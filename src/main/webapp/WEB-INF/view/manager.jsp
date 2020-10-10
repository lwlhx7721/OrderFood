<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>金桥学员成长跟踪系统</title>
    <link rel="stylesheet" href="../../static/css/index.css">
    <link rel="stylesheet" href="../../static/layui/css/layui.css"  media="all">
    <script src="../../static/layui/layui.js" charset="utf-8"></script>
    <script src="../../static/js/jquery-3.3.1.js"></script>
</head>
<body>
<div id="container">
    <div id="header">
        <a href="#"><img src="../../static/images/header.png" alt=""></a>
        <ul class="layui-nav" style="height: 60px;float: right;background-color: #265160">
            <li class="layui-nav-item">
                <a href="javascript:">${sessionScope.user.ename}</a>
                <dl class="layui-nav-child" style="background-color: #009688">
                    <dd><a id="updSelf">修改个人资料</a></dd>
                    <dd><a href="logout">退出</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">&nbsp;&nbsp;</li>
        </ul>
    </div>
    <div id="right">
        <div id="body">
            <iframe src="MImanager" name="main" scrolling="no"></iframe>
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
                content:'updEmp?empno=' + ${sessionScope.user.empno},
                title:"修改个人资料",
                area:['800px','600px'],//设置弹框的宽高
            })
        })
    });
</script>
</body>
</html>


