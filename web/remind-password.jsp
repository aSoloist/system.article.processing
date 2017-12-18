<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-bg" >
<head>
    <title>稿件管理系统 - 找回密码</title>

    <style type="text/css">
        body {
            background: url(img/bgs/landscape.jpg) no-repeat;
            background-size:100% 100%;
            -moz-background-size:100% 100%;}
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/elements.css" />
    <link rel="stylesheet" type="text/css" href="css/icons.css" />

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css" />

    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/signin.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /></head>
<body>
<div class="row-fluid login-wrapper">
    <img class="logo" src="img/logo-white.png" />

    <div class="span4 box">
        <div class="content-wrap">
            <h6>找回密码</h6>
            <form id="loginForm" method="post" action="${pageContext.request.contextPath}/admin-login">
                <input class="span12" type="text" placeholder="E-mail" name="email"/>
                <a class="btn-glow primary login"  href="javascript:document.getElementById('loginForm').submit();">发送邮件</a>
            </form>
        </div>
    </div>

    <div class="span4 no-account">
        <a href="signin.jsp">返回登录</a>
    </div>

</div>

</body>
</html>