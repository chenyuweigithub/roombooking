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
<link rel="stylesheet" type="text/css" href="css/button.css" />
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
        
        <div id="content" class="float_r" style="border:1px">
<div>

<table width="100%" height="161" border="0"  border="1">
<s:set var="rooms" value="#request.rooms"/>
<s:if test="#rooms.size!=0">
		<font color="blue"><h3>所有符合条件的排练房</h3></font><br>
<s:iterator value="#rooms" var="room">
  <tr>
    <td width="20%"  height="160px">
    <a href="detailed.action?roomid=<s:property value="#room.roomid"/>">
		<img src="images/product/<s:property value="#room.img"/>" width="200px" height="160px" alt="Shoes 1" />
	</a>
    </td>
    <td width="45%" valign="top">
    <a href="detailed.action?roomid=<s:property value="#room.roomid"/>" style="color: black;">
    <h1><strong></strong><s:property value="#room.roomname"/></strong></h1>
	<p>排练房描述 ：<s:property value="#room.descriptive"/></p>
	<p>设备信息：<s:property value="#room.equipmaent"/></p>
	<p>场地守则：<s:property value="#room.rules"/></p>
	</a>
    </td>
    <td  width="15%">
    <p class="product_price">￥ <s:property value="#room.price"/> / h</p>
    </td>
    <td  width="20%">
    <div><a href="getRoombyid.action?roomid=<s:property value="#room.roomid" class="small blue button"/>">立即前往预约</a></div>
    </td>
  </tr>
</s:iterator>
</s:if>
<s:else>
	<div align="center"><p>对不起，没有找到排练房！</p></div>
</s:else>
</table>
</div>

<br/>



<hr/>
	<div align="center" style="border:1px">
			<s:set value="#request.pager" var="pager" />
			<s:if test="#pager.hasFirst">
				<a href="browseRoombyHql.action?currentPage=1">首页</a>
			</s:if>
			<s:if test="#pager.hasPrevious">
				<a href="browseRoombyHql.action?currentPage=<s:property value= "#pager.currentPage-1"/>">上一页 </a>
			</s:if>
			<s:if test="#pager.hasNext">
				<a href="browseRoombyHql.action?currentPage=<s:property value= "#pager.currentPage+1"/>">下一页 </a>
			</s:if>
			<s:if test="#pager.hasLast">
				<a href="browseRoombyHql.action?currentPage=<s:property value= "#pager.totalPage"/>"> 尾页 </a>
			</s:if>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp; 
			当前第<s:property value="#pager.currentPage" />页，总共<s:property value="#pager.totalPage" />页
		</div>
</div>
        <!--  
        <div id="content" class="float_r">
          <div class="product_box">
	            <h3>Ut eu feugiat</h3>
            	<a href="productdetail.html">
                <div width="200px" height="160px">
                <img src="images/product/02.jpg"  width="200px" height="160px" alt="Shoes 1"  />
                </div>
                </a>
                <p>Nulla rutrum neque vitae erat condimentum eget malesuada.</p>
                <p class="product_price">$ 100 / h</p>
                <a href="shoppingcart.html" class="addtocart"></a>
                <a href="productdetail.html" class="detail"></a>
            </div>
            <div class="product_box">
	            <h3>Ut eu feugiat</h3>
            	<a href="productdetail.html">
                <div width="200px" height="160px">
                <img src="images/product/01.jpg"  width="200px" height="160px" alt="Shoes 1"  />
                </div>
                </a>
                <p>Nulla rutrum neque vitae erat condimentum eget malesuada.</p>
                <p class="product_price">$ 100 / h</p>
                <a href="shoppingcart.html" class="addtocart"></a>
                <a href="productdetail.html" class="detail"></a>
            </div>       	
            <div class="product_box no_margin_right">
            	<h3>Mauris consectetur</h3>
            	<a href="productdetail.html">
                <div width="200px" height="160px">
                <img src="images/product/01.jpg"  width="200px" height="160px" alt="Shoes 1"  />
                </div>
                </a>
                <p>Morbi non risus vitae est vestibulum tincidunt ac eget metus.</p>
              <p class="product_price">$ 60</p>
                <a href="shoppingcart.html" class="addtocart"></a>
                <a href="productdetail.html" class="detail"></a>
            </div>   
            
            <div class="cleaner"></div>
                 	
      <div class="product_box">
            	<h3>Proin volutpat</h3>
           	<a href="productdetail.html"><img src="images/product/04.jpg" alt="Shoes 4" /></a>
            <p>Sed semper euismod dolor sit amet interdum. Phasellus in mi eros.</p>
      <p class="product_price">$ 220</p>
                <a href="shoppingcart.html" class="addtocart"></a>
                <a href="productdetail.html" class="detail"></a>
          </div>        	
            <div class="product_box">
	            <h3>Aenean tempus</h3>
            	<a href="productdetail.html"><img src="images/product/05.jpg" alt="Shoes 5" /></a>
                <p>Maecenas porttitor erat quis leo pellentesque molestie.</p>
              <p class="product_price">$ 180</p>
                <a href="shoppingcart.html" class="addtocart"></a>
                <a href="productdetail.html" class="detail"></a>
            </div>        	
            <div class="product_box no_margin_right">
            	<h3>Nulla luctus urna</h3>
            	<a href="productdetail.html"><img src="images/product/06.jpg" alt="Shoes 6" /></a>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                <p class="product_price">$ 160</p>
                <a href="shoppingcart.html" class="addtocart"></a>
                <a href="productdetail.html" class="detail"></a>
            </div>       
            
        </div> 
        <div class="cleaner"></div>
        -->
    </div> <!-- END of templatemo_main -->
      <!-- END of templatemo_footer -->
    
</div> <!-- END of templatemo_wrapper -->
</div> <!-- END of templatemo_body_wrapper -->

</body>
</html>