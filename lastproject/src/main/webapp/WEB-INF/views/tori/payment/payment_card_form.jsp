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
<title>Payment_Cancel_ADD</title>
<script>
/* $(document).ready(function(){
	$('#paymentCancelAdd').click(function(){
		if($('#paymentCancelId').val.length<4){
			alert('���̵� 4���� �̻� �Է��Ͻÿ�.');
      $('#paymentCancelId').focus();
		}else if($('#paymentId').val().length<4){
			alert('�������̵� 4�ڸ� �̻� �Է��Ͻÿ�.');
      $('#paymentId').focus();
		}else if($('#tableOrderId').val()==''){
			alert('���̺��ֹ��ڵ带 �Է����ּ���.');
      $('#tableOrderId').focus();
		}else if($('#memberPhone').val()==''){
			alert('��ȭ��ȣ�� �Է����ּ���.');
      $('#memberPhone').focus();
		}else if($('#paymentCancelTotal').val()==''){
			alert('�ֹ���ұݾ��� �Է����ּ���.');
      $('#paymentCancelTotal').focus();
		}else if($('#paymentCancelPay').val()==''){
			alert('�����ݾ��� �Է����ּ���.');
      $('#paymentCancelPay').focus();
		}else if($('#paymentCancelBackMileage').val()==''){
			alert('ȸ���� ���ϸ����� ������ �Է����ּ���.');
      $('#paymentCancelBackMileage').focus();
		}else if($('#paymentCancelReturnMileage').val()==''){
			alert('ȯ���� ���ϸ����� ������ �Է����ּ���.');
      $('#paymentCancelReturnMileage').focus();
		}else if($('#paymentCancelDate').val()!="����"|"ī��"){
			alert('�ŷ���ҳ�¥�� �������� �Է����ּ���.');
      $('#paymentCancelDate').focus();
		}else if($('#paymentCancelCate').val()==''){
			alert('�ŷ���ұ����� ����� �Է����ּ���.');
      $('#paymentCancelCate').focus();
		}else {
			$('#paymentCancelAdd').submit();
		}
	});
}); */
</script>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
	<div class="container">
		<form action="${pageContext.request.contextPath}/tori/payment/payment_card_action" method="post" class="form-inline">
			<table class="table table-hover table-stripped">
				<tr>
					<td>���ι�ȣ :
					</td>
					<td><input type="text" class="form-control" name="card_id" id="card_id" size="auto">
					</td>
				</tr>
				<tr>
					<td>������ȣ : 
					</td>
					<td><input type="text" class="form-control" name="payment_id" id="payment_id" size="auto">
					</td>
				</tr>
				<tr>
					<td>���α��� : 
					</td>
					<td><input type="text" class="form-control" name="card_app" id="card_app" size="auto">
					</td>
				</tr>
				<tr>
					<td>�󼼳��� : 
					</td>
					<td><input type="text" class="form-control" name="card_detail" id="card_detail" size="auto">
					</td>
				</tr>
				<tr>
					<td>���γ�¥ : 
					</td>
					<td><input type="text" class="form-control" name="card_date" id="card_date" size="auto">
					</td>
				</tr>
				<tr>
					<td>ī��� : 
					</td>
					<td><input type="text" class="form-control" name="card_company" id="card_company" size="auto">
					</td>
				</tr>
				<tr>
					<td>ī������ݾ� :
					</td>
					<td><input type="text" class="form-control" name="card_total" id="card_total" size="auto">
					</td>
				</tr>
				<tr>
					<td>���ް���: 
					</td>
					<td><input type="text" class="form-control" name="card_price" id="card_price" size="auto">
					</td>
				</tr>
				<tr>
					<td>�ΰ��� : 
					</td>
					<td><input type="text" class="form-control" name="card_tax" id="card_tax" size="auto">
					</td>
				</tr>
				</table>
		<input type="submit" id="paymentCardAdd" name="paymentCardAdd" value="����">
		<input type="reset" id="paymentCancel" name="paymentCancel" value="�ǵ���">
		<a class="btn btn-default" href="${pageContext.request.contextPath}/tori/payment/payment_card_list">�۸��</a>
		</form>
	
	
	
	</div>
</body>
</html>