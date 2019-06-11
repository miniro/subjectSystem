<%--
  Created by IntelliJ IDEA.
  User: abao
  Date: 2019-05-28
  Time: 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<img id="codeimg" name="codeimg" src="" width="80" height="25"/>

<#-- 获取验证码 -->
$("#getYzm").click(function(){
var url = "https://www.sojson.com/getYzm.shtml?t=" + Math.random();
this.src = url;
}).click().show();aa
a
</body>
</html>
