<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        html,body {
            width: 100%;
            height: 100%;
            margin: 0;
            background-color: #E7E3E7;
        }
        img {
            width: 100%;
            height: 100%;
        }
        #container {

            width: 100%;
            height: 100%;
            text-align: center;
            position: absolute;
            margin: 0 auto;
        }
        #login {
            width: 400px;
            height: 300px;
            text-align: center;
            position: absolute;
            top: 200px;
            right: 150px;
            padding: 50px 50px 20px 5px;
            background-color: white;
            border-radius: 5%;
        }
        #title {
            width: 800px;
            height: 200px;
            text-align: center;
            position: absolute;
            top: 40px;
            left: 40px;
            background-image: url("../../static/images/title.png");
        }
    </style>
    <link rel="stylesheet" href="../../static/layui/css/layui.css">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div class="layui-carousel" id="container">
    <div id="title"></div>
    <div id="login">
        <h1 style="color:#009688;margin: 30px;margin-top: 0px">登录</h1>
        <div style="display: flex;justify-content: center">
            <div class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="text" id="username" style="width: 250px; margin-left: 50px" name="username" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <br><br>
                <div class="layui-form-item">
                    <div class="layui-input-inline">
                        <input type="password" style="width: 250px; margin-left: 50px" required lay-verify="required" placeholder="请输入密码" class="layui-input" id="pwd" name="pwd">
                    </div>
                </div>
                <br>
                <br>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" style="width: 250px; margin-left: -60px" lay-submit lay-filter="formDemo" id="ok">登录</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use('carousel', function(){
        var carousel = layui.carousel;
        //建造实例
        carousel.render({
            elem: '#container'
            ,width: '100%' //设置容器宽度
            ,height: '100%'
            ,arrow: 'always' //始终显示箭头
            //,anim: 'updown' //切换动画方式
        });
    });
</script>
<script>
    //Demo
    layui.use(['form','layer'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,$ = layui.jquery;
        $("#ok").click(function () {
            $.ajax({
                type: "post",
                url:"login",
                data: {
                    username: $("#username").val(),
                    pwd: $("#pwd").val()
                },
                dataType: "text",
                success: function (data) {
                    if("admin" == data) {
                        window.location = "admin";
                    } else if("sysadmin" == data) {
                        window.location = "sysadmin";
                    } else if("manager" == data){
                        window.location = "manager";
                    } else if("emp" == data) {
                        window.location = "emp";
                    } else {
                        layer.msg("用户名或密码错误");
                    }
                },
                error:function () {
                    layer.msg("执行失败");
                }
            })
        })
    });
</script>
</body>
</html>


