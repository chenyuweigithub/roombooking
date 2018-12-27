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
<title>BandRoomBooking</title>
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
        
        <s:action name="browseAllroom" executeResult="true"/>
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