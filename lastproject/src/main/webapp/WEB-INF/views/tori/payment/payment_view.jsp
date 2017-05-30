<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>결제 상세정보</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- script를 이용해서 결제취소한 후에 결제취소테이블에 등록하는 과정 -->
<script>
	function paymentDelete(){
		alert('결제 취소를 진행하시겠습니까?');
		console.log('결제취소');
		/* paymentdelete.href="${pageContext.request.contextPath}/tori/payment/payment_delete?payment_id=${payment.payment_id}"; */
	}
</script>
<%@ include file="../../modal/wide_menu.jsp" %>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<div class="container">
<br><br>
<div>
	<div class="col-sm-6">
		<img src="" height="auto" width="auto" alt="결제회사정보">
	
	</div>
	<div class="col-sm-6">
		<table class="table table-hover table-stripped">
		<caption>결제관리기본정보</caption>
			<tr>
			<td>결제ID
			</td>
			<td>${payment.payment_id}
			</td>
			</tr>
			<tr>
			<td>테이블주문번호
			</td>
			<td>${payment.table_order_id}
			</td>
			</tr>
			<tr>
			<td>결제총액
			</td>
			<td>${payment.payment_total}
			</td>
			</tr>
			<tr>
			<td>결제금액
			</td>
			<td>${payment.payment_pay}
			</td>
			</tr>
			<tr>
			<td>결제일자
			</td>
			<td>${payment.payment_date}
			</td>
			</tr>
			<tr>
			<td>결제유형
			</td>
			<td>${payment.payment_cate}
			</td>
			</tr>
			<tr>
			<td>결제상태
			</td>
			<td>${payment.payment_state}
			</td>
			</tr>
		</table>
	
	</div>
</div>
<br><br>
<div class="container">
	<table class="table table-stripped table-hover">
	<caption>추가정보</caption>
			<tr>
			<td>회원전화번호
			</td>
			<td>${payment.member_phone}
			</td>
			</tr>
			<tr>
			<td>적립마일리지
			</td>
			<td>${payment.payment_addmileage}
			</td>
			</tr>
			<tr>
			<td>사용마일리지
			</td>
			<td>${payment.payment_usemileage}
			</td>
			</tr>
	</table>
	<br><br>
	
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/payment/payment_list">리스트로</a>
	<a class="btn btn-primary" onclick="javascript:paymentDelete();" name="paymentdelete" id="paymentdelete"
	href="${pageContext.request.contextPath}/tori/payment/payment_delete?payment_id=${payment.payment_id}">거래취소추가</a>
</div>

</div>

</body>
</html>