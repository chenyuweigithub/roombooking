<%@ page contentType="text/html;charset=gb2312"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
<head>
	<title>�������</title>
	<link href="css/bookstore.css" rel="stylesheet" type="text/css"/>
</head>
<body>
		<hr/>
		<div align="center">
			<s:set value="#request.pager" var="pager" />
			<s:if test="#pager.hasFirst">
				<a href="index.action?currentPage=1">��ҳ</a>
			</s:if>
			<s:if test="#pager.hasPrevious">
				<a href="index.action?currentPage=<s:property value= "#pager.currentPage-1"/>">��һҳ </a>
			</s:if>
			<s:if test="#pager.hasNext">
				<a href="index.action?currentPage=<s:property value= "#pager.currentPage+1"/>">��һҳ </a>
			</s:if>
			<s:if test="#pager.hasLast">
				<a href="index.action?currentPage=<s:property value= "#pager.totalPage"/>"> βҳ </a>
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
			��ǰ��<s:property value="#pager.currentPage" />ҳ���ܹ�<s:property value="#pager.totalPage" />ҳ
		</div>
</body>
</html>
