<%--
  Created by IntelliJ IDEA.
  User: T.A.B
  Date: 2022/3/4
  Time: 17:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>美食管理</title>
    <link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
<div class="col-md-12 column">
    <div style="margin-top: 30px">
<c:forEach var="allfood" items="${foods.list}" varStatus="varstatus">
    <c:if test="${allfood.fid!=null}">
        <div class="col-sm-6 col-md-2">
                        <div class="thumbnail" style="height: 220px">
                            <img alt="${allfood.description}" title="${allfood.description}" src="/foodimages/${allfood.img}" style="width:100%; height: 100px" onclick="location.href='${pageContext.request.contextPath}/food/commentaries/${allfood.fid}'"
                            />
                            <div style="height: 20px">
                                <a href="${pageContext.request.contextPath}/food/commentaries/${allfood.fid}">
                                    <h6 style="margin-left:8px ">${allfood.title}</h6></a>
                            </div>
                            <div style="width: 100%;height: 26px;margin-top: 30px;margin-bottom: 10px">
                                <img src="/foodimages/liulan.png"  style="width: 13px;height: 13px;margin-left: 8px"/>
                                <p style="font-size: 13px;color: #666666;display: inline;">${liulansize[varstatus.count-1]}</p>
                                <img src="/foodimages/date.png" style="width: 13px;height: 13px;margin-left: 12px"/>
                                <p style="font-size: 13px;color: #666666;display: inline;margin-left:3px">${allfood.time}</p>
                                <img src="/foodimages/user.png" style="width: 13px;height: 13px;margin-left: 8px"/>
                                <a style="font-size: 13px;color: #666666;" href="${pageContext.request.contextPath}/user/usermessage/${allfood.uid}">${usernames[varstatus.count-1]}</a>
                            </div>
                            <div style="width: 100%;height: 26px;margin-top: 30px;margin-bottom: 10px">
<%--                                <form action="" method="post">--%>
<%--                                    <input type="hidden" name="bianji"/>--%>
<%--                                    <input type="submit" value="编辑" />--%>
<%--                                </form>--%>
<%--                                <form action="" method="post">--%>
<%--                                    <input type="hidden" name="bianji"/>--%>
<%--                                    <input type="submit" value="删除" />--%>
<%--                                </form>--%>
                               <button type="button" class="btn btn-default"><a href="/food/bainji">编辑</a></button>
                                <button type="button" class="btn btn-default"><a href="">删除</a></button>
                            </div>
                        </div>
        </div>
    </c:if>
</c:forEach>
</div>
</div>
    </div>
    <div style="text-align: center;margin-top: 200px">
        <ul class="pagination">
            <li><a href="${pageContext.request.contextPath}/food/allfood?page=${foods.pageNum-1}&size=${foods.pageSize}">&laquo;</a></li>
            <li><a href="${pageContext.request.contextPath}/food/allfood?page=1&size=${foods.pageSize}">首页</a></li>
            <c:forEach begin="1" end="${foods.pages}" var="pagenum">
                <li><a href="${pageContext.request.contextPath}/food/allfood?page=${pagenum}&size=${foods.pageSize}">${pagenum}</a></li>
            </c:forEach>
            <li><a href="${pageContext.request.contextPath}/food/allfood?page=${foods.pages}&size=${foods.pageSize}">尾页</a></li>
            <li><a href="${pageContext.request.contextPath}/food/allfood?page=${foods.pageNum+1}&size=${foods.pageSize}">&raquo;</a></li>
        </ul>
    </div>
</div>

</body>
</html>
