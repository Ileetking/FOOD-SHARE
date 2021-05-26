var E = window.wangEditor
var editor = new E('#div1', '#div2') // 两个参数也可以传入 elem 对象，class 选择器
//开启debug模式
editor.customConfig.debug = true;
// 关闭粘贴内容中的样式
editor.customConfig.pasteFilterStyle = false
// 忽略粘贴内容中的图片
editor.customConfig.pasteIgnoreImg = true
// 使用 base64 保存图片
//editor.customConfig.uploadImgShowBase64 = true

// 上传图片到服务器
editor.customConfig.uploadFileName = 'myFile'; //设置文件上传的参数名称
editor.customConfig.uploadImgServer = 'upload.do'; //设置上传文件的服务器路径
editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024; // 将图片大小限制为 3M
//自定义上传图片事件
editor.customConfig.uploadImgHooks = {
    before : function(xhr, editor, files) {

    },
    success : function(xhr, editor, result) {
        console.log("上传成功");
    },
    fail : function(xhr, editor, result) {
        console.log("上传失败,原因是"+result);
    },
    error : function(xhr, editor) {
        console.log("上传出错");
    },
    timeout : function(xhr, editor) {
        console.log("上传超时");
    }
}

editor.create()