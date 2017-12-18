<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-bg" >
<head>
	<title>稿件管理系统 - 注册</title>

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
                <h6>注册</h6>
                <div class="alert alert-info">
                    <i class="icon-lightbulb"></i>
                    可用作提示错误信息
                </div>
                <form id="registForm" method="post" action="${pageContext.request.contextPath}/login">
                    <table id="TABLE">
                        <tbody>
                        <tr>
                            <td>姓名：</td>
                            <td>
                                <input class="span12" name="nickname" placeholder="2 - 4个汉字" type="text" />
                            </td>
                        </tr>
                        <tr>
                            <td>密码：</td>
                            <td>
                                <input class="span12" name="password" placeholder="密码" type="password" />
                            </td>
                        </tr>
                        <tr>
                            <td>确认密码：</td>
                            <td>
                                <input class="span12" name="password2" placeholder="再次输入密码" type="password" />
                            </td>
                        </tr>
                        <tr>
                            <td>用户名：</td>
                            <td>
                                <input class="span12" name="username" placeholder="请输入用户名" type="text" />
                            </td>
                        </tr>
                        <tr>
                            <td>单位：</td>
                            <td>
                                <input class="span12" name="unit" placeholder="单位" type="text" />
                            </td>
                        </tr>
                        <tr>
                            <td>地址：</td>
                            <td>
                                <input class="span12" name="address" placeholder="精确到省" type="text" />
                            </td>
                        </tr>
                        <tr>
                            <td>手机号：</td>
                            <td>
                                <input class="span12" name="email" placeholder="请输入11位手机号" type="text" />
                            </td>
                        </tr>
                        <tr>
                            <td>E-mail：</td>
                            <td>
                                <input class="span12" name="phone" placeholder="XXXXXXXX @ XXX .com" type="text" />
                            </td>
                        </tr>
                    </table>
                    <div class="remember">
                        <input id="mainAcceptIpt" type="checkbox" />
                        <label for="mainAcceptIpt">同意<a href="javascript:void(0);" > "服务条款" </a>
                            和<a href="javascript:void(0);" > "隐私权相关政策" </a></label>
                    </div>
                    <a class="btn-glow primary login"  href="javascript:document.getElementById('registForm').submit();">注册</a>
                </form>
                <div class="forgot">已有帐号？<a href="signin.jsp">直接登录</a></div>
            </div>
        </div>

    </div>

</body>
</html>