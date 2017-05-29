<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OrderList</title>
<%@ include file="../modal/wide_menu.jsp" %>
</head>
<body>
<br/><br/><br/>
	<table>
		<tbody>
			<c:forEach var="f" items="${order_list}">
			<tr>
				<td><a href="${pageContext.request.contextPath}/order_detail?table_order_id=${f.table_order_id}">${f.table_order_id}</a></td>
				<td>${f.table_order_num}</td>
				<td>${f.table_order_end}</td>
				<td>${f.table_order_date}</td>
				
				
				<td><a href="${pageContext.request.contextPath}/order_modify_form?table_order_id=${f.table_order_id}">주문수정</a></td>
				<td><a href="${pageContext.request.contextPath}/order_end_t?table_order_id=${f.table_order_id}">종결처리</a></td>
				<td><a href="${pageContext.request.contextPath}/tori/payment/payment_add_form?table_order_id=${f.table_order_id}">주문처리</a>
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>