<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>学生信息管理系统</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script src="/js/jquery-1.12.3.min.js"></script>
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/jquery.bootgrid.min.css">
    <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="/js/jquery.bootgrid.min.js"></script>
    <script type="text/javascript" src="/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="/css/bootstrap-datetimepicker.min.css" type="text/css"></link>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="navbar navbar-inverse">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">学生信息管理系统</a>
                    </div>
                    <div class="collapse navbar-collapse" >
                        <ul class="nav navbar-nav">
                            <li class="dropdown">
                                <a href="#" id="username" class="dropdown-toggle" data-toggle="dropdown">
                                    <%=session.getAttribute("username")%> <span class="caret"></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a href="/user/logout">退出登录</a> </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="row">
                    <div class="col-md-12">
                        <h2>学生信息</h2>
                        <hr/>
                        <!-- 4.新增学生 id属性 -->
                        <button type="button" class="btn btn-primary" id="add">新增学生信息</button>
                        <a class="btn btn-primary" href="/stu/exportStu">导出学生信息-Excel</a>
                        <%--<div class="btn-group">--%>
                            <%--<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--%>
                                <%--功能3 <span class="caret"></span>--%>
                            <%--</button>--%>
                            <%--<ul class="dropdown-menu">--%>
                                <%--<li><a href="#">功能1</a> </li>--%>
                                <%--<li><a href="#">功能2</a> </li>--%>
                            <%--</ul>--%>
                        <%--</div>--%>
                        <%--1. id="grid-data" 所在位置--%>
                        <table id="grid-data" class="table table-condensed table-hover table-striped">
                            <thead>
                            <tr>
                                <%--数据显示来源(根据data-column-**)--%>
                                <th data-column-id="id" data-identifier="true" data-type="numeric">编号</th>
                                <th data-column-id="stu_id">学号</th>
                                <th data-column-id="stu_name">姓名</th>
                                <th data-column-id="stu_age">年龄</th>
                                <th data-column-id="stu_major">科目</th>
                                <th data-column-id="commands" data-formatter="commands" data-sortable="false">操作</th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {

            //1. 调用 id.bootgrid({***});
            var grid = $("#grid-data").bootgrid({
                // 是否发生异步请求(必须true)
                ajax:true,
                // 传递的参数
                post:function () {
                    return {
                        id: "b0df282a-0d67-40e5-8558-c9e93b7befed"
                    };
                },
                // 请求的url 返回json格式数据
                url:"/stu/stuList",
                // html中与data-data-formatter相连
                formatters:{
                    // 其中column是每列的列名, row是java返回值得每行数据
                    "commands":function (column, row) {
                        //在操作这一列显示的东西----data-row-id为自定义属性------row.id中的id为java返回行中的一个属性值id
                        // 类command-edit 和 command-delete 所在位置
                        return "<button type=\"button\" class=\"btn btn-xs btn-default command-edit\" data-row-id=\"" + row.id + "\">编辑<span class=\"fa fa-pencil\"></span></button> "+
                            "<button type=\"button\" class=\"btn btn-xs btn-default command-delete\" data-row-id=\"" + row.id + "\">删除<span class=\"fa fa-trash-o\"></span></button>";
                    }
                }
                //延迟加载
            }).on("loaded.rs.jquery.bootgrid",function () {
                // 2.修改页面 点击class(.command-edit)按钮
                grid.find(".command-edit").on("click", function (e) {
                    // 2.调用class(.stumodal).modal()
                    $(".stumodal").modal();
                    // post() 方法通过Http post请求从服务器载入数据 url, data, success
                    $.post("/stu/getStuInfo",{id:$(this).data("row-id")}, function (str) {
                        // 赋值给id为id2
                        $("#id2").val(str.id);
                        $("#stu_id2").val(str.stu_id);
                        $("#stu_name2").val(str.stu_name);
                        $("#stu_age2").val(str.stu_age);
                        $("#stu_major2").val(str.stu_major);
                    });
                    // 3.删除按钮 点击class(.command-delete)
                }).end().find(".command-delete").on("click", function (e) {
                    var r = confirm("你确定要删除编号为 " + $(this).data("row-id") + " 的学生信息吗?");
                    if(r){
                        $.post("/stu/delStu", {id:$(this).data("row-id")}, function () {
                            alert("删除成功!");
                            $("#grid-data").bootgrid("reload");
                        });
                    };
                });
            });
        });

        // 4.新增 根据id属性调用模态框
        // 用法：通过简单的一行 JavaScript 来调用带有 id="identifier" 的模态框：
        // $('#identifier').modal(options)
        $(document).ready(function () {
            $('#add').click(function () {
                // .modal，用来把 <div> 的内容识别为模态框
                $(".addmodal").modal();
            });
        });

    </script>

    <%--4.新增模态框 class所在位置--%>
    <div class="modal fade addmodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- <div class="modal-header">，modal-header 是为模态窗口的头部定义样式的类。 -->
                <div class="modal-header">
                    <%-- class="close"，close 是一个 CSS class，用于为模态窗口的关闭按钮设置样式。 --%>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <%-- 模态框-标题 --%>
                    <h4 class="modal-title">新增学生信息</h4>
                </div>
                <form action="/stu/addStu" method="post">
                    <!-- class="modal-body"，是 Bootstrap CSS 的一个 CSS class，用于为模态窗口的主体设置样式。 -->
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="stu_id1">学号</label>
                            <input type="text" name="stu_id" class="form-control" id="stu_id1">
                        </div>
                        <div class="form-group">
                            <label for="stu_name1">姓名</label>
                            <input type="text" name="stu_name" class="form-control" id="stu_name1">
                        </div>
                        <div class="form-group">
                            <label for="stu_age1">年龄</label>
                            <input type="text" name="stu_age" class="form-control" id="stu_age1">
                        </div>
                        <div class="form-group">
                            <label for="stu_major1">科目</label>
                            <input type="text" name="stu_major" class="form-control" id="stu_major1">
                        </div>
                    </div>
                    <%--class="modal-footer"，是 Bootstrap CSS 的一个 CSS class，用于为模态窗口的底部设置样式。--%>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">新增</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%--2.stumodal 所在位置--%>
    <div class="modal fade stumodal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <%--modal-header 是 模态窗口的头部定义样式的类--%>
                <div class="modal-header">
                    <%-- class="close"，close 是一个 CSS class，用于为模态窗口的关闭按钮设置样式。 --%>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <%-- 模态框-标题 --%>
                    <h4 class="modal-title">修改学生信息</h4>
                </div>
                <form action="/stu/updateStu" method="post">
                    <!-- class="modal-body"，是 Bootstrap CSS 的一个 CSS class，用于为模态窗口的主体设置样式。 -->
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="id2">编号</label>
                            <input type="text" name="id" class="form-control" id="id2" readonly="true">
                        </div>
                        <div class="form-group">
                            <label for="stu_id2">学号</label>
                            <input type="text" name="stu_id" class="form-control" id="stu_id2">
                        </div>
                        <div class="form-group">
                            <label for="stu_name2">姓名</label>
                            <input type="text" name="stu_name" class="form-control" id="stu_name2">
                        </div>
                        <div class="form-group">
                            <label for="stu_age2">年龄</label>
                            <input type="text" name="stu_age" class="form-control" id="stu_age2">
                        </div>
                        <div class="form-group">
                            <label for="stu_major2">科目</label>
                            <input type="text" name="stu_major" class="form-control" id="stu_major2">
                        </div>
                    </div>
                    <%--class="modal-footer"，是 Bootstrap CSS 的一个 CSS class，用于为模态窗口的底部设置样式。--%>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>