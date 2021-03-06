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
            <a class="navbar-brand" href="<%=basePath%>personalInfor/list.action">反方教学选课系统</a>
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
                    <c:if test="${flag == 'STUDENT'}">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>
                            用户：${STU_SESSION.name}(学生用户)
                        </a>
                        </li>
                    </c:if>
                    <c:if test="${flag == 'ADMIN'}">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>
                            管理员
                        </a>
                        </li>
                    </c:if>
                    <c:if test="${flag == 'TEACHER'}">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i>
                            用户：${STU_SESSION.name}(教师用户)
                        </a>
                        </li>
                    </c:if>
                    <c:if test="${flag == 'STUDENT'}">
                        <li><a href="${pageContext.request.contextPath }/connectUs.action"><i class="fa fa-gear fa-fw"></i> 联系管理员</a></li>
                    </c:if>
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
                            <a href="${pageContext.request.contextPath }/teacher/score/list.action">
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
                        <c:if test="${flag != 'TEACHER'}">
                            <a href="${pageContext.request.contextPath }/message/list.action">
                                <i class="fa fa-magic fa-fw" aria-hidden="true"></i> 消息管理
                            </a>
                        </c:if>
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
    <!-- 用户信息列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">个人信息</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
            <c:if test="${flag == 'ADMIN'}">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/personalInfor/list.action">
                    <div class="form-group">
                        <label for="userId">教工号或学号</label>
                        <input type="text" class="form-control" id="userId"
                               value="${userId }" name="userId" />
                    </div>
                    <div class="form-group">
                        <label for="userName">用户姓名</label>
                        <input type="text" class="form-control" id="userName"
                               value="${userName }" name="userName" />
                    </div>
                    <div class="form-group">
                        <label for="userType">用户类别</label>
                        <select	class="form-control" id="userType" name="userType">
                            <option value="1">学生</option>
                            <option value="2">教师</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
            </c:if>
        <c:if
            test="${flag == 'ADMIN'}">
            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
               data-target="#newpersonalInforchooseDialog" onclick="clearpersonalInfor()">新建</a>
            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
               data-target="#importDialog">导入</a>
        </c:if>
        <c:if
                test="${flag == 'TEACHER'}">
            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
               data-target="#personalInforEditDialog" onclick="editpersonalInfor('${STU_SESSION.teacherId}')">修改信息</a>
        </c:if>
        <c:if
                test="${flag == 'TEACHER'}">
            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
               data-target="#passwordEditDialog">修改密码</a>
        </c:if>
        <c:if
                test="${flag == 'STUDENT'}">
            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
               data-target="#personalInforEditDialog" onclick="editpersonalInfor('${STU_SESSION.studentId}')">修改信息</a>
        </c:if>
        <c:if
                test="${flag == 'STUDENT'}">
            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
               data-target="#passwordEditDialog">修改密码</a>
        </c:if>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">我的信息</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped" style="text-align: center">
                        <c:if test="${flag == 'ADMIN'}">
                            <thead>
                            <tr>
                                <th>学号或教工号</th>
                                <th>姓名</th>
                                <th>用户类型</th>
                                <th>电话</th>
                                <th>邮箱</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.rows}" var="row">
                                <tr>
                                    <c:if test="${userType == '学生'}">
                                        <td>
                                            <a href="#"data-toggle="modal" data-target="#lookInforStuDialog" onclick= "lookInforStu('${row.studentId}')">${row.studentId}</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${userType == '教师'}">
                                        <td>
                                            <a href="#"  data-toggle="modal" data-target="#lookInforTeaDialog" onclick= "lookInforTea('${row.teacherId}')">${row.teacherId}</a>
                                        </td>
                                    </c:if>
                                    <td>${row.name}</td>
                                    <td>${userType}</td>
                                    <td>${row.phone}</td>
                                    <td>${row.email}</td>
                                    <td>
                                        <c:if test="${userType == '学生'}">
                                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                               data-target="#personalInforEditDialog" onclick= "editpersonalInfor('${row.studentId}')">修改</a>
                                            <a href="#" class="btn btn-danger btn-xs" onclick= "deletepersonalInfor('${row.studentId}')">删除</a>
                                        </c:if>
                                        <c:if test="${userType == '教师'}">
                                            <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                               data-target="#personalInforEditDialog" onclick= "editpersonalInfor('${row.teacherId}')">修改</a>
                                            <a href="#" class="btn btn-danger btn-xs" onclick= "deletepersonalInfor('${row.teacherId}')">删除</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>

                        <c:if test="${flag == 'STUDENT'}">
                            <thead>
                            <tr>
                                <th>学生编号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>年级</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${STU_SESSION.studentId}</td>
                                <td>${STU_SESSION.name}</td>
                                <td>${STU_SESSION.sex}</td>
                                <td>${STU_SESSION.grade}</td>
                            </tr>
                            </tbody>
                            <thead>
                            <tr>
                                <th>毕业学校</th>
                                <th>专业</th>
                                <th>qq号</th>
                                <th>手机号</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${STU_SESSION.school}</td>
                                <td>${STU_SESSION.major}</td>
                                <td>${STU_SESSION.qq}</td>
                                <td>${STU_SESSION.phone}</td>
                            </tr>
                            </tbody>
                            <thead>
                            <tr>
                                <th>邮箱</th>
                                <th>家庭地址</th>
                                <th>入学时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${STU_SESSION.email}</td>
                                <td>${STU_SESSION.address}</td>
                                <td>${STU_SESSION.enrollmentDate}</td>
                            </tr>
                            </tbody>
                        </c:if>

                        <c:if test="${flag == 'TEACHER'}">
                                <thead>
                                <tr>
                                    <th>教师编号</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>${STU_SESSION.teacherId}</td>
                                    <td>${STU_SESSION.name}</td>
                                    <td>${STU_SESSION.sex}</td>
                                </tr>
                                </tbody>
                                <thead>
                                <tr>
                                    <th>qq号</th>
                                    <th>手机号</th>
                                    <th>邮箱</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>${STU_SESSION.qq}</td>
                                    <td>${STU_SESSION.phone}</td>
                                    <td>${STU_SESSION.email}</td>
                                </tr>
                                </tbody>
                                <thead>
                                <tr>

                                    <th>家庭地址</th>
                                    <th>职位</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>${STU_SESSION.address}</td>
                                    <td>${STU_SESSION.position}</td>
                                </tr>
                                </tbody>
                            </c:if>

                    </table>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 用户信息列表查询部分  end-->
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


<div class="modal fade" id="passwordEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="passwdDialog_form">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <div class="form-group" >
                                <label for="StudentId" class="col-sm-2 control-label">
                                    原密码
                                </label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="passwd" placeholder="原密码" name="passwd" />
                                </div>
                            </div>
                            <div class="form-group" >
                                <label for="StudentId" class="col-sm-2 control-label">
                                    新密码
                                </label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="passwd1" placeholder="新密码" name="passwd1" />
                                </div>
                            </div>
                            <div class="form-group" >
                                <label for="StudentId" class="col-sm-2 control-label">
                                    再输入
                                </label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="passwd2" placeholder="再次输入" name="passwd2" />
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <a href="#" class="btn btn-primary" onclick="editPasswd()">修改密码</a>
            </div>
        </div>
    </div>
</div>

<!-- 选择用户信息模态框 -->
<div class="modal fade" id="newpersonalInforchooseDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">选择用户类型</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="newpersonalInforchooseDialog_form">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <select	class="form-control" id="type" name="type">
                                <option value="">--请选择用户类型--</option>
                                <option value="1">老师</option>
                                <option value="2">学生</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <a href="#" class="btn btn-primary" data-toggle="modal"
                   data-target="#newpersonalInforDialog " onclick="newpersonalInfor(document.getElementById('type').value)">新建用户信息 </a>
            </div>
        </div>
    </div>
</div>
<!-- 创建用户信息模态框 -->
<div class="modal fade" id="newpersonalInforDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">新建用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_personalInfor_form">
                    <div class="form-group" id="tea11">
                        <label for="teacherId" class="col-sm-2 control-label" >
                            教师编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="teacherId" placeholder="教师编号" name="teacherId" />
                        </div>
                    </div>
                    <div class="form-group" id="stu11">
                        <label for="StudentId" class="col-sm-2 control-label">
                            用户编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="StudentId" placeholder="用户编号" name="StudentId" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Name" class="col-sm-2 control-label">
                            姓名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Name" placeholder="姓名" name="Name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Sex" placeholder="性别" name="Sex" />
                        </div>
                    </div>
                    <div class="form-group" id="stu22">
                        <label for="Grade" class="col-sm-2 control-label">
                            年级
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Grade" placeholder="年级" name="Grade" />
                        </div>
                    </div>
                    <div class="form-group" id="stu33">
                        <label for="School" class="col-sm-2 control-label">
                            毕业学校
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="School" placeholder="毕业学校" name="School" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Qq" class="col-sm-2 control-label">
                            qq号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Qq" placeholder="qq号" name="Qq" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Phone" class="col-sm-2 control-label">
                            手机号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Phone" placeholder="手机号" name="Phone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Email" class="col-sm-2 control-label">
                            邮箱
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Email" placeholder="邮箱" name="Email" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Email" class="col-sm-2 control-label">
                            密码
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Password" placeholder="密码" name="Password" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Address" class="col-sm-2 control-label">
                            家庭地址
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="Address" placeholder="家庭地址" name="Address" />
                        </div>
                    </div>
                    <div class="form-group" id="stu44">
                        <label for="EnrollmentDate" class="col-sm-2 control-label">
                            入学时间
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="EnrollmentDate" placeholder="入学时间" name="EnrollmentDate" />
                        </div>
                    </div>
                    <div class="form-group" id="tea22">
                        <label for="position" class="col-sm-2 control-label" >
                            职称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="position" placeholder="职称" name="position" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createStuInfor(document.getElementById('teacherId').value)">创建用户信息</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="lookInforStuDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">查看学生信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_personalInfor_form1">
                    <div class="form-group" >
                        <label for="moreStudentId" class="col-sm-2 control-label " >
                            用户编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="moreStudentId" placeholder="学生编号" name="studentId" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="moreName" class="col-sm-2 control-label">
                            姓名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="moreName" placeholder="姓名" name="name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-10">
                            <input type="moreSex" class="form-control" id="moreSex" placeholder="性别" name="sex" />
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="Grade" class="col-sm-2 control-label" >
                            年级
                        </label>
                        <div class="col-sm-10">
                            <input type="moreGrade" class="form-control" id="moreGrade" placeholder="年级" name="grade" />
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="School" class="col-sm-2 control-label" >
                            毕业学校
                        </label>
                        <div class="col-sm-10">
                            <input type="moreSchool" class="form-control" id="moreSchool" placeholder="毕业学校" name="school" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Qq" class="col-sm-2 control-label">
                            qq号
                        </label>
                        <div class="col-sm-10">
                            <input type="moreQq" class="form-control" id="moreQq" placeholder="qq号" name="qq" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Phone" class="col-sm-2 control-label">
                            手机号
                        </label>
                        <div class="col-sm-10">
                            <input type="morePhone" class="form-control" id="morePhone" placeholder="手机号" name="phone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Email" class="col-sm-2 control-label">
                            邮箱
                        </label>
                        <div class="col-sm-10">
                            <input type="moreEmail" class="form-control" id="moreEmail" placeholder="邮箱" name="email" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Address" class="col-sm-2 control-label">
                            家庭地址
                        </label>
                        <div class="col-sm-10">
                            <input type="moreAddress" class="form-control" id="moreAddress" placeholder="家庭地址" name="address" />
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="moreEnrollmentDate" class="col-sm-2 control-label" i>
                            入学时间
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="moreEnrollmentDate" placeholder="入学时间" name="enrollmentDate" />
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

<div class="modal fade" id="lookInforTeaDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">查看教师信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_personalInfor_form1">
                    <div class="form-group" >
                        <label for="moreteacherId2" class="col-sm-2 control-label" >
                            教师编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="moreteacherId2" placeholder="教师编号" name="teacherId" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="moreName" class="col-sm-2 control-label">
                            姓名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="moreName2" placeholder="姓名" name="name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-10">
                            <input type="moreSex" class="form-control" id="moreSex2" placeholder="性别" name="sex" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Qq" class="col-sm-2 control-label">
                            qq号
                        </label>
                        <div class="col-sm-10">
                            <input type="moreQq" class="form-control" id="moreQq2" placeholder="qq号" name="qq" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Phone" class="col-sm-2 control-label">
                            手机号
                        </label>
                        <div class="col-sm-10">
                            <input type="morePhone" class="form-control" id="morePhone2" placeholder="手机号" name="phone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Email" class="col-sm-2 control-label">
                            邮箱
                        </label>
                        <div class="col-sm-10">
                            <input type="moreEmail" class="form-control" id="moreEmail2" placeholder="邮箱" name="email" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Address" class="col-sm-2 control-label">
                            家庭地址
                        </label>
                        <div class="col-sm-10">
                            <input type="moreAddress" class="form-control" id="moreAddress2" placeholder="家庭地址" name="address" />
                        </div>
                    </div>
                    <div class="form-group" >
                        <label for="moreposition2" class="col-sm-2 control-label" >
                            职称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="moreposition2" placeholder="职称" name="position" />
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

<div class="modal fade" id="importDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">导入用户信息</h4>
            </div>
            <div class="form-group">
                <input id="fileFolder" type=file webkitdirectory>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="commit()">确定</button>
            </div>
        </div>
    </div>
</div>


<!-- 修改用户信息模态框 -->
<div class="modal fade" id="personalInforEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="update_personalInfor_form">
                    <div class="form-group" id="tea1">
                        <label for="editteacherId" class="col-sm-2 control-label" >
                            教师编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="editteacherId" placeholder="教师编号" name="teacherId" />
                        </div>
                    </div>
                    <div class="form-group" id="stu1">
                        <label for="editStudentId" class="col-sm-2 control-label " >
                            用户编号
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="editStudentId" placeholder="学生编号" name="studentId" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="editName" class="col-sm-2 control-label">
                            姓名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="editName" placeholder="姓名" name="name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Sex" class="col-sm-2 control-label">
                            性别
                        </label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="sex"  name="sex">
                                <option value="">--请选择--</option>
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="stu2">
                        <label for="Grade" class="col-sm-2 control-label" >
                            年级
                        </label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="grade"  name="grade">
                                <option value="">--请选择--</option>
                                <option value="大一">大一</option>
                                <option value="大二">大二</option>
                                <option value="大三">大三</option>
                                <option value="大四">大四</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="stu3">
                        <label for="School" class="col-sm-2 control-label" >
                            毕业学校
                        </label>
                        <div class="col-sm-10">
                            <input type="editSchool" class="form-control" id="editSchool" placeholder="毕业学校" name="school" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Qq" class="col-sm-2 control-label">
                            qq号
                        </label>
                        <div class="col-sm-10">
                            <input type="editQq" class="form-control" id="editQq" placeholder="qq号" name="qq" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Phone" class="col-sm-2 control-label">
                            手机号
                        </label>
                        <div class="col-sm-10">
                            <input type="editPhone" class="form-control" id="editPhone" placeholder="手机号" name="phone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Email" class="col-sm-2 control-label">
                            邮箱
                        </label>
                        <div class="col-sm-10">
                            <input type="editEmail" class="form-control" id="editEmail" placeholder="邮箱" name="email" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="Address" class="col-sm-2 control-label">
                            家庭地址
                        </label>
                        <div class="col-sm-10">
                            <input type="editAddress" class="form-control" id="editAddress" placeholder="家庭地址" name="address" />
                        </div>
                    </div>
                    <div class="form-group" id="stu4">
                        <label for="editEnrollmentDate" class="col-sm-2 control-label" i>
                            入学时间
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="editEnrollmentDate" placeholder="入学时间" name="enrollmentDate" />
                        </div>
                    </div>
                    <div class="form-group" id="tea2">
                        <label for="editposition" class="col-sm-2 control-label" >
                            职称
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="editposition" placeholder="职称" name="position" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updatePersonalInfor()">修改用户信息</button>
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
    //清空新建用户信息窗口中的数据
    function clearpersonalInfor() {
        $("#teacherId").val("");
        $("#StudentId").val("");
        $("#Name").val("");
        $("#Sex").val("");
        $("#Grade").val("");
        $("#School").val("");
        $("#Qq").val("");
        $("#Phone").val("");
        $("#Email").val("");
        $("#Address").val("");
        $("#EnrollmentDate").val("");
        $("#editStudentId").val("");
        $("#editName").val("");
        $("#editSex").val("");
        $("#editGrade").val("");
        $("#editSchool").val("");
        $("#editQq").val("");
        $("#editPhone").val("");
        $("#editEmail").val("");
        $("#editAddress").val("");
        $("#editEnrollmentDate").val("");
    }
    // 创建学生信息
    function createStuInfor(id) {
        if(id!=""){
            $.post("<%=basePath%>personalInfor/createTea.action",
                $("#new_personalInfor_form").serialize(),function(data){
                    if(data == "OK"){
                        alert("教师信息创建成功！");
                        window.location.reload();
                    }else if(data == "TeacherId Empty"){
                        alert("教师编号不得为空！");
                        window.location.reload();
                    }else if(data == "Name Empty"){
                        alert("姓名不得为空！");
                        window.location.reload();
                    }else if(data == "Email Empty"){
                        alert("邮箱不得为空！");
                        window.location.reload();
                    }else if(data == "Password Empty"){
                        alert("密码不得为空！");
                        window.location.reload();
                    }else if(data == "Duplicate"){
                        alert("教师id或者邮箱已注册！");
                        window.location.reload();
                    }else{
                        alert("创建失败！");
                        window.location.reload();
                    }
                });
        }
        else{
            $.post("<%=basePath%>personalInfor/createStu.action",
                $("#new_personalInfor_form").serialize(),function(data){
                    if(data == "OK"){
                        alert("学生信息创建成功！");
                        window.location.reload();
                    }else if(data == "StudentId Empty"){
                        alert("学号不得为空！");
                        window.location.reload();
                    }else if(data == "Name Empty"){
                        alert("姓名不得为空！");
                        window.location.reload();
                    }else if(data == "Email Empty"){
                        alert("邮箱不得为空！");
                        window.location.reload();
                    }else if(data == "Password Empty"){
                        alert("密码不得为空！");
                        window.location.reload();
                    }else if(data == "Duplicate"){
                        alert("学号或者邮箱已注册！");
                        window.location.reload();
                    }else{
                        alert("创建失败！");
                        window.location.reload();
                    }
                });
        }
    }
    // 执行修改用户信息操作
    function updatePersonalInfor() {
        $.post("<%=basePath%>personalInfor/update.action",
            $("#update_personalInfor_form").serialize(),function(data){
                if(data =="OK"){
                    alert("用户信息更新成功！");
                    window.location.reload();
                }else{
                    alert("用户信息更新失败！");
                    window.location.reload();
                }
            });
    }

    function lookInforStu(studentId) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>personalInfor/getpersonalInforStu.action",
            data:{"studentId":studentId},
            success:function(data) {
                $("#moreStudentId").val(data.studentId);
                $("#moreName").val(data.name);
                $("#moreSex").val(data.sex);
                $("#moreGrade").val(data.grade);
                $("#moreSchool").val(data.school);
                $("#moreQq").val(data.qq);
                $("#morePhone").val(data.phone);
                $("#moreEmail").val(data.email);
                $("#moreAddress").val(data.address);
                $("#moreEnrollmentDate").val(data.enrollmentDate);
            }
        });
    }

    function lookInforTea(teacherId) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>personalInfor/getpersonalInforTea.action",
            data:{"teacherId":teacherId},
            success:function(data) {
                $("#moreName2").val(data.name);
                $("#moreSex2").val(data.sex);
                $("#moreQq2").val(data.qq);
                $("#morePhone2").val(data.phone);
                $("#moreEmail2").val(data.email);
                $("#moreAddress2").val(data.address);
                $("#moreteacherId2").val(data.teacherId);
                $("#moreposition2").val(data.position);
            }
        });
    }

    // 通过id获取修改的用户信息
    function editpersonalInfor(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>personalInfor/getpersonalInforStuById.action",
            data:{"id":id},
            success:function(data) {
                $("#editStudentId").val(data.studentId);
                $("#editName").val(data.name);
                $("#editSex").val(data.sex);
                $("#editGrade").val(data.grade);
                $("#editSchool").val(data.school);
                $("#editQq").val(data.qq);
                $("#editPhone").val(data.phone);
                $("#editEmail").val(data.email);
                $("#editAddress").val(data.address);
                $("#editEnrollmentDate").val(data.enrollmentDate);
                $("#editteacherId").val(data.teacherId);
                $("#editposition").val(data.position);
                var flag2=data.studentId
                if (flag2){
                    document.getElementById("stu1").style.display="block";
                    document.getElementById("stu2").style.display="block";
                    document.getElementById("stu3").style.display="block";
                    document.getElementById("stu4").style.display="block";
                    document.getElementById("tea1").style.display="none";//隐藏
                    document.getElementById("tea2").style.display="none";//隐藏
                }
                else {
                    document.getElementById("tea1").style.display="block";
                    document.getElementById("tea2").style.display="block";
                    document.getElementById("stu1").style.display="none";//隐藏
                    document.getElementById("stu2").style.display="none";//隐藏
                    document.getElementById("stu3").style.display="none";//隐藏
                    document.getElementById("stu4").style.display="none";//隐藏
                }
            }
        });
    }
    // 删除用户信息
    function deletepersonalInfor(id) {
        if(confirm('确定要删除该用户信息吗?')) {
            $.ajax({
                type:"get",
                url:"<%=basePath%>personalInfor/delete.action",
                data:{"UserId":id},
                success:function(data) {
                    if(data =="OK"){
                        alert("用户信息删除成功！");
                        window.location.reload();
                    }else{
                        alert("该用户已选课或已指定课程，无法删除！");
                        window.location.reload();
                    }
                }
            });
        }
    }

    function commit(){
        //判断是否选中文件
        var file=$("#fileFolder").val();
        if(file==''){
            alert('请选择要上传的文件');
            return;
        }
        else{
            if(confirm('确定要导入用户信息吗?')) {
                $.ajax({
                    type: "get",
                    url: "<%=basePath%>personalInfor/import.action",
                    data: {"file": file},
                    success: function (data) {
                        if (data == "OK") {
                            alert("导入成功！");
                            window.location.reload();
                        } else {
                            alert("导入失败！");
                            window.location.reload();
                        }
                    }
                });
            }
            window.location.reload();
        }
    }


    // 通过id获取修改的用户信息
    function newpersonalInfor(id) {
        if (id==2){
            document.getElementById("stu11").style.display="block";
            document.getElementById("stu22").style.display="block";
            document.getElementById("stu33").style.display="block";
            document.getElementById("stu44").style.display="block";
            document.getElementById("tea11").style.display="none";//隐藏
            document.getElementById("tea22").style.display="none";//隐藏
        }
        else {
            document.getElementById("tea11").style.display="block";
            document.getElementById("tea22").style.display="block";
            document.getElementById("stu11").style.display="none";//隐藏
            document.getElementById("stu22").style.display="none";//隐藏
            document.getElementById("stu33").style.display="none";//隐藏
            document.getElementById("stu44").style.display="none";//隐藏
        }
    }

    function editPasswd(){
        $.post("<%=basePath%>personalInfor/editPasswd.action",
            $("#passwdDialog_form").serialize(),function(data){
                if(data =="OK"){
                    alert("密码更改成功！");
                    window.location.reload();
                }else if(data=="flag1"){
                    alert("两次密码输入不一致！");
                    window.location.reload();
                }
                else if(data=="flag2"){
                    alert("新旧密码相同！");
                    window.location.reload();
                }
                else if(data=="flag3"){
                    alert("原密码错误！");
                    window.location.reload();
                }
            });
    }
</script>



</body>
</html>