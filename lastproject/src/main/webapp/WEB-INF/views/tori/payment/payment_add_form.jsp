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
		/* if($('#payment_id').val().length<4){
			alert('아이디를 4글자 이상 입력하시오.');
      		$('#payment_id').focus();} */
		if($('#table_order_id').val().length<4){
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
		}
		/* else if($('#payment_addmileage').val()==''){
			alert('추가된마일리지를 입력해주세요.');
      		$('#payment_addmileage').focus();
		} */
		else if($('#payment_usemileage').val()==''){
			alert('사용한마일리지는 얼마인지 입력해주세요.');
      		$('#payment_usemileage').focus();
		}
		/* else if($('#payment_date').val()==''){
			alert('거래날짜는 언제인지 입력해주세요.');
      		$('#payment_date').focus();
		}else if($('#payment_cate').val()==''){
			alert('거래구분은 무엇인지 입력해주세요.');
      		$('#payment_cate').focus();
		}else if($('#payment_state').val()==''){
			alert('거래상태는 어떠한지 입력해주세요.');
      		$('#payment_state').focus();
		} */
		else {
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
				$("#IDCheck").val() = "아이디 사용가능";
			}else{
				alert("중복됩니다");
				console.log(data);
				$("#IDCheck").val() = "아이디 사용불가";
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

 function toidCheck(){
	console.log('ToidCheck');
	var Toid = $("#table_order_id").val();
	if($("#table_order_id").val() == ''){
		alert('현재 일치하는 주문번호가 없습니다');
		return;
	}
	
	  $.ajax({
			type:'POST',
			data:"Toid="+$("#table_order_id").val(),
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'text',
			url:'${pageContext.request.contextPath}/tori/payment/ToidCheck',
			success : function(data){
				alert("성공");
				var chkRst = data;
				if(chkRst=="Y"){
					alert("등록 가능 합니다");
					console.log(data);
					//$("#IDCheck").val() = "아이디 사용가능";
				}else{
					alert("중복됩니다");
					console.log(data);
					//$("#IDCheck").val() = "아이디 사용불가";
				}
			},
			error : function(request,status,error){
				
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("실패");
			}
		});
}

 function toMPhoneCheck(){
	console.log('ToMPhoneCheck');
	var ToMPhone = $("#member_phone").val();
	if($("#member_phone").val() == ''){
		alert('현재 해당 회원번호가 존재하지 않습니다');
		return;
	}
	
	 $.ajax({
			type:'POST',
			data:"ToMPhone="+$("#member_phone").val(),
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'text',
			url:'${pageContext.request.contextPath}/tori/payment/ToMPhoneCheck',
			success : function(data){
				alert("성공");
				var chkRst = data;
				if(chkRst=="Y"){
					alert("등록 가능 합니다");
					console.log(data);
					//$("#IDCheck").val() = "아이디 사용가능";
				}else{
					alert("중복됩니다");
					console.log(data);
					//$("#IDCheck").val() = "아이디 사용불가";
				}
			},
			error : function(request,status,error){
				
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("실패");
			}
		});
} 
 
 function bringOrderList(){
	 console.log("bringOrderList");
	 var OrderList = $("#table_order_id").val();
	 var values;
	 
	 $.ajax({
			type:'POST',
			data:"Toid="+$("#table_order_id").val(),
			contentType:"application/x-www-form-urlencoded; charset=UTF-8",
			dataType:'text',
			url:'${pageContext.request.contextPath}/tori/payment/bringOrderList',
			success : function(data){
				alert("성공");
				var chkRst = data;
				//values = data.OrderList;
				if(chkRst>="0"){
					alert("가격 산정 완료");
					console.log(data);			// data값이 잘 받아와졌는지 확인테스트
					//console.log(values);
					data = Number(data);		// data타입은 문자열인데 이것을 정수로 형변환
					var mileage = data*0.01;	
					console.log(data);			// 형변환 잘 되었는지 출력
					console.log(mileage);
					document.getElementById('payment_total').value = data;			// 자바스크립트 코드를 이용하여 id값이 payment_total인 요소의 값을 data변수의 값으로 설정해준다.
					document.getElementById('payment_addmileage').value = mileage;
				}else{
					alert("가격 산정 불가");
					console.log(data);
					//console.log(values);
				}
			},
			error : function(request,status,error){
				
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				alert("실패");
			}
		});
 }

//payment_state가 취소인지 정상인지에 따라서 이동경로를 다르게 설정해주는 스크립트
/* function SubmitYesNo(){
	console.log('3');
	alert(11);
	 var index = $("#payment_state").val();
	console.log(index); 
	 if(index=="취소"){
		paymentForm.action="${pageContext.request.contextPath}/tori/payment/payment_cancel_action";
	}else{
		paymentForm.action="${pageContext.request.contextPath}/tori/payment/payment_add_action";
	} paymentForm.submit();
} */
</script>
 <%@ include file="../../modal/wide_menu.jsp" %>
</head>
<body>


<!-- 부모창에서 보내온 값을 받아서 table_order_id 아이디에 vlaue 값으로 사용한다. --> 
<script>
window.onload = function(){
var x = opener.document.getElementById('table_order_id').value;
document.getElementById('table_order_id').value = x;
};
</script>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<div class="container">
<!-- form action에도 입력폼 및 리스트로 가는 것을 작성하지 않고 다른 경로를 작성해본다. 그리고  컨트롤러, 리스트, 매퍼, DTO, DAO, 및 입력 폼의 name속성의 값들을 전부  DB내의 컬럼명으로 통일해서 작성한다-->
	<form id="paymentForm" class="form-inline" action="${pageContext.request.contextPath}/tori/payment/payment_add_action" method="post">
	<table class="table table-stripped table-hover">
		<!-- <tr>
		<td>결제번호</td>
		<td><input class="form-control" size="auto" id="payment_id" name="payment_id"></td>
		<td>
			ID 체크 확인용
			<input type="hidden" id="idChk" value="N" />
			<p id="IDCheck"></p>
		</td>
		</tr> -->
		<tr>
		<td>테이블사용코드</td>
		<td><input class="form-control" size="auto" id="table_order_id" name="table_order_id" type="text"></td>
		<td>
		<input type="button" class="btn btn-primary form-control" name="ToidCheck" value="체크" size="auto" onclick="javascript:toidCheck();">
		<input type="button" class="btn btn-primary form-control" name="BringOrderList" value="가져오기" size="auto" onclick="javascript:bringOrderList();">
		</td>
		<!-- JAVASCRIPT 함수의 처음 글자를 대문자로 해도 함수로 인식하지 않을 수 있음 -->
		</tr>
		<tr>
		<td>전화번호</td>
		<td><input class="form-control" size="auto" id="member_phone" name="member_phone" type="tel"></td>
		<td><input type="button" class="btn btn-primary form-control" name="ToMPhoneCheck" value="체크" size="auto" onclick="javascript:toMPhoneCheck();"></td>
		</tr>
		<tr>
		<td>총액</td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_total" name="payment_total" type="text" readonly></td>
		</tr>
		<tr>
		<td>결제금액</td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_pay" name="payment_pay" type="text"></td>
		</tr>
		<tr>
		<td>적립마일리지</td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_addmileage" name="payment_addmileage" type="text" readonly></td>
		</tr>
		<tr>
		<td>사용마일리지</td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_usemileage" name="payment_usemileage" type="text"></td>
		</tr>
		<!-- <tr>
		<td>날짜</td>
		<td colspan="2"><input class="form-control" size="auto" id="payment_date" name="payment_date" type="date"></td>
		</tr> -->
		<tr>
		<td>구분</td>
		<td colspan="2">
		<input type="radio" class="form-control" name="payment_cate" id="payment_cate" value="현금">현금
		<input type="radio" class="form-control" name="payment_cate" id="payment_cate" value="카드">카드
		<!-- <input class="form-control" size="auto" id="payment_cate" name="payment_cate" type="text"> --></td>
		</tr>
		<!-- <tr>
		<td>상태</td>
		<td><input class="form-control" size="auto" id="payment_state" name="payment_state" type="text"></td>
		<td><label id="paymentcancelYN"></label></td>
		</tr> -->
	</table>
	<input class="btn btn-primary" type="button" id="paymentAdd" name="paymentAdd" value="제출">
	<!-- <input class="btn btn-primary" type="button" id="paymentAdd" name="paymentAdd" onclick="javascript:SubmitYesNo();" value="제출"> -->
	<input class="btn btn-primary" type="reset" id="paymentCancel" name="paymentCancel" value="되돌림">
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_list">글목록</a>
	<!-- <input type="button" class="btn btn-primary" id="idcheck" name="idcheck" value="아이디중복체크" onclick="javascript:chkDupId();"/> -->
	</form>
	<br><br>
	
	<!-- payment_state가 취소라면 payment_cancel_list.jsp로 화면을 이동하게끔 한다. 그리고 실질적인 데이터베이스 반영이 되어져야 한다 -->
	<div>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_cancel_form">결제취소직권입력</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_card_form">카드결제직권입력</a>
	</div>
</div>
</body>
</html>
