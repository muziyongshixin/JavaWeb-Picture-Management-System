// 为表单绑定异步上传的事件
$(function() {
    // 为表单绑定异步上传的事件
    $("#picForm").ajaxForm({
        url: "uploadPic.action", // 请求的url
        type: "post", // 请求方式
        dataType: "text", // 响应的数据类型
        async: true, // 异步
        success: function (imageUrl) {
            alert(imageUrl);
        },
        error: function () {
            alert("数据加载失败！");
        }
    });
// 为提交按钮绑定事件
    $("#saveBtn").click(function () {
        // 表单输入较验
        var title = $("#title");
        // 获取textarea的内容
        var content = tinyMCE.get('content').getContent();
        var msg = "";
        if ($.trim(title.val()) == "") {
            msg = "公告标题不能为空！";
            title.focus();
        } else if ($.trim(content) == "") {
            msg = "内容不能为空！";
        }
        msg = "";
        if (msg != "") {
            alert(msg);
        } else {
            // 表单提交
            $("#noticeForm").submit();
        }
    });

})