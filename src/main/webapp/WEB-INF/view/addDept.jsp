<%--
  Created by IntelliJ IDEA.
  User: 王明睿
  Date: 2020/9/23
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加部门页面</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css ">
    <script src="../../static/layui/layui.js"></script>
</head>
<body>
<div class="layui-form">
    <div class="layui-form-item">
        <label class="layui-form-label">部门名称</label>
        <div class="layui-input-inline">
            <input type="text" name="deptName" id="deptName" lay-verify="required" placeholder="请输入部门名称"
                   autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button type="submit" id="add" class="layui-btn" lay-submit="" lay-filter="demo1">添加</button>
            <a class="layui-btn layui-btn-primary" id="close">取消</a>
        </div>
    </div>
</div>
<script>
    layui.use(['layer'], function () {
        var $ = layui.jquery,
            layer = layui.layer;
        $("#close").click(function () {
            //当你在iframe页面关闭自身时
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        })
        $("#add").click(function () {
            $.ajax({
                type: "post",
                url: "toAddDepts",
                data: {
                    dName: $("#deptName").val(),
                },
                dataType: "text",
                success: function (data) {
                    if ("true" == data) {
                        layer.msg("新增成功");
                        setTimeout('closeLayer();',1000);
                    } else {
                        layer.msg("新增失败");
                    }
                },
                error: function () {
                    alert("执行失败")
                }
            })
        })

    });
    var closeLayer = function () {
        parent.location.reload();
    }
</script>
</body>
</html>
