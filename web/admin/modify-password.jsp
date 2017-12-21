<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>稿件管理系统 - 修改密码</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- bootstrap -->
    <link href="../css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="../css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="../css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>

    <link href="../css/validate.css" type="text/css" rel="stylesheet">
    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="../css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="../css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="../css/icons.css"/>

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="../css/lib/font-awesome.css"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="../css/compiled/personal-info.css" type="text/css" media="screen"/>

    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'/>

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>

<%@include file="header.jsp" %>
<%
    String key = request.getParameter("key");
    if (key != null && key.equals("1")) {
        out.print("<script>alert(\"密码修改成功\");</script>");
    }
%>
<!-- sidebar -->
<div id="sidebar-nav">
    <ul id="dashboard-menu">
        <li>
            <a href="index.jsp">
                <i class="icon-home"></i>
                <span>主页</span>
            </a>
        </li>
        <li>
            <a href="get-message.jsp">
                <i class="icon-comment"></i>
                <span>消息</span>
            </a>
        </li>
        <li class="active">
            <a class="dropdown-toggle" href="#">
                <i class="icon-group"></i>
                <span>用户中心</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="active submenu">
                <li><a href="personal-info.jsp">个人信息</a></li>
                <li><a href="modify-password.jsp" class="active">更改密码</a></li>
            </ul>
        </li>
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-edit"></i>
                <span>稿件管理</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="all-article.jsp">我的稿件</a></li>
                <li><a href="submit-article.jsp">提交稿件</a></li>
            </ul>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/exit">
                <i class="icon-share-alt"></i>
                <span>退出帐号</span>
            </a>
        </li>
    </ul>
</div>
<!-- end sidebar -->

<!-- main container -->
<div class="content">
    <div class="container-fluid">
        <div class="settings-wrapper" id="pad-wrapper">

            <div class="alert alert-info" style="margin-left: 29px; width: 1200px">
                <i class="icon-lightbulb"></i>
                <span style="font-size: 16px" class="point">提示</span>
            </div>
            <!-- edit form column -->
            <div class="span7 personal-info">
                <h5 class="personal-title">修改密码</h5>

                <form class="modify-password" method="post" action="${pageContext.request.contextPath}/updatePassword">
                <div class="field-box">
                    <label>原密码:</label>
                    <input class="span5 inline-input" name="oldPassword" type="password" reg="^[a-zA-Z0-9_]{6,16}$" tip="密码长度最小为6，最长为16，只能含有字母数字下划线" 
                           value="" minlength="6" maxlength="16"/>
                </div>
                <div class="field-box">
                    <label>新密码:</label>
                    <input class="span5 inline-input" id="password" name="password" type="password" reg="^[a-zA-Z0-9_]{6,16}$" tip="密码长度最小为6，最长为16，只能含有字母数字下划线，且两次密码一致"
                           value="" minlength="6" maxlength="16"/>
                </div>
                <div class="field-box">
                    <label>再次输入:</label>
                    <input class="span5 inline-input" id="password2" name="password2" type="password" reg="^[a-zA-Z0-9_]{6,16}$" tip="两次密码必须一致"
                           value="" minlength="6" maxlength="16"/>
                </div>
                <div class="span6 field-box actions">
                    <input type="submit" id="login" class="btn-glow primary" value="保存修改"/>
                    <span>或</span>
                    <input type="reset" value="取消" class="reset"/>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end main container -->

<!-- scripts -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/theme.js"></script>
<script type="text/javascript" src="../js/jquery-1.3.2.min.js"></script>
<script type="application/javascript" src="../js/easy_validator.pack.js"></script>
<script type="text/javascript" src="../js/jquery.bgiframe.min.js"></script>
</body>
</html>