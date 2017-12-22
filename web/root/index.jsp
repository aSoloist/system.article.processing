<%--
  Created by IntelliJ IDEA.
  User: LiWenfeng
  Date: 2017/12/22 0022
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>稿件管理系统 - 后台主页</title>

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
        <li class="active">
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div>
            <a href="../admin/index.jsp">
                <i class="icon-home"></i>
                <span>主页</span>
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

        <!-- upper main stats -->
        <div id="main-stats">
            <div class="row-fluid stats-row">
                <div class="span3 stat">
                    <div class="data">
                        <span class="number">河南 - 郑州</span>
                        上次登录
                    </div>
                </div>
                <div class="span3 stat">
                    <div class="data">
                        <span class="number"><%=request.getRemoteAddr()%></span>
                        当前IP地址
                    </div>
                </div>
                <div class="span3 stat">
                    <div class="data">
                        <span class="number">篇</span>
                        正在审核的稿件
                    </div>
                </div>
                <div class="span3 stat last">
                    <div class="data">
                        <span class="number">篇</span>
                        已通过稿件
                    </div>
                </div>
            </div>
        </div>
        <!-- end upper main stats -->

        <div id="pad-wrapper">

            <!-- orders table -->
            <div class="table-wrapper orders-table section">
                <div class="row-fluid head">
                    <div class="span12">
                        <h4>稿件状态</h4>
                    </div>
                </div>

                <div class="row-fluid filter-block span12">
                    <div class="pull-right">
                        <a class="glow right" href="all-article.jsp">查看全部>></a>
                    </div>

                    <div class="row-fluid">
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
                            <tr>
                                <td>
                                    <a href="#">45645345
                                    </a>
                                </td>
                                <td>452452
                                </td>
                                <td>452542
                                </td>
                                <td>452452
                                </td>
                                <td>452452
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- end orders table -->
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
