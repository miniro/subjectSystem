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
                <div class="label-input100">选择错误类型</div>
                <div>
                    <select class="js-select2" name="service" id="select" onchange="change()">
                        <option>请选择</option>
                        <option>系统错误</option>
                        <option>课程信息错误</option>
                        <option>课表显示错误</option>
                        <option>公告显示错误</option>
                        <option>成绩录入错误</option>
                        <option>其他错误</option>
                    </select>
                    <div class="dropDownSelect2"></div>
                </div>
                <span class="focus-input100"></span>
            </div>

            <div class="wrap-input100 validate-input" data-validate="留言不能为空">
                <label class="label-input100" for="message">留言</label>
                <textarea id="message" class="input100" name="content" placeholder="请输入留言"></textarea>
                <span class="focus-input100"></span>
            </div>

            <div class="container-contact100-form-btn">
                <button class="contact100-form-btn"type="submit">提 交</button>
            </div>
            <div class="contact100-form-social flex-c-m">
                <a href="http://www.dowebok.com" class="contact100-form-social-item flex-c-m bg1 m-r-20" target="_blank">
                    <i class="fa fa-wechat" aria-hidden="true"></i>
                </a>

                <a href="http://www.dowebok.com/code" class="contact100-form-social-item flex-c-m bg2 m-r-20" target="_blank">
                    <i class="fa fa-qq" aria-hidden="true"></i>
                </a>

                <a href="http://www.dowebok.com/950.html" class="contact100-form-social-item flex-c-m bg3" target="_blank">
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
<script>

    function change() {

        var result = $("#select").val();

        // alert("您选择的是："+result);

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

