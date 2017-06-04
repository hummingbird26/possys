<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OrderList</title>
<%@ include file="../modal/header.jsp" %>
</head>
<body>
<br/><br/><br/><br/><br/>
	<table>
		<thead>
            <tr>
                <th>주문 코드</th>
                <th>테이블 번호</th>
                <th>상태</th>
                <th>주문일시</th>
                <th>주문수정</th>
                <th>종결처리</th>
                <th>결제처리</th>
            </tr>
        </thead>
		<tbody>
			<c:forEach var="f" items="${order_list}">
			
			<tr>
				<td><a href="${pageContext.request.contextPath}/order_detail?table_order_id=${f.table_order_id}">${f.table_order_id}</a></td>
				<td>${f.table_order_num}</td>
				<td>${f.table_order_end}</td>
				<td>${f.table_order_date}</td>
				
				
				<td><a href="${pageContext.request.contextPath}/order_modify_form?table_order_id=${f.table_order_id}">주문수정</a></td>
				<td><a href="${pageContext.request.contextPath}/order_end_t?table_order_id=${f.table_order_id}">종결처리</a></td>
				<td><a href="${pageContext.request.contextPath}/tori/payment/payment_add_form?table_order_id=${f.table_order_id}">결제처리</a>
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	    <ul class="pager">
        <c:if test="${currentPage > 1}">
        <li class="previous"><a href="${pageContext.request.contextPath}/order_list?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${selbox != null && keyWord != null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/order_list?currentPage=${i}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/order_list?currentPage=${i}">[${i}]</a></li>></c:otherwise>
        	</c:choose>
        </c:forEach>
        </c:if>
        <c:if test="${selbox == null && keyWord == null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/order_list?currentPage=${1}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/order_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
        		</c:choose>
        	</c:forEach>
        </c:if>
        <c:if test="${currentPage < lastPage}">
        <li class="next"><a href="${pageContext.request.contextPath}/order_list?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
</body>
</html>