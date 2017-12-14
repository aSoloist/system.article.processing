<%@ page import="java.util.List" %>
<%@ page import="com.article.processing.model.Article" %><%--
  Created by IntelliJ IDEA.
  User: Soloist
  Date: 2017/12/14
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    List list = (List) request.getAttribute("articles");
    for (Object o : list) {
        out.print(((Article) o).getContent() + "<br/>");
    }
%>
</body>
</html>
