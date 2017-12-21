<%@ page import="com.article.processing.model.User" %><%--
  Created by IntelliJ IDEA.
  User: LiWenfeng
  Date: 2017/12/21 0021
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8" %>
<%
    response.setStatus(HttpServletResponse.SC_OK);
    response.setStatus(500);

    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

    String errorMessage = pageContext.getException().getMessage();
    User user = (User) request.getSession().getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <title>500 - 系统内部错误</title>

    <script src="<%=basePath %>/js/jquery-1.3.2.min.js"></script>
    <!-- bootstrap需要引入的js和css文件 -->
    <link href="<%=basePath %>/css/bootstrap/bootstrap.css" rel="stylesheet">
    <script src="<%=basePath %>/js/bootstrap.min.js"></script>

    <script language="javascript" type="text/javascript">
        var i = 5;
        var intervalid;
        intervalid = setInterval("fun()", 1000);

        function fun() {
            if (i === 0) {
                <%if (user != null) {%>
                window.location.href = "../admin/index.jsp";
                <%} else {%>
                window.location.href = "../signin.jsp";
                <%}%>
                clearInterval(intervalid);
            }
            document.getElementById("mes").innerHTML = i;
            i--;
        }
    </script>

</head>
<body>
<div class="container-fluid pagination-centered">
    <div class="page-header"><h1>系统内部错误.</h1></div>
    <div class="brand" style="font-size: 24px">将在 <span id="mes" style="color: red; font-size: 28px">5</span> 秒钟后返回<%
        if (user != null) {
            out.print("首页！");
        } else {
            out.print("登陆！");
        }
    %>
    </div>
    <br><br>
    <div class="errorMessage">
        系统执行发生错误，信息描述如下：<br><br>
        错误状态代码是：${pageContext.errorData.statusCode}<br>
        错误发生页面是：${pageContext.errorData.requestURI}<br>
        错误信息：<%=errorMessage%><br><br>
        <a href="javascript:" onclick="history.go(-1);" class="btn">返回上一页</a> &nbsp;
        <%if (user != null) {%>
        <a href="javascript:" onclick="window.location.href='../admin/index.jsp';" class="btn">返回主页</a>
        <%} else {%>
        <a href="javascript:" onclick="window.location.href='../signin.jsp';" class="btn">返回登陆</a>
        <%}%>
    </div>
</div>
</body>
</html>