<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>조건별결제내역검색</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<%@ include file="../../modal/wide_menu.jsp" %>
<%-- <%@ include file="../../modal/header.jsp" %> --%>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<br><br>
<div class="container">
	<form id="form" name="form" class="form-inline" action="${pageContext.request.contextPath}/tori/payment/payment_search_list" method="get">
		<select id="select" name="select" class="form-inline" value="선택하세요">
			<option value="payment_date">날짜별검색</option>
			<option value="payment_cate">결제유형별검색</option>
			<option value="payment_id">결제번호별검색</option>
			<option value="member_phone">회원번호별검색</option>
		</select>
		<input type="text" class="form-inline" name="keyWord" id="keyWord">
		<input type="submit" class="form-inline btn btn-primary" name="search" id="search">
	
	</form>
</div>
</body>
</html>