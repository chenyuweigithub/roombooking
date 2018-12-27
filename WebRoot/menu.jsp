<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
               <h3>排练房分类</h3>   
                <div class="content"> 
                	<ul class="sidebar_list">
	                	 <s:iterator value="#request['catalogs']" var="catalog">
							<li>
								<a href="browseAllroombycatalog.action?catalogid=<s:property value="#catalog.catalogid"/>&currentPage=1" target=_self>
									 <s:property value="#catalog.catalogname"/>
								</a>
							</li>
						</s:iterator>
						   <li class="last">
								<a href="index.action">
									全部排练房
								</a>
							</li>
                    </ul>
                </div>
                
  </body>
</html>
