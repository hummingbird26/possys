<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�޴� ȭ��</title>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>�޴� - ${menu.menu_id} ���� ȭ��</h1>
<br>

<form id="addform" action="${pageContext.request.contextPath}/menu_modify" method="post">
		
		<div>�޴��ڵ� : <input name ="menu_id" id ="menu_id" type ="text" value="${menu.menu_id}" readonly="readonly"/></div>
		<div>�޴���: <input name ="menu_name" id ="menu_name" type ="text" value="${menu.menu_name}"/></div>
		<div>��ǰī�װ�: <input name ="menu_cate" id ="menu_cate" type ="text" value="${menu.menu_cate}"/></div>
		<div>����: <input name ="menu_price" id ="menu_price" type ="text" value="${menu.menu_price}"/></div>
		<div>���ο��� : <input name ="menu_sprice" id ="menu_sprice" type ="text" value="${menu.menu_sprice}"/></div>
		<div>Į�θ�: <input name ="menu_kcal" id ="menu_kcal" type ="text" value="${menu.menu_kcal}" readonly="readonly"/></div>
		
		

<br>
		<div>
			<input type="submit" id="addmenu" value="����">
			<input type="reset" id="reset" value="�ʱ�ȭ">
			<a href="${pageContext.request.contextPath}/food_list">���</a>
			<a href="${pageContext.request.contextPath}/food_delete?food_id=${food.food_id}">����</a>
		</div>
	</form>

</body>
</html>