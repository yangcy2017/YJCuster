<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>有间客户管理系统</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <style>
        body{
            width: 800px;
            text-align: center;
            margin-left:auto;
            margin-right:auto;
        }
        .top {
            margin-top: 30px;
        }

        .top img {
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }

        .top h1 {
            color: red;
            display: inline;
            vertical-align: middle
        }
        .tool{
            margin-top: 30px;

        }
        .tool input{
            margin-right: 10px;
            margin-left: 10px;
        }
        .keyword{
            float: left;
        }
        .searchType{
            float: left;
            height: 26px;
        }
        .search{
            float: left;
        }
        .add{
            float:right
        }
        table{
            margin-top: 60px;
            margin-left: 10px;
            margin-right: 10px;
            border:2px solid #000;
        }
        tr{
            border:2px solid #000;
        }
        td{
            border:2px solid #000;
            width:156px;
            height: 25px;
        }
    </style>
    <script>
        $(function () {
            $(".add").on("click", function () {
                alertAddCustWindow();
            });
            $(".search").on("click", function () {
                var keyword = $(".keyword").val();
                if(!keyword){
                    alert("请输入关键字");
                    return;
                }
                var searchType = $(".searchType").val();
                var data = {};
                data.keyword = keyword;
                data.searchType = searchType;
                $.ajax({
                    url: "/killer/cust/search",
                    data: data,
                    type: "POST",
                    dataType: "json",
                    success: function(data) {
                        if(data.code == 0){
                            var records = data.data;
                            var _html = "";
                            $.each(records, function (i,e) {
                                _html += "" +
                                    "<tr>" +
                                    "   <td>"+e.name+"</td>" +
                                    "   <td>"+e.number+"</td>" +
                                    "   <td>"+e.phone+"</td>" +
                                    "   <td>"+e.gender+"</td>" +
                                    "   <td><a onclick='showInfo();'>"+"详情"+"</a></td>" +
                                    "</tr>";
                            });
                            $("tbody").html(_html);
                        }else{
                            $("tbody").html("");
                            alert(data.msg);
                        }
                    },
                    error:function () {
                        alert("请求异常！");
                    }
                });

            });
        });
        function showInfo(){
            alert("张总御用架构师正在紧急开发中，请稍后");
        }
        function alertAddCustWindow() {
            GenerateHtml("新增用户");
            $("#mb_btn_ok").click(function() {
                var name = $("#name").val();
                var wx = $("#wx").val();
                var phone = $("#phone").val();
                var gender = $("#gender").val();
                var recommendWx = $("#recommendWx").val();
                if(!name){
                    alert("姓名不可为空");
                    return;
                }
                if(!wx){
                    alert("微信不可为空");
                    return;
                }
                if(!phone){
                    alert("手机号不可为空");
                    return;
                }
                if(!gender){
                    alert("性别不可为空");
                    return;
                }
                var data = {};
                data.name = name;
                data.wx = wx;
                data.phone = phone;
                data.gender = gender;
                data.recommendWx = recommendWx;
                $.ajax({
                    url: "/killer/cust/add",
                    data: data,
                    type: "POST",
                    dataType: "json",
                    success: function(data) {
                        if(data.code == 0){
                            $("#mb_box,#mb_con").remove();
                        }else{
                            alert("创建用户失败：" + data.msg);
                        }
                    },
                    error:function () {
                        alert("请求异常！");
                    }
                });
            });
            $("#mb_btn_no,#mb_ico").click(function() {
                $("#mb_box,#mb_con").remove();
            });
        }
        var GenerateHtml = function(title) {
            var _html = "";
            _html +=    '<div id="mb_box"></div>' +
                        '<div id="mb_con">' +
                            '<span id="mb_tit">' + title + '</span>' +
                            '<a id="mb_ico">x</a>' +
                            '<div id="mb_msg">' +
                                '<span>姓名:</span><input type="text" name="name" id="name"><br/><br/>'+
                                '<span>微信号:</span><input type="text" name="wx" id="wx"><br/><br/>'+
                                '<span>性别:</span><input type="text" name="gender" id="gender"><br/><br/>'+
                                '<span>电话:</span><input type="text" name="phone" id="phone"><br/><br/>'+
                                '<span>推荐人微信号:</span><input type="text" name="recommendWx" id="recommendWx">'+
                            '</div>' +
                        '<div id="mb_btnbox">';
            _html += '<input id="mb_btn_ok" type="button" value="确定" />';
            _html += '<input id="mb_btn_no" type="button" value="取消" />';

            _html += '</div></div>';
            //必须先将_html添加到body，再设置Css样式
            $("body").append(_html);
            //生成Css
            GenerateCss();
        }
        //生成Css
        var GenerateCss = function() {
            $("#mb_box").css({
                width: '100%',
                height: '100%',
                zIndex: '99999',
                position: 'fixed',
                filter: 'Alpha(opacity=60)',
                backgroundColor: 'black',
                top: '0',
                left: '0',
                opacity: '0.6'
            });
            $("#mb_con").css({
                zIndex: '999999',
                width: '400px',
                position: 'fixed',
                backgroundColor: 'White',
                borderRadius: '15px'
            });
            $("#mb_tit").css({
                display: 'block',
                fontSize: '14px',
                color: '#444',
                padding: '10px 15px',
                backgroundColor: '#DDD',
                borderRadius: '15px 15px 0 0',
                borderBottom: '3px solid #009BFE',
                fontWeight: 'bold'
            });
            $("#mb_msg").css({
                padding: '20px',
                lineHeight: '20px',
                borderBottom: '1px dashed #DDD',
                fontSize: '13px'
            });
            $("#mb_msg span").css({
                display:'inline-block',
                width:'100px'
            });
            $("#mb_ico").css({
                display: 'block',
                position: 'absolute',
                right: '10px',
                top: '9px',
                border: '1px solid Gray',
                width: '18px',
                height: '18px',
                textAlign: 'center',
                lineHeight: '16px',
                cursor: 'pointer',
                borderRadius: '12px',
                fontFamily: '微软雅黑'
            });
            $("#mb_btnbox").css({
                margin: '15px 0 10px 0',
                textAlign: 'center'
            });
            $("#mb_btn_ok,#mb_btn_no").css({
                width: '85px',
                height: '30px',
                color: 'white',
                border: 'none'
            });
            $("#mb_btn_ok").css({
                backgroundColor: '#168bbb'
            });
            $("#mb_btn_no").css({
                backgroundColor: 'gray',
                marginLeft: '20px'
            });
            //右上角关闭按钮hover样式
            $("#mb_ico").hover(function() {
                $(this).css({
                    backgroundColor: 'Red',
                    color: 'White'
                });
            }, function() {
                $(this).css({
                    backgroundColor: '#DDD',
                    color: 'black'
                });
            });
            var _widht = document.documentElement.clientWidth; //屏幕宽
            var _height = document.documentElement.clientHeight; //屏幕高
            var boxWidth = $("#mb_con").width();
            var boxHeight = $("#mb_con").height();
            //让提示框居中
            $("#mb_con").css({
                top: (_height - boxHeight) / 2 + "px",
                left: (_widht - boxWidth) / 2 + "px"
            });
        }


    </script>
</head>
<body>
    <%--top--%>
    <div class="top">
        <img src="../pic/logo.png" alt="logo">
        <h1>有间实景客户管理系统</h1>
    </div>
    <%--tool--%>
    <div class="tool">
        <input type="text" name="keyword" class="keyword">
        <select name="searchType" class="searchType">
            <option value="name">姓名</option>
            <option value="wx">微信号</option>
            <option value="phone">手机号</option>
        </select>
        <input type="button" class="search" value="搜索"/>
        <input type="button" class="add" value="新建"/>
    </div>
    <%--data--%>
    <div>
        <table>
            <thead>
                <tr>
                    <td>姓名</td>
                    <td>微信号</td>
                    <td>电话</td>
                    <td>性别</td>
                    <td>详情</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
