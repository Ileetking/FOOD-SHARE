<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
                          .talk_con {
                              width: 600px;
                              height: 500px;
                              border: 1px solid #666;
                              margin: 50px auto 0;
                              background: #f9f9f9;
                          }

    .talk_show {
        width: 580px;
        height: 420px;
        border: 1px solid #666;
        background: #fff;
        margin: 10px auto 0;
        overflow: auto;
    }

    .talk_input {
        width: 580px;
        margin: 10px auto 0;
    }

    .whotalk {
        width: 80px;
        height: 30px;
        float: left;
        outline: none;
    }

    .talk_word {
        width: 420px;
        height: 26px;
        padding: 0px;
        float: left;
        margin-left: 10px;
        outline: none;
        text-indent: 10px;
    }

    .talk_sub {
        width: 56px;
        height: 30px;
        float: left;
        margin-left: 10px;
    }

    .atalk {
        margin: 10px;
    }

    .atalk span {
        display: inline-block;
        background: #0181cc;
        border-radius: 10px;
        color: #fff;
        padding: 5px 10px;
    }

    .btalk {
        margin: 10px;
        text-align: right;
    }

    .btalk span {
        display: inline-block;
        background: #ef8201;
        border-radius: 10px;
        color: #fff;
        padding: 5px 10px;
    }
</style>
    <script>
        $(function(){
            $('#talksub').click(function(){
                //发送单击，获取用户输入的数据value属性值
                var vals=$('#talkwords').val()
                //如果输入的数据为空，则弹窗提示
                if (vals=='')
                {
                    alert('请输入数据！')
                    return
                }
                //条件下拉列表中的value值是0还是1
                var whovals=$('#who').val()
                var str=""
                //选择A发送还是B发送
                if (whovals==0){
                    str='<div class="atalk"><span>'+ vals+'</span></div>'
                }
                else{
                    str='<div class="btalk"><span>'+ vals+'</span></div>'
                }
                //原有的内容+str,否则会覆盖掉原有内容
                $('#words').html($('#words').html()+str)
                //发送完数据后清空输入框
                $('#talkwords').val('')
            })
        })
    </script>
</head>
<body>

            <div class="talk_con">
                <div class="talk_show" id="words">
                    <div class="atalk"><span>A：你还好吗？</span></div>
                    <div class="btalk"><span>B：嗯，你呢？</span></div>
                </div>
                <div class="talk_input">
                  <%--  <select class="whotalk" id="who">
                        <option value="0">A：</option>
                        <option value="1">B：</option>
                    </select>--%>
                    <input type="text" class="talk_word" id="talkwords">
                    <input type="submit" value="发送" class="talk_sub" id="talksub">
                </div>
            </div>
</body>
</html>