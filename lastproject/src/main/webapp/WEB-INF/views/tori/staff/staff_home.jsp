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
<title>staff_home</title>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<div class="container">
	<br><br><br><br>
	<fieldset>
	<legend>��������_����</legend>
	<table class="table table-hover">
	<tr>
	<td><a href="#{pageContext.request.contextPath}/tori/payment/payment_add_form"><button class="btn btn-default">��������</button></a></td>
	<td><a href="#{pageContext.request.contextPath}/tori/payment/payment_cancel_add_form"><button class="btn btn-default">������Ұ���</button></a></td>
	</tr>
	<tr>
	<td><a href="#{pageContext.request.contextPath}/tori/payment/payment_add_form"><button class="btn btn-default">ī���������</button></a></td>
	<td></td>
	</tr>
	</table>
	</fieldset>
</div>
<!-- ������ �ϴ� ȭ�� : �ۼ��� �ϰ� ��ũ�� ������ �ʴ´�! -->
</body>
</html>