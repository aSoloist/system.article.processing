<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>稿件管理系统 - 主页</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>

    <!-- libraries -->
    <link href="css/lib/jquery-ui-1.10.2.custom.css" rel="stylesheet" type="text/css"/>
    <link href="css/lib/font-awesome.css" type="text/css" rel="stylesheet"/>

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="css/icons.css"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/index.css" type="text/css" media="screen"/>

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

<!-- navbar -->
<div class="navbar navbar-inverse">
    <div class="navbar-inner">
        <button type="button" class="btn btn-navbar visible-phone" id="menu-toggler">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <a class="brand" href="index.html">稿件管理系统</a>

        <ul class="nav pull-right">
            <li class="hidden-phone">
                <input class="search" type="text"/>
            </li>
            <li class="notification-dropdown hidden-phone">
                <a href="#" class="trigger">
                    <i class="icon-envelope-alt"></i>
                </a>
                <div class="pop-dialog">
                    <div class="pointer right">
                        <div class="arrow"></div>
                        <div class="arrow_border"></div>
                    </div>
                    <div class="body">
                        <a href="#" class="close-icon"><i class="icon-remove-sign"></i></a>
                        <div class="messages">
                            <a href="#" class="item">
                                <img src="img/admin.jpg" class="display"/>
                                <div class="name">管理员</div>
                                <div class="msg">
                                    你有一条新的消息。
                                </div>
                                <span class="time"><i class="icon-time"></i> 13 分钟前</span>
                            </a>
                            <a href="#" class="item">
                                <img src="img/admin.jpg" class="display"/>
                                <div class="name">管理员</div>
                                <div class="msg">
                                    你有一条新的消息，请注意查收。
                                </div>
                                <span class="time"><i class="icon-time"></i> 26 分钟前</span>
                            </a>
                            <a href="#" class="item last">
                                <img src="img/admin.jpg" class="display"/>
                                <div class="name">管理员</div>
                                <div class="msg">
                                    你有一条新的消息，请注意查收。emmmmm。
                                </div>
                                <span class="time"><i class="icon-time"></i> 2 天前</span>
                            </a>
                            <div class="footer">
                                <a href="#" class="logout">查看所有消息</a>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle hidden-phone" data-toggle="dropdown">我的账户<b class="caret"></b>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="personal-info.html">个人信息</a></li>
                    <li><a href="#">账户设置</a></li>
                    <li><a href="#">我的钱包</a></li>
                </ul>
            </li>
            <li class="settings hidden-phone">
                <a href="personal-info.html" role="button">
                    <i class="icon-cog"></i>
                </a>
            </li>
            <li class="settings hidden-phone">
                <a href="signin.jsp" role="button">
                    <i class="icon-share-alt"></i>
                </a>
            </li>
        </ul>
    </div>
</div>
<!-- end navbar -->

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
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-edit"></i>
                <span>稿件管理</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="my-manuscript.jsp">我的稿件</a></li>
                <li><a href="submit-manuscript.jsp">提交稿件</a></li>
            </ul>
        </li>
        <li>
            <a href="signin.jsp">
                <i class="icon-share-alt"></i>
                <span>退出帐号</span>
            </a>
        </li>
    </ul>
</div>
<!-- end sidebar -->

<!-- main container -->
<div class="content">

</div>


<!-- scripts -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/theme.js"></script>

</body>
</html>