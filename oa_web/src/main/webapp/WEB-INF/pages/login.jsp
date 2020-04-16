<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎使用iNoteOA</title>
    <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
    <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
    <meta name="author" content="AbsoluteAdmin">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="assets/skin/default_skin/css/theme.css">
    <link rel="stylesheet" type="text/css" href="assets/admin-tools/admin-forms/css/admin-forms.css">
    <link rel="shortcut icon" href="assets/img/favicon.ico">

    <%
        String username = "";
        if(session.getAttribute("username") != null){
            username = (String) session.getAttribute("username");
        }
    %>
<script>
    //给username这个文本框绑定获取焦点事件
    document.getElementById("error-sn").onfocus = function(){
        document.getElementById("error-sn").type = "hidden";
    };

    if(document.getElementById("remember") === true) {
        <%
            String password = "";
            if(session.getAttribute("password") != null){
                password = (String) session.getAttribute("password");
            }
        %>
    }
</script>
</head>
<body class="external-page external-alt sb-l-c sb-r-c">
<div id="main" class="animated fadeIn">
    <section id="content_wrapper">
        <section id="content">
            <div class="admin-form theme-info mw400" id="login">
                <div class="content-header">
                    <h1>iNoteOA自动化管理系统</h1>
                </div>
                <div class="panel mt15 mb10">
                <form method="post" action="login" id="myForm" name="myForm">
                    <div class="panel-body bg-light p15 pb5">
                        <div class="section">
                            <label for="sn" class="field-label text-muted fs18 mb10">工号</label>
                            <label for="sn" class="field prepend-icon">
                                <input type="text" name="sn" id="sn" value="<%=username%>" class="gui-input" placeholder="请输入工号...">
                                <label for="sn" class="field-icon">
                                    <i class="fa fa-user"></i>
                                </label>
                            </label>
                            <input type="hidden" id="error-sn" style="border-color: red;color: red" value="" class="gui-input" readonly>
                        </div>
                        <div class="section">
                            <label for="password" class="field-label text-muted fs18 mb10">密码</label>
                            <label for="password" class="field prepend-icon">
                                <input type="password" name="password" id="password" value="<%=password%>" class="gui-input" placeholder="请输入密码...">
                                <label for="password" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                            <input type="hidden" id="error-password" style="border-color: red;color: red" value="您输入的密码应为6-12个字母、数字、下划线" class="gui-input" readonly>
                        </div>
                        <div class="section">
                            <input type="text" value="" placeholder="请输入验证码"
                                   style="height:25px; position: relative; top:-5px; font-size:16px;" id ="text">&nbsp;&nbsp;&nbsp;&nbsp;
                            <canvas id="canvas" width="100" height="25" onclick="ok()"
                                   style="border: 1px solid #ccc;border-radius: 5px;"></canvas>
                        </div>
                    </div>
                    <div class="panel-footer clearfix">
                        <button type="reset" class="button btn-primary mr10 pull-right">重置</button>
                        <button type="submit" class="button btn-primary mr10 pull-right" id="submit" >登陆</button>
                        <label class="switch ib switch-primary mt10">
                            <input type="checkbox" name="remember" id="remember" checked="true">
                            <label for="remember" data-on="是" data-off="否"></label>
                            <span>记住我</span>
                        </label>
                    </div>
                </form>
                </div>
            </div>
        </section>
    </section>
</div>
<script src="vendor/jquery/jquery-1.11.1.min.js"></script>
<script src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>
<script src="assets/js/utility/utility.js"></script>
<script src="assets/js/demo/demo.js"></script>
<script src="assets/js/main.js"></script>

<script >
    window.onload = function() {
        sn.onblur = function () {
            //获取用户名
            var us = document.getElementById("sn").value;
            //去除前后空白
            us = us.trim();
            //判断用户名是否为空
            if (us === "") {
                document.getElementById("error-sn").value = "用户名不能为空";
                document.getElementById("error-sn").type = "text";
            } else if (us.length != 5) {
                //用户名长度非法
                document.getElementById("error-sn").value = "您输入的工号位数应为5位";
                document.getElementById("error-sn").type = "text";
            } else {
                //用户名长度合法
                //继续判断是否含有特殊符号
                var RegExp = /^[0-9]{5}$/;
                var ok = RegExp.test(us);
                if (ok) {
                    document.getElementById("error-sn").type = "hidden";
                } else {
                    document.getElementById("error-sn").value = "您输入的工号只能含有数字";
                    document.getElementById("error-sn").type = "text";
                }
            }
        }

        password.onblur = function () {
            //获取密码
            var uspwd = document.getElementById("password").value;
            //去除前后空白
            uspwd = uspwd.trim();
            //判断密码是否为空
            if (uspwd === "") {
                document.getElementById("error-password").value = "密码不能为空";
                document.getElementById("error-password").type = "text";
            } else if (uspwd.length < 6 || uspwd.length > 12) {
                //密码长度非法
                document.getElementById("error-password").value = "您输入的密码位数应为6-12位";
                document.getElementById("error-password").type = "text";
            } else {
                //用户名长度合法
                //继续判断是否含有特殊符号
                var RegExp1 = /^[A-Za-z0-9]{6,12}$/;
                var ok1 = RegExp1.test(uspwd);
                if (ok1) {
                    document.getElementById("error-password").type = "hidden";
                } else {
                    document.getElementById("error-password").value = "您输入的密码只能含有数字，字母或下划线";
                    document.getElementById("error-password").type = "text";
                }
            }
        }
    }
</script>
<script >
    var submitBtn = document.getElementById("submit");
    var show_num = [];
    draw(show_num);
    function ok(){
        draw(show_num);
    }
    submitBtn.onclick = function (event) {
        var val=document.getElementById("text").value;
        var num = show_num.join("");
        if(val==''){
            alert('请输入验证码！');
        }else if(val == num){
            document.getElementById(".input-val").val('');
            draw(show_num);
        }else{
            alert('验证码错误！');
            document.getElementById("text").value='';
            draw(show_num);
        }
        if((val == num)&&(document.getElementById("error-sn").type==="hidden")&&
            (document.getElementById("error-password").type==="hidden")){
        } else {
            event.preventDefault(); // 兼容标准浏览器
        }
    }
    function draw(show_num) {
        var canvas_width=document.getElementById('canvas').clientWidth;
        var canvas_height=document.getElementById('canvas').clientHeight;
        var canvas = document.getElementById("canvas");//获取到canvas的对象，演员
        var context = canvas.getContext("2d");//获取到canvas画图的环境，演员表演的舞台
        canvas.width = canvas_width;
        canvas.height = canvas_height;
        var sCode = "1,2,3,4,5,6,7,8,9,0";
        var aCode = sCode.split(",");
        var aLength = aCode.length;//获取到数组的长度

        for (var i = 0; i <= 3; i++) {
            var j = Math.floor(Math.random() * aLength);//获取到随机的索引值
            var deg = Math.random() * 30 * Math.PI / 180;//产生0~30之间的随机弧度
            var txt = aCode[j];//得到随机的一个内容
            show_num[i] = txt;
            var x = 10 + i * 20;//文字在canvas上的x坐标
            var y = 20 + Math.random() * 8;//文字在canvas上的y坐标
            context.font = "bold 23px 微软雅黑";

            context.translate(x, y);
            context.rotate(deg);

            context.fillStyle = randomColor();
            context.fillText(txt, 0, 0);

            context.rotate(-deg);
            context.translate(-x, -y);
        }
        for (var i = 0; i <= 5; i++) { //验证码上显示线条
            context.strokeStyle = randomColor();
            context.beginPath();
            context.moveTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.lineTo(Math.random() * canvas_width, Math.random() * canvas_height);
            context.stroke();
        }
        for (var i = 0; i <= 30; i++) { //验证码上显示小点
            context.strokeStyle = randomColor();
            context.beginPath();
            var x = Math.random() * canvas_width;
            var y = Math.random() * canvas_height;
            context.moveTo(x, y);
            context.lineTo(x + 1, y + 1);
            context.stroke();
        }
    }
    function randomColor() {//得到随机的颜色值
        var r = Math.floor(Math.random() * 256);
        var g = Math.floor(Math.random() * 256);
        var b = Math.floor(Math.random() * 256);
        return "rgb(" + r + "," + g + "," + b + ")";
    }

</script>
</body>
</html>
