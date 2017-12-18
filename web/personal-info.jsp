<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>稿件管理系统 - 个人信息</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <!-- bootstrap -->
    <link href="css/bootstrap/bootstrap.css" rel="stylesheet"/>
    <link href="css/bootstrap/bootstrap-responsive.css" rel="stylesheet"/>
    <link href="css/bootstrap/bootstrap-overrides.css" type="text/css" rel="stylesheet"/>

    <!-- global styles -->
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="css/elements.css"/>
    <link rel="stylesheet" type="text/css" href="css/icons.css"/>

    <!-- libraries -->
    <link rel="stylesheet" type="text/css" href="css/lib/font-awesome.css"/>

    <!-- this page specific styles -->
    <link rel="stylesheet" href="css/compiled/personal-info.css" type="text/css" media="screen"/>

    <!-- open sans font -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
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
        <li>
            <div class="pointer">
                <div class="arrow"></div>
                <div class="arrow_border"></div>
            </div>
            <a href="index.html">
                <i class="icon-home"></i>
                <span>主页</span>
            </a>
        </li>
        <li class="active">
            <a class="dropdown-toggle" href="#">
                <i class="icon-group"></i>
                <span>用户中心</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="active submenu">
                <li><a href="personal-info.html" class="active">个人信息</a></li>
                <li><a href="revise-avatar.html">修改头像</a></li>
                <li><a href="modify-password.html">更改密码</a></li>
            </ul>
        </li>
        <li>
            <a class="dropdown-toggle" href="#">
                <i class="icon-edit"></i>
                <span>稿件管理</span>
                <i class="icon-chevron-down"></i>
            </a>
            <ul class="submenu">
                <li><a href="submit-manuscript.html">我的稿件</a></li>
                <li><a href="form-wizard.html">提交稿件</a></li>
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
    <div class="container-fluid">
        <div class="settings-wrapper" id="pad-wrapper">

            <!-- edit form column -->
            <div class="span7 personal-info">
                <h5 class="personal-title">个人信息</h5>

                <form/>
                <div class="field-box">
                    <label>姓名:</label>
                    <input class="span5 inline-input" type="text" value="nickname"/>
                </div>
                <div class="field-box">
                    <label>用户名:</label>
                    <input class="span5 inline-input" type="text" value="username"/>
                </div>
                <div class="field-box">
                    <label>单位:</label>
                    <input class="span5 inline-input" type="text" value="unit"/>
                </div>
                <div class="field-box">
                    <label>地址:</label>
                    <input class="span5 inline-input" type="text" value="address"/>
                </div>
                <div class="field-box">
                    <label>手机号:</label>
                    <input class="span5 inline-input" type="text" value="phone" disabled="true"/>
                </div>
                <div class="field-box">
                    <label>E-mail:</label>
                    <input class="span5 inline-input" type="text" value="email" disabled="true"/>
                </div>
                <div class="span6 field-box actions">
                    <input type="button" class="btn-glow primary" value="保存修改" />
                    <span>或</span>
                    <input type="reset" value="取消" class="reset" />
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- end main container -->

<!-- scripts -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/theme.js"></script>
</body>
</html>