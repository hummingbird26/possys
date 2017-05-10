<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>OrderList</title>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
	<table>
		<tbody>
			<c:forEach var="f" items="${list}">
			<tr>
				<td>${f.table_order_id}</td>
				<td>${f.table_order_num}</td>
				<td>${f.table_order_end}</td>
				<td>${f.table_order_date}</td>
				<td><a href="${pageContext.request.contextPath}/order_modify_form?table_order_id=${f.table_order_id}">주문수정</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>