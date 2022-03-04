<%--
  Created by IntelliJ IDEA.
  User: T.A.B
  Date: 2022/3/4
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
<script>
    window.onload=function () {
        if(window.confirm("请先登录美食网！！")){
          location.href="${pageContext.request.contextPath}/user/tologin";
        }else {
            location.href="${pageContext.request.contextPath}/food/allfoodbycity";
        }

    };

</script>
</html>
