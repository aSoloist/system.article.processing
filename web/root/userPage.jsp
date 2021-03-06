<%@ page import="com.article.processing.model.Pagination" %>
<%@ page import="com.article.processing.model.User" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: LiWenfeng
  Date: 2017/12/22 0022
  Time: 19:27
  To change this template use File | Settings | File Templates.
--%>
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
    String id = request.getParameter("id");
    List list = ((Pagination) request.getSession().getAttribute("users")).getData();
    if (id != null && list.size() > 0) {
        User user = null;
        for (Object o : list) {
            if (id.equals(((User) o).getId())) {
                user = (User) o;
                break;
            }
        }
        if (user != null) {
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
            <!-- edit form column -->
            <div class="row-fluid header">
                <h3>用户信息</h3>
            </div>

            <div class="row-fluid form-wrapper">
                <!-- left column -->
                <div class="span9 with-sidebar">
                    <div class="container">
                        <div></div>
                        <div class="span12 field-box">
                            <label>姓名:</label>
                            <input class="span9" type="text" value="<%=user.getUsername()%>" readonly/>
                        </div>
                        <div class="span12 field-box">
                            <label>用户名:</label>
                            <input class="span9" type="text" value="<%=user.getNickname()%>" readonly/>
                        </div>
                        <div class="span12 field-box">
                            <label>单位:</label>
                            <input class="span9" type="text" value="<%=user.getUnit()%>" readonly/>
                        </div>
                        <div class="span12 field-box">
                            <label>地址:</label>
                            <input class="span9" type="text" value="<%=user.getAddress()%>" readonly/>
                        </div>
                        <div class="span12 field-box">
                            <label>手机号:</label>
                            <input class="span9" type="text" value="<%=user.getPhone()%>" readonly/>
                        </div>
                        <div class="span12 field-box">
                            <label>E-mail:</label>
                            <input class="span9" type="text" value="<%=user.getEmail()%>" readonly/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%
        }
    }
%>
<!-- scripts -->
<script src="../js/jquery-latest.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/theme.js"></script>

</body>
</html>