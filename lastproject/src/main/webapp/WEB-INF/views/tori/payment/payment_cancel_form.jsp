<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Payment_Cancel_ADD</title>
<script>
/* $(document).ready(function(){
	$('#paymentCancelAdd').click(function(){
		if($('#paymentCancelId').val.length<4){
			alert('아이디를 4글자 이상 입력하시오.');
      $('#paymentCancelId').focus();
		}else if($('#paymentId').val().length<4){
			alert('결제아이디를 4자리 이상 입력하시오.');
      $('#paymentId').focus();
		}else if($('#tableOrderId').val()==''){
			alert('테이블주문코드를 입력해주세요.');
      $('#tableOrderId').focus();
		}else if($('#memberPhone').val()==''){
			alert('전화번호를 입력해주세요.');
      $('#memberPhone').focus();
		}else if($('#paymentCancelTotal').val()==''){
			alert('주문취소금액을 입력해주세요.');
      $('#paymentCancelTotal').focus();
		}else if($('#paymentCancelPay').val()==''){
			alert('결제금액을 입력해주세요.');
      $('#paymentCancelPay').focus();
		}else if($('#paymentCancelBackMileage').val()==''){
			alert('회수한 마일리지는 얼마인지 입력해주세요.');
      $('#paymentCancelBackMileage').focus();
		}else if($('#paymentCancelReturnMileage').val()==''){
			alert('환불한 마일리지는 얼마인지 입력해주세요.');
      $('#paymentCancelReturnMileage').focus();
		}else if($('#paymentCancelDate').val()!="현금"|"카드"){
			alert('거래취소날짜는 언제인지 입력해주세요.');
      $('#paymentCancelDate').focus();
		}else if($('#paymentCancelCate').val()==''){
			alert('거래취소구분은 어떠한지 입력해주세요.');
      $('#paymentCancelCate').focus();
		}else {
			$('#paymentCancelAdd').submit();
		}
	});
}); */
</script>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
	<div class="container">
		<form action="${pageContext.request.contextPath}/tori/payment/payment_cancel_action" method="post" class="form-inline">
			<table class="table table-hover table-stripped">
				<tr>
					<td>결제취소코드 :
					</td>
					<td><input type="text" class="form-control" name="payment_cancel_id" id="payment_cancel_id" size="auto">
					</td>
				</tr>
				<tr>
					<td>결제번호 : 
					</td>
					<td><input type="text" class="form-control" name="payment_id" id="payment_id" size="auto">
					</td>
				</tr>
				<tr>
					<td>테이블사용코드 : 
					</td>
					<td><input type="text" class="form-control" name="table_order_id" id="table_order_id" size="auto">
					</td>
				</tr>
				<tr>
					<td>전화번호 : 
					</td>
					<td><input type="text" class="form-control" name="member_phone" id="member_phone" size="auto">
					</td>
				</tr>
				<tr>
					<td>총액 : 
					</td>
					<td><input type="text" class="form-control" name="payment_cancel_total" id="payment_cancel_total" size="auto">
					</td>
				</tr>
				<tr>
					<td>결제금액 :
					</td>
					<td><input type="text" class="form-control" name="payment_cancel_pay" id="payment_cancel_pay" size="auto">
					</td>
				</tr>
				<tr>
					<td>회수마일리지 : 
					</td>
					<td><input type="text" class="form-control" name="payment_cancel_backmileage" id="payment_cancel_backmileage" size="auto">
					</td>
				</tr>
				<tr>
					<td>환불마일리지 : 
					</td>
					<td><input type="text" class="form-control" name="payment_cancel_returnmileage" id="payment_cancel_returnmileage" size="auto">
					</td>
				</tr>
				<tr>
					<td>날짜 : 
					</td>
					<td><input type="date" class="form-control" name="payment_cancel_date" id="payment_cancel_date" size="auto">
					</td>
				</tr>
				<tr>
					<td>구분 : 
					</td>
					<td><input type="text" class="form-control" name="payment_cancel_cate" id="payment_cancel_cate" size="auto">
					</td>
				</tr>
				</table>
		<input type="submit" id="paymentCancelAdd" name="paymentCancelAdd" value="제출">
		<input type="reset" id="paymentCancel" name="paymentCancel" value="되돌림">
		<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/payment/payment_cancel_list">글목록</a>
		</form>
	
	
	
	</div>
</body>
</html>