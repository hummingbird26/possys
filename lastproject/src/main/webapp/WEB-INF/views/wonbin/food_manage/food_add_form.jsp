<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>식자재 품목관리</title>
<%@ include file="../../modal/wide_menu.jsp" %>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>식자재 입력폼</h1>

	<form id="addform" action="${pageContext.request.contextPath}/food_add_form" method="post">
		
		<div>상품명 : <input name ="food_name" id ="food_name" type ="text"/></div>
		<div>규격 : <input name ="food_size" id ="food_size" type ="text"/></div>
		<div>단위 : <input name ="food_unit" id ="food_unit" type ="text"/></div>
		<div>유통기한 : <input name ="food_shelflife" id ="food_shelflife" type ="text"/></div>
		<div>담당자 : <input name ="staff_id" id ="staff_id" type ="text"/></div>
		
		

<br>
		<div>
			<input type="submit" id="addfood" value="등록">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/food_list">취소</a>
		</div>
	</form>
</body>
</html>