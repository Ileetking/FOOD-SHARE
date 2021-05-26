<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
  <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

</head>
<body>
<form action="${pageContext.request.contextPath}/user/updateuserimage" enctype="multipart/form-data" method="post">
    <h3>修改头像</h3>
    <input type="file" name="file"/>
    <input type="hidden" name="uid" value="<%=request.getSession().getAttribute("uid")%>"/>
    <input type="submit" value="确认修改"/>
</form>
</body>