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
		<img src="" height="auto" width="auto" alt="ī���������">
	
	</div>
	<div class="col-sm-6">
		<table class="table table-hover table-stripped">
		<caption>ī������⺻����</caption>
			<tr>
			<td>���ι�ȣ
			</td>
			<td>${card_payment.card_id}
			</td>
			</tr>
			<tr>
			<td>������ȣ
			</td>
			<td>${card_payment.payment_id}
			</td>
			</tr>
			<tr>
			<td>���α���
			</td>
			<td>${card_payment.card_app}
			</td>
			</tr>
			<tr>
			<td>��������
			</td>
			<td>${card_payment.card_date}
			</td>
			</tr>
			<tr>
			<td>ī���
			</td>
			<td>${card_payment.card_company}
			</td>
			</tr>
			<tr>
			<td>ī������ݾ�
			</td>
			<td>${card_payment.card_total}
			</td>
			</tr>
			<tr>
			<td>ī����ް���
			</td>
			<td>${card_payment.card_price}
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
			<td>���λ���
			</td>
			<td>${card_payment.card_detail}
			</td>
			</tr>
			<tr>
			<td>ȯ�޸��ϸ���
			</td>
			<td>${card_payment.card_backmileage}
			</td>
			</tr>
			<tr>
			<td>ȸ�����ϸ���
			</td>
			<td>${card_payment.card_returnmileage}
			</td>
			</tr>
	</table>
	<br><br>
	
	<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/payment/payment_card_list">����Ʈ��</a>
</div>

</div>

</body>
</html>