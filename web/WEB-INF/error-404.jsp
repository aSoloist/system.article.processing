<%@ page language="java" contentType="text/html; charset=UTF-8" isErrorPage="true" pageEncoding="UTF-8" %>
<%response.setStatus(HttpServletResponse.SC_OK);%>
<html>
<head>
    <title>网页访问不鸟</title>

    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/error_all.css">

</head>
<body class="error-404">
<div id="doc_main">
    <section class="bd clearfix">
        <div class="module-error">
            <div class="error-main clearfix">
                <div class="label" style="background:url('<%=basePath %>img/error.png') 0 0 no-repeat"></div>
                <div class="info">
                    <h3 class="title">啊哦，你所访问的页面不存在了，可能是炸了</h3>
                    <div class="reason">
                        <p>可能的原因：</p>
                        <p>1.手抖打错了。</p>
                        <p>2.链接过了保质期。</p>
                    </div>
                    <div class="oper">
                        <p><a href="javascript:history.go(-1);">返回上一级页面&gt;</a></p>
                        <p><a href="<%=basePath %>admin/index.jsp">回到网站首页&gt;</a></p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

</body>
</html>
