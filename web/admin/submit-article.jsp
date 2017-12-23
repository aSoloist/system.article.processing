<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Soloist
  Date: 2017/12/14
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>稿件管理系统 - 提交稿件</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- bootstrap -->
    <link href="../css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="../css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="../css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>

    <!-- libraries -->
    <link href="../css/lib/bootstrap-wysihtml5.css" type="text/css" rel="stylesheet"/>
    <link href="../css/lib/uniform.default.css" type="text/css" rel="stylesheet"/>
    <link href="../css/lib/select2.css" type="text/css" rel="stylesheet"/>
    <link href="../css/lib/bootstrap.datepicker.css" type="text/css" rel="stylesheet"/>
    <link href="../css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="../css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="../css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="../css/icons.css"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="../css/compiled/form-showcase.css" type="text/css" media="screen"/>

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
        out.print("<script>alert(\"提交成功\");</script>");
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
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-group"></i>
                <span>用户中心</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="personal-info.jsp">个人信息</a></li>
                <li><a href="modify-password.jsp">更改密码</a></li>
            </ul>
        </li>
        <li class="active">
            <a class="dropdown-toggle" href="#">
                <i class="icon-edit"></i>
                <span>稿件管理</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="active submenu">
                <li><a href="all-article.jsp">我的稿件</a></li>
                <li><a href="submit-article.jsp" class="active">提交稿件</a></li>
            </ul>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/exit">
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
        <div id="pad-wrapper" class="form-page">
            <div class="row-fluid form-wrapper">
                <form action="${pageContext.request.contextPath}/saveArticle" method="post">
                    <div class="field-box">
                        <label>标题:</label>
                        <input class="span7 inline-input" type="text" name="title" value="" minlength="1" maxlength="30"/>
                    </div>
                    <div class="field-box">
                        <label>内容:</label>
                        <div class="wysi-column">
                            <textarea id="wysi" class="span10 wysihtml5" rows="20" name="content" minlength="10" title=""></textarea>
                        </div>
                    </div>
                    <div class="span6 field-box actions text-center">
                        <input type="submit" class="btn-glow primary" value="提交"/>
                        <span>&nbsp;或</span>
                        <input type="reset" value="取消" class="reset"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- scripts for this page -->
<script src="../js/wysihtml5-0.3.0.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/bootstrap-wysihtml5-0.0.2.js"></script>
<script src="../js/bootstrap.datepicker.js"></script>
<script src="../js/jquery.uniform.min.js"></script>
<script src="../js/select2.min.js"></script>
<script src="../js/theme.js"></script>

<!-- call this page plugins -->
<script type="text/javascript">
    $(function () {

        // wysihtml5 plugin on textarea
        $(".wysihtml5").wysihtml5({
            "font-styles": false
        });

        $(window).bind('beforeunload', function(){
            return '';
        });
    });
</script>

</body>
</html>
