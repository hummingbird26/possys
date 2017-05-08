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
<title>Payment_ADD</title>

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
<div class="container">
<!-- form action에도 입력폼 및 리스트로 가는 것을 작성하지 않고 다른 경로를 작성해본다. 그리고  컨트롤러, 리스트, 매퍼, DTO, DAO, 및 입력 폼의 name속성의 값들을 전부  DB내의 컬럼명으로 통일해서 작성한다-->
	<form class="form-inline" action="${pageContext.request.contextPath}/tori/payment/payment_add_action" method="post">
	<table class="table table-stripped table-hover">
		<tr>
		<td>결제번호</td>
		<td><input class="form-control" size="auto" id="payment_id" name="payment_id"></td>
		</tr>
		<tr>
		<td>테이블사용코드</td>
		<td><input class="form-control" size="auto" id="table_order_id" name="table_order_id" type="text"></td>
		</tr>
		<tr>
		<td>전화번호</td>
		<td><input class="form-control" size="auto" id="member_phone" name="member_phone" type="text"></td>
		</tr>
		<tr>
		<td>총액</td>
		<td><input class="form-control" size="auto" id="payment_total" name="payment_total" type="text"></td>
		</tr>
		<tr>
		<td>결제금액</td>
		<td><input class="form-control" size="auto" id="payment_pay" name="payment_pay" type="text"></td>
		</tr>
		<tr>
		<td>적립마일리지</td>
		<td><input class="form-control" size="auto" id="payment_addmileage" name="payment_addmileage" type="text"></td>
		</tr>
		<tr>
		<td>사용마일리지</td>
		<td><input class="form-control" size="auto" id="payment_usemileage" name="payment_usemileage" type="text"></td>
		</tr>
		<tr>
		<td>날짜</td>
		<td><input class="form-control" size="auto" id="payment_date" name="payment_date" type="date"></td>
		</tr>
		<tr>
		<td>구분</td>
		<td><input class="form-control" size="auto" id="payment_cate" name="payment_cate" type="text"></td>
		</tr>
		<tr>
		<td>상태</td>
		<td><input class="form-control" size="auto" id="payment_state" name="payment_state" type="text"></td>
		</tr>
	</table>
	<input class="btn btn-default" type="submit" id="paymentAdd" name="paymentAdd" value="제출">
	<input class="btn btn-default" type="reset" id="paymentCancel" name="paymentCancel" value="되돌림">
	<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/payment/payment_list">글목록</a>
	</form>
	
</div>
</body>
</html>
