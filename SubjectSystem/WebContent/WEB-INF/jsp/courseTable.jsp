<%--
  Created by IntelliJ IDEA.
  User: abao
  Date: 2019-05-24
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="abao" uri="http://subjectsystem.ftthzj.team/common/"%>
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
    <script src="<%=basePath%>js/Timetables.min.js"></script>
    <style>
        #coursesTable {
            padding: 15px 10px;
        }

        .Courses-head {
            background-color: #edffff;
        }

        .Courses-head > div {
            text-align: center;
            font-size: 14px;
            line-height: 28px;
        }

        .left-hand-TextDom, .Courses-head {
            background-color: #f2f6f7;
        }

        .Courses-leftHand {
            background-color: #f2f6f7;
            font-size: 12px;
        }

        .Courses-leftHand .left-hand-index {
            color: #9c9c9c;
            margin-bottom: 4px !important;
        }

        .Courses-leftHand .left-hand-name {
            color: #666;
        }

        .Courses-leftHand p {
            text-align: center;
            font-weight: 900;
        }

        .Courses-head > div {
            border-left: none !important;
        }

        .Courses-leftHand > div {
            padding-top: 5px;
            border-bottom: 1px dashed rgb(219, 219, 219);
        }

        .Courses-leftHand > div:last-child {
            border-bottom: none !important;
        }

        .left-hand-TextDom, .Courses-head {
            border-bottom: 1px solid rgba(0, 0, 0, 0.1) !important;
        }

        .Courses-content > ul {
            border-bottom: 1px dashed rgb(219, 219, 219);
            box-sizing: border-box;
        }

        .Courses-content > ul:last-child {
            border-bottom: none !important;
        }

        .highlight-week {
            color: #02a9f5 !important;
        }

        .Courses-content li {
            text-align: center;
            color: #666666;
            font-size: 14px;
            line-height: 50px;
        }

        .Courses-content li span {
            padding: 6px 2px;
            box-sizing: border-box;
            line-height: 18px;
            border-radius: 4px;
            white-space: normal;
            word-break: break-all;
            cursor: pointer;
        }

        .grid-active {
            z-index: 9999;
        }

        .grid-active span {
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
        }
    </style>
    <style type="text/css">
        html, body {height:100%;}

        body {
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2afd0', endColorstr='#88caec',GradientType=1 ); /* IE6-9 fallback on horizontal gradient */
            font-family: 'Comfortaa', cursive;
        }

        #clock {
            height: 100%;
            position: relative;
            width: 100%;
            margin:10% auto;
            border-radius:50%;
            box-shadow:25px 40px 100px rgba(2, 2, 2, 0.7);
        }

        #clock div {
            position: absolute;
            left:50%;
        }

        #clock img[src*="second"] {
            transition: transform 600000s linear 1s;
            height: 150px;
            width: 100%;
        }

        #clock:target img[src*="second"] {
            transform: rotate(3600000deg);
            height: 150px;
            width: 2px;
        }

        #clock img[src*="minute"] {
            transition: transform 360000s linear 0s;
            height: 150px;
            width: 3px;
        }

        #clock:target img[src*="minute"] {
            height: 150px;
            width: 3px;
            transform: rotate(36000deg);
        }

        #clock img[src*="hour"] {
            height: 150px;
            width: 4px;
            color: #c7254e;
            transition: transform 216000s linear 0s;
        }

        #clock:target img[src*="hour"] {
            height: 150px;
            width: 4px;
            color: #c7254e;
            transform: rotate(360deg);
        }
        .clock1 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock1.png") no-repeat;
            background-size:150px 150px;
        }

        .clock2 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock2.png") no-repeat;
            background-size:150px 150px;
        }

        .clock3 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock3.png") no-repeat;
            background-size:150px 150px;
        }

        .clock4 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock4.png") no-repeat;
            background-size:150px 150px;
        }

        .clock5 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock5.png") no-repeat;
            background-size:150px 150px;
        }

        .clock6 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock6.png") no-repeat;
            background-size:150px 150px;
        }

        .clock7 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock7.png") no-repeat;
            background-size:150px 150px;
        }
        .clock8 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock8.png") no-repeat;
            background-size:150px 150px;
        }

        .clock9 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock9.png") no-repeat;
            background-size:150px 150px;
        }

        .clock10 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock10.png") no-repeat;
            background-size:150px 150px;
        }

        .clock11 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock11.png") no-repeat;
            background-size:150px 150px;
        }

        .clock12 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock12.png") no-repeat;
            background-size:150px 150px;
        }

        .clock13 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock1.png") no-repeat;
            background-size:150px 150px;
        }

        .clock14 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock2.png") no-repeat;
            background-size:150px 150px;
        }

        .clock15 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock3.png") no-repeat;
            background-size:150px 150px;
        }

        .clock16 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock4.png") no-repeat;
            background-size:150px 150px;
        }

        .clock17 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock5.png") no-repeat;
            background-size:150px 150px;
        }

        .clock18 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock6.png") no-repeat;
            background-size:150px 150px;
        }

        .clock19 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock7.png") no-repeat;
            background-size:150px 150px;
        }
        .clock20 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock8.png") no-repeat;
            background-size:150px 150px;
        }
        .clock21 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock9.png") no-repeat;
            background-size:150px 150px;
        }
        .clock22 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock10.png") no-repeat;
            background-size:150px 150px;
        }

        .clock23 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock11.png") no-repeat;
            background-size:150px 150px;
        }

        .clock0 {
            background:#383838 url("${pageContext.request.contextPath}/images/clock12.png") no-repeat;
            background-size:150px 150px;
        }

    </style>

</head>
<body>

<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
            <div id="clock" style="width:150px;height:150px;float:right">
            <div id="hour" style="transform: rotate(56deg);"><img src="${pageContext.request.contextPath}/images/hour.png"></div>
            <div id="minute" style="transform: rotate(312deg);"><img src="${pageContext.request.contextPath}/images/minute.png"></div>
            <div id="second" style="transform: rotate(6deg);"><img src="${pageContext.request.contextPath}/images/second.png"></div>
            </div>
        </ul>
    </div>
</div>
<div id="page-wrapper">

<div id="coursesTable"></div>
<a href="${pageContext.request.contextPath }/course/list.action">
    <button style="background-color: #00a2ae; color: #fff; padding: 5px 10px; border-radius: 4px;border: none">
        返回主页
    </button>
</a>
<button onclick="onChange2()"
        style="background-color: #00a2ae; color: #fff; padding: 5px 10px; border-radius: 4px;border: none">
    查看已选课表
</button>
<button onclick="onChange()"
        style="background-color: #00a2ae; color: #fff; padding: 5px 10px; border-radius: 4px;border: none">
    查看预置课表
</button>
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
    var courseList =${coursesName};
    function Clock_dg(prop) {
        var angle = 360/60,
            date = new Date();
        var h = date.getHours();
        if(h > 12) {
            h = h - 12;
        }

        hour = h;
        minute = date.getMinutes(),
            second = date.getSeconds(),
            hourAngle = (360/12) * hour + (360/(12*60)) * minute;

        $('#minute')[0].style[prop] = 'rotate('+angle * minute+'deg)';
        $('#second')[0].style[prop] = 'rotate('+angle * second+'deg)';
        $('#hour')[0].style[prop] = 'rotate('+hourAngle+'deg)';
        $('#clock').addClass('clock'+h);
    }


    $(function(){
        var props = 'transform WebkitTransform MozTransform OTransform msTransform'.split(' '),
            prop,
            el = document.createElement('div');

        for(var i = 0, l = props.length; i < l; i++) {
            if(typeof el.style[props[i]] !== "undefined") {
                prop = props[i];
                break;
            }
        }
        setInterval(function(){
            Clock_dg(prop)
        },100);
    });
    var week = window.innerWidth > 360 ? ['周一', '周二', '周三', '周四', '周五','周六','周日'] :
        ['一', '二', '三', '四', '五','六','七'];
    var day = new Date().getDay();
    var courseType = [
        [{index: '1', name: '8:30'}, 1],
        [{index: '2', name: '9:30'}, 1],
        [{index: '3', name: '10:30'}, 1],
        [{index: '4', name: '11:30'}, 1],
        [{index: '5', name: '12:30'}, 1],
        [{index: '6', name: '14:30'}, 1],
        [{index: '7', name: '15:30'}, 1],
        [{index: '8', name: '16:30'}, 1],
        [{index: '9', name: '17:30'}, 1],
        [{index: '10', name: '18:30'}, 1],
        [{index: '11', name: '19:30'}, 1],
        [{index: '12', name: '20:30'}, 1]
    ];
    // 实例化(初始化课表)
    var Timetable = new Timetables({
        el: '#coursesTable',
        timetables: courseList,
        week: week,
        timetableType: courseType,
        highlightWeek: day,
        gridOnClick: function (e) {
            alert(e.name + '  ' + e.week + ', 第' + e.index + '节课, 课长' + e.length + '节');
            console.log(e);
        },
        styles: {
            Gheight: 50
        }
    });

    //切换课表
    function onChange() {
        var courseListOther = ${coursesPresetName};

        Timetable.setOption({
            timetables: courseListOther,
            week: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
            styles: {
                palette: ['#dedcda', '#ff4081']
            },
            timetableType: courseType,
            gridOnClick: function (e) {
                alert(e.name + '  ' + e.week + ', 第' + e.index + '节课, 课长' + e.length + '节');
                console.log(e);            }
        });
    };

    function onChange2() {
        var courseListOther = ${coursesName};

        Timetable.setOption({
            timetables: courseListOther,
            week: ['周一', '周二', '周三', '周四', '周五', '周六', '周日'],
            styles: {
                palette: ['#dedcda', '#ff4081']
            },
            timetableType: courseType,
            gridOnClick: function (e) {
                alert(e.name + '  ' + e.week + ', 第' + e.index + '节课, 课长' + e.length + '节');
                console.log(e);            }
        });
    };

    //清空新建课程窗口中的数据
    function clearhomepage() {
        $("#new_homepageName").val("");
        $("#new_homepageFrom").val("")
        $("#new_custIndustry").val("")
        $("#new_custLevel").val("")
        $("#new_linkMan").val("");
        $("#new_phone").val("");
        $("#new_mobile").val("");
        $("#new_zipcode").val("");
        $("#new_address").val("");
    }
    // 创建课程
    function createhomepage() {
        $.post("<%=basePath%>homepage/create.action",
            $("#new_homepage_form").serialize(),function(data){
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
    function edithomepage(id) {
        $.ajax({
            type:"get",
            url:"<%=basePath%>homepage/gethomepageById.action",
            data:{"id":id},
            success:function(data) {
                $("#edit_cust_id").val(data.cust_id);
                $("#edit_homepageName").val(data.cust_name);
                $("#edit_homepageFrom").val(data.cust_source)
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
    function updatehomepage() {
        $.post("<%=basePath%>homepage/update.action",$("#edit_homepage_form").serialize(),function(data){
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
    function deletehomepage(id) {
        if(confirm('确实要删除该课程吗?')) {
            $.post("<%=basePath%>homepage/delete.action",{"id":id},
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
</div>
</body>
</html>
