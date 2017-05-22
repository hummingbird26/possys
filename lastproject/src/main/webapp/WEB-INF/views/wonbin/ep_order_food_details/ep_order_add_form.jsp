<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>발주 현황 및 식재현황 상세 관리</title>
</head>
<%@ include file="../../modal/wide_menu.jsp" %>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>발주 현황 및 식재현황 상세 관리</h1>
	<form id="addform" action="${pageContext.request.contextPath}/ep_order_add_form" method="post">
		
		<div>식재 코드 번호 : <input name ="food_id" id ="food_id" type ="text"/></div>
		<div>업체 코드 번호 : <input name ="ep_id" id ="ep_id" type ="text"/></div>
		<div>연락처 : <input name ="ep_phone" id ="ep_phone" type ="text"/></div>
		<div>업체 담당자 : <input name ="ep_director" id ="ep_director" type ="text"/></div>
		<div>주소 : <input name ="ep_address" id ="ep_address" type ="text"/></div>
		<div>비고 : <input name ="ep_text" id ="ep_text" type ="text"/></div>
		<div>식재 코드 번호 : <input name ="food_id" id ="food_id" type ="text"/></div>
		<div>업체명 : <input name ="ep_name" id ="ep_name" type ="text"/></div>
		<div>연락처 : <input name ="ep_phone" id ="ep_phone" type ="text"/></div>
		<div>업체 담당자 : <input name ="ep_director" id ="ep_director" type ="text"/></div>
		<div>주소 : <input name ="ep_address" id ="ep_address" type ="text"/></div>
		<div>비고 : <input name ="ep_text" id ="ep_text" type ="text"/></div>
		
		

<br>
		<div>
			<input type="submit" id="addsubmit" value="등록">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/ep_manage_list">취소</a>
		</div>
	</form>
</body>
</html>