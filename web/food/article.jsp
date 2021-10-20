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
    <style>
        .butt{
            background: none;border-radius: 10px;border-color: #dbdbdb;width: 115px;
            height: 30px;border-width: 1px;cursor: pointer
        }
        .butt:hover{
            border-color: #323534;
        }
    </style>
</head>
<body style="background: #eeeeee">
    <div style="width: 300px;height: 300px;background: #ffffff;margin-left: 100px;float: left">
    <div style="margin-top: 16px;border-bottom: 1px solid #eeeeee">
        <div style="text-align: center">
            <img class="img-circle" src="/foodimages/${userimage}"
                 style="width: 70px;height: 70px;"/>
        </div>
        <span style="margin-top: 10px;margin-left: 120px;color: #323534;font-size: 15px">${username}</span>
        <div style="color: #8a8a8a;text-align: center;line-height: 36px;font-size: 13px">
            <span>${food.address}  </span>

            <span>${food.time}</span>
        </div>
    </div>
        <div style="margin-left: 10px;width: 300px;height: 80px;">
       <div style="width: 48px;text-align: center;margin-right: 10px;float: left"><p style="font-size: small;color: #323534">11</p><p style="font-size: small;color: #323534">已分享</p></div>
        <div style="width: 48px;text-align: center;margin-right: 10px;float: left"><p style="font-size: small;color: #323534">11</p><p style="font-size: small;color: #323534">访问</p> </div>
            <div style="width: 48px;text-align: center;margin-right: 10px;float: left"><p style="font-size: small;color: #323534">11</p><p style="font-size: small;color: #323534">获赞</p> </div>
            <div style="width: 48px;text-align: center;margin-right: 10px;float: left"><p style="font-size: small;color: #323534">11</p><p style="font-size: small;color: #323534">评论</p> </div>
            <div style="width: 48px;text-align: center;float: left"><p style="font-size: small;color: #323534">11</p><p style="font-size: small;color: #323534">收藏</p> </div>
        </div>
      <div style="margin-top: 30px;margin-left: 20px">
          <div style="float: left"> <button class="butt" >私信</button></div>
          <div style="margin-left: 30px;float: left"><button  class="butt">关注</button></div>

      </div>
    </div>

    <div style="width: 800px;text-align: center;margin-left: 10px;background: #ffffff;float: left;width: 980px">
        ${food.article}
    <br>
    <div>
        <form action="${pageContext.request.contextPath}/food/addcommentary" method="post">
            <input type="text" name="content" style="width: 500px"/>
            <input name="uid" value="<%=request.getSession().getAttribute("uid")%>" style="display: none"/>
            <input name="fid" value="${food.fid}" style="display: none"/>
            <button type="submit">发送</button>
        </form>

    </div>
 <div style="text-align: center">
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
