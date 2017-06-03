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
    <h1>Staff Search List</h1>
    <div>전체행의 수 : ${staffSRcount}</div>
    <table class="table table-striped table-hover" border="1">
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
            <c:forEach var="s" items="${staffSRsearch}">
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
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/staff/staff_add_form">게시글 입력</a>
        <a href="${pageContext.request.contextPath}/tori/staff/staff_search_form" class="btn btn-primary">조건검색</a>
    </div>
    <br><br>
    <div>	
    </div>
</div>
</body>
</html>