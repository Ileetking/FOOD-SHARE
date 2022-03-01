<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<html>
<head>
    <title>爱美食</title>
    <link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<%--    <link href="../css/font-awesome.min.css" rel="stylesheet"/>--%>
<%--    <script src="../js/autoload.js"/>--%>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">
<%--         <link type="text/css" rel="stylesheet" href="../css/demo.css">--%>
        <script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script>
    <style>
        .butt{
            background: none;border-radius: 10px;border-color: #dbdbdb;width: 115px;
            height: 30px;border-width: 1px;cursor: pointer
        }
        .butt:hover{
            border-color: #323534;
        }

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
<body style="background: #eeeeee">

<div style="background: #fafafa">
    <div class="test">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <strong style="font-family: 字魂66号-仔仔体;font-size: 30px;color: #00a1d6;height: auto;width: auto;margin-top: 20px">愛美食</strong>
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

    <div style="width: 300px;height: 300px;background: #ffffff;margin-left: 100px;float: left;margin-top: 61px">
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
       <div style="width: 48px;text-align: center;margin-right: 10px;float: left"><p style="font-size: small;color: #323534">11</p><p style="font-size: small;color: #323534">关注</p></div>
        <div style="width: 48px;text-align: center;margin-right: 10px;float: left"><p style="font-size: small;color: #323534">${allliulan}</p><p style="font-size: small;color: #323534">访问</p> </div>
            <div style="width: 48px;text-align: center;margin-right: 10px;float: left"><p style="font-size: small;color: #323534">${alldianzan}</p><p style="font-size: small;color: #323534">获赞</p> </div>
            <div style="width: 48px;text-align: center;margin-right: 10px;float: left"><p style="font-size: small;color: #323534">${commentaries.size()}</p><p style="font-size: small;color: #323534">评论</p> </div>
            <div style="width: 48px;text-align: center;float: left"><p style="font-size: small;color: #323534">${allshouchang}</p><p style="font-size: small;color: #323534">收藏</p> </div>
        </div>
      <div style="margin-top: 30px;margin-left: 20px">
          <div style="float: left"> <button class="butt" >私信</button></div>
          <div style="margin-left: 30px;float: left"><button  class="butt">关注</button></div>

      </div>
    </div>

    <div style="width: 800px;text-align: center;margin-left: 10px;background: #ffffff;float: left;width: 980px;margin-top: 61px">
        ${food.article}
            <div style="align-content: center">
                <img  src="/foodimages/zan.png" id="qiehuang" style="width: 30px;height: 30px;margin-right: 38px"/>
                <script>
                    var bt=document.getElementById("qiehuang");
                    if(!${dianzan}){
                        bt.src="/foodimages/yizan.png";
                    }
                </script>
                <img  src="/foodimages/shouchang.png" id="shou" style="width: 33px;height: 33px"/>
                <script>
                    var bt1=document.getElementById("shou");
                    if(!${shouchang}){
                        bt1.src="/foodimages/yishouchang.png";
                    }
                </script>
            </div>
            <form id="ddd" action="${pageContext.request.contextPath}/food/isdianzan" method="post">
             <input type="hidden" name="dianzan" id="dianzan">
                <input id="uuid" name="uid" value="<%=request.getSession().getAttribute("uid")%>" style="display: none"/>
                <input name="fid" value="${food.fid}" style="display: none"/>
            </form>
            <form id="eee" action="${pageContext.request.contextPath}/food/isshouchang">
                <input name="uid" value="<%=request.getSession().getAttribute("uid")%>" style="display: none"/>
                <input name="fid" value="${food.fid}" style="display: none"/>
                <input type="hidden" name="shouchang" id="shouchang">
            </form>
            <script>
                var bt1=document.getElementById("qiehuang");
                var bt2=document.getElementById("shou");
                var bt3=document.getElementById("ddd");
                var bt6=document.getElementById("eee");
                var bt4=document.getElementById("dianzan");
                var bt5=document.getElementById("shouchang");
                var iszan=${dianzan};
                var isshou=${shouchang};
               bt1.onclick=function () {
                       if(iszan){
                           bt1.src="/foodimages/yizan.png";
                           iszan=false;
                       }
                       else {
                           bt1.src="/foodimages/zan.png";
                           iszan=true;
                       }
                       bt4.value=iszan;
                       bt3.submit();

                   }
               bt2.onclick=function () {
                       if(isshou){
                           bt2.src="/foodimages/yishouchang.png";
                           isshou=false;
                       }
                       else {
                           bt2.src="/foodimages/shouchang.png";
                           isshou=true;
                       }
                       bt5.value=isshou;
                       bt6.submit();
               }
            </script>
            <br/>
            <br/>

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
