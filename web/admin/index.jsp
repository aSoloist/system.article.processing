<%@ page import="com.article.processing.model.Article" %>
<%@ page import="com.article.processing.model.Pagination" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="com.article.processing.model.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>稿件管理系统 - 主页</title>

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
    int startIndex = pagination.getStartIdx();
    List list = pagination.getData();
    int unCheck = 0;
    int accept = 0;
    for (Object aList : list) {
        Article article = (Article) aList;
        if (article.getStatus() == 0) {
            unCheck++;
        } else if (article.getStatus() == 2) {
            accept++;
        }
    }
%>
<!-- sidebar -->
<div id="sidebar-nav">
    <ul id="dashboard-menu">
        <li class="active">
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div>
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
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-edit"></i>
                <span>稿件管理</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="all-article.jsp">我的稿件</a></li>
                <li><a href="submit-article.jsp">提交稿件</a></li>
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
                        <span class="number"><%=unCheck%>篇</span>
                        正在审核的稿件
                    </div>
                </div>
                <div class="span3 stat last">
                    <div class="data">
                        <span class="number"><%=accept%>篇</span>
                        已通过稿件
                    </div>
                </div>
            </div>
        </div>
        <!-- end upper main stats -->

        <div id="pad-wrapper">
<%
    Pagination messages = (Pagination) request.getSession().getAttribute("messages");
    Message message = messages.getCount() != 0 ? (Message) messages.getData().get(0) : new Message("");
%>
            <div class="row-fluid chart">
                <div class="row-fluid head">
                    <div class="span12">
                        <h4>公告板</h4>
                    </div>
                </div>

                <div class="row-fluid filter-block">
                    <div class="pull-right">
                        <a class="glow right" href="get-message.jsp">查看全部>></a>
                    </div>
                </div>
                <br>
                <div class="span12"><h5><%=message.getMessageContent()%></h5></div>
            </div>

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
                            <%
                                int n = list.size() < 4 ? list.size() : 4;
                                for (int i = startIndex; i < n; i++) {
                                    Article article = (Article) list.get(i);
                            %>
                            <tr>
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
