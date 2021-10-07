<%--
  Created by IntelliJ IDEA.
  User: T.A.B
  Date: 2021/10/7
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${username}的空间</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body style="background: #eeeeee">


    <div  style="background-image: url('/image/userba.jpg');height: 260px;width: 1200px;margin-top: 0px;margin-left:160px">

        <div style="width: 60px;height: 60px">
            <img class="img-circle" src="/foodimages/muwangqing.jpg" width="70px" height="70px" style="margin-left: 30px;margin-top: 170px"/>
        </div>
        <div style="margin-left: 130px;margin-top: 120px;height: auto;width: auto">
            <p style="color: #f6f5f5;font-family: 'Adobe 繁黑體 Std B';font-size: 22px">${username}</p>
        </div>
<%--        <p><a class="btn btn-primary btn-lg" role="button">--%>
<%--            学习更多</a>--%>
        </p>
        <div style="background: #ffffff;margin-top: 40px;width: 1200px;height: 80px;border-bottom-left-radius: 3px;border-bottom-right-radius: 3px">

        </div>
    </div>
<div style="background: #ffffff;margin-top: 85px;margin-left: 160px;width: 800px;height: 800px;float: left;border-radius: 3px">
    <h3 style="margin-left: 20px;margin-top: 20px">TA的视频</h3>
    <div style="margin-top: 20px">
    <c:forEach var="allfood" items="${userfoods}" varStatus="varstatus">
        <c:if test="${allfood.fid!=null}">
            <div class="col-sm-6 col-md-3">
                <div class="thumbnail" style="height: 160px;border: none">
                    <img alt="${allfood.description}" title="${allfood.description}" src="/foodimages/${allfood.img}" style="width:100%; height: 100px" onclick="location.href='${pageContext.request.contextPath}/food/commentaries/${allfood.fid}'"
                    />
                    <div style="height: auto">
                        <a href="${pageContext.request.contextPath}/food/commentaries/${allfood.fid}">
                            <h6 style="margin-left:8px ">${allfood.title}</h6></a>
                    </div>

                    <div style="width: 100%;height: 26px;margin-top: 10px;margin-bottom: 10px">
                        <img src="/foodimages/liulan.png"  style="width: 13px;height: 13px;margin-left: 8px"/>
                        <img src="/foodimages/date.png" style="width: 13px;height: 13px;margin-left: 37px"/>
                        <p style="font-size: 13px;color: #666666;display: inline;margin-left: 3px">${allfood.time}</p>
                    </div>


                </div>
            </div>
        </c:if>
    </c:forEach>
    </div>

</div>
<div style="background: #ffffff;margin-top: 85px;margin-left: 980px;width: 380px;height: 200px;border-radius: 3px">
    <div style="margin-left: 20px;">
        <p style="font-family: 'Adobe 繁黑體 Std B';font-size: 20px;">
            <strong>公告</strong></p>
    </div>





</div>
<div style="background: #ffffff;margin-top: 15px;margin-left: 980px;width: 380px;height: 100px;border-radius: 3px">

</div>



</body>
</html>
