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
    Pagination pagination = (Pagination) session.getAttribute("articles");
%>
<!-- sidebar -->
<div id="sidebar-nav">
    <ul id="dashboard-menu">
        <li class="active">
            <a href="../admin/index.jsp">
                <i class="icon-home"></i>
                <span>主页</span>
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
            <a href="all-user.jsp">
                <i class="icon-group"></i>
                <span>所有用户</span>
            </a>
        </li>
        <li>
            <a href="all-user.jsp">
                <i class="icon-envelope"></i>
                <span>发送公告</span>
            </a>
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

<!-- main container -->
<div class="content">

    <div class="container-fluid">
        <div id="pad-wrapper">

            <!-- orders table -->
            <div class="table-wrapper orders-table">
                <div class="row-fluid head">
                    <div class="span12">
                        <h4>稿件状态</h4>
                    </div>
                </div>
                <br>

                <div class="row-fluid span12">

                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="span3">
                                <span class="line"></span>
                                标题
                            </th>
                            <th class="span6">
                                <span class="line"></span>
                                内容
                            </th>
                            <th class="span2">
                                最近提交日期
                            </th>
                            <th class="span2">
                                <span class="line"></span>
                                提交次数
                            </th>
                            <th class="span2">
                                <span class="line"></span>
                                状态
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <%
                            if (pagination != null) {
                                int pages = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
                                pagination.setPage(pages);
                                int startIndex = pagination.getStartIdx();
                                List list = pagination.getData();
                                int totalPage = pagination.getTotalPage();
                                int rows = pagination.getRows();
                                if (pages == totalPage) {
                                    rows = pagination.getCount() - (totalPage - 1) * rows;
                                }
                                for (int i = 0; i < rows; i++) {
                                    Article article = (Article) list.get(startIndex++);
                        %>
                        <tr class="first">
                            <td>
                                <a href="#">
                                    <%
                                        String title = article.getTitle();
                                        if (title.length() > 8) {
                                            title = title.substring(0, 8) + "......";
                                        }
                                    %>
                                    <%=title%>
                                </a>
                            </td>
                            <td>
                                <%
                                    String content = article.getContent();
                                    if (content.length() > 40) {
                                        content = content.substring(0, 40) + "......";
                                    }
                                %>
                                <%=content%>
                            </td>
                            <td>
                                <%=new Date(article.getCreateTime().getTime())%>
                            </td>
                            <td>
                                <%=article.getVer()%>
                            </td>
                            <td>
                                <%
                                    if (article.getStatus() == 0) {
                                %><span class="label label-info">审核中
                                    <%
                            } else if (article.getStatus() == 1) {
                        %><span class="label ">未通过
                                        <%
                            } else if (article.getStatus() == 2) {
                        %><span class="label label-success">通过
                        <%
                            }
                        %></span>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- end orders table -->
            <div class="pagination text-center">
                <ul>
                    <li><a href="all-article.jsp?page=<%=pages == 1 ? 1 : pages - 1%>">‹</a></li>
                    <%
                        for (int i = 1; i <= totalPage; i++) {
                            if (pages == i) {
                                out.println("<li><a class=\"active\" href=\"all-article.jsp?page=" + i + "\">" + i + "</a></li>");
                            } else {
                                out.println("<li><a href=\"all-article.jsp?page=" + i + "\">" + i + "</a></li>");
                            }
                        }
                    %>
                    <li><a href="all-article.jsp?page=<%=pages == totalPage ? totalPage : pages + 1%>">›</a></li>
                </ul>
            </div>

            <%}%>
        </div>
    </div>
</div>

<!-- scripts -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/theme.js"></script>

</body>
</html>