<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>직원목록</title>

 <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/font-awesome.min.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/simple-line-icons.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/fullcalendar.min.css"/>
	<link href="${pageContext.request.contextPath}/resources/asset/css/style.css" rel="stylesheet">
	<!-- end: Css -->

	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/asset/img/logomi.png">
   
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<%@ include file="../../modal/header.jsp" %>
</head>
<body>
<br><br><br>
	<div class="container">
    <h1>Staff List</h1>
    <div>전체행의 수 : ${staffcount}</div>
    <br><br>
    <table class="table table-striped table-hover">
        <thead>
            <tr>
                <th>직원아이디</th>
                <th>직원이름</th>
                <th>직급</th>
                <th>성별</th>
                <th>휴대폰번호</th>
                <th>가입일자</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach varStatus="status" var="s" items="${list}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/tori/staff/staff_view?staff_id=${s.staff_id}">${s.staff_id}</a></td>
                    <td>${s.staff_name}</td>
                    <td>${s.staff_level}</td>
                    <td>${s.staff_gender}</td>
                    <td>${s.staff_phone}</td>
                    <td>${s.staff_date}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
        <li class="previous"><a href="${pageContext.request.contextPath}/tori/staff/staff_list?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${selbox != null && keyWord != null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/tori/staff/staff_list?currentPage=${i}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/tori/staff/staff_list?currentPage=${i}">[${i}]</a></li>></c:otherwise>
        	</c:choose>
        </c:forEach>
        </c:if>
        <c:if test="${selbox == null && keyWord == null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/tori/staff/staff_list?currentPage=${1}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/tori/staff/staff_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
        		</c:choose>
        	</c:forEach>
        </c:if>
        <c:if test="${currentPage < lastPage}">
        <li class="next"><a href="${pageContext.request.contextPath}/tori/staff/staff_list?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    <div>
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/staff/staff_add_form">직원가입화면</a>
        <a href="${pageContext.request.contextPath}/tori/staff/staff_search_form" class="btn btn-primary">조건검색</a>
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