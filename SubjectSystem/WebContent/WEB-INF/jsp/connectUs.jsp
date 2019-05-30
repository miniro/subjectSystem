<%--
  Created by IntelliJ IDEA.
  User: abao
  Date: 2019-05-28
  Time: 14:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itheima" uri="http://subjectsystem.ftthzj.team/common/"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath%>/vendor/select2/select2.min.css">
    <link rel="stylesheet" href="<%=basePath%>/css/util.css">
    <link rel="stylesheet" href="<%=basePath%>/css/main.css">
</head>
<body>
<div class="dowebok container-contact100">
    <div class="wrap-contact100">
        <form class="contact100-form validate-form" action="${pageContext.request.contextPath }/message/addMessage.action" method="post">
            <span class="contact100-form-title">联系管理员</span>
            <div class="wrap-input100">
                <div class="label-input100">选择消息类型</div>
                <div>
                    <select class="js-select2" name="service" id="select" onchange="change()">
                        <option>上报错误</option>
                        <option>提出建议</option>
                        <option>其他类型</option>
                    </select>
                    <div class="dropDownSelect2"></div>
                </div>
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="消息内容不能为空">
                <label class="label-input100" for="message">消息内容</label>
                <textarea id="message" class="input100" name="content" placeholder="请输入消息内容"></textarea>
                <span class="focus-input100"></span>
            </div>

            <div class="container-contact100-form-btn">
                <button class="contact100-form-btn"type="submit">提 交</button>
            </div>
            <a href="${pageContext.request.contextPath }/course/list.action">
                    返回主页
            </a>
            <div class="contact100-form-social flex-c-m">
                <a  class="contact100-form-social-item flex-c-m bg1 m-r-20" target="_blank">
                    <i class="fa fa-wechat" aria-hidden="true"></i>
                </a>

                <a  class="contact100-form-social-item flex-c-m bg2 m-r-20" target="_blank">
                    <i class="fa fa-qq" aria-hidden="true"></i>
                </a>

                <a  class="contact100-form-social-item flex-c-m bg3" target="_blank">
                    <i class="fa fa-weibo" aria-hidden="true"></i>
                </a>
            </div>
        </form>
        <div class="contact100-more flex-col-c-m" style="background-image: url('images/bg-01.jpg');">
        </div>
    </div>
</div>
<script src="vendor/jquery/jquery-1.12.4.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
    var errorType;
    function change() {

        errorType = $("#select").val();
        alert("您选择的是："+errorType);

    }
    function testJson(){
        // 获取输入的用户名和密码
        var content = $("#content").val();
        var errorType = $("#content").val();

        $.ajax({
            url : "${pageContext.request.contextPath }/message/addMessage.action",
            type : "post",
            // data表示发送的数据
            data :JSON.stringify({content:content,e:errorType}),
            // 定义发送请求的数据格式为JSON字符串
            contentType : "application/json;charset=UTF-8",
            //定义回调响应的数据格式为JSON字符串,该属性可以省略
            dataType : "json",
            beforeSend : function(req) {
                req.setRequestHeader('Content-Type', 'application/json');  ///加这一行解决问题
            },
            //成功响应的结果
            success : function(data){
                if(data != null){
                    alert("您输入的用户名为："+data.errorType+
                        "密码为："+data.content);
                }
            }
        });
    }
    $(".js-select2").each(function(){
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
    $(".js-select2").each(function(){
        $(this).on('select2:open', function (e){
            $(this).parent().next().addClass('eff-focus-selection');
        });
    });
    $(".js-select2").each(function(){
        $(this).on('select2:close', function (e){
            $(this).parent().next().removeClass('eff-focus-selection');
        });
    });
</script>
<script src="js/main.js"></script>
</body>
</html>

