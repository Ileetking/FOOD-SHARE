<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html>
<head>
    <title>爱美食</title>
    <link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>
<%--    <script type="text/javascript">--%>
<%--        function a() {--%>
<%--            <%--%>
<%-- String username=(String)session.getAttribute("username");--%>
<%-- if(username==null || username.equals("")){--%>
<%-- request.getRequestDispatcher("/user/login.jsp").forward(request,response);--%>
<%-- return;--%>
<%-- }--%>
<%-- %>--%>
<%--        }--%>
<%--    </script>--%>
</head>
<body>
<div style="width: 800px;text-align: center;margin: 0 auto">
    <div style="margin-top: 16px;border-bottom: 1px solid #eeeeee">
        <div style="text-align: center">
            <img class="img-circle" src="/foodimages/${userimage}"
                 style="width: 45px;height: 45px;"/>

        </div>
        <span style="margin-top: 10px">${username}</span>
        <div style="color: #8a8a8a;text-align: center;line-height: 36px;font-size: 13px">
            <span>${food.address}  </span>

            <span>${food.time}</span>
        </div>
        ${food.article}

    </div>
    <br>
    <div>
        <form action="${pageContext.request.contextPath}/food/addcommentary" method="post">
            <input type="text" name="content" style="width: 500px"/>
            <input name="uid" value="<%=request.getSession().getAttribute("uid")%>" style="display: none"/>
            <input name="fid" value="${food.fid}" style="display: none"/>
            <button type="submit">发送</button>
        </form>

    </div>
 <div>
     <c:forEach var="commentary" items="${commentaries}" varStatus="varstatus">
     <div style="margin-bottom: 10px;margin-top: 10px;text-align: left" >
         <P>
             <img class="img-circle" src="/foodimages/${userimages[varstatus.count-1]}"
                  style="width: 20px;height: 20px;"/>${commentary.user.username}:&nbsp;&nbsp;${commentary.content}
         </P>
     </div>
     </c:forEach>
 </div>
</div>

</body>
</html>
