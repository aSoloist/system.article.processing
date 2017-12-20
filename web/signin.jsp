<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-bg">
<head>
    <title>稿件管理系统 - 用户登录</title>

    <style type="text/css">
        body {
            background: url(img/bgs/landscape.jpg) no-repeat;
            background-size: 100% 100%;
            -moz-background-size: 100% 100%;
        }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>
    <link href="css/validate.css" type="text/css" rel="stylesheet">

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="css/icons.css"/>

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/signin.css" type="text/css" media="screen"/>

    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'/>

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

</head>
<body>
<div class="row-fluid login-wrapper">
    <img class="logo" src="img/logo-white.png"/>

    <div class="span4 box">
        <div class="content-wrap">
            <h6>登录</h6>
            <div class="alert alert-info">
                <i class="icon-lightbulb"></i>
                <span style="font-size: 16px" class="point"></span>
            </div>
            <form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
                <input class="span12" type="text" placeholder="手机号/E-mail" name="phoneOrEmail" reg="^\S+$" tip="手机号或邮箱不能为空"/>
                <input class="span12" type="password" placeholder="密码" name="password" reg="^\S+$" tip="密码不能为空"/>
                <a href="remind-password.jsp" class="forgot">忘记密码？</a>
                <a class="btn-glow primary login"
                   href="javascript:document.getElementById('loginForm').submit();">登录</a>
            </form>
        </div>
    </div>

    <div class="span4 no-account">
        <p>还没有帐号？</p>
        <a href="signup.jsp">注册一个</a>
    </div>
    <div class="span4 no-account">
        <a href="admin-signin.jsp">管理员登录</a>
    </div>

</div>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="application/javascript" src="js/easy_validator.pack.js"></script>
<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>
</body>
</html>