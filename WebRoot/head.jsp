<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  </head>
  
  <body>
		<div class="topbar-wrap white">
		 <!-- 顶 部 -->
		    <div class="topbar-inner clearfix">
		        <div class="topbar-logo-wrap clearfix">
		            <h1 class="topbar-logo none"><a href="index.action"  class="navbar-brand"></a></h1>
				<ul class="navbar-list clearfix">
					<li><a class="on" href="index.action"><img
							src="images/logo.png" width="112" height="48"></a></li>
					<li><a href="index.action">网站首页</a></li>		
					<li><a href="getOrderbyuserid.action?currentPage=1">我的预定</a></li>
					<s:if test="#session.user.usertype==2">
						<li>
							<div class="dropdown">
								<button class="dropbtn">后台管理</button>
								<div class="dropdown-content">
										<a style="background-color: white;" href="getallroomPagingbySeller.action">我的排练房</a> 
										<a style="background-color: white;" href="upload.jsp">上传排练房</a> 
										<a style="background-color: white;" href="getMyOrderbysellerid.action">我的预约</a>
									    <a style="background-color: white;" href="http://www.runoob.com">评价管理</a> 
								</div>
							</div>
						</li>
					</s:if>		
				</ul>
			</div>
		        <div class="top-info-wrap">
		            <ul class="top-info-list clearfix">
		                <li>
                            <form action="getRequiredBookbyHqlPaging.action" method="post">
				              <input type="text" name="roomname"/>
				              <input type="submit" name="Search" value="搜索" class="btn-find"/>
				            </form>
		                </li>
		                <li>
		                <s:if test="#session.user==null">
		                <a href="login.jsp">登录</a>
		                </s:if>
		                <s:else>
		                <a href="logout.action">注销</a>
		                </s:else>
		                </li>
		                <li>
		                		<s:if test="#session.user==null">
		                		<a href="register.jsp">注册</a>
								</s:if>
							    <s:else>
							    </s:else>
		                
		                </li>
		                <li>
			                	<s:if test="#session.user==null">
								</s:if>
							    <s:else>
				                <a href="updatepwd.jsp">修改密码</a>
				                </s:else>
				        </li>
		                <li>
		                        <s:if test="#session.user==null">
								</s:if>
								<s:else>
										<a href="Message.action"><s:property value="#session.user.username"/>，你好</a>
								</s:else>
		                </li>
		                
		            </ul>
		        </div>
		    </div>
		</div>
  </body>
</html>
