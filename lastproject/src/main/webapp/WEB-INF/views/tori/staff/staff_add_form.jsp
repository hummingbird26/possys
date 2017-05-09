<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Staff_ADD</title>

<!-- <script>
$(document).ready(function(){
	$('#paymentAdd').click(function(){
		if($('#paymentId').val().length<4){
			alert('아이디를 4글자 이상 입력하시오.');
      		$('#paymentId').focus();
		}else if($('#table_order_ID').val().length<4){
			alert('테이블주문번호를 4자리 이상 입력하시오.');
      		$('#table_order_ID').focus();
		}else if($('#memberPhone').val()==''){
			alert('고객의 핸드폰번호를 입력해주세요.');
      		$('#memberPhone').focus();
		}else if($('#paymentTotal').val()==''){
			alert('주문총액을 입력해주세요.');
      		$('#paymentTotal').focus();
		}else if($('#paymentPay').val()==''){
			alert('주문금액을 입력해주세요.');
      		$('#paymentPay').focus();
		}else if($('#paymentAddmileage').val()==''){
			alert('추가된마일리지를 입력해주세요.');
      		$('#paymentAddmileage').focus();
		}else if($('#paymentUsemileage').val()==''){
			alert('사용한마일리지는 얼마인지 입력해주세요.');
      		$('#paymentUsemileage').focus();
		}else if($('#paymentDate').val()==''){
			alert('거래날짜는 언제인지 입력해주세요.');
      		$('#paymentDate').focus();
		}else if($('#paymentCate').val()!="현금"|"카드"){
			alert('거래구분은 무엇인지 입력해주세요.');
      		$('#paymentCate').focus();
		}else if($('#paymentState').val()==''){
			alert('거래상태는 어떠한지 입력해주세요.');
      		$('#paymentState').focus();
		}else {
			$('#paymentAdd').submit();
		}
	});
});

</script> -->
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<div class="container">
<!-- form action에도 입력폼 및 리스트로 가는 것을 작성하지 않고 다른 경로를 작성해본다. 그리고  컨트롤러, 리스트, 매퍼, DTO, DAO, 및 입력 폼의 name속성의 값들을 전부  DB내의 컬럼명으로 통일해서 작성한다-->
	<form class="form-inline" action="${pageContext.request.contextPath}/tori/staff/staff_add_action" method="post">
	<table class="table table-stripped table-hover">
		<tr>
		<td>스태프ID</td>
		<td><input class="form-control" size="auto" id="staff_id" name="staff_id" type="text"></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		<td><input class="form-control" size="auto" id="staff_pw" name="staff_pw" type="password"></td>
		</tr>
		<tr>
		<td>성명</td>
		<td><input class="form-control" size="auto" id="staff_name" name="staff_name" type="text"></td>
		</tr>
		<tr>
		<td>직급</td>
		<td><input class="form-control" size="auto" id="staff_level" name="staff_level" type="text"></td>
		</tr>
		<tr>
		<td>나이</td>
		<td><input class="form-control" size="auto" id="staff_age" name="staff_age" type="text"></td>
		</tr>
		<tr>
		<td>주소</td>
		<td><input class="form-control" size="auto" id="staff_addr" name="staff_addr" type="text"></td>
		</tr>
		<tr>
		<td>성별</td>
		<td><input class="form-control" size="auto" id="staff_gender" name="staff_gender" type="text"></td>
		</tr>
		<tr>
		<td>핸드폰</td>
		<td><input class="form-control" size="auto" id="staff_phone" name="staff_phone" type="text"></td>
		</tr>
		<tr>
		<td>가입일자</td>
		<td><input class="form-control" size="auto" id="staff_date" name="staff_date" type="date"></td>
		</tr>
	</table>
	<input class="btn btn-default" type="submit" id="staffAdd" name="staffAdd" value="제출">
	<input class="btn btn-default" type="reset" id="staffCancel" name="staffCancel" value="되돌림">
	<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/staff/staff_list">글목록</a>
	</form>
	
</div>
</body>
</html>
