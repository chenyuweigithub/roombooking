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
						<s:set var="orders" value="#request.Sellerorders" />
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
								<s:iterator value="#request['Sellerorders']" var="order">
									<tr>
										<td class="tc"><s:date name="#order.orderdate"
												format="yyyy-MM-dd HH:mm" /></td>
										<td><s:property value="#order.room.roomname" /></td>
										<td><s:property value="#order.usedate" /></td>
										<s:if test="#order.orderstatus==1">
											<td><p style="color: black;">未查看</p></td>
										</s:if>
										<s:if test="#order.orderstatus==2">
											<td><p style="color: blue;">已接受</p></td>
										</s:if>
										<s:if test="#order.orderstatus==3">
											<td><p style="color: red;">未接受</p></td>
										</s:if>
										<td><s:property value="#order.phone" /></td>
										<td><s:property value="#order.remarks" /></td>
										<td>
										<s:if test="#order.orderstatus==1">
												<a href="updatestatus?orderstatus=2&orderid=<s:property value="#order.orderid" />">接受预约</a> 
												<a href="updatestatus?orderstatus=3&orderid=<s:property value="#order.orderid" />">拒绝预约</a> 
										 </s:if> 
										 <s:if test="#order.orderstatus==2">已接受
                                          </s:if> 
                                          <s:if test="#order.orderstatus==3">已拒绝
                                          <%-- <form action="updatereason.action">
                                          <input type="hidden" name="orderid" value="<s:property value="#order.orderid" />"/>
                                          <input type="text" size="8" name="reason" placeholder="拒绝原因"/>
                                          <input type="submit" value="提交">
                                          </form> --%>
										 </s:if></td>
									</tr>
								</s:iterator>
							</table>
						</s:if>
						<s:else>
							<br />
							<br />
							<a href="index.action" style="font-size: large;">暂无预约</a>
						</s:else>
					</div>
				</div>

				<hr />
				<div align="center" style="border:1px">
					<s:set value="#request.pager" var="pager" />
					<s:if test="#pager.hasFirst">
						<a href="getallroomPagingbySeller.action?currentPage=1">首页</a>
					</s:if>
					<s:if test="#pager.hasPrevious">
						<a
							href="getallroomPagingbySeller.action?currentPage=<s:property value= "#pager.currentPage-1"/>">上一页
						</a>
					</s:if>
					<s:if test="#pager.hasNext">
						<a
							href="getallroomPagingbySeller.action?currentPage=<s:property value= "#pager.currentPage+1"/>">下一页
						</a>
					</s:if>
					<s:if test="#pager.hasLast">
						<a
							href="getallroomPagingbySeller.action?currentPage=<s:property value= "#pager.totalPage"/>">
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