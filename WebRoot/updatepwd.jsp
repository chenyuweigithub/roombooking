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
     
     <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
     <script type="text/javascript">
	function validateForm() {
	    var y = document.forms["myForm"]["newpassword"].value;
	    var z = document.forms["myForm"]["renewpassword"].value;
	    if (y!=z) {
	        alert("密码和确认密码不一样。");
	        return false;
	    }
	}
	</script>
     
</head>
<body>
<div>
<jsp:include page="head.jsp"/>
</div>

<div class="c" align="center">  

<div class="admin_login_wrap">
    <s:if test="#session.validated==false">
		 <h1  align="center">原密码错误，修改失败</h1><br/>
		 <%
		     session.setAttribute("validated", true);
		 %>
	</s:if>
	<s:else>
			<h1  align="center">修改密码</h1><br/>
	</s:else>
	<!-- <h1 align="center">修改密码</h1> -->
    <div class="adming_login_border">
        <div class="admin_input">
            <form action="updatepwd.action" onsubmit="return validateForm()"  name="myForm"  method="post">
            
              <input type="hidden" name="user.userid" value="<s:property value="#session.user.userid"/>"/>
                <ul class="admin_items">
                    <li>
                        <input type="password" name="user.password"  id="password" size="35" placeholder="原密码" class="admin_input_style" />
                    </li>
                     <li>
                        <input type="password" name="user.newpassword"  id="newpassword" size="35" placeholder="新密码" class="admin_input_style" />
                    </li>
                    <li>
                        <input type="password" name="repwd" id="renewpassword" size="35" placeholder="请再次输入新密码"  class="admin_input_style" />
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
</div>
</body>
</html>