<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>$Title$</title>
    <script src="/HandyEditor.min.js"></script>
    <script>
        var he = HE.getEditor('editor', {
            autoHeight: true,
            autoFloat: false,
            topOffset: 0,
            uploadPhoto: true,
            uploadPhotoUrl: uploadDomain,
            uploadPhotoHandler: "",
            uploadPhotoSize: 200,
            uploadPhotoType: 'gif,png,jpg,jpeg',
            uploadPhotoSizeError: '不能上传大于2MB的图片',
            uploadPhotoTypeError: '只能上传gif,png,jpg,jpeg格式的图片',
            lang: 'zh-jian',
            skin: 'HandyEditor',
            externalSkin: '',
            item: ['bold', 'italic', 'strike', 'underline', 'fontSize', 'fontName', 'paragraph', 'color', 'backColor', '|', 'center', 'left', 'right', 'full', 'indent', 'outdent', '|', 'link', 'unlink', 'textBlock', 'code', 'selectAll', 'removeFormat', 'trash', '|', 'image', 'expression', 'subscript', 'superscript', 'horizontal', 'orderedList', 'unorderedList', '|', 'undo', 'redo', '|', 'html', '|', 'about']
        });

    </script>

</head>
<body>
<textarea id="editor" name="editor" rows="5" style="display: none;"></textarea>

</body>
</html>