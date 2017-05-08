<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>폐기식자재 품목관리</title>
</head>
<body>
<h1>폐기식자재 품목관리</h1>
	<form id="addform" action="${pageContext.request.contextPath}/drop_add_form" method="post">
		
		<div>식재 코드 번호 : <input name ="food_id" id ="food_id" type ="text"/></div>
		<div>폐기 수량 : <input name ="drop_ea" id ="drop_ea" type ="text"/></div>
		<div>폐기 사유 : <input name ="drop_reason" id ="drop_reason" type ="text"/></div>
		<div>담당자 : <input name ="staff_id" id ="staff_id" type ="text"/></div>
		<div>폐기 일자 : <input name ="drop_date" id ="drop_date" type ="text"/></div>
		
		

<br>
		<div>
			<input type="submit" id="addfood" value="폐기등록">
			<input type="reset" id="reset" value="초기화">
			<a href="#">취소</a>
		</div>
	</form>
</body>
</html>