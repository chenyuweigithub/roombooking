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
    <title>预约</title>
		<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
		<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
		<link rel="stylesheet" type="text/css" href="css/common.css"/>
		<link rel="stylesheet" type="text/css" href="css/main.css"/> 
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
</head>
<body>
<jsp:include page="head.jsp"/>
<div align="center" >
<div style="width:75%" align="center" >
<div class="container clearfix">    
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="result-wrap">
            <div class="result-content">
                <form action="checkout.action?roomid=<s:property value="#session.room.roomid"/>" method="post" id="myform" name="myform" enctype="multipart/form-data">
                    <table class="insert-tab" width="100%">
                        <tbody>
                        <tr>
                            <th width="250">排练房：</th>
                            <td width="1229">
                                <a href="productdetail.html"><img src="images/product/<s:property value="#session.room.img"/>" width="200px" height="160px" alt="Shoes 1" /></a>
                                <br/>
                                <a href="#"><s:property value="#session.room.roomname"/>（<s:property value="#session.room.descriptive"/>）</a>
                            </td>
                        </tr>
                            <tr>
                                <th>地址：</th>
                                <td>
                                   <a href="#"><s:property value="#session.room.address"/></a>
                                </td>
                            </tr>
                            <tr>
                                <th>门店电话：</th>
                                <td><p><s:property value="#session.room.phone"/></p></td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>联系电话：</th>
                                <td><input class="common-text" name="order.phone" size="50" type="text"> </td>
                            </tr>
                             <tr>
                                <th><i class="require-red">*</i>预约时间：</th>
                                <td><input class="common-text" name="order.usedate" placeholder="年/月/日  时：分-时：分（例如：2018/01/01 17：00-18：00）" size="50" type="text"></td>
                            </tr>
                            
                            <tr>
                                <th>备注：</th>
                                <td><textarea name="order.remarks" class="common-textarea" id="content" cols="30" style="width: 98%;height:50" rows="10"></textarea></td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
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