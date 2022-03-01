
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">
     <script>
         // $(function(){
         //     $("#logi").on("click",function () {
         //         if($("#username").val() == ""){
         //             alert("账号不能为空")
         //         } else {
         //             if($("#password").val().length < 6){
         //                 alert("密码不能少于六位");
         //             }
         //         }
         //     });
         // });
     </script>

    <style type="text/css">
        body{background: url(../image/4.jpg) no-repeat;background-size:cover;font-size: 16px;}
        .form{background: rgba(255,255,255,0.2);width:400px;margin:100px auto;}
        #login_form{display: block;}
        #register_form{display: none;}
        .fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
        input[type="text"],input[type="password"]{padding-left:26px;}
        .checkbox{padding-left:21px;}
    </style>
</head>
<body>
<div class="container">
    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form" action="${pageContext.request.contextPath}/user/login" method="post">
            <h3 class="form-title">登录美食屋</h3>
             <span id="logininfo" style="color: red"><%if (request.getSession().getAttribute("loginmsg")!=null){%><%=request.getSession().getAttribute("loginmsg")%><%session.removeAttribute("loginmsg");}%></span>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" name="username" autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" placeholder="Password" name="password" maxlength="8"/>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-success pull-right" id="logi" value="登录"/>
                </div>
            </div>
        </form>
    </div>


</div>
</body>
</html>
