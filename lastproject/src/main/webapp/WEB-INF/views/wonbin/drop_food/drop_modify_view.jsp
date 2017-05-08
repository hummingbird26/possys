<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>수정 화면</title>
</head>
<body>
<h1>식자재 - ${food.food_id} 수정 화면</h1>
<br>

<form id="addform" action="${pageContext.request.contextPath}/food_modify" method="post">
		
		<div>상품번호 : <input name ="food_id" id ="food_id" type ="text" value="${food.food_id}" readonly="readonly"/></div>
		<div>상품명 : <input name ="food_name" id ="food_name" type ="text" value="${food.food_name}"/></div>
		<div>규격 : <input name ="food_size" id ="food_size" type ="text" value="${food.food_size}"/></div>
		<div>단위 : <input name ="food_unit" id ="food_unit" type ="text" value="${food.food_unit}"/></div>
		<div>유통기한 : <input name ="food_shelflife" id ="food_shelflife" type ="text" value="${food.food_shelflife}"/></div>
		<div>담당자 : <input name ="staff_id" id ="staff_id" type ="text" value="${food.staff_id}" readonly="readonly"/></div>
		
		

<br>
		<div>
			<input type="submit" id="addfood" value="수정">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/food_list">취소</a>
			<a href="${pageContext.request.contextPath}/food_delete?food_id=${food.food_id}">삭제</a>
		</div>
	</form>



</body>
</html>