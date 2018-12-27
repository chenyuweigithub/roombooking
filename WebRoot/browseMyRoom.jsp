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
<title>订单</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/button.css" />
<script type="text/javascript" src="js/libs/modernizr.min.js"></script>
</head>
<body>
	<jsp:include page="head.jsp" />
	<div align="center">
		<div style="width:80%" align="center">
			<div class="main-wrap">
				<div class="result-wrap">
					<div class="result-content">
						<s:set var="rooms" value="#request['rooms']" />
						<s:if test="#rooms.size!=0">
							<table class="result-tab" width="100%">
								<tr>
									<th>略缩图</th>
									<th>排练房</th>
									<th>价格</th>
									<th>操作</th>
								</tr>
							
<s:iterator value="#request['rooms']" var="room">
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
    <div sytle="text-align: center;">
    <a class="small red button" href="deleteRoombyid.action?roomid=<s:property value="#room.roomid"/>">  &nbsp;修改排练房&nbsp;   </a>
    <a class="small green button" href="deleteRoombyid.action?roomid=<s:property value="#room.roomid"/>">  &nbsp;删除排练房&nbsp;   </a>
    </div>
    </td>
  </tr>
</s:iterator>
</table>
						</s:if>
						<s:else>
							<br />
							<br />
							<a href="index.action" style="font-size: large;">暂无订单，立即前往预定</a>
						</s:else>
					</div>
				</div>

				<hr />
				<div align="center" style="border:1px">
					<s:set value="#request.pager" var="pager" />
					<s:if test="#pager.hasFirst">
						<a href="getOrderbyuserid.action?currentPage=1">首页</a>
					</s:if>
					<s:if test="#pager.hasPrevious">
						<a
							href="getOrderbyuserid.action?currentPage=<s:property value= "#pager.currentPage-1"/>">上一页
						</a>
					</s:if>
					<s:if test="#pager.hasNext">
						<a
							href="getOrderbyuserid.action?currentPage=<s:property value= "#pager.currentPage+1"/>">下一页
						</a>
					</s:if>
					<s:if test="#pager.hasLast">
						<a
							href="getOrderbyuserid.action?currentPage=<s:property value= "#pager.totalPage"/>">
							尾页 </a>
					</s:if>
					<br /> 当前第
					<s:property value="#pager.currentPage" />
					页，总共
					<s:property value="#pager.totalPage" />
					页
				</div>
				<!--/页码-->
			</div>
		</div>
		<!--/main-->
	</div>
</body>
</html>