<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加信息</title>
    <link rel="stylesheet" href="../../static/layui/css/layui.css"  media="all">
    <script src="../../static/layui/layui.js" charset="utf-8"></script>
    <script src="../../static/js/jquery-3.3.1.js"></script>
</head>
<body>
<form class="layui-form" id="addForm">
    <div style="float: left">
        <div class="layui-form-item">
            <label class="layui-form-label">餐品</label>
            <div class="layui-input-inline">
                <select name="mId" id="mId">
                    <option value="">请选择餐品</option>
                    <c:forEach items="${mealList}" var="meal">
                        <option value="${meal.mId}">${meal.mName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    </div>
    <div style="float: left">
        <div class="layui-form-item">
            <label class="layui-form-label">数量</label>
            <div class="layui-input-inline">
                <input type="text" id="amount" name="amount" required  lay-verify="required" placeholder="请输入数量"  autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div style="float: left">
        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <input type="text" id="remarks" name="remarks" required  lay-verify="required" placeholder="请输入备注"  autocomplete="off" class="layui-input">
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
            var myDate = new Date();
            var str = myDate.getHours() > 12 ? "晚餐" : "午餐";
            $.ajax({
                type: "post",
                url:"addMI",
                data:{
                    aTime: myDate,
                    aNum: ${sessionScope.user.empno},
                    mId: $("#mId").val(),
                    oType: str,
                    amount: $("#amount").val(),
                    total: $("#amount").val() * 15,
                    remrks: $("#remarks").val()
                },
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

