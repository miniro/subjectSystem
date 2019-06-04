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
            <a class="navbar-brand" href="<%=basePath%>notice/list.action">反方教学选课系统</a>
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

        <div class="navbar-default sidebar" id="navbar1" role="navigation" >
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <img src="${pageContext.request.contextPath}/images/school.jpg"  height="195" width="280" alt="城市学院" />
                    <li>
                        <a href="${pageContext.request.contextPath }/course/list.action" class="active">
                            <i class="fa fa-edit fa-fw" aria-hidden="true"></i> 课程管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/score/list.action">
                            <i class="fa fa-file fa-fw" aria-hidden="true"></i> 成绩管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/notice/list.action">
                            <i class="fa fa-exclamation-circle fa-fw"  aria-hidden="true"></i> 公告管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/personalInfor/list.action">
                            <i class="fa fa-gear fa-fw" aria-hidden="true"></i> 用户信息管理
                        </a>
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
        <div class="navbar-default sidebar" id="navbar2" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <img src="${pageContext.request.contextPath}/images/school.jpg"  height="195" width="280" alt="城市学院" />
                    <li>
                        <a href="${pageContext.request.contextPath }/course/list.action" class="active">
                            <i class="fa fa-edit fa-fw" aria-hidden="true"></i> 课程查询
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/course/toCourseTable.action">
                            <i class="fa fa-table fa-fw" aria-hidden="true"></i> 我的课表
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/score/list.action">
                            <i class="fa fa-file fa-fw" aria-hidden="true"></i> 成绩查询
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/notice/list.action">
                            <i class="fa fa-exclamation-circle fa-fw"  aria-hidden="true"></i> 公告栏
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/personalInfor/list.action">
                            <i class="fa fa-gear fa-fw" aria-hidden="true"></i> 个人信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/message/list.action">
                            <i class="fa fa-magic fa-fw" aria-hidden="true"></i> 我的消息
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
        <div class="navbar-default sidebar" id="navbar3" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <img src="${pageContext.request.contextPath}/images/school.jpg"  height="195" width="280" alt="城市学院" />
                    <li>
                        <a href="${pageContext.request.contextPath }/course/list.action" class="active">
                            <i class="fa fa-edit fa-fw" aria-hidden="true"></i> 课程查询
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/score/list.action">
                            <i class="fa fa-file fa-fw" aria-hidden="true"></i> 成绩管理
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/notice/list.action">
                            <i class="fa fa-exclamation-circle fa-fw"  aria-hidden="true"></i> 公告栏
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/personalInfor/list.action">
                            <i class="fa fa-gear fa-fw" aria-hidden="true"></i> 个人信息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath }/message/list.action">
                            <i class="fa fa-magic fa-fw" aria-hidden="true"></i> 我的消息
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
    <script type="text/javascript">
        flag="<%=session.getAttribute("FLAG")%>";
        if (flag==0){
            document.getElementById("navbar1").style.display="block";
            document.getElementById("navbar2").style.display="none";//隐藏
            document.getElementById("navbar3").style.display="none";//隐藏
        }
        else if(flag==1){
            document.getElementById("navbar2").style.display="block";
            document.getElementById("navbar1").style.display="none";//隐藏
            document.getElementById("navbar3").style.display="none";//隐藏
        }
        else if(flag==-1){
            document.getElementById("navbar3").style.display="block";
            document.getElementById("navbar1").style.display="none";//隐藏
            document.getElementById("navbar2").style.display="none";//隐藏
        }
    </script>
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">关于我们</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">计算1603 富涛涛（负责工作） 31601146</h3>
                <h3 class="page-header">计算1603 胡子衿（负责划水） 31601148</h3>
                <h3 class="page-header">谢谢🙏</h3>

            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>
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

</body>
</html>