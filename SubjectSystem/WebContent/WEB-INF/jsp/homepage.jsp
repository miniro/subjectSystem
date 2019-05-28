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
</head>
<body>
<div id="wrapper">
    <!-- 导航栏部分 -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation"
         style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=basePath%>course/list.action">反方教学选课系统</a>
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
                                <strong>张经理</strong> <span class="pull-right text-muted">
								<em>昨天</em>
							</span>
                            </div>
                            <div>今天晚上开会，讨论一下下个月工作的事...</div>
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
                                    <strong>任务 1</strong>
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
                                    <strong>任务 2</strong>
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
                        <a href="#">
                            <div>
                                <i class="fa fa-upload fa-fw"></i> 服务器重启
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
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
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
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <img src="${pageContext.request.contextPath}/images/school.jpg"  height="195" width="250" alt="城市学院" />
                    <li>
                        <a href="${pageContext.request.contextPath }/course/list.action" class="active">
                            <i class="fa fa-edit fa-fw" aria-hidden="true"></i> 课程管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/course/toCourseTable.action">
                            <i class="fa fa-table fa-fw" aria-hidden="true"></i> 查看课表
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/score/listScoreTable.action">
                            <i class="fa fa-file fa-fw" aria-hidden="true"></i> 查看成绩
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/notice/list.action">
                            <i class="fa fa-exclamation-circle fa-fw"  aria-hidden="true"></i> 查看公告
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/information/list.action">
                            <i class="fa fa-gear fa-fw" aria-hidden="true"></i>个人信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/fttAndHzj/list.action">
                            <i class="fa fa-bug fa-fw" aria-hidden="true"></i>关于我们
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 左侧显示列表部分 end-->
    </nav>
    <!-- 课程列表查询部分  start-->
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">课程管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="panel panel-default">
            <div class="panel-body">
                <form class="form-inline" method="get"
                      action="${pageContext.request.contextPath }/course/list.action">
                    <div class="form-group">
                        <label for="courseId">课程id</label>
                        <input type="text" class="form-control" id="courseId"
                               value="${courseId }" name="courseId" />
                    </div>
                    <div class="form-group">
                        <label for="courseName">课程名称</label>
                        <input type="text" class="form-control" id="courseName"
                               value="${courseName }" name="courseName" />
                    </div>
                    <div class="form-group">
                        <label for="teacherName">教师姓名</label>
                        <input type="text" class="form-control" id="teacherName"
                               value="${teacherName }" name="teacherName" />
                    </div>
                    <div class="form-group">
                        <label for="property">课程类别</label>
                        <select	class="form-control" id="property1" name="property">
                            <option value="">--请选择--</option>
                            <option value="1">必修课</option>
                            <option value="2">选修课</option>
                        </select>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="credit">所占学分</label>--%>
<%--                        <select	class="form-control" id="credit"  name="credit">--%>
<%--                            <option value="">--请选择--</option>--%>
<%--                            <c:forEach items="${creditType}" var="item">--%>
<%--                                <option value="${item.dict_id}"--%>
<%--                                        <c:if test="${item.dict_id == credit}"> selected</c:if>>--%>
<%--                                        ${item.dict_item_name }--%>
<%--                                </option>--%>
<%--                            </c:forEach>--%>
<%--                        </select>--%>
<%--                    </div>--%>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
        <a href="#" class="btn btn-primary" data-toggle="modal"
           data-target="#newcourseDialog" onclick="clearcourse()">新建</a>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">课程信息列表</div>
                    <!-- /.panel-heading -->
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>课程编号</th>
                            <th>课程名称</th>
                            <th>学分</th>
                            <th>教师姓名</th>
                            <th>课程性质</th>
                            <th>上课时间</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${page.rows}" var="row">
                            <tr>
                                <td>${row.courseId}</td>
                                <td>${row.courseName}</td>
                                <td>${row.credit}</td>
                                <td>${row.teacherName}</td>
                                <td>${row.property}</td>
                                <td>${row.time}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-md-12 text-right">
                        <itheima:page url="${pageContext.request.contextPath }/course/list.action" />
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
    </div>
    <!-- 课程列表查询部分  end-->
</div>
<!-- 创建课程模态框 -->
<div class="modal fade" id="newcourseDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel1">新建课程信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_course_form">
                    <div class="form-group">
                        <label for="new_courseId" class="col-sm-2 control-label">
                            课程id
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_courseId" placeholder="课程id" name="courseId" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_courseName" class="col-sm-2 control-label">
                            课程名
                        </label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="new_courseName" placeholder="课程姓名" name="courseName" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="teacherId" style="float:left;padding:7px 15px 0 27px;">教师</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="teacherId" name="teacherId">
                                <option value="">--请选择--</option>
                                <c:forEach items="${teacherList}" var="item">
                                    <option value="${item.teacherId}"<c:if test="${item.teacherId == teacherId}"> selected</c:if>>${item.name}&emsp;${item.teacherId}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="credit" style="float:left;padding:7px 15px 0 27px;">学分</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="credit"  name="credit">
                                <option value="">--请选择--</option>
                                <c:forEach items="${creditList}" var="item">
                                    <option value="${item}"<c:if test="${item == credit}"> selected</c:if>>
                                            ${item}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="property" style="float:left;padding:7px 15px 0 27px;">课程性质</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="property"  name="property">
                                <option value="">--请选择--</option>
                                <option value="1">必修课</option>
                                <option value="2">选修课</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="weekTime" style="float:left;padding:7px 15px 0 27px;">上课时间</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="weekTime"  name="weekTime">
                                <option value="">--请选择--</option>
                                <c:forEach var="i" begin="1" end="7" step="1">
                                    <option value="${i}">周${i}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="startingTime" style="float:left;padding:7px 15px 0 27px;">开始时间</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="startingTime"  name="startingTime">
                                <option value="">--请选择--</option>
                                <c:forEach var="j" begin="1" end="12" step="1">
                                    <option value="${j}">${j}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="endingTime" style="float:left;padding:7px 15px 0 27px;">结束时间</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="endingTime"  name="endingTime">
                                <option value="">--请选择--</option>
                                <c:forEach var="k" begin="1" end="12" step="1">
                                    <option value="${k}">${k}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
<%--                    <div class="form-group">--%>
<%--                        <label for="new_custLevel" style="float:left;padding:7px 15px 0 27px;">上课时间</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <select	class="form-control" id="new_custLevel" name="cust_level">--%>
<%--                                <option value="">--请选择--</option>--%>
<%--                                <c:forEach items="${levelType}" var="item">--%>
<%--                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>--%>
<%--                                </c:forEach>--%>
<%--                            </select>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="new_phone" class="col-sm-2 control-label">起始时间</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="text" class="form-control" id="new_phone" placeholder="起始时间" name="cust_phone" />--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="new_mobile" class="col-sm-2 control-label">结束时间</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="text" class="form-control" id="new_mobile" placeholder="结束时间" name="cust_mobile" />--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="new_zipcode" class="col-sm-2 control-label">截止时间</label>--%>
<%--                        <div class="col-sm-10">--%>
<%--                            <input type="text" class="form-control" id="new_zipcode" placeholder="截止时间" name="cust_zipcode" />--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="createcourse()">创建课程</button>
            </div>
        </div>
    </div>
</div>
<!-- 修改课程模态框 -->
<div class="modal fade" id="courseEditDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改课程信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_course_form">
                    <input type="hidden" id="edit_cust_id" name="cust_id"/>
                    <div class="form-group">
                        <label for="edit_courseName" class="col-sm-2 control-label">课程名称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_courseName" placeholder="课程名称" name="cust_name" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_courseFrom" style="float:left;padding:7px 15px 0 27px;">课程来源</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_courseFrom" name="cust_source">
                                <option value="">--请选择--</option>
                                <c:forEach items="${fromType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_custIndustry"  name="cust_industry">
                                <option value="">--请选择--</option>
                                <c:forEach items="${industryType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">课程级别</label>
                        <div class="col-sm-10">
                            <select	class="form-control" id="edit_custLevel" name="cust_level">
                                <option value="">--请选择--</option>
                                <c:forEach items="${levelType}" var="item">
                                    <option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_linkMan" placeholder="联系人" name="cust_linkman" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_phone" placeholder="固定电话" name="cust_phone" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_mobile" placeholder="移动电话" name="cust_mobile" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_zipcode" placeholder="邮政编码" name="cust_zipcode" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_address" class="col-sm-2 control-label">联系地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="edit_address" placeholder="联系地址" name="cust_address" />
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updatecourse()">保存修改</button>
            </div>
        </div>
    </div>
</div>
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
<!-- 编写js代码 -->
<script type="text/javascript">
    //清空新建课程窗口中的数据
    function clearcourse() {
        $("#new_courseName").val("");
        $("#new_courseFrom").val("")
        $("#new_custIndustry").val("")
        $("#new_custLevel").val("")
        $("#new_linkMan").val("");
        $("#new_phone").val("");
        $("#new_mobile").val("");
        $("#new_zipcode").val("");
        $("#new_address").val("");
    }
    // 创建课程
    function createcourse() {
        $.post("<%=basePath%>course/create.action",
            $("#new_course_form").serialize(),function(data){
                if(data =="OK"){
                    alert("课程创建成功！");
                    window.location.reload();
                }else{
                    alert("课程创建失败！");
                    window.location.reload();
                }
            });
    }
    // 通过id获取修改的课程信息
    function editcourse(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>course/getcourseById.action",
            data:{"id":id},
            success:function(data) {
                $("#edit_cust_id").val(data.cust_id);
                $("#edit_courseName").val(data.cust_name);
                $("#edit_courseFrom").val(data.cust_source)
                $("#edit_custIndustry").val(data.cust_industry)
                $("#edit_custLevel").val(data.cust_level)
                $("#edit_linkMan").val(data.cust_linkman);
                $("#edit_phone").val(data.cust_phone);
                $("#edit_mobile").val(data.cust_mobile);
                $("#edit_zipcode").val(data.cust_zipcode);
                $("#edit_address").val(data.cust_address);

            }
        });
    }
    // 执行修改课程操作
    function updatecourse() {
        $.post("<%=basePath%>course/update.action",$("#edit_course_form").serialize(),function(data){
            if(data =="OK"){
                alert("课程信息更新成功！");
                window.location.reload();
            }else{
                alert("课程信息更新失败！");
                window.location.reload();
            }
        });
    }
    // 删除课程
    function deletecourse(id) {
        if(confirm('确实要删除该课程吗?')) {
            $.post("<%=basePath%>course/delete.action",{"id":id},
                function(data){
                    if(data =="OK"){
                        alert("课程删除成功！");
                        window.location.reload();
                    }else{
                        alert("删除课程失败！");
                        window.location.reload();
                    }
                });
        }
    }
</script>
</body>
</html>