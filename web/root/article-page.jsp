<%@ page import="java.util.List" %>
<%@ page import="com.article.processing.model.Pagination" %>
<%@ page import="com.article.processing.model.Message" %>
<%@ page import="com.article.processing.model.Article" %><%--
  Created by IntelliJ IDEA.
  User: LiWenfeng
  Date: 2017/12/21 0021
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>稿件管理系统 - 所有稿件</title>

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
    String id = request.getParameter("id");
    List list = ((Pagination) request.getSession().getAttribute("articles")).getData();
%>
<!-- sidebar -->
<div id="sidebar-nav">
    <ul id="dashboard-menu">
        <li>
            <a href="../root/index.jsp">
                <i class="icon-home"></i>
                <span>主页</span>
            </a>
        </li>
        <li>
            <a href="all-user.jsp">
                <i class="icon-group"></i>
                <span>所有用户</span>
            </a>
        </li>
        <li class="active">
            <a class="dropdown-toggle" href="#">
                <i class="icon-edit"></i>
                <span>稿件管理</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="active submenu">
                <li><a href="check-pending.jsp">待审核稿件</a></li>
                <li><a href="all-article.jsp" class="active">所有稿件</a></li>
            </ul>
        </li>
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-envelope"></i>
                <span>管理公告</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="announcement.jsp">发布公告</a></li>
                <li><a href="all-message.jsp">管理公告</a></li>
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
<%
    if (id != null && list.size() > 0) {
        Article article = null;
        for (Object o : list) {
            if (id.equals(((Article) o).getId())) {
                article = (Article) o;
                break;
            }
        }
        if (article != null) {
%>
<!-- main container -->
<div class="content">
    <div class="container-fluid">
        <div id="pad-wrapper" class="form-page">
            <div class="row-fluid form-wrapper">
                <form action="${pageContext.request.contextPath}/root/setStatus" method="post">
                    <%
                        request.setAttribute("id", article.getId());
                    %>
                    <div class="field-box">
                        <label>标题:</label>
                        <input class="span7 inline-input" type="text" name="title" value="<%=article.getTitle()%>"
                               maxlength="30" readonly="readonly"/>
                    </div>
                    <div class="field-box">
                        <label>内容:</label>
                        <div>
                            <textarea class="span10" rows="20" name="content" title=""
                                      readonly="readonly"><%=article.getContent()%></textarea>
                        </div>
                    </div>
                    <div class="span6 field-box actions text-center">
                        <input type="submit" class="btn-glow primary" value="通过"/>
                        <span>或</span>
                        <input type="submit" class="btn-glow inverse" value="未通过"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%
        }
    }
%>
<!-- scripts for this page -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/jquery.uniform.min.js"></script>
<script src="../js/select2.min.js"></script>
<script src="../js/theme.js"></script>


</body>
</html>
