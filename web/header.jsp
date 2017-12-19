<%--
  Created by IntelliJ IDEA.
  User: LiWenfeng
  Date: 2017/12/19 0019
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
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
                    <li><a href="personal-info.jsp">个人信息</a></li>
                    <li><a href="javascript:void(0);">账户设置</a></li>
                    <li><a href="javascript:void(0);">我的钱包</a></li>
                </ul>
            </li>
            <li class="settings hidden-phone">
                <a href="javascript:void(0);" role="button">
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

</body>
</html>