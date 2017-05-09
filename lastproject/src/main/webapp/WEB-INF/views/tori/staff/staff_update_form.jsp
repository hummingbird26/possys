<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Staff_UPDATE</title>

</head>
<body>
<div class="container">
<!-- form action���� �Է��� �� ����Ʈ�� ���� ���� �ۼ����� �ʰ� �ٸ� ��θ� �ۼ��غ���. �׸���  ��Ʈ�ѷ�, ����Ʈ, ����, DTO, DAO, �� �Է� ���� name�Ӽ��� ������ ����  DB���� �÷������� �����ؼ� �ۼ��Ѵ�-->
	<form class="form-inline" action="${pageContext.request.contextPath}/tori/staff/staff_update_action" method="post">
	<table class="table table-stripped table-hover">
		<tr>
		<td>������ID</td>
		<td><input class="form-control" size="auto" id="staff_id" name="staff_id" value="${staff.staff_id}" readonly></td>
		</tr>
		<tr>
		<td>��й�ȣ</td>
		<td><input class="form-control" size="auto" id="staff_pw" name="staff_pw" type="password" value="${staff.staff_pw}"></td>
		</tr>
		<tr>
		<td>����</td>
		<td><input class="form-control" size="auto" id="staff_name" name="staff_name" type="text" value="${staff.staff_name}"></td>
		</tr>
		<tr>
		<td>����</td>
		<td><input class="form-control" size="auto" id="staff_level" name="staff_level" type="text" value="${staff.staff_level}"></td>
		</tr>
		<tr>
		<td>����</td>
		<td><input class="form-control" size="auto" id="staff_age" name="staff_age" type="text" value="${staff.staff_age}"></td>
		</tr>
		<tr>
		<td>�ּ�</td>
		<td><input class="form-control" size="auto" id="staff_addr" name="staff_addr" type="text" value="${staff.staff_addr}"></td>
		</tr>
		<tr>
		<td>����</td>
		<td><input class="form-control" size="auto" id="staff_gender" name="staff_gender" type="text" value="${staff.staff_gender}"></td>
		</tr>
		<tr>
		<td>�ڵ���</td>
		<td><input class="form-control" size="auto" id="staff_phone" name="staff_phone" type="text" value="${staff.staff_phone}"></td>
		</tr>
		<tr>
		<td>��������</td>
		<td><input class="form-control" size="auto" id="staff_date" name="staff_date" type="date" value="${staff.staff_date}" readonly></td>
		</tr>
	</table>
	<input class="btn btn-default" type="submit" id="staffUpdate" name="staffUpdate" value="����">
	<input class="btn btn-default" type="reset" id="staffReset" name="staffReset" value="�ǵ���">
	<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/staff/staff_list">�۸��</a>
	</form>
	
</div>
</body>
</html>
