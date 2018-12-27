<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link href="css/admin_login.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body>

<jsp:include page="head.jsp"/>

<div class="c" align="center">  
<div class="admin_login_wrap">
    <h1 align="center">登录</h1>
    <div class="adming_login_border">
        <div class="admin_input">
            <form action="login.action" method="post">
                <ul class="admin_items">
                    <li>
                        <input type="text" name="user.username" placeholder="用户名" id="user" size="35" class="admin_input_style" />
                    </li>
                    <li>
                        <input type="password" name="user.password" placeholder="密码" id="pwd" size="35" class="admin_input_style" />
                    </li>
                    <li>
                        <input type="submit" tabindex="3" value="登录" class="btn btn-primary" />
                    </li>
                </ul>
            </form>
            <div align="right"> 没有账号？<a href="register.jsp">立即注册</a></div>
        </div>
     
    </div>
    <!-- 可以插入底部 -->
    
</div>
</div>
</body>
</html>