
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: T.A.B
  Date: 2021/4/14
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>爱美食</title>
    <link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">--%>
<%--    <script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script>--%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

   <style>
     a{
       color: #323534;
     }
     a:hover{
       color: deepskyblue;
       text-decoration: none;
     }

   </style>

  </head>

  <body>
<div class="container">
    <div class="row clearfix">
      <div class="col-md-12 column">
        <nav class="navbar navbar-default" role="navigation">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="${pageContext.request.contextPath}/food/toaddFood">分享美食吧！</a>
          </div>

          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
              <li class="active">
                <a href="/index1.jsp">首页</a>
              </li>
              <li>
                <a href="/user/tofujing">附近</a>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">我的<strong class="caret"></strong></a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="${pageContext.request.contextPath}/user/usershouchang/<%if(request.getSession().getAttribute("uid")==null)out.print(0);else out.print(request.getSession().getAttribute("uid"));%>">我的收藏</a>
                  </li>
                  <li>
                    <a href="${pageContext.request.contextPath}/user/userdianzan/<%if(request.getSession().getAttribute("uid")==null)out.print(0);else out.print(request.getSession().getAttribute("uid"));%>">我的点赞</a>
                  </li>
                  <li>
                    <a href="${pageContext.request.contextPath}/user/userpinlun/<%if(request.getSession().getAttribute("uid")==null)out.print(0);else out.print(request.getSession().getAttribute("uid"));%>">我的评论</a>
                  </li>
                  <li class="divider">
                  </li>
                  <li>
                    <a href="${pageContext.request.contextPath}/user/tozuye">主页管理</a>
                  </li>
                  <li class="divider">
                  </li>
                  <li>
                    <a href="${pageContext.request.contextPath}/chat.jsp">联系客服</a>
                  </li>
                </ul>
              </li>
            </ul>
            <form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/food/searchfood" method="post">
              <div class="form-group">
                <input type="text" class="form-control" name="search"/>
              </div> <button type="submit" class="btn btn-default">搜索</button>
            </form>

            <ul class="nav navbar-nav navbar-right" id="lore">
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
                   style="height: 60px">
                  <img alt="" class="img-circle" src="/foodimages/<%=request.getSession().getAttribute("uimage")%>" width="38px" height="38px"/>
                  <span style="color: #000000;font-size: 15px">
                                <i><%=request.getSession().getAttribute("username")%></i>
                            </span>
                </a>
                <div class="dropdown-menu pull-right"
                     style="background: #FFFFFF;width: 320px;overflow: hidden">
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
                    <p><%=request.getSession().getAttribute("address")%><a href="#" style="font-size: 12px"></a></p>
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
              </li>
            </ul>
          </div>

        </nav>
        <ul class="nav nav-pills">
          <li><a href="${pageContext.request.contextPath}/index1.jsp">推荐</a></li>
          <c:forEach var="category" items="${allname1}">
            <li><a href="/food/category.jsp?cid=${category.id}">${category.categoryname}</a></li>
          </c:forEach>
        </ul>
        <br>
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


            </div>
          </div>
          </c:if>
        </c:forEach>

       <div style="text-align: center;margin-top: 500px">
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
    </div>
  </div>
  </body>
</html>

