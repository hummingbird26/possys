<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>메뉴 화면</title>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">홍락이짱</a></center></h1>
<h1>메뉴 - ${menu.menu_id} 식재등록</h1>
<br>

<form id="addform" action="${pageContext.request.contextPath}/menu_modify" method="post">
		
		<div>메뉴코드 : <input name ="menu_id" id ="menu_id" type ="text" value="${menu.menu_id}" readonly="readonly"/></div>
		<div>메뉴명: <input name ="menu_name" id ="menu_name" type ="text" value="${menu.menu_name}" readonly="readonly"/></div>
		<div>식재코드: <input name ="menu_cate" id ="menu_cate" type ="text" value="${menu.menu_cate}" readonly="readonly"/></div>
		<div>상품명: <input name ="menu_price" id ="menu_price" type ="text" value="${menu.menu_price}" readonly="readonly"/></div>
		<div>단위 : <input name ="menu_sprice" id ="menu_sprice" type ="text" value="${menu.menu_sprice}"/></div>
		<div>수량: <input name ="menu_kcal" id ="menu_kcal" type ="text" value="${menu.menu_kcal}"/></div>
		
		

<br>
		<div>
			<input type="submit" id="addmenu" value="등록">
			<input type="reset" id="reset" value="취소">
		</div>
	</form>

</body>
</html>