<%--
  Created by IntelliJ IDEA.
  User: Soloist
  Date: 2017/12/7
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/login">
    <label>
        <input type="text" autofocus="autofocus" placeholder="邮箱或手机号" name="phoneOrEmail"><br/>
    </label>
    <label>
        <input type="password" placeholder="密码" name="password"><br/>
    </label>
    <input type="submit" value="登陆">
</form>
</body>
</html>
