<%--
  Created by IntelliJ IDEA.
  User: T.A.B
  Date: 2021/10/9
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        a{
            color: #323534;
        }
        a:hover{

            text-decoration: none;
        }
    </style>
</head>
<body>
            <ul class="nav navbar-nav">
                <li><a href="/user/updateusernane.jsp" target="zhuye"><h5 style="margin-left: 50px">修改昵称</h5></a></li>
                <li class="active"><a href="${pageContext.request.contextPath}/user/useradmin/<%=request.getSession().getAttribute("uid")%>" target="zhuye"><h5 style="margin-left: 50px">美食管理</h5></a></li>
                <li><a href="/user/gonggao.jsp" target="zhuye"><h5 style="margin-left: 50px">发布公告</h5></a></li>
                <li><a href="/user/zhuyemessage.jsp" target="zhuye"><h5 style="margin-left: 50px">更新主页描述</h5></a></li>
            </ul>


</body>
</html>
