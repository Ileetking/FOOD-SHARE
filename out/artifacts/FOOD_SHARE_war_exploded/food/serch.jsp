<%--
  Created by IntelliJ IDEA.
  User: T.A.B
  Date: 2021/10/10
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>愛美食|搜索</title>
    <link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">
    <style>
        .test{
            position: fixed;
            top: 0px;
            width: 100%;
            height: 60px;
            background: #ffffff;
            z-index: 999;
        }
        a{
            color: #8a8a8a;
        }
        a:hover{

            text-decoration: none;
        }

    </style>
</head>
<body>
<div style="background: #fafafa">
<div class="test">
    <nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
    <strong style="font-family: 字魂66号-仔仔体;font-size: 30px;color: #00a1d6;height: auto;width: auto;margin-top: 20px">愛美食|搜索</strong>
    <a href="/index1.jsp"style="margin-left: 5px;font-family: 'Adobe 楷体 Std R'">
        <img src="/foodimages/tubiao.png" style="width: 15px;height: 15px;margin-left:20px "/>
        首页</a>
        </div>
    <form class="navbar-form navbar-left" style="margin-left: 100px;" role="search" action="${pageContext.request.contextPath}/food/searchfood" method="post">
        <div class="form-group">
            <input type="text" class="form-control" style="width: 600px" name="search"/>
        </div> <button type="submit" class="btn btn-default">搜索</button>
    </form>

    <ul class="nav navbar-nav navbar-right" id="lore" style="margin-right: 50px">
        <li>
            <a href="${pageContext.request.contextPath}/user/tologin">登录</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/user/toresgiter">注册</a>
        </li>
    </ul>
    <ul class="nav navbar-nav navbar-right" id="ulrica">
        <li class="dropdown">
            <a href="#" class="dropdown-toggle"
               data-toggle="dropdown"
               style="height: 60px;margin-right: 300px">
                <img alt="" class="img-circle" src="/foodimages/<%=request.getSession().getAttribute("uimage")%>" width="38px" height="38px"/>
            </a>
            <div class="dropdown-menu pull-right" style="background: #FFFFFF;width: 320px;overflow: hidden;margin-right: 180px">
                <div style="margin-top: 16px;border-bottom: 1px solid #eeeeee">
                    <div style="text-align: center">
                        <img class="img-circle" src="/foodimages/<%=request.getSession().getAttribute("uimage")%> " onclick="location.href='${pageContext.request.contextPath}/user/usermessage/<%=request.getSession().getAttribute("uid")%>'"
                             style="width: 38px;height: 38px;"/>
                    </div>
                    <div style="color: #323534;text-align: center;line-height: 36px;font-size: 15px">
                        <span><%=request.getSession().getAttribute("username")%></span>
                    </div>
                </div>
                <div style="color: #323534;text-align: center;line-height: 36px;font-size: 15px">
                    <p><%=request.getSession().getAttribute("address")%><a href="#" style="font-size: 12px">（切换城市）</a></p>
                </div>

                <div class="row" style="margin-left: 15px;margin-right: 15px;margin-top: 10px">
                    <div class="col-md-4 text-center grid">
                        <i class="fa fa-user-circle" style="font-size: 25px;line-height: 45px;"></i>
                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                            <a href="${pageContext.request.contextPath}/user/userimage.jsp">修改头像</a></p>
                    </div>
                    <div class="col-md-4 text-center grid">
                        <i class="fa fa-key" style="font-size: 25px;line-height: 45px;"></i>
                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                            密码修改</p>
                    </div>
                    <div class="col-md-4 text-center grid">
                        <i class="fa fa-comments" style="font-size: 25px;line-height: 45px;"></i>
                        <p style="padding: 0px;margin-top: 6px;margin-bottom: 10px;font-size: 12px">
                            消息</p>
                    </div>
                </div>
                <div class="row" style="margin-top: 20px">
                    <div class="text-center"
                         style="padding: 15px;margin: 0px;background: #f6f5f5;color: #323534;">
                        <i class="fa fa-sign-out"></i>
                        <a href="/user/removese">退出登入界面</a>
                    </div>
                </div>
            </div>
        </li>
    </ul>
    <script language="JavaScript">
        var name="j<%=request.getSession().getAttribute("username")%>";
        if(name =="jnull"){
            document.getElementById("lore").style.display='inline';
            document.getElementById("ulrica").style.display='none';
        }
        else{
            document.getElementById("lore").style.display='none';
            document.getElementById("ulrica").style.display='inline';}
    </script>
    </nav>
</div>
</div>
<div style="margin-left: 350px;margin-top: 100px;width: 800px;height: 1000px;">
                <div class="tabbable" id="tabs-326431">
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#foods" data-toggle="tab">美食</a>
                        </li>
                        <li>
                            <a href="#users" data-toggle="tab">用戶</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="foods">
                            <c:forEach var="allfood" items="${foods}" varStatus="varstatus">
                                <c:if test="${allfood.fid!=null}">
                                    <div class="col-sm-6 col-md-3">
                                        <div class="thumbnail" style="height: 220px">
                                            <img alt="${allfood.description}" title="${allfood.description}" src="/foodimages/${allfood.img}" style="width:100%; height: 100px" onclick="location.href='${pageContext.request.contextPath}/food/commentaries/${allfood.fid}'"
                                            />
                                            <div style="height: 20px">
                                                <a href="${pageContext.request.contextPath}/food/commentaries/${allfood.fid}">
                                                    <h6 style="margin-left:8px ">${allfood.title}</h6></a>
                                            </div>

                                            <div style="width: 100%;height: 26px;margin-top: 30px;margin-bottom: 10px">
                                                <img src="/foodimages/liulan.png"  style="width: 13px;height: 13px;margin-left: 8px"/>
                                                <img src="/foodimages/date.png" style="width: 13px;height: 13px;margin-left: 37px"/>
                                                <p style="font-size: 13px;color: #666666;display: inline;margin-left: 3px">${allfood.time}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                           <h3>${nofood}</h3>
                              </div>
                   <div class="tab-pane" id="users">
                                <c:forEach var="user" items="${users}">
                                <c:if test="${user.uid!=null}">
                                <div class="col-sm-6 col-md-2">
                                    <div class="thumbnail" style="height: 220px">
                                        <img  src="/foodimages/${user.uimage}" style="width:100%; height: 100px" onclick="location.href='${pageContext.request.contextPath}/user/usermessage/${user.uid}'"
                                        />
                            <a style="font-size: 13px;color: #666666;" href="${pageContext.request.contextPath}/user/usermessage/${user.uid}">${user.username}</a>
                        </div>
                    </div>
                  </c:if>
                </c:forEach>
                       <h3>${nouser}</h3>
                   </div>

</div>
</div>
</div>


</body>
</html>
