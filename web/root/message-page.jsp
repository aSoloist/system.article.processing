<%--
  Created by IntelliJ IDEA.
  User: LiWenfeng
  Date: 2017/12/23 0023
  Time: 13:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.article.processing.model.Pagination" %>
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
    String id = request.getParameter("id");
    List list = ((Pagination) request.getSession().getAttribute("messages")).getData();
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
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-edit"></i>
                <span>稿件管理</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="check-pending.jsp">待审核稿件</a></li>
                <li><a href="all-article.jsp">所有稿件</a></li>
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
                <li><a href="all-message.jsp" class="active">管理公告</a></li>
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

<!-- main container -->
<div class="content">
    <div class="span12">
        <div class="left"><br>
            <a class="btn-flat white" href="javascript:history.go(-1);">
                <span class="icon-reply"></span>
                <span>返回上级</span>
            </a>
        </div>
    </div>
    <br>
    <div class="container-fluid">
        <div id="pad-wrapper">
            <%
                if (id != null && list.size() > 0) {
                    Message message = null;
                    for (Object o : list) {
                        if (id.equals(((Message) o).getId())) {
                            message = (Message) o;
                            break;
                        }
                    }
                    if (message != null) {
            %>
            <div class="table-wrapper orders-table">
                <div class="row-fluid text-center">
                    <div class="span12">
                        <h2><%=message.getTitle()%>
                        </h2>
                    </div>
                    <br><br>
                    <div class="date">
                        <%=new Date(message.getCreateTime().getTime())%>
                    </div>
                </div>
                <br>

                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="span12">
                            <div class="text-center"><br>
                                <h5><%=message.getMessageContent()%>
                                </h5>
                            </div>
                        </th>
                    </tr>
                    </thead>
                </table>
            </div>
            <div class="span6 field-box actions text-center">
                <input type="submit" class="btn-glow primary" value="编辑"/>
                <span>或</span>
                <input type="submit" class="btn-glow inverse" value="删除"/>
            </div>
            <%
                    }
                }
            %>
        </div>
    </div>
</div>

<!-- scripts -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/theme.js"></script>

</body>
</html>