<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ������</title>

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
		<img src="" height="auto" width="auto" alt="����ȸ������">
	
	</div>
	<div class="col-sm-6">
		<table class="table table-hover table-stripped">
		<caption>���������⺻����</caption>
			<tr>
			<td>����ID
			</td>
			<td>${payment.payment_id}
			</td>
			</tr>
			<tr>
			<td>���̺��ֹ���ȣ
			</td>
			<td>${payment.table_order_id}
			</td>
			</tr>
			<tr>
			<td>�����Ѿ�
			</td>
			<td>${payment.payment_total}
			</td>
			</tr>
			<tr>
			<td>�����ݾ�
			</td>
			<td>${payment.payment_pay}
			</td>
			</tr>
			<tr>
			<td>��������
			</td>
			<td>${payment.payment_date}
			</td>
			</tr>
			<tr>
			<td>��������
			</td>
			<td>${payment.payment_cate}
			</td>
			</tr>
			<tr>
			<td>��������
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
	<caption>�߰�����</caption>
			<tr>
			<td>ȸ����ȭ��ȣ
			</td>
			<td>${payment.member_phone}
			</td>
			</tr>
			<tr>
			<td>�������ϸ���
			</td>
			<td>${payment.payment_addmileage}
			</td>
			</tr>
			<tr>
			<td>��븶�ϸ���
			</td>
			<td>${payment.payment_usemileage}
			</td>
			</tr>
	</table>
	<br><br>
	
	<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/payment/payment_list">����Ʈ��</a>
</div>

</div>

</body>
</html>