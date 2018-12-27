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
<meta name="keywords"
	content="shoes store, free template, ecommerce, online shop, website templates, CSS, HTML" />
<meta name="description"
	content="Shoes Store is a free ecommerce template provided " />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/main.css" />
<script type="text/javascript" src="js/libs/modernizr.min.js"></script>
</head>

<body>
	<jsp:include page="head.jsp" />
	<div align="center">
		<div style="width:75%" align="center">
			<div class="container clearfix">
				<!--/sidebar-->
				<div class="main-wrap">
					<div class="result-wrap">
						<div class="result-content">
							<form action="upload.action" method="post" id="myform"
								name="myform" enctype="multipart/form-data">
								<table class="insert-tab" width="100%">
									<tbody>
										
										<tr>
											<th><i class="require-red">*</i>排练房名称：</th>
											<td><input class="common-text required" id="title"
												name="room.roomname" size="50" value="" type="text" /></td>
										</tr>
										<tr>
											<th><i class="require-red">*</i>描述：</th>
											<td><input class="common-text required" id="title"
												name="room.descriptive" size="50" value="" type="text" /></td>
										</tr>
										 <tr>
											<th><i class="require-red">*</i>缩略图：</th>
											<td><input name="photo" id="" type="file" /></td>
										</tr>
										<tr>
											<th width="120"><i class="require-red">*</i>分类：</th>
											<td><select name="room.catalog.catalogid" id="catid" class="required">
													<option value="1">大型排练房（适合6-10人）</option>
													<option value="2">中型排练房（适合4-5人）</option>
													<option value="3">小型排练房（适合4人以下）</option>
											</select></td>
										</tr>
										<tr>
											<th><i class="require-red">*</i>联系方式：</th>
											<td><input class="common-text" name="room.phone" size="50"
												 type="text" oninput = "value=value.replace(/[^\d]/g,'')" /></td>
										</tr>
										<tr>
											<th><i class="require-red">*</i>价格：</th>
											<td>￥<input class="common-text" name="room.price" size="3"
												 type="text" oninput = "value=value.replace(/[^\d]/g,'')" /> / h</td>
										</tr>
										<tr>
											<th><i class="require-red">*</i>地址：</th>
											<td><input class="common-text" name="room.address" size="50"
												 type="text" /></td>
										</tr>
										
										<tr>
											<th>场地守则：</th>
											<td><input class="common-text" name="room.rules" size="50"
												 type="text" /></td>
										</tr>

										<tr>
											<th><i class="require-red">*</i>设备描述：</th>
											<td><textarea name="room.equipmaent" class="common-textarea" 
											id="content" cols="30" style="width: 98%;height:50" rows="10"></textarea></td>
										</tr>
										<tr>
											<th></th>
											<td><input class="btn btn-primary btn6 mr10" value="提交"type="submit" /> 
											<input class="btn btn6" onclick="history.go(-1)" value="返回" type="button" /></td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>

				</div>
				<!--/main-->
			</div>
		</div>
	</div>

</body>
</html>