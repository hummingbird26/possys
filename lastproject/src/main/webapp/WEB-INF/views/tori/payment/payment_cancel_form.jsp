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
<title>Payment_Cancel_ADD</title>
<script>
$(document).ready(function(){
	$('#paymentCancelAdd').click(function(){
		if($('#payment_cancel_id').val().length<4){
			alert('아이디를 4글자 이상 입력하시오.');
      $('#payment_cancel_id').focus();
		}else if($('#payment_id').val().length<4){
			alert('결제아이디를 4자리 이상 입력하시오.');
      $('#payment_id').focus();
		}else if($('#table_order_id').val()==''){
			alert('테이블주문코드를 입력해주세요.');
      $('#table_order_id').focus();
		}else if($('#member_phone').val()==''){
			alert('전화번호를 입력해주세요.');
      $('#member_phone').focus();
		}else if($('#payment_cancel_total').val()==''){
			alert('주문취소금액을 입력해주세요.');
      $('#payment_cancel_total').focus();
		}else if($('#payment_cancel_pay').val()==''){
			alert('결제금액을 입력해주세요.');
      $('#payment_cancel_pay').focus();
		}else if($('#payment_cancel_backmileage').val()==''){
			alert('회수한 마일리지는 얼마인지 입력해주세요.');
      $('#payment_cancel_backmileage').focus();
		}else if($('#payment_cancel_returnmileage').val()==''){
			alert('환불한 마일리지는 얼마인지 입력해주세요.');
      $('#payment_cancel_returnmileage').focus();
		}else if($('#payment_cancel_date').val()==''){
			alert('거래취소날짜는 언제인지 입력해주세요.');
      $('#payment_cancel_date').focus();
		}else if($('#payment_cancel_cate').val()==''){
			alert('거래취소구분은 어떠한지 입력해주세요.');
      $('#payment_cancel_cate').focus();
		}else {
			$('#paymentCancelForm').submit();
		}
	});
});

function chkDupCancelId(){
	var prmId = $("#payment_cancel_id").val();
	console.log(prmId); // prmId값에 payment_cancel_id의 값이 잘 전달되어지는지 확인
	if($("#payment_cancel_id").val()=='')
		{ alert('ID를 입력해주세요!');
			return;
		}
	$.ajax({
		type:'POST',
		data:"prmId=" +$("#payment_cancel_id").val(),
		dataType:'text',
		url:'${pageContext.request.contextPath}/tori/payment/chkDupCancelId',
		success : function(rData, textStatus, xhr){
			alert("성공");
			var chkRst = rData;
			if(chkRst==0){
				alert("등록이 가능합니다");
				$("#idcheck").val('Y');
			}else{
				alert("중복됩니다");
				$("#idcheck").val('N');
			}
		},
		error : function(xhr, status, e){
			alert("실패");
		}
	});
}

function insertCancelChk(){
	var frm = document.companyForm;
	
	if(!chkVal('payment_cancel_id','payment_cancel_id'))
		return false;
	if($("#idChk").val()=='N'){
		alert('ID체크를 해주시오');
		return;
	}
}
</script>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
	<div class="container">
		<form id="paymentCancelForm" action="${pageContext.request.contextPath}/tori/payment/payment_cancel_action" method="post" class="form-inline">
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
		<input type="submit" class="btn btn-default" id="paymentCancelAdd" name="paymentCancelAdd" value="제출">
		<input type="reset" class="btn btn-default" id="paymentCancel" name="paymentCancel" value="되돌림">
		<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/payment/payment_cancel_list">글목록</a>
		<input type="button" value="idcheck" onclick="javascript:chkDupCancelId();"/>
		</form>
		<br><br>
			<div>
			<!-- ID 체크 확인용 -->
			<input type="hidden" id="idChk" value="N"/>
			</div>
	</div>
</body>
</html>