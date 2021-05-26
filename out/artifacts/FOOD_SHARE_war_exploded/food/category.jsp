<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<%--   <%out.print(request.getParameter("cid"));%>--%>
<form name="myform" action="${pageContext.request.contextPath}/food/categoryfood/<%out.print(request.getParameter("cid"));%>" method="post"></form>
<script language="javascript">
    document.myform.submit();
</script>
</body>
</html>