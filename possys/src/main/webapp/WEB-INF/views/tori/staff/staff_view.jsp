<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
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
			<td>${staff.staff_id}
			</td>
			</tr>
			<tr>
			<td>�����̸�
			</td>
			<td>${staff.staff_name}
			</td>
			</tr>
			<tr>
			<td>����
			</td>
			<td>${staff.staff_level}
			</td>
			</tr>
			<tr>
			<td>����
			</td>
			<td>${staff.staff_gender}
			</td>
			</tr>
			<tr>
			<td>��ȭ��ȣ
			</td>
			<td>${staff.staff_phone}
			</td>
			</tr>
			<tr>
			<td>�����������
			</td>
			<td>${staff.staff_date}
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
			<td>ȸ����й�ȣ
			</td>
			<td>${staff.staff_pw}
			</td>
			</tr>
			<tr>
			<td>��������
			</td>
			<td>${staff.staff_age}
			</td>
			</tr>
			<tr>
			<td>�����ּ�
			</td>
			<td>${staff.staff_addr}
			</td>
			</tr>
	</table>
	<br><br>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/staff/staff_update_form?staff_id=${staff.staff_id}">����</a>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/staff/staff_delete_form?staff_id=${staff.staff_id}">����</a>
	<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/staff/staff_list">����Ʈ��</a>
</div>

</div>

</body>
</html>