<%--
  Created by IntelliJ IDEA.
  User: Soloist
  Date: 2017/12/14
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/saveArticle.do" method="post">
    <label>
        <input type="text" name="title">
    </label>
    <label>
        <input type="text" name="content">
    </label>
    <input type="submit" value="提交">
</form>
</body>
</html>
