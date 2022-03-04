<%--
  Created by IntelliJ IDEA.
  User: T.A.B
  Date: 2022/3/4
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<title>爱美食</title>
<link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>
</head>
<body>
<form name="myform" action="${pageContext.request.contextPath}/food/allfoodbyaddress" method="post">
</form>
<script language="javascript">
    document.myform.submit();
</script>
</body>
</html>
