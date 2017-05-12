<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			<td>결제취소ID
			</td>
			<td>${payment_cancel.payment_cancel_id}
			</td>
			</tr>
			<tr>
			<td>결제ID
			</td>
			<td>${payment_cancel.payment_id}
			</td>
			</tr>
			<tr>
			<td>테이블주문아이디
			</td>
			<td>${payment_cancel.table_order_id}
			</td>
			</tr>
			<tr>
			<td>결제취소금액
			</td>
			<td>${payment_cancel.payment_cancel_pay}
			</td>
			</tr>
			<tr>
			<td>결제취소총액
			</td>
			<td>${payment_cancel.payment_cancel_total}
			</td>
			</tr>
			<tr>
			<td>결제취소일자
			</td>
			<td>${payment_cancel.payment_cancel_date}
			</td>
			</tr>
			<tr>
			<td>결제취소유형
			</td>
			<td>${payment_cancel.payment_cancel_cate}
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
			<td>${payment_cancel.member_phone}
			</td>
			</tr>
			<tr>
			<td>반환마일리지
			</td>
			<td>${payment_cancel.payment_cancel_backmileage}
			</td>
			</tr>
			<tr>
			<td>회수마일리지
			</td>
			<td>${payment_cancel.payment_cancel_usemileage}
			</td>
			</tr>
	</table>
	<br><br>
	
	<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/payment/payment_cancel_list">리스트로</a>
</div>

</div>

</body>
</html>