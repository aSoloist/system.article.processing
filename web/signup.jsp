<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-bg">
<head>
    <title>稿件管理系统 - 注册</title>

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
    <link rel="stylesheet" href="css/compiled/signup.css" type="text/css" media="screen" />

    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css' />

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>

<div class="header">
    <a href="index.html">
        <img src="img/logo.png" class="logo" />
    </a>
</div>
<div class="row-fluid login-wrapper">
    <div class="box">
        <div class="content-wrap">
            <h6>注册新用户</h6>
            <form id="loginForm" method="post" action="${pageContext.request.contextPath}/login">
                <table id="TABLE">
                    <tbody>
                    <tr>
                        <td>姓名：</td>
                        <td>
                            <input class="span12" name="nickname" placeholder="2 - 4个汉字" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td>
                            <input class="span12" name="password" placeholder="密码" type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td>
                            <input class="span12" name="password2" placeholder="再次输入密码" type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>用户名：</td>
                        <td>
                            <input class="span12" name="username" placeholder="请输入用户名" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>单位：</td>
                        <td>
                            <input class="span12" name="unit" placeholder="单位" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>地址：</td>
                        <td>
                            <input class="span12" name="address" placeholder="精确到省" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>手机号：</td>
                        <td>
                            <input class="span12" name="phone" placeholder="请输入11位手机号" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>E-mail：</td>
                        <td>
                            <input class="span12" name="phone" placeholder="XXXXXXXX @ XXX .com" type="text"/>
                        </td>
                    </tr>
                </table>
                <br>
                <div class="remember">
                    <label for="mainAcceptIpt"><input id="mainAcceptIpt" type="checkbox"/>同意<a href="javascript:void(0);"> "服务条款" </a>
                        和<a href="javascript:void(0);"> "隐私相关政策" </a></label>
                </div>
                <div class="action">
                    <a class="btn-glow primary signup" href="javascript:document.getElementById('loginForm').submit();">注册</a>
                </div>
            </form>
        </div>
    </div>

    <div class="span4 already">
        <p>已有帐号？</p>
        <a href="signin.jsp">直接登录</a>
    </div>
</div>

<!-- scripts -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/theme.js"></script>

</body>
</html>