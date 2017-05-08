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
<h1>폐기번호 - ${drop.drop_id} 수정 화면</h1>
<br>

<form id="addform" action="${pageContext.request.contextPath}/drop_modify" method="post">
		
		<div>폐기번호 : <input name ="drop_id" id ="drop_id" type ="text" value="${drop.drop_id}" readonly="readonly"/></div>
		<div>식재 코드 번호 : <input name ="food_id" id ="food_id" type ="text" value="${drop.food_id}" readonly="readonly"/></div>
		<div>폐기 수량 : <input name ="drop_ea" id ="drop_ea" type ="text" value="${drop.drop_ea}"/></div>
		<div>폐기 사유 : <input name ="drop_reason" id ="drop_reason" type ="text" value="${drop.drop_reason}"/></div>
		<div>담당자 : <input name ="staff_id" id ="staff_id" type ="text" value="${drop.staff_id}"/></div>
		
<br>
		<div>
			<input type="submit" id="adddrop" value="수정">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/drop_list">취소</a>
			<a href="${pageContext.request.contextPath}/drop_delete?drop_id=${drop.drop_id}">삭제</a>
		</div>
	</form>



</body>
</html>