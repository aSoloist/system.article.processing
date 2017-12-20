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
    <title>稿件管理系统 - 我的稿件</title>

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
                <i class="icon-home"></i>
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
                <li><a href="revise-avatar.jsp">修改头像</a></li>
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
                <li><a href="my-manuscript.jsp" class="active">我的稿件</a></li>
                <li><a href="submit-manuscript.jsp">提交稿件</a></li>
            </ul>
        </li>
        <li>
            <a href="../signin.jsp">
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
                            <th class="span2">
                                稿件ID
                            </th>
                            <th class="span3">
                                最近提交日期
                            </th>
                            <th class="span3">
                                <span class="line"></span>
                                标题
                            </th>
                            <th class="span3">
                                <span class="line"></span>
                                内容
                            </th>
                            <th class="span3">
                                <span class="line"></span>
                                提交次数
                            </th>
                            <th class="span3">
                                <span class="line"></span>
                                状态
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <!-- row -->
                        <tr class="first">
                            <td>
                                <a href="#">#459</a>
                            </td>
                            <td>
                                Jan 03, 2017
                            </td>
                            <td>
                                <a href="#">emmmm</a>
                            </td>
                            <td>
                                瓜皮
                            </td>
                            <td>
                                3
                            </td>
                            <td>
                                <span class="label label-success">通过</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#">#510</a>
                            </td>
                            <td>
                                Feb 22, 2017
                            </td>
                            <td>
                                <a href="#">emmmmm</a>
                            </td>
                            <td>
                                两个瓜皮
                            </td>
                            <td>
                                5
                            </td>
                            <td>
                                <span class="label label-info">审核中</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#">#590</a>
                            </td>
                            <td>
                                Mar 03, 2017
                            </td>
                            <td>
                                <a href="#">emmmmmm</a>
                            </td>
                            <td>
                                三个瓜皮
                            </td>
                            <td>
                                4
                            </td>
                            <td>
                                <span class="label label-success">通过</span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <a href="#">#618</a>
                            </td>
                            <td>
                                Jan 03, 2017
                            </td>
                            <td>
                                <a href="#">emmmmmmm</a>
                            </td>
                            <td>
                                四个瓜皮
                            </td>
                            <td>
                                8
                            </td>
                            <td>
                                <span class="label">未通过</span>
                            </td>
                        </tr><tr>
                            <td>
                                <a href="#">#625</a>
                            </td>
                            <td>
                                Jan 06, 2017
                            </td>
                            <td>
                                <a href="#">emmmmmmmm</a>
                            </td>
                            <td>
                                五个瓜皮
                            </td>
                            <td>
                                13
                            </td>
                            <td>
                                <span class="label label-success">通过</span>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- end orders table -->
            <div class="pagination pull-left right">
                <ul>
                    <li><a href="#">‹</a></li>
                    <li><a class="active" href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">›</a></li>
                </ul>
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
