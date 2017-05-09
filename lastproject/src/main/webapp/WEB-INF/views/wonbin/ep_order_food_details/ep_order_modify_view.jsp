<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 화면</title>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>식자재 - ${ep_m.ep_id} 수정 화면</h1>
<br>

<form id="addform" action="${pageContext.request.contextPath}/ep_manage_modify" method="post">
		
		<div>업체 번호 : <input name ="ep_id" id ="ep_id" type ="text" value="${ep_m.ep_id}" readonly="readonly"/></div>
		<div>식재 코드 번호 : <input name ="food_id" id ="food_id" type ="text" value="${ep_m.food_id}"/></div>
		<div>업체명 : <input name ="ep_name" id ="ep_name" type ="text" value="${ep_m.ep_name}"/></div>
		<div>연락처 : <input name ="ep_phone" id ="ep_phone" type ="text" value="${ep_m.ep_phone}"/></div>
		<div>업체 담당자 : <input name ="ep_director" id ="ep_director" type ="text" value="${ep_m.ep_director}"/></div>
		<div>주소 : <input name ="ep_address" id ="ep_address" type ="text" value="${ep_m.ep_address}"/></div>
		<div>비고 : <input name ="ep_text" id ="ep_text" type ="text" value="${ep_m.ep_text}"/></div>
		
		

<br>
		<div>
			<input type="submit" id="addsubmit" value="수정">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/ep_manage_list">취소</a>
			<a href="${pageContext.request.contextPath}/ep_manage_delete?ep_id=${ep_m.ep_id}">삭제</a>
		</div>
	</form>



</body>
</html>