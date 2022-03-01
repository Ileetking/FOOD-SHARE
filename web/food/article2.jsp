<%--
  Created by IntelliJ IDEA.
  User: T.A.B
  Date: 2022/3/1
  Time: 1:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form name="myform" action="${pageContext.request.contextPath}/food/commentaries/${fid}" method="post"></form>
<script language="javascript">
    document.myform.submit();
</script>
</body>
</html>
