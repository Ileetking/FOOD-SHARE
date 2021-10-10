<%--
  Created by IntelliJ IDEA.
  User: T.A.B
  Date: 2021/10/8
  Time: 21:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>主页管理</title>
    <link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .test{
            position: fixed;
            top: 0px;
            width: 100%;
            height: 60px;
            background: #ffffff;
        }
        a{
            color: #8a8a8a;
        }
        a:hover{

            text-decoration: none;
        }
        .menut{
            position: fixed;
            height: 100%;
        }

    </style>
</head>
<body style="background: #fafafa">
<div class="test">
<strong style="font-family: 字魂66号-仔仔体;font-size: 30px;color: #00a1d6;height: auto;width: auto;margin-top: 20px">主页管理中心</strong>
    <a href="/index1.jsp"style="margin-left: 5px;font-family: 'Adobe 楷体 Std R'">
        <img src="/foodimages/tubiao.png" style="width: 15px;height: 15px;margin-left:20px "/>
        首页</a>
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
</div>
<div style="margin-top: 60px;z-index: -999" class="menut">
    <div style="width: 210px;height: 60px;background: #fcfcfc">
   <button style="background: #00a1d6;margin-left: 30px;font-size: 18px;color: #ffffff;width: 150px;height: 50px;margin-top: 15px;border: none">
       <img src="/foodimages/fabu.png" style="width: 18px;height: 19px;margin-right: 5px">
       发布</button>
    </div>
<iframe src="/user/menu.jsp" frameborder="0" scrolling="no" height="100%" width="210px" noresize="noresize" style="float: left">
</iframe>
    <iframe name="zhuye" frameborder="0" scrolling="yes" height="100%" width="1160px" noresize="noresize" style="background: #ffffff;margin-left: 80px;margin-top: -40px;float: left">

    </iframe>

</div>
</body>
</html>
