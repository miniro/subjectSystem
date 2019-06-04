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
<!DOCTYPE HTML>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>反方教学选课系统</title>
    <!-- 引入css样式文件 -->
    <!-- Bootstrap Core CSS -->
    <link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
    <!-- MetisMenu CSS -->
    <link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet" />
    <!-- DataTables CSS -->
    <link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet" />
    <!-- Custom Fonts -->
    <link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>css/boot-crm.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=basePath%>css/style.css">
</head>
<body>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>message/list.action">反方教学选课系统</a>
        </div>
        <!-- 导航栏右侧图标部分 -->
        <ul class="nav navbar-top-links navbar-right">
            <!-- 邮件通知 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-envelope fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-messages">
                    <li>
                        <a href="#">
                            <div>
                                <strong>教学办钟颖老师</strong> <span class="pull-right text-muted">
								<em>昨天</em>
							</span>
                            </div>
                            <div>请及时完成教学评价</div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="${pageContext.request.contextPath}/notice/list.action">
                            <strong>查看全部消息</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 邮件通知 end -->
            <!-- 任务通知 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-tasks fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-tasks">
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>完成教学评价</strong>
                                    <span class="pull-right text-muted">完成40%</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-success"
                                         role="progressbar" aria-valuenow="40" aria-valuemin="0"
                                         aria-valuemax="100" style="width: 40%">
                                        <span class="sr-only">完成40%</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <p>
                                    <strong>完善个人资料</strong>
                                    <span class="pull-right text-muted">完成20%</span>
                                </p>
                                <div class="progress progress-striped active">
                                    <div class="progress-bar progress-bar-info" role="progressbar"
                                         aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"
                                         style="width: 20%">
                                        <span class="sr-only">完成20%</span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>查看所有任务</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 任务通知 end -->
            <!-- 消息通知 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> 新回复
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-envelope fa-fw"></i> 新消息
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-tasks fa-fw"></i> 新任务
                                <span class="pull-right text-muted small">4分钟之前</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>查看所有提醒</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 消息通知 end -->
            <!-- 用户信息和系统设置 start -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i>
                        用户：${STU_SESSION.name}
                    </a>
                    </li>
                    <li><a href="${pageContext.request.contextPath }/connectUs.action"><i class="fa fa-gear fa-fw"></i> 联系管理员</a></li>
                    <li class="divider"></li>
                    <li>
                        <a href="${pageContext.request.contextPath }/logout.action">
                            <i class="fa fa-sign-out fa-fw"></i>退出登录
                        </a>
                    </li>
                </ul>
            </li>
            <!-- 用户信息和系统设置结束 -->
        </ul>
        <!-- 左侧显示列表部分 start-->

        <div class="navbar-default sidebar" id="navbar" role="navigation" >
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <img src="${pageContext.request.contextPath}/images/school.jpg"  height="195" width="280" alt="城市学院" />
                    <li>
                        <c:if test="${flag == 'ADMIN'}">
                            <a href="${pageContext.request.contextPath }/course/list.action" >
                                <i class="fa fa-edit fa-fw" aria-hidden="true"></i> 课程管理
                            </a>
                        </c:if>
                        <c:if test="${flag != 'ADMIN'}">
                            <a href="${pageContext.request.contextPath }/course/list.action" >
                                <i class="fa fa-edit fa-fw" aria-hidden="true"></i> 课程查询
                            </a>
                        </c:if>
                    </li>
                    <c:if test="${flag == 'STUDENT'}">
                        <li>
                            <a href="${pageContext.request.contextPath }/course/toCourseTable.action">
                                <i class="fa fa-table fa-fw" aria-hidden="true"></i> 我的课表
                            </a>
                        </li>
                    </c:if>
                    <li>
                        <c:if test="${flag == 'ADMIN'}">
                            <a href="${pageContext.request.contextPath }/student/score/list.action">
                                <i class="fa fa-file fa-fw" aria-hidden="true"></i> 成绩管理
                            </a>
                        </c:if>
                        <c:if test="${flag == 'STUDENT'}">
                            <a href="${pageContext.request.contextPath }/student/score/list.action">
                                <i class="fa fa-file fa-fw" aria-hidden="true"></i> 成绩查询
                            </a>
                        </c:if>
                        <c:if test="${flag == 'TEACHER'}">
                            <a href="${pageContext.request.contextPath }/teacher/score/list.action">
                                <i class="fa fa-file fa-fw" aria-hidden="true"></i> 成绩查询
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <c:if test="${flag == 'ADMIN'}">
                            <a href="${pageContext.request.contextPath }/notice/list.action">
                                <i class="fa fa-exclamation-circle fa-fw"  aria-hidden="true"></i> 公告管理
                            </a>
                        </c:if>
                        <c:if test="${flag != 'ADMIN'}">
                            <a href="${pageContext.request.contextPath }/notice/list.action">
                                <i class="fa fa-exclamation-circle fa-fw"  aria-hidden="true"></i> 公告查询
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <c:if test="${flag == 'ADMIN'}">
                            <a href="${pageContext.request.contextPath }/personalInfor/list.action">
                                <i class="fa fa-gear fa-fw" aria-hidden="true"></i> 用户信息管理
                            </a>
                        </c:if>
                        <c:if test="${flag != 'ADMIN'}">
                            <a href="${pageContext.request.contextPath }/personalInfor/list.action">
                                <i class="fa fa-gear fa-fw" aria-hidden="true"></i> 我的信息
                            </a>
                        </c:if>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/message/list.action">
                            <i class="fa fa-magic fa-fw" aria-hidden="true"></i> 消息管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/fttAndHzj/list.action">
                            <i class="fa fa-bug fa-fw" aria-hidden="true"></i> 关于我们
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 左侧显示列表部分 end-->
    </nav>

    <!-- 消息列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">消息管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/message/list.action">
                    <div class="form-group">
                        <label for="errorType">消息类型</label>
                        <input type="text" class="form-control" id="errorType"
                               value="${errorType }" name="errorType" />
                    </div>
                    <div class="form-group">
                        <label for="studentId">学生id</label>
                        <input type="text" class="form-control" id="studentId"
                               value="${studentId }" name="studentId" />
                    </div>
                    <div class="form-group">
                        <label for="content">内容</label>
                        <input type="text" class="form-control" id="content"
                               value="${content }" name="content" />
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
        <c:if test="${flag == 'ADMIN'}">
            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
               data-target="#newmessageDialog" onclick="clearmessage()">新建</a>
        </c:if>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">消息信息列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>消息编号</th>
                            <th>学生号</th>
                            <th>消息内容</th>
                            <th>消息类型</th>
                            <c:if test="${flag == 'ADMIN'}">
                                <th>操作</th>
                            </c:if>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row">
                            <tr>
                                <td>
                                    <a href="#"  data-toggle="modal" data-target="#messageInforDialog" onclick= "lookInforMessage('${row.id}')">${row.id}</a>
                                </td>
                                <td>${row.studentId}</td>
                                <td>${row.content}</td>
                                <td>${row.errorType}</td>
                                <c:if test="${flag == 'ADMIN'}">
                                <td>
                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                       data-target="#messageEditDialog" onclick= "editmessage('${row.id}')">修改</a>
                                    <a href="#" class="btn btn-danger btn-xs" onclick= "deletemessage('${row.id}')">删除</a>
                                </td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <itheima:page url="${pageContext.request.contextPath }/message/list.action" />
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 消息列表查询部分  end-->
    <!-- footer -->
    <div class="wave-box">

        <div class="marquee-box marquee-up" id="marquee-box">
            <div class="marquee">
                <div class="wave-list-box" id="wave-list-box1">
                    <ul>
                        <li><img height="60" alt="波浪" src="${pageContext.request.contextPath}/images/wave_02.png"></li>
                    </ul>
                </div>
                <div class="wave-list-box" id="wave-list-box2">
                    <ul>
                        <li><img height="60" alt="波浪" src="${pageContext.request.contextPath}/images/wave_02.png"></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="marquee-box" id="marquee-box3">
            <div class="marquee">
                <div class="wave-list-box" id="wave-list-box4">
                    <ul>
                        <li><img height="60" alt="波浪" src="${pageContext.request.contextPath}/images/wave_01.png"></li>
                    </ul>
                </div>
                <div class="wave-list-box" id="wave-list-box5">
                    <ul>
                        <li><img height="60" alt="波浪" src="${pageContext.request.contextPath}/images/wave_01.png"></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
    <div class="footer">
        <div class="auto clearfix">

            <div class="footer-floor1">
                <div class="clear-float"></div>
            </div>
        </div>
        <div class="footer-floor2">
            <p>©2019-2019 fttAndAbao 版权所有</p>
        </div>
    </div>
    <!-- footer end -->
</div>
<!-- 创建消息模态框 -->
<div class="modal fade" id="newmessageDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">新建消息信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_message_form">
                    <div class="form-group">
                        <label for="content" class="col-sm-2 control-label">
                            消息内容
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="content" placeholder="消息内容" name="content" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="studentId" class="col-sm-2 control-label">
                            学生编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="studentId" placeholder="学生编号" name="studentId" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="errorType" class="col-sm-2 control-label">
                            消息类型
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="errorType" placeholder="消息类型" name="errorType" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createmessage()">创建消息</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="messagechooseEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改消息信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_message_form">
                    <div class="form-group">
                        <label for="choosemessageId" class="col-sm-2 control-label">
                            消息编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="choosemessageId" placeholder="消息编号" name="choosemessageId" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <a href="#" class="btn btn-primary" data-toggle="modal"
                   data-target="#messageEditDialog" onclick= "editmessage(document.getElementById('choosemessageId').value)" >选择消息编号</a>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="messageInforDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">修改消息信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_message_form1">
                    <div class="form-group">
                        <label for="morecontent" class="col-sm-2 control-label">
                            消息内容
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="morecontent" placeholder="消息内容" name="content" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="morestudentId" class="col-sm-2 control-label">
                            学生编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="morestudentId" placeholder="学生编号" name="studentId" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="moreerrorType" class="col-sm-2 control-label">
                            消息类型
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="moreerrorType" placeholder="消息类型" name="Type" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

<!-- 修改消息模态框 -->
<div class="modal fade" id="messageEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">修改消息信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_message_form">
                    <div class="form-group">
                        <label for="editcontent" class="col-sm-2 control-label">
                            消息内容
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="editcontent" placeholder="消息内容" name="content" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="editstudentId" class="col-sm-2 control-label">
                            学生编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="editstudentId" placeholder="学生编号" name="studentId" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="editerrorType" class="col-sm-2 control-label">
                            消息类型
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="editerrorType" placeholder="消息类型" name="Type" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updatemessage()">修改消息</button>
            </div>
        </div>
    </div>
</div>
<!-- 删除消息模态框 -->
<div class="modal fade" id="messageDeleteDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">删除消息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="delete_message_form">
                    <div class="form-group">
                        <label for="id" class="col-sm-2 control-label">
                            消息编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="id" placeholder="消息编号" name="id" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="deletemessage()">删除消息</button>
            </div>
        </div>
    </div>
</div>


<div style="margin-top: 100px"></div>

<!-- 引入js文件 -->
<!-- jQuery -->
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=basePath%>js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=basePath%>js/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=basePath%>js/sb-admin-2.js"></script>
<script src="<%=basePath%>js/script.js"></script>
<!-- 编写js代码 -->
<script type="text/javascript">
    //清空新建消息窗口中的数据
    function clearmessage() {
        $("#id").val("");
        $("#studentId").val("");
        $("#editstudentId").val("");
        $("#errorType").val("");
        $("#editerrorType").val("");
        $("#content").val("");
        $("#editcontent").val("");
    }
    // 创建消息
    function createmessage() {
        $.post("<%=basePath%>message/create.action",
            $("#new_message_form").serialize(),function(data){
                if(data =="OK"){
                    alert("消息创建成功！");
                    window.location.reload();
                }else{
                    alert("消息创建失败！");
                    window.location.reload();
                }
            });
    }
    // 执行修改消息操作
    function updatemessage() {
        $.post("<%=basePath%>message/update.action",
            $("#update_message_form").serialize(),function(data){
                if(data =="OK"){
                    alert("消息信息更新成功！");
                    window.location.reload();
                }else{
                    alert("消息信息更新失败！");
                    window.location.reload();
                }
            });
    }

    function lookInforMessage(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>message/getmessageById.action",
            data:{"id":id},
            success:function(data) {
                $("#morestudentId").val(data.studentId);
                $("#moreerrorType").val(data.errorType);
                $("#morecontent").val(data.content);
            }
        });
    }
    // 通过id获取修改的消息信息
    function editmessage(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>message/getmessageById.action",
            data:{"id":id},
            success:function(data) {
                $("#editstudentId").val(data.studentId);
                $("#editerrorType").val(data.errorType);
                $("#editcontent").val(data.content);
            }
        });
    }
    // 删除消息
    function deletemessage(messageId) {
        if(confirm('确定要删除该消息吗?')) {
            $.ajax({
                type: "get",
                url: "<%=basePath%>message/delete.action",
                data: {"id": messageId},
                success: function (data) {
                    if (data == "OK") {
                        alert("消息删除成功！");
                        window.location.reload();
                    } else {
                        alert("消息删除失败！");
                        window.location.reload();
                    }
                }
            });
        }
    }
</script>

</body>
</html>