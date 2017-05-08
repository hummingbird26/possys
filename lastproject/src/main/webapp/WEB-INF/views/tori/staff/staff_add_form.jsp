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
<title>Staff_ADD</title>

<!-- <script>
$(document).ready(function(){
	$('#paymentAdd').click(function(){
		if($('#paymentId').val().length<4){
			alert('���̵� 4���� �̻� �Է��Ͻÿ�.');
      		$('#paymentId').focus();
		}else if($('#table_order_ID').val().length<4){
			alert('���̺��ֹ���ȣ�� 4�ڸ� �̻� �Է��Ͻÿ�.');
      		$('#table_order_ID').focus();
		}else if($('#memberPhone').val()==''){
			alert('���� �ڵ�����ȣ�� �Է����ּ���.');
      		$('#memberPhone').focus();
		}else if($('#paymentTotal').val()==''){
			alert('�ֹ��Ѿ��� �Է����ּ���.');
      		$('#paymentTotal').focus();
		}else if($('#paymentPay').val()==''){
			alert('�ֹ��ݾ��� �Է����ּ���.');
      		$('#paymentPay').focus();
		}else if($('#paymentAddmileage').val()==''){
			alert('�߰��ȸ��ϸ����� �Է����ּ���.');
      		$('#paymentAddmileage').focus();
		}else if($('#paymentUsemileage').val()==''){
			alert('����Ѹ��ϸ����� ������ �Է����ּ���.');
      		$('#paymentUsemileage').focus();
		}else if($('#paymentDate').val()==''){
			alert('�ŷ���¥�� �������� �Է����ּ���.');
      		$('#paymentDate').focus();
		}else if($('#paymentCate').val()!="����"|"ī��"){
			alert('�ŷ������� �������� �Է����ּ���.');
      		$('#paymentCate').focus();
		}else if($('#paymentState').val()==''){
			alert('�ŷ����´� ����� �Է����ּ���.');
      		$('#paymentState').focus();
		}else {
			$('#paymentAdd').submit();
		}
	});
});

</script> -->
</head>
<body>
<div class="container">
<!-- form action���� �Է��� �� ����Ʈ�� ���� ���� �ۼ����� �ʰ� �ٸ� ��θ� �ۼ��غ���. �׸���  ��Ʈ�ѷ�, ����Ʈ, ����, DTO, DAO, �� �Է� ���� name�Ӽ��� ������ ����  DB���� �÷������� �����ؼ� �ۼ��Ѵ�-->
	<form class="form-inline" action="${pageContext.request.contextPath}/tori/staff/staff_add_action" method="post">
	<table class="table table-stripped table-hover">
		<tr>
		<td>������ID</td>
		<td><input class="form-control" size="auto" id="staff_id" name="staff_id" type="text"></td>
		</tr>
		<tr>
		<td>��й�ȣ</td>
		<td><input class="form-control" size="auto" id="staff_pw" name="staff_pw" type="password"></td>
		</tr>
		<tr>
		<td>����</td>
		<td><input class="form-control" size="auto" id="staff_name" name="staff_name" type="text"></td>
		</tr>
		<tr>
		<td>����</td>
		<td><input class="form-control" size="auto" id="staff_level" name="staff_level" type="text"></td>
		</tr>
		<tr>
		<td>����</td>
		<td><input class="form-control" size="auto" id="staff_age" name="staff_age" type="text"></td>
		</tr>
		<tr>
		<td>�ּ�</td>
		<td><input class="form-control" size="auto" id="staff_addr" name="staff_addr" type="text"></td>
		</tr>
		<tr>
		<td>����</td>
		<td><input class="form-control" size="auto" id="staff_gender" name="staff_gender" type="text"></td>
		</tr>
		<tr>
		<td>�ڵ���</td>
		<td><input class="form-control" size="auto" id="staff_phone" name="staff_phone" type="text"></td>
		</tr>
		<tr>
		<td>��������</td>
		<td><input class="form-control" size="auto" id="staff_date" name="staff_date" type="date"></td>
		</tr>
	</table>
	<input class="btn btn-default" type="submit" id="staffAdd" name="staffAdd" value="����">
	<input class="btn btn-default" type="reset" id="staffCancel" name="staffCancel" value="�ǵ���">
	<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/staff/staff_list">�۸��</a>
	</form>
	
</div>
</body>
</html>
