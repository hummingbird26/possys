<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>발주 업체 관리</title>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>발주 업체 관리</h1>





	<form id="addform" action="${pageContext.request.contextPath}/ep_manage_add_form" method="post">
		<div>식재 코드 번호 : 
		<c:forEach var="f" items="${list}">
		<input name ="food_id" id ="food_id" type ="text" value="${f.food_id}"/>(${f.food_name})<br>
		</c:forEach>
		</div>
	
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