<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정 화면</title>
<%@ include file="../../modal/header.jsp" %>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<div class="container">
<h3>식재료 - ${food.food_id} 수정 화면</h3>
<br>
<br>
<br>
<form class="form-horizontal col-sm-12" id="addform" action="${pageContext.request.contextPath}/food_modify" method="post">
		<div class="form-group">
			<label class="control-label col-sm-2">식재료 코드</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="food_id" id ="food_id" type ="text" value="${food.food_id}" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">상품명</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="food_name" id ="food_name" type ="text" value="${food.food_name}" readonly="readonly"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">단위</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="food_unit" id ="food_unit" type ="text" value="${food.food_unit}"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">유통기한</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="food_shelflife" id ="food_shelflife" type ="text" value="${food.food_shelflife}"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">담당자</label>
			<div class="col-xs-7">
				<input  class="sel_view form-control" name ="staff_id" id ="staff_id" type ="text" value="${food.staff_id}" readonly="readonly"/>
			</div>
		</div>		
<br>
		<div class="form-group col-sm-10">
				<center>
				<input class="btn btn-primary" type="submit" id="addfood" value="수정">
				<a href="${pageContext.request.contextPath}/food_list"><button class="btn btn-default" type="button" id="censel">취소</button></a>
				<a href="${pageContext.request.contextPath}/food_delete?food_id=${food.food_id}"><button class="btn btn-default" type="button" id="all_del">삭제</button></a>
				</center>
			</div>
		</form>
</div>


</body>
</html>