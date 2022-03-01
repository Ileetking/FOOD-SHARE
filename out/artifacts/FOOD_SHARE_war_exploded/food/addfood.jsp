<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" deferredSyntaxAllowedAsLiteral="true" %>
<html>
<head>
    <title>发布美食</title>
    <link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome/css/font-awesome.min.css">
    <%--         <link type="text/css" rel="stylesheet" href="../css/demo.css">--%>
    <script src="https://cdn.jsdelivr.net/gh/stevenjoezhang/live2d-widget@latest/autoload.js"></script>
    <style>
        .toolbar {
            border: 1px solid #ccc;
        }
        .text {
            border: 1px solid #ccc;
            min-height: 400px;
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
<body>

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

<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column" style="margin-left: 90px">
            <form  name="form1" role="form" action="${pageContext.request.contextPath}/food/addFood" enctype="multipart/form-data" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1">美食标题</label><input type="text" name="title" class="form-control" id="exampleInputEmail1" />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">美食描述</label><input type="text" name="description" class="form-control" id="exampleInputPassword1" />
                </div>
                <input name="uid"  style="display: none" value="<%=request.getSession().getAttribute("uid")%>"/>
                <label>请选择类型</label>
                <select class="selectpicker" name="cid">
                    <c:forEach var="all" items="${allname}">
                        <option value="${all.id}">${all.categoryname}</option>
                    </c:forEach>
                </select>
                <br>
                <div class="form-group">
                    <label for="exampleInputFile">上传美食图片</label><input type="file" name="file" id="exampleInputFile" />
                    <p class="help-block">
                        该图片会作为缩略图并展示在首页
                    </p>
                </div>
                <div>
                    <div id="toolbar-container" class="toolbar"></div>
                </div>
                <textarea  name="article" id="txtIntro" style="display: none"></textarea>
                <div id="d4"></div>
                <div class="checkbox">
                </div> <button id="button" type="submit" class="btn btn-default">上传首页</button>

            </form>
        </div>
    </div>
</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/wangEditor.min.js"></script>
<script type="text/javascript">

   const E = window.wangEditor
   const editor = new E('#toolbar-container')
   const $text1 = $('#txtIntro')
   editor.config.onchange = function (html) {
       // 第二步，监控变化，同步更新到 textarea
       $text1.val(html)
   }
   // editor.config.uploadImgServer = '/foodimage'
   editor.config.showLinkImg = false
   editor.config.uploadImgShowBase64 = true
   editor.create()

   // 第一步，初始化 textarea 的值
   $text1.val(editor.txt.html())
</script>
</html>