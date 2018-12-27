<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shoes Store, free template</title>
<meta name="keywords" content="shoes store, free template, ecommerce, online shop, website templates, CSS, HTML" />
<meta name="description" content="Shoes Store is a free ecommerce template provided " />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/main.css"/>   
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">

</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "top_nav", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>

</head>

<body>


<jsp:include page="head.jsp"/>


<div id="templatemo_body_wrapper">
<div id="templatemo_wrapper">

  <div class="copyrights">Collect from <a href="http://www.mycodes.net/"  title="网页模板">网页模板</a></div>
    
    <div id="templatemo_main">
    	<div id="sidebar" class="float_l">
        	<div class="sidebar_box"><span class="bottom"></span>
            	 <!-- 侧边栏内容 -->
            	 <s:action name="browseCatalog" executeResult="true"/>
            </div>
            <div class="sidebar_box"><span class="bottom"></span>
            	<h3>新上线排练房 </h3>   
                <div class="content"> 
                    <div class="bs_box">
                    	<a href="#"><img src="images/templatemo_image_01.jpg" alt="image" /></a>
                        <h4><a href="#">Phasellus ut dui</a></h4>
                        <p class="price">$20</p>
                        <div class="cleaner"></div>
                    </div>
                    <div class="bs_box">
                    	<a href="#"><img src="images/templatemo_image_01.jpg" alt="image" /></a>
                        <h4><a href="#">Vestibulum ante</a></h4>
                        <p class="price">$8</p>
                        <div class="cleaner"></div>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="content" class="float_r">
        	<h1 style="font-size:36px">个人信息</h1><br/>
            <div class="content_half float_l">
                <div id="contact_form" style="width: 600px">
                   <form method="post" name="contact" action="updateMessage"> 
                   <input type="hidden" name="user.userid" value="<s:property value="#session.user.userid"/>"/>
                        <p style="font-size: large; white-space: nowrap">用户名:<s:property value="#session.user.username"/> 
                        </p>
                        <br/>
                        <div class="cleaner h10" ></div>
                        
                         <p style="font-size: large;" white-space: nowrap">您的身份:
                         <s:if test="#session.user.usertype==1">商家
                        </s:if>
                        <s:if test="#session.user.usertype==2">用户
                        </s:if>
                        </p>
                         <br/>
                        <div class="cleaner h10"></div>
                        
                        <p style="font-size: large;" white-space: nowrap"> 电话:
                         <input type="text" name="user.phone" value="<s:property value="#session.user.phone"/>" class="required input_field" />
                        </p>
                        <br/>
                        <div class="cleaner h10"></div>
        
                        <p style="font-size: large;" white-space: nowrap"> 性别:
                        
                        <s:if test="#session.user.sex==1">
                        <input type="radio" name="user.sex" value="1" checked="checked"/>男
						<input type="radio" name="user.sex" value="2"/>女<br/>
                        </s:if>
                        <s:if test="#session.user.sex==2">
                        <input type="radio" name="user.sex" value="1"/>男
						<input type="radio" name="user.sex" value="2" checked="checked"/>女<br/>
                        </s:if>
                        <s:if test="#session.user.sex==null">
                        <input type="radio" name="user.sex" value="1"/>男
						<input type="radio" name="user.sex" value="2"/>女<br/>
                        </s:if>	
                        </p>
                        <br/>
                        <div class="cleaner h10"></div>
                        
                        <p style="font-size: large;" white-space: nowrap"> 年龄:
                         <input type="text" name="user.age" name="author" value="<s:property value="#session.user.age"/>"  class="required input_field" />
                        </p>
                        <br/>
                        <div class="cleaner h10"></div>
                        
                         <p style="font-size: large;" white-space: nowrap"> 签名:
                         <input type="text" name="user.sign" value="<s:property value="#session.user.sign"/>" class="required input_field" />
                        </p>
                        <br/>
                        <div class="cleaner h10"></div>
                        
                        <input type="submit" class="submit_btn" name="submit" id="submit" value="更改" />
                        
                    </form>
                </div>
            </div>
        </div>
        
    </div> <!-- END of templatemo_main -->
      <!-- END of templatemo_footer -->
    
</div> <!-- END of templatemo_wrapper -->
</div> <!-- END of templatemo_body_wrapper -->

</body>
</html>