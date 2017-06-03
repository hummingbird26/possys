<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	<%@ include file="../modal/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>메뉴 화면</title>
</head>
<body>
</br></br></br></br>
<h1>메뉴 - ${menu.menu_id} 식재등록</h1>
<br>
<form id="addform" action="${pageContext.request.contextPath}/menu_modify2" method="post">
		
		<div>메뉴코드 : <input name ="menu_id" id ="menu_id" type ="text" value="${menu.menu_id}" readonly="readonly"/></div>
		<div>메뉴명: <input name ="menu_name" id ="menu_name" type ="text" value="${menu.menu_name}" readonly="readonly"/></div>
		<div>식재코드: <input name ="food_id" id ="food_id" type ="text" value="${food.food_id}" readonly="readonly"/></div>
		<div>상품명: <input name ="food_name" id ="food_name" type ="text" value="${food.food_name}" readonly="readonly"/></div>
		<div>단위 : <input name ="food_unit" id ="food_unit" type ="text" value="${food.food_unit}"  readonly="readonly"/></div>
		<div>수량: <input name ="fpm_ea" id ="fpm_ea" type ="text" placeholder="수량을 입력하세요" /></div>
		
		

<br>
		<div>
			<input type="submit" id="addmenu" value="등록">
			<a href="${pageContext.request.contextPath}/menu_list">취소</a>
		</div>
	</form>

</body>
</html>