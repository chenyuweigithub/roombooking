<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
	<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
	<link rel="stylesheet" type="text/css" href="css/common.css"/>
	<link rel="stylesheet" type="text/css" href="css/main.css"/>  
    <link rel="stylesheet" type="text/css" href="css/button.css" />
  </head>

<body>
<div id="content" class="float_r" style="border:1px">
<div>

<table width="100%" height="161" border="0"  border="1">
<s:iterator value="#request['rooms']" var="room">
  <tr>
    <td width="20%"  height="160px">
    <a href="detailed.action?roomid=<s:property value="#room.roomid"/>">
		<img src="images/product/<s:property value="#room.img"/>" width="200px" height="160px" alt="Shoes 1" />
	</a>
    </td>
    <td width="45%" valign="top">
    <a href="detailed.action?roomid=<s:property value="#room.roomid"/>" style="color: black;">
    <h1><strong><s:property value="#room.roomname"/></strong></h>
	<p> 排练房描述 ：<s:property value="#room.descriptive"/></p>
	<p>设备信息：<s:property value="#room.equipmaent"/></p>
	<p>场地守则：<s:property value="#room.rules"/></p>
	</a>
    </td>
    <td  width="15%">
    <a href="detailed.jsp">
    <p class="product_price">￥ <s:property value="#room.price"/> / h</p>
    </a>
    </td>
    <td  width="20%">
    <div><a href="getRoombyid.action?roomid=<s:property value="#room.roomid"/>" class="small blue button">立即前往预约</a></div>
    </td>
  </tr>
</s:iterator>
</table>

</div>

<br/>

<hr/>

	<div align="center" style="border:1px">
			<s:set value="#request.pager" var="pager" />
			<s:if test="#pager.hasFirst">
				<a href="index.action?currentPage=1">首页</a>
			</s:if>
			<s:if test="#pager.hasPrevious">
				<a href="index.action?currentPage=<s:property value= "#pager.currentPage-1"/>">上一页 </a>
			</s:if>
			<s:if test="#pager.hasNext">
				<a href="index.action?currentPage=<s:property value= "#pager.currentPage+1"/>">下一页 </a>
			</s:if>
			<s:if test="#pager.hasLast">
				<a href="index.action?currentPage=<s:property value= "#pager.totalPage"/>"> 尾页 </a>
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

	
</body>
</html>
