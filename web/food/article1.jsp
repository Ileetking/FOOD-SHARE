<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
</head>
<body>
<form name="myform" action="${pageContext.request.contextPath}/food/commentaries/${fid}" method="post"></form>
<script language="javascript">
    document.myform.submit();
</script>
</body>
</html>