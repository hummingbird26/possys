<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>폐기식자재 품목관리</title>
<%-- <%@ include file="../../modal/wide_menu.jsp" %> --%>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<div>

</div>
<br>
<br>
	<div class="container">
	<h2 class="col-sm-3">폐기등록</h2>
	<br>
	<br>
	<br>
	<br>	
	<br>
<%-- 	<form id="addform" action="${pageContext.request.contextPath}/drop_add_form" method="post"> --%>
		<form class="form-horizontal col-sm-12">
			<div class="form-group">
				<label class="control-label col-sm-2">식재 코드</label>
				<div class="col-xs-7">
					<input  class="form-control" name ="food_id" id ="food_id" type ="text"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">상품명</label>
				<div class="col-xs-7">
					<input  class="form-control" name ="food_name" id ="food_name" type ="text"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">폐기 사유</label>
				<div class="col-xs-7">
					<textarea  class="form-control" rows="5" name ="drop_reason" id ="drop_reason"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">폐기 수량</label>
				<div class="col-xs-7">
					<input  class="form-control" name ="drop_ea" id ="drop_ea" type ="text"/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2">담당자</label>
				<div class="col-xs-7">
					<input  class="form-control" name ="staff_id" id ="staff_id" type ="text"/>
				</div>
			</div>
			<br>
			<div class="form-group col-sm-10">
				<center>
				<input class="btn btn-default" type="submit" id="addsubmit" value="폐기등록">
				<input class="btn" type="reset" id="reset" value="초기화">
				<button class="btn" type="button">취소</button>
				</center>
			</div>
		</form>
	</div>

</body>
</html>