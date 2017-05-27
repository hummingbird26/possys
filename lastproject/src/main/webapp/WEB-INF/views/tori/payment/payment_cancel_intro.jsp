<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PAYMENT_CANCEL_INTRO</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ include file="../../modal/wide_menu.jsp" %>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
	<div class="container">
		<form class="form-inline" action="${pageContext.request.contextPath}/tori/payment/payment_cancel_ACT" method="POST">
			<div><input type="hidden" class="form-inline" name="payment_id" id="payment_id">${payment_id}</div>
			<div><input type="submit" class="btn btn-primary" name="paymentCancelAdd" id="paymentCancelAdd">결제취소목록</div>
		</form>
	
	
	</div>
</body>
</html>