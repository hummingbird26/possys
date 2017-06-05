<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결제목록</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<%@ include file="../../modal/wide_menu.jsp" %>
<%-- <%@ include file="../../modal/header.jsp" %> --%>
</head>
<body>
	<div class="container">
    <h1>Payment List</h1>
    <div>전체행의 수 : ${paymentSRcount}</div>
    <table class="table table-striped table-hover" border="1">
        <thead>
            <tr>
                <th>결제아이디</th>
                <th>테이블주문아이디</th>
                <th>금액총합</th>
                <th>지불금액</th>
                <th>결제일자</th>
                <th>결제유형</th>
                <th>결제상태</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="p" items="${paymentSRsearch}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/tori/payment/payment_view?payment_id=${p.payment_id}">${p.payment_id}</a></td>
                    <td>${p.table_order_id}</td>
                    <td>${p.payment_total}</td>
                    <td>${p.payment_pay}</td>
                    <td>${p.payment_date}</td>
                    <td>${p.payment_cate}</td>
                    <td>${p.payment_state}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/tori/payment/payment_search_list?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${select != null && keyWord != null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/tori/payment/payment_search_list?currentPage=${i}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/tori/payment/payment_search_list?currentPage=${i}">[${i}]</a></li>></c:otherwise>
        	</c:choose>
        </c:forEach>
        </c:if>
         <c:if test="${select == null && keyWord == null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/tori/payment/payment_search_list?currentPage=${1}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/tori/payment/payment_search_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
        		</c:choose>
        	</c:forEach>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/tori/payment/payment_search_list?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    <div>
        <a class="btn btn-primary href="${pageContext.request.contextPath}/tori/payment/payment_add_form">결제정보입력</a>
        <a href="${pageContext.request.contextPath}/tori/payment/payment_search_form" class="btn btn-primary">조건검색</a>
    </div>
    <br><br>
    <div>
    <!-- payment_search_date.jsp를 payment_search_form.jsp로 이름을 변경하였다.
    왜냐하면 form으로 날짜별검색, 카드결제검색 등을 수행하기 위해서 -->
	    <!-- <button class="btn btn-default">카드결제내역이동</button>
		<button class="btn btn-default">결제취소내역확인</button>
		<button class="btn btn-default">조건검색</button> -->
		<%-- <a href="${pageContext.request.contextPath}/tori/payment/payment_card_form?payment_cate=${p.payment_cate}" class="btn btn-default">카드결제내역</a>
		<a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_form?payment_state=${p.payment_state}" class="btn btn-default">결제취소내역</a> --%>
		
    </div>
</div>
</body>
</html>