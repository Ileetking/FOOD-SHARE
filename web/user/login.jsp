
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

        .code
        {
            background-color: silver;
            font-family:Arial; /*设置字体*/
            font-style:initial;
            color:brown;
            font-size:12px;
            border:0px;
            padding:2px 3px;
            letter-spacing:42px;
            font-weight:bolder;

            width:225px;
            height:21px;

            float: right;
            /*margin-left: 120px;*/
            /*margin-top: -35px;*/

        }
    </style>
    <script language="javascript" type="text/javascript">

        var code;
        function createCode() {  //函数体
            code = "";
            var codeLength = 5; //验证码的长度
            var checkCode = document.getElementById("checkCode");
            var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
            for (var i = 0; i < codeLength; i++)
            {
                var charNum = Math.floor(Math.random() * 52);//设置随机产生
                code += codeChars[charNum];
            }
            if (checkCode)
            {
                checkCode.className = "code";
                checkCode.innerHTML = code;
            }
        }
    </script>
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
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Verification" name="verification" maxlength="5"/>
                    <div class="code" id="checkCode" onclick="createCode()"></div>
                    <%--                    <a class="yz"  href="#" onclick="createCode()">看不清换一张</a>--%>
                </div>
                <div class="form-group">
                    <input type="hidden" id="codeu" name="codeu"/>
                    <input type="submit" class="btn btn-success pull-right" id="logi" value="登录" onclick="getdom()"/>
                </div>
            </div>
        </form>
    </div>


</div>
</body>
<script>
    function getdom() {
        $("#codeu").attr("value",code);
    }
</script>
<script>
    window.onload=createCode();
</script>
</html>
