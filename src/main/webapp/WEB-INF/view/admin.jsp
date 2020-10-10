<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理员页面</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css"  media="all">
    <script src="../../static/layui/layui.js" charset="utf-8"></script>
    <style>
        *{
            border-radius: 2px;
        }
        html,body {
            width: 100%;
            height: 100%;
            margin: 0px;
            padding: 0px;
            border: 0px;
            overflow-x: hidden;
            background-color: #E7E3E7;
        }
        #container {
            width: 100%;
            height: 620px;
            background-color: white;
            margin: 0;
            border: 0px;
        }
        #header {
            width: 100%;
            height: 60px;
            background-image: linear-gradient(to right, #6495ED , #009688);
        }
        #body {
            width: 100%;
            height: 530px;
            background-color: #393D49;
        }
        #left {
            width: 15%;
            height: 565px;
            background-image: linear-gradient(to bottom, #6495ED,#6495ED, #f0f0f0);
            float: left;
        }
        #right {
            width: 85%;
            height: 560px;
            background-color: #00FF00;
            float: right;
        }
        #footer {
            width: 100%;
            height: 30px;
            background-color: #F0F0F0;
            text-align: center;
            padding-top: 5px;
        }
        .bluebtn {
            background-color: #6495ED;
        }
        iframe {
            width: 99%;
            height: 99%;
            margin: 1px;
            overflow-y: hidden;
        }
    </style>
</head>
<body>
<div id="container">
    <div id="header">
        <img src="../../static/images/header.png" alt="" style="float: left;margin-left: 20px">
        <ul class="layui-nav layui-bg-green" style="height: 60px;float: right">
            <li class="layui-nav-item">
                <a href="javascript:;">admin</a>
                <dl class="layui-nav-child" style="background-color: #009688">
                    <dd><a href="logout">退出</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">&nbsp;&nbsp;</li>
        </ul>
    </div>
    <div id="left">
        <ul class="layui-nav layui-nav-tree layui-bg-green" lay-filter="demo" style="margin: 1px;margin-top: 20px" id="leftDemo">
            <li class="layui-nav-item bluebtn" id="li1">
                <a href="empList" target="main">员工管理</a>
            </li>
            <li class="layui-nav-item" id="li2">
                <a href="deptList" target="main">部门管理</a>
            </li>
            <li class="layui-nav-item bluebtn" id="li3">
                <a href="mealList" target="main">餐品管理</a>
            </li>
        </ul>
    </div>
    <div id="right">
        <div id="body">
            <iframe src="empList" name="main" scrolling="no"></iframe>
        </div>
        <div id="footer">
            @2020&nbsp;&nbsp;金桥教务查询系统&nbsp;&nbsp;
        </div>
    </div>
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
    });
</script>
</body>
</html>