<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../modal/wide_menu.jsp" %>
</head>
<body>
<br/><br/><br/>

		<div>주문 번호 : ${order.table_order_id}</div>
		<div>테이블 번호 : ${order.table_order_num}</div>
		<div>주문종결 :${order.table_order_end}</div>
		<div>주문날짜 :${order.table_order_date}</div>
				<c:forEach var="f" items="${order_list}">
					<div>메뉴코드 : ${f.menu_id}" 메뉴명 : ${f.menu_name}" 수량 : ${f.order_detail_ea}" 소계 :"${f.order_detail_sum}"</div>
										
				</c:forEach>

<br>
		<div>
			<input type="submit" id="addsubmit" value="수정">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/order_list">취소</a>
			<a href="${pageContext.request.contextPath}/order_delete?table_order_id=${order.table_order_id}">삭제</a>
		</div>


</body>
</html>