<%--
  Created by IntelliJ IDEA.
  User: LiWenfeng
  Date: 2017/12/22 0022
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.article.processing.model.Pagination" %>
<%@ page import="java.util.List" %>
<%@ page import="com.article.processing.model.Message" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>稿件管理系统 - 管理公告</title>

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
    Pagination messages = (Pagination) request.getSession().getAttribute("messages");
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
        <li class="active">
            <a class="dropdown-toggle" href="#">
                <i class="icon-envelope"></i>
                <span>管理公告</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="active submenu">
                <li><a href="announcement.jsp">发布公告</a></li>
                <li><a href="allMessage.jsp" class="active">管理公告</a></li>
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
            <div class="table-wrapper orders-table">
                <div class="row-fluid head">
                    <div class="span12">
                        <h4>消息</h4>
                    </div>
                </div>
                <br>

                <div class="row-fluid span12">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th class="span2">
                                <span class="line"></span>时间
                            </th>
                            <th class="span3">
                                <span class="line"></span>标题
                            </th>
                            <th class="span12">
                                <span class="line"></span>内容
                            </th>
                            <th class="span2">
                                <span class="line"></span>管理
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <%
                            if (messages != null) {
                                int pages = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
                                messages.setPage(pages);
                                int startIndex = messages.getStartIdx();
                                int totalPage = messages.getTotalPage();
                                List list = messages.getData();
                                int rows = messages.getRows();
                                if (pages == totalPage) {
                                    rows = messages.getCount() - (totalPage - 1) * rows;
                                }
                                for (int i = 0; i < rows; i++) {
                                    Message message = (Message) list.get(startIndex++);
                        %>
                        <tr>
                            <td class="time">
                                <%=new Date(message.getCreateTime().getTime())%>
                            </td>
                            <td>
                                <a href="messagePage.jsp?id=<%=message.getId()%>" class="name">
                                    <%
                                        String title = message.getTitle();
                                        if (title.length() > 8) {
                                            title = title.substring(0, 8) + "......";
                                        }
                                    %>
                                    <%=title%>
                                </a>
                            </td>
                            <td class="description">
                                <%
                                    String content = message.getMessageContent();
                                    if (content.length() > 40) {
                                        content = content.substring(0, 40) + "......";
                                    }
                                %>
                                <%=content%>
                            </td>
                            <td>
                                <ul class="actions">
                                    <li><a href="announcement.jsp?id=<%=message.getId()%>">编辑</a></li>
                                    <li class="last"><a href="${pageContext.request.contextPath}/root/deleteMessage?id=<%=message.getId()%>" 
                                                        onclick="return confirm('确认删除？');">删除</a></li>
                                </ul>
                            </td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                    <div class="pagination text-center">
                        <ul>
                            <li><a href="allMessage.jsp?page=<%=pages == 1 ? 1 : pages - 1%>">‹</a></li>
                            <%
                                for (int i = 1; i <= totalPage; i++) {
                                    if (pages == i) {
                                        out.println("<li><a class=\"active\" href=\"getMessage.jsp?page=" + i + "\">" + i + "</a></li>");
                                    } else {
                                        out.println("<li><a href=\"getMessage.jsp?page=" + i + "\">" + i + "</a></li>");
                                    }
                                }
                            %>
                            <li><a href="allMessage.jsp?page=<%=pages == totalPage ? totalPage : pages + 1%>">›</a>
                            </li>
                        </ul>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- scripts -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/theme.js"></script>

</body>
</html>