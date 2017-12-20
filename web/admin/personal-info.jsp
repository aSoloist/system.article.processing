<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.article.processing.model.User" %>
<html>
<head>
    <title>稿件管理系统 - 个人信息</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- bootstrap -->
    <link href="../css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="../css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="../css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>

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
    User user = (User) request.getSession().getAttribute("user");
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
                <i class="icon-home"></i>
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
                <li><a href="personal-info.jsp" class="active">个人信息</a></li>
                <li><a href="revise-avatar.jsp">修改头像</a></li>
                <li><a href="modify-password.jsp">更改密码</a></li>
            </ul>
        </li>
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-edit"></i>
                <span>稿件管理</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="my-manuscript.jsp">我的稿件</a></li>
                <li><a href="submit-manuscript.jsp">提交稿件</a></li>
            </ul>
        </li>
        <li>
            <a href="../signin.jsp">
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

            <!-- edit form column -->
            <div class="span7 personal-info">
                <h5 class="personal-title">个人信息</h5>

                <form action="${pageContext.request.contextPath}/updateUser" method="post">
                <div class="field-box">
                    <label>姓名:</label>
                    <input class="span5 inline-input" type="text" name="username" value="<%=user.getUsername()%>"/>
                </div>
                <div class="field-box">
                    <label>用户名:</label>
                    <input class="span5 inline-input" type="text" name="nickname" value="<%=user.getNickname()%>"/>
                </div>
                <div class="field-box">
                    <label>单位:</label>
                    <input class="span5 inline-input" type="text" name="unit" value="<%=user.getUnit()%>"/>
                </div>
                <div class="field-box">
                    <label>地址:</label>
                    <input class="span5 inline-input" type="text" name="address" value="<%=user.getAddress()%>"/>
                </div>
                <div class="field-box">
                    <label>手机号:</label>
                    <input class="span5 inline-input" type="text" value="<%=user.getPhone()%>" disabled="true"/>
                </div>
                <div class="field-box">
                    <label>E-mail:</label>
                    <input class="span5 inline-input" type="text" value="<%=user.getEmail()%>" disabled="true"/>
                </div>
                <div class="span6 field-box actions">
                    <input type="submit" class="btn-glow primary" value="保存修改"/>
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
</body>
</html>