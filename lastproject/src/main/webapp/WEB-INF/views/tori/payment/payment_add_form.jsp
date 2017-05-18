<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- jQuery UI library -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Payment_ADD</title>

<script>
$(document).ready(function(){
	$('#paymentAdd').click(function(){
		if($('#payment_id').val().length<4){
			alert('아이디를 4글자 이상 입력하시오.');
      		$('#payment_id').focus();
		}else if($('#table_order_id').val().length<4){
			alert('테이블주문번호를 4자리 이상 입력하시오.');
      		$('#table_order_id').focus();
		}else if($('#member_phone').val()==''){
			alert('고객의 핸드폰번호를 입력해주세요.');
      		$('#member_phone').focus();
		}else if($('#payment_total').val()==''){
			alert('주문총액을 입력해주세요.');
      		$('#payment_total').focus();
		}else if($('#payment_pay').val()==''){
			alert('주문금액을 입력해주세요.');
      		$('#payment_pay').focus();
		}else if($('#payment_addmileage').val()==''){
			alert('추가된마일리지를 입력해주세요.');
      		$('#payment_addmileage').focus();
		}else if($('#payment_usemileage').val()==''){
			alert('사용한마일리지는 얼마인지 입력해주세요.');
      		$('#payment_usemileage').focus();
		}else if($('#payment_date').val()==''){
			alert('거래날짜는 언제인지 입력해주세요.');
      		$('#payment_date').focus();
		}else if($('#payment_cate').val()==''){
			alert('거래구분은 무엇인지 입력해주세요.');
      		$('#payment_cate').focus();
		}else if($('#payment_state').val()==''){
			alert('거래상태는 어떠한지 입력해주세요.');
      		$('#payment_state').focus();
		}else {
			$('#paymentForm').submit();
		}
	});
});

function chkDupId(){
	var prmId = $("#payment_id").val();
	console.log(prmId);
	if($("#payment_id").val() == '')
		{	alert('ID를 입력해 주세요!');
			return;
		}
	 $.ajax({
		type:'POST',
		data:"prmId="+$("#payment_id").val(),
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		dataType:'text',
		url:'${pageContext.request.contextPath}/tori/payment/chkDupId',
		success : function(data){
			alert("성공");
			var chkRst = data;
			if(chkRst=="Y"){
				alert("등록 가능 합니다");
				console.log(data);
				$("#idcheck").val('Y');
			}else{
				alert("중복됩니다");
				console.log(data);
				$("#idcheck").val('N');
			}
		},
		error : function(request,status,error){
			
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("실패");
		}
	});
}

function insertChk(){
	var frm = document.paymentForm;
	
	if(!chkVal('payment_id','payment_id'))
		return false;
	if($("#idChk").val()=='N'){
		alert('ID체크를 해주시오');
		return;
	}
}
</script>
 <%@ include file="../../modal/wide_menu.jsp" %>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<div class="container">
<!-- form action에도 입력폼 및 리스트로 가는 것을 작성하지 않고 다른 경로를 작성해본다. 그리고  컨트롤러, 리스트, 매퍼, DTO, DAO, 및 입력 폼의 name속성의 값들을 전부  DB내의 컬럼명으로 통일해서 작성한다-->
	<form id="paymentForm" class="form-inline" action="${pageContext.request.contextPath}/tori/payment/payment_add_action" method="post">
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
		<td><input class="form-control" size="auto" id="member_phone" name="member_phone" type="tel"></td>
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
	<input class="btn btn-primary" type="submit" id="paymentAdd" name="paymentAdd" value="제출">
	<input class="btn btn-primary" type="reset" id="paymentCancel" name="paymentCancel" value="되돌림">
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_list">글목록</a>
	<input type="button" class="btn btn-primary" value="idcheck" onclick="javascript:chkDupId();"/>
	</form>
	<br><br>
	<div>
	<!-- ID 체크 확인용 -->
	<input type="hidden" id="idChk" value="N"/>
	</div>
	<div>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_cancel_form">결제취소직권입력</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_card_form">카드결제직권입력</a>
	</div>
</div>
</body>
</html>
