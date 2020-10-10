<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: swz
  Date: 2020/9/23
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学员信息</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css"  media="all">
    <script src="../../static/layui/layui.js" charset="utf-8"></script>
    <script src="../../static/js/jquery-3.3.1.js"></script>
</head>
<body>
<form class="layui-form" id="addForm">
    <div style="float: left">
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" id="ename" name="ename" required  lay-verify="required" placeholder="请输入姓名"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">性别</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="0" title="男" checked>
                <input type="radio" name="sex" value="1" title="女">
            </div>
        </div>
    </div>
    <div style="float: left">
        <div class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">联系电话</label>
                <div class="layui-input-inline">
                    <input type="text" id="contact" name="contact" required  lay-verify="required" placeholder="请输入联系电话" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                    <input type="text" id="pwd" name="pwd" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
    </div>
        <div class="layui-form">
            <div class="layui-form-item">
                <label class="layui-form-label">职位</label>
                <div class="layui-input-inline">
                    <input type="text" id="position" name="position" required  lay-verify="required" placeholder="请输入职位" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
    <div style="float: left">
        <div class="layui-form-item">
            <label class="layui-form-label">部门</label>
            <div class="layui-input-inline">
                <select name="deptno" id="deptno">
                    <option value="">请选择部门</option>
                    <c:forEach items="${deptList}" var="dept">
                        <option value="${dept.deptno}">${dept.dName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block" style="margin-left:300px">
            <a class="layui-btn" id="ok">确定</a>
            <a class="layui-btn layui-btn-primary" id="close">取消</a>
        </div>
    </div>
</form>
<script>
    //Demo
    layui.use(['form','laydate','layer','upload'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,$ = layui.jquery

        $("#close").click(function () {
            //当你在iframe页面关闭自身时
            var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
            parent.layer.close(index); //再执行关闭
        })

        $("#ok").click(function () {
            $.ajax({
                type: "post",
                url:"addEmpForm",
                data:$("#addForm").serialize(),
                dataType: "text",
                success: function (data) {
                    if("true" == data) {
                        layer.msg("新增成功");
                        setTimeout('closeLayer();',1000);
                    } else {
                        layer.msg("新增失败");
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
