<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/10/9
  Time: 18:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>更新餐品信息</title>
    <link rel="stylesheet" href="../../../static/layui/css/layui.css ">
    <script src="../../../static/layui/layui.js"></script>
</head>
<body>
<div class="layui-form">
    <input type="hidden" name="mId" id="mId" value="${meal.mId}">
    <div class="layui-form-item">
        <label class="layui-form-label">餐品名称</label>
        <div class="layui-input-inline">
            <input type="text" id="mName" name="mName" required  lay-verify="required" value="${meal.mName}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">单价</label>
        <div class="layui-input-inline">
            <input type="text" id="univalent" name="univalent" required  lay-verify="required" value="${meal.univalent}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" id="ok">确定</button>
            <a class="layui-btn layui-btn-primary" id="close">取消</a>
        </div>
    </div>
</div>
<script>
    //Demo
    layui.use(['form','laydate','layer'], function(){
        var form = layui.form
            ,laydate = layui.laydate
            ,layer = layui.layer
            ,$ = layui.jquery;
        $("#close").click(function () {
            //当你在iframe页面关闭自身时
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        })
        $("#ok").click(function () {
            $.ajax({
                type: "post",
                url:"updMeals",
                data: {
                    mId: $("#mId").val(),
                    mName: $("#mName").val(),
                    univalent: $("#univalent").val(),
                },
                dataType: "text",
                success: function (data) {
                    if("true" == data) {
                        layer.msg("修改成功");
                        setTimeout('closeLayer();',1000);
                    } else {
                        layer.msg("修改失败");
                    }
                },
                error:function () {
                    layer.msg("执行失败");
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
