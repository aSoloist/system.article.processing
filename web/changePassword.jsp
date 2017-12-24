<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="login-bg">
<head>
    <title>稿件管理系统 - 找回密码</title>

    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    
    <style type="text/css">
        body {
            background: url(<%=basePath%>img/bgs/landscape.jpg) no-repeat;
            background-size: 100% 100%;
            -moz-background-size: 100% 100%;
        }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- bootstrap -->
    <link href="<%=basePath%>css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/validate.css" type="text/css" rel="stylesheet">
    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/icons.css"/>

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/lib/font-awesome.css"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="<%=basePath%>css/compiled/signin.css" type="text/css" media="screen"/>

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
    <img class="logo" src="<%=basePath%>img/logo-white.png"/>

    <div class="span4 box">
        <div class="content-wrap">
            <h6>找回密码</h6>
            <div class="alert alert-info">
                <i class="icon-lightbulb"></i>
                <span style="font-size: 16px" class="point">提示</span>
            </div>
            <form id="loginForm" method="post" action="${pageContext.request.contextPath}/forUpdatePass">
                <input type="hidden" name="email" value="<%=(String) request.getAttribute("email")%>">
                <table id="TABLE">
                    <tbody>
                    <tr>
                        <td>密码：</td>
                        <td>
                            <input id="password" class="span12" name="password" reg="^[a-zA-Z0-9_]{6,16}$"
                                   tip="密码长度最小为6，最长为16，只能含有字母数字下划线，且两次密码一致" type="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>确认密码：</td>
                        <td>
                            <input id="password2" class="span12" name="password2" reg="^[a-zA-Z0-9_]{6,16}$"
                                   tip="两次密码必须一致" type="password"/>
                        </td>
                    </tr>
                    </tbody>
                </table><br>
                <div class="action">
                    <a class="btn-glow primary signup" id="login" href="javascript:document.getElementById('loginForm').submit();">确认修改</a>
                </div>
            </form>
        </div>
    </div>

    <div class="span4 no-account">
        <a href="signIn.jsp">返回登录</a>
    </div>

</div>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.3.2.min.js"></script>
<script type="application/javascript" src="<%=basePath%>js/easy_validator.pack.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.bgiframe.min.js"></script>
</body>
</html>