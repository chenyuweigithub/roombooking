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
<script type="text/javascript" src="js/libs/modernizr.min.js"></script>
</head>
<body>
	<jsp:include page="head.jsp" />
	<div align="center">
		<div style="width:80%" align="center">
			<div class="main-wrap">
				<div class="result-wrap">
					<div class="result-content">
						<s:set var="orders" value="#request.orders" />
						<s:if test="#orders.size!=0">
							<table class="result-tab" width="100%">
								<tr>
									<th>订单时间</th>
									<th>排练房</th>
									<th>预约时间</th>
									<th>订单状态</th>
									<th>预留电话</th>
									<th>备注</th>
									<th>操作</th>
								</tr>
								<s:iterator value="#request['orders']" var="order">
									<tr>
										<td class="tc"><s:date name="#order.orderdate"
												format="yyyy-MM-dd HH:mm" /></td>
										<td><s:property value="#order.room.roomname" /></td>
										<td><s:property value="#order.usedate" /></td>
										<s:if test="#order.orderstatus==1">
											<td><p style="color: black;">商家未查看</p></td>
										</s:if>
										<s:if test="#order.orderstatus==2">
											<td><p style="color: blue;">已接受预约</p></td>
										</s:if>
										<s:if test="#order.orderstatus==3">
											<td title="鼠标停留显示内容1"><p style="color: red;">未接受预言</p></td>
										</s:if>
										<td><s:property value="#order.phone" /></td>
										<td><s:property value="#order.remarks" /></td>
										<td><a href="#">订单详情</a> <s:if
												test="#order.orderstatus==1">
												<a href="#">修改时间</a>
											</s:if> <s:if test="#order.orderstatus==2">
                                                                                                   无法修改
                            </s:if> <s:if test="#order.orderstatus==3">
												<a href="#">重新预约</a>
											</s:if></td>
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
	</div>
</body>
</html>