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
<title></title>
<meta name="keywords" content="shoes store, free template, ecommerce, online shop, website templates, CSS, HTML" />
<meta name="description" content="Shoes Store is a free ecommerce template provided " />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" type="text/css" href="css/common.css"/>
<link rel="stylesheet" type="text/css" href="css/main.css"/>   
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>


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
            <div class="content_half float_l">
        	<a  rel="lightbox[portfolio]" href="images/product/<s:property value="#session.room.img"/>"><img src="images/product/<s:property value="#session.room.img"/>" width="300px" height="240px" alt="Shoes 1" /></a>
            </div>
            <div class="content_half float_r">
                <table>
                    <tr>
                        <td>排练房：</td>
                        <td><s:property value="#session.room.roomname"/>（<s:property value="#session.room.descriptive"/>）</td>
                    </tr>
                    <tr>
                        <td width="160">价格:</td>
                        <td>￥ <s:property value="#session.room.price"/> / h</td>
                    </tr>
                    <tr>
                        <td>描述:</td>
                        <td><s:property value="#session.room.descriptive"/></td>
                    </tr>
                    <tr>
                        <td>场地守则:</td>
                        <td><s:property value="#session.room.rules"/></td>
                    </tr>
                    <tr>
                        <td>门店电话：</td>
                        <td><s:property value="#session.room.phone"/></td>
                    </tr>
                    <tr>
                    	<td>地址:</td>
                        <td><s:property value="#session.room.address"/></td>
                    </tr>
                    <tr>
                        
                    </tr>
                </table>
                <div><a href="getRoombyid.action?roomid=<s:property value="#session.room.roomid"/>">立即前往预约</a> </div>
                <div class="cleaner h20"></div>

                <a href="shoppingcart.html" class="addtocart"></a>

			</div>
            <div class="cleaner h30"></div>
            
            <h5>设备详情</h5>
            <p><s:property value="#session.room.equipmaent"/></p>	
            
          <div class="cleaner h50"></div>
            	    
        </div>

<br/>
     </div>
    </div> <!-- END of templatemo_main -->
      <!-- END of templatemo_footer -->
    
</div> <!-- END of templatemo_wrapper -->
</div> <!-- END of templatemo_body_wrapper -->

</body>
</html>