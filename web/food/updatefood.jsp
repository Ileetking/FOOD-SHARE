<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" deferredSyntaxAllowedAsLiteral="true" %>
<html>
<head>
    <title>发布美食</title>
    <link rel="icon" href="/foodimages/tubiao1.png" type="image/x-icon"/>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <%--         <link type="text/css" rel="stylesheet" href="../css/demo.css">--%>
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
<div class="container" style="height: 800px">
    <div class="row clearfix">
        <div class="col-md-12 column" style="margin-left: 90px">
            <form  name="form1" role="form" action="${pageContext.request.contextPath}/food/updatefood" enctype="multipart/form-data" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1">美食标题</label><input type="text" name="title" class="form-control" id="exampleInputEmail1" value=${title} />
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">美食描述</label><input type="text" name="description" class="form-control" id="exampleInputPassword1" value=${description} />
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
                    <label for="exampleInputFile">上传美食图片</label><input type="file" name="file" id="exampleInputFile" value=${img} />
                    <p class="help-block">
                        该图片会作为缩略图并展示在首页
                    </p>
                </div>
                <div>
                    <div id="toolbar-container" class="toolbar"></div>
                </div>
                <textarea  name="article" id="txtIntro"   style="display: none" ></textarea>
                <script>document.getElementById(txtIntro).value=${artile}</script>
                <div id="d4"></div>
                <div class="checkbox">
                </div> <button id="button" type="submit" class="btn btn-default">上传更新</button>

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