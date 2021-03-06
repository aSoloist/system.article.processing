<%--
  Created by IntelliJ IDEA.
  User: LiWenfeng
  Date: 2017/12/22 0022
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.article.processing.model.Article" %>
<%@ page import="com.article.processing.model.Pagination" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="com.article.processing.model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>稿件管理系统 - 所有用户</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- bootstrap -->
    <link href="../css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="../css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="../css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>

    <!-- libraries -->
    <link href="../css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css"/>
    <link href="../css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="../css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="../css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="../css/icons.css"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="../css/compiled/index.css" type="text/css" media="screen"/>

    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
          rel='stylesheet' type='text/css'/>

    <!-- lato font -->
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900,300italic,400italic,700italic,900italic'
          rel='stylesheet' type='text/css'/>

    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>

<%@include file="header.jsp" %>
<%
    Pagination users = (Pagination) session.getAttribute("users");
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
        <li class="active">
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div>
            <a href="allUser.jsp">
                <i class="icon-group"></i>
                <span>所有用户</span>
            </a>
        </li>
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-edit"></i>
                <span>稿件管理</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="checkPending.jsp">待审核稿件</a></li>
                <li><a href="allArticle.jsp">所有稿件</a></li>
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
                <li><a href="allMessage.jsp">管理公告</a></li>
            </ul>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/root/exit">
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
        <div id="pad-wrapper">

            <!-- orders table -->
            <div class="table-wrapper orders-table">
                <div class="row-fluid head">
                    <div class="span12">
                        <h4>所有用户</h4>
                    </div>
                </div>
                <br>

                <div class="row-fluid span12">

                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="span3">
                                <span class="line"></span>
                                用户名
                            </th>
                            <th class="span3">
                                <span class="line"></span>
                                姓名
                            </th>
                            <th class="span4">
                                邮箱
                            </th>
                            <th class="span4">
                                <span class="line"></span>
                                手机号
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <%
                            if (users != null) {
                                int pages = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
                                users.setPage(pages);
                                int startIndex = users.getStartIdx();
                                int totalPage = users.getTotalPage();
                                List list = users.getData();
                                int rows = users.getRows();
                                if (pages == totalPage) {
                                    rows = users.getCount() - (totalPage - 1) * rows;
                                }
                                for (int i = 0; i < rows; i++) {
                                    User user = (User) list.get(startIndex++);
                        %>
                        <tr class="first">
                            <td>
                                <a href="userPage.jsp?id=<%=user.getId()%>">
                                    <%=user.getNickname()%>
                                </a>
                            </td>
                            <td>
                                <%=user.getUsername()%>
                            </td>
                            <td>
                                <%=user.getEmail()%>
                            </td>
                            <td>
                                <%=user.getPhone()%>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                    <div class="pagination text-center">
                        <ul>
                            <li><a href="allUser.jsp?page=<%=pages == 1 ? 1 : pages - 1%>">‹</a></li>
                            <%
                                for (int i = 1; i <= totalPage; i++) {
                                    if (pages == i) {
                                        out.println("<li><a class=\"active\" href=\"getMessage.jsp?page=" + i + "\">" + i + "</a></li>");
                                    } else {
                                        out.println("<li><a href=\"getMessage.jsp?page=" + i + "\">" + i + "</a></li>");
                                    }
                                }
                            %>
                            <li><a href="allUser.jsp?page=<%=pages == totalPage ? totalPage : pages + 1%>">›</a>
                            </li>
                        </ul>
                    </div>
                    <%}%>
                </div>
            </div>
            <!-- end orders table -->
        </div>
    </div>
</div>

<!-- scripts -->
<script src="../js/jquery-latest.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/theme.js"></script>

</body>
</html>