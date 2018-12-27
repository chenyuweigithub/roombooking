<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link  rel="stylesheet" type="text/css" href="css/admin_login.css" />
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/main.css"/>

<script type="text/javascript" src="dwr/engine.js"></script>
<script type="text/javascript" src="dwr/util.js"></script>
<script type="text/javascript" src="dwr/interface/UserDAOAjax.js"></script>
<script type="text/javascript">

	function show(boolean) {
		if (boolean) {
			alert("用户已经存在！");
		}
	}
	function validate() {
		var name = myForm.username.value;
		if (name == "") {
			alert("用户名不能为空！");
			return;
		}
		UserDAOAjax.exitUser(name, show);
	}
	function valirepwd() {
		var password = myForm.password.value;
		var repassword = myForm.repassword.value;
		if (password != repassword) {
			alert("密码和确认密码不一样。");
			return;
		}
	}
</script>
</head>

<body>

<jsp:include page="head.jsp"/>

<div class="admin_login_wrap">
    <h1 align="center">注册</h1>
    <div class="adming_login_border">
        <div class="admin_input">
            <form action="register.action"  name="myForm"  method="post">
                <ul class="admin_items">
                    <li>
                      <input type="text" name="user.username"  placeholder="用户名" id=username onblur="validate()" size="35" class="admin_input_style" />
                    </li>
                    <li>
                      <input type="text" name="user.phone"  placeholder="手机号 " id="user" size="35" class="admin_input_style" />
                    </li>
                    <li>
                      <input type="password" name="user.password" placeholder="密码" id=password size="35" class="admin_input_style" />
                    </li>
                    <li>
                      <input type="password" name="repwd" placeholder="再次输入密码" id=repassword onblur="valirepwd()" size="35" class="admin_input_style" />
                    </li>
                    <li>
                                                                                    你的身份：
                        <input type="radio" name="user.usertype" value="1" checked/>我是用户                                                           
                        <input type="radio" name="user.usertype" value="2"/>我是商家<br/> 
                    </li>
                    
                    <li>
                        <input type="submit" tabindex="3" value="提交" class="btn btn-primary" />
                    </li>
                </ul>
            </form>
        </div>
    </div>
    <!-- 可以插入底部 -->
    
</div>
</body>
</html>
