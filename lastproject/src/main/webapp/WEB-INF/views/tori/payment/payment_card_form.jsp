<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Card_Payment_ADD</title>
<script>
$(document).ready(function(){
	$('#paymentCardAdd').click(function(){
		if($('#card_id').val().length<4){
			alert('아이디를 4글자 이상 입력하시오.');
      $('#card_id').focus();
		}else if($('#payment_id').val().length<4){
			alert('결제아이디를 4자리 이상 입력하시오.');
      $('#payment_id').focus();
		}else if($('#card_app').val()==''){
			alert('신용구븐를 입력해주십시오.');
      $('#card_app').focus();
		}else if($('#card_detail').val()==''){
			alert('카드사상세정보를 입력해주세요.');
      $('#card_detail').focus();
		}else if($('#card_date').val()==''){
			alert('카드결제기일을 입력해주세요.');
      $('#card_date').focus();
		}else if($('#card_company').val()==''){
			alert('신용카드사를 입력해주세요.');
      $('#card_company').focus();
		}else if($('#card_company').val()==''){
			alert('신용카드사를 입력해주세요.');
      $('#card_company').focus();
		}else if($('#card_total').val()==''){
			alert('카드총결제금액은 얼마인지 입력해주세요!');
      $('#card_total').focus();
		}else if($('#card_price').val()==''){
			alert('공급가액은 얼마인지 입력해주세요.');
      $('#card_price').focus();
		}else if($('#card_tax').val()==''){
			alert('카드 부가세는 얼마인가요?');
      $('#card_tax').focus();
		}else {
			$('#paymentCardForm').submit();
		}
	});
});
</script>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
	<div class="container">
		<form id="paymentCardForm" action="${pageContext.request.contextPath}/tori/payment/payment_card_action" method="post" class="form-inline">
			<table class="table table-hover table-stripped">
				<tr>
					<td>승인번호 :
					</td>
					<td><input type="text" class="form-control" name="card_id" id="card_id" size="auto">
					</td>
				</tr>
				<tr>
					<td>결제번호 : 
					</td>
					<td><input type="text" class="form-control" name="payment_id" id="payment_id" size="auto">
					</td>
				</tr>
				<tr>
					<td>승인구분 : 
					</td>
					<td><input type="text" class="form-control" name="card_app" id="card_app" size="auto">
					</td>
				</tr>
				<tr>
					<td>상세내역 : 
					</td>
					<td><input type="text" class="form-control" name="card_detail" id="card_detail" size="auto">
					</td>
				</tr>
				<tr>
					<td>승인날짜 : 
					</td>
					<td><input type="date" class="form-control" name="card_date" id="card_date" size="auto">
					</td>
				</tr>
				<tr>
					<td>카드사 : 
					</td>
					<td><input type="text" class="form-control" name="card_company" id="card_company" size="auto">
					</td>
				</tr>
				<tr>
					<td>카드결제금액 :
					</td>
					<td><input type="text" class="form-control" name="card_total" id="card_total" size="auto">
					</td>
				</tr>
				<tr>
					<td>공급가액: 
					</td>
					<td><input type="text" class="form-control" name="card_price" id="card_price" size="auto">
					</td>
				</tr>
				<tr>
					<td>부가세 : 
					</td>
					<td><input type="text" class="form-control" name="card_tax" id="card_tax" size="auto">
					</td>
				</tr>
				</table>
		<input type="submit" class="btn btn-default" id="paymentCardAdd" name="paymentCardAdd" value="제출">
		<input type="reset" class="btn btn-default" id="paymentCancel" name="paymentCancel" value="되돌림">
		<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/payment/payment_card_list">글목록</a>
		</form>

	</div>
</body>
</html>