<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-bg">
<head>
    <title>稿件管理系统 - 注册</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet" />
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet" />
    <link href="css/validate.css" type="text/css" rel="stylesheet">

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
    <a href="signIn.jsp">
        <img src="img/logo.png" class="logo" />
    </a>
</div>
<div class="row-fluid login-wrapper">
    <div class="box">
        <div class="content-wrap">
            <h6>注册新用户</h6>
            <div class="alert alert-info">
                <i class="icon-lightbulb"></i>
                <span style="font-size: 16px" class="point">提示</span>
            </div>
            <form id="loginForm" method="post" action="${pageContext.request.contextPath}/register">
                <table id="TABLE">
                    <tbody>
                    <tr>
                        <td>姓名：</td>
                        <td>
                            <input class="span12" name="username" reg="^[\u4e00-\u9fa5]{2,4}$" tip="请输入2-4个汉字" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td>
                            <input id="password" class="span12" name="password" reg="^[a-zA-Z0-9_]{6,16}$" tip="密码长度最小为6，最长为16，只能含有字母数字下划线，且两次密码一致" type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td>
                            <input id="password2" class="span12" name="password2" reg="^[a-zA-Z0-9_]{6,16}$" tip="两次密码必须一致" type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>用户名：</td>
                        <td>
                            <input class="span12" name="nickname" reg="^[\u4e00-\u9fa5a-zA-Z0-9_]{3,}$" tip="用户名长度最小为3，可以含有汉字字母数字下划线" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>单位：</td>
                        <td>
                            <input class="span12" name="unit" reg="^[\u4e00-\u9fa5]+$" tip="请输入所在单位" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>地址：</td>
                        <td>
                            <input class="span12" name="address" reg="^[\u4e00-\u9fa5]{6,}$" tip="请输入地址，例如：河南省郑州市" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>手机号：</td>
                        <td>
                            <input class="span12" name="phone" reg="^1[3|5|7|8][0-9]{9}$" tip="请输入正确格式的手机号" url="${pageContext.request.contextPath}/isExist" type="text"/>
                        </td>
                    </tr>
                    <tr>
                        <td>E-mail：</td>
                        <td>
                            <input class="span12" name="email" reg="^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$" tip="请输入正确格式的邮箱"
                                   url="${pageContext.request.contextPath}/isExist" type="text"/>
                        </td>
                    </tr>
                </table>
                <br>
                <div class="remember">
                    <label for="mainAcceptIpt"><input id="mainAcceptIpt" type="checkbox"/>同意<a href="javascript:void(0);"> "服务条款" </a>
                        和<a href="javascript:void(0);"> "隐私相关政策" </a></label>
                </div>
                <div class="action">
                    <a class="btn-glow primary signup" id="login" href="javascript:document.getElementById('loginForm').submit();">注册</a>
                </div>
            </form>
        </div>
    </div>

    <div class="span4 already">
        <p>已有帐号？</p>
        <a href="signIn.jsp">直接登录</a>
    </div>
</div>

<!-- scripts -->
<script src="js/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/theme.js"></script>
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="application/javascript" src="js/easy_validator.pack.js"></script>
<script type="text/javascript" src="js/jquery.bgiframe.min.js"></script>
</body>
</html>