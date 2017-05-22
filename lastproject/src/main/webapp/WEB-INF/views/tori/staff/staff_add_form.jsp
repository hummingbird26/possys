<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script>
$(document).ready(function(){
	$('#staffAdd').click(function(){
		if($('#staff_id').val().length<4){
			alert('직원아이디를 4글자 이상 입력하시오.');
      		$('#staff_id').focus();
		}else if($('#staff_pw').val().length<4){
			alert('직원비번를 4자리 이상 입력하시오.');
      		$('#staff_pw').focus();
		}else if($('#staff_name').val()==''){
			alert('직원의 이름을 입력해주세요.');
      		$('#staff_name').focus();
		}else if($('#staff_level').val()==''){
			alert('직급을 입력해주세요.');
      		$('#staff_level').focus();
		}else if($('#staff_age').val()==''){
			alert('나이을 입력해주세요.');
      		$('#staff_age').focus();
		}else if($('#staff_addr').val()==''){
			alert('주소를 입력해주세요.');
      		$('#staff_addr').focus();
		}else if($('#staff_gender').val()==''){
			alert('성별구분을 입력해주세요.');
      		$('#staff_gender').focus();
		}else if($('#staff_phone').val()==''){
			alert('직원의 핸드폰번호를 입력해주세요.');
      		$('#staff_phone').focus();
		}else if($('#staff_date').val()==''){
			alert('직원가입일자는 언제인가요.');
      		$('#staff_date').focus();
		}else {
			$('#staffForm').submit();
		}
	});
});

function chkDupStaffId(){
	var prmId = $("#staff_id").val();
	console.log(prmId);
	if($("#staff_id").val() == '')
		{	alert('ID를 입력해 주세요!');
			return;
		}
	 $.ajax({
		type:'POST',
		data:"prmId="+$("#staff_id").val(),
		contentType:"application/x-www-form-urlencoded; charset=UTF-8",
		dataType:'text',
		url:'${pageContext.request.contextPath}/tori/staff/chkDupStaffId',
		success : function(data){
			alert("성공");
			var chkRst = data;
			if(chkRst=="Y"){
				alert("등록 가능 합니다");
				console.log(data);
				$("#idcheck").val('Y');
			}else{
				alert("중복됩니다");
				console.log(data);
				$("#idcheck").val('N');
			}
		},
		error : function(request,status,error){
			
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			alert("실패");
		}
	});
}

function insertChk(){
	var frm = document.companyForm;
	
	if(!chkVal('staff_id','staff_id'))
		return false;
	if($("#idChk").val()=='N'){
		alert('ID체크를 해주시오');
		return;
	}
}

</script>

<%@ include file="../../modal/wide_menu.jsp" %>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<div class="container">
<!-- form action에도 입력폼 및 리스트로 가는 것을 작성하지 않고 다른 경로를 작성해본다. 그리고  컨트롤러, 리스트, 매퍼, DTO, DAO, 및 입력 폼의 name속성의 값들을 전부  DB내의 컬럼명으로 통일해서 작성한다-->
	<form id="staffForm" class="form-inline" action="${pageContext.request.contextPath}/tori/staff/staff_add_action" method="post">
	<table class="table table-stripped table-hover">
		<tr>
		<td>스태프ID</td>
		<td><input class="form-control" size="auto" id="staff_id" name="staff_id" type="text"></td>
		</tr>
		<tr>
		<td>비밀번호</td>
		<td><input class="form-control" size="auto" id="staff_pw" name="staff_pw" type="password"></td>
		</tr>
		<tr>
		<td>성명</td>
		<td><input class="form-control" size="auto" id="staff_name" name="staff_name" type="text"></td>
		</tr>
		<tr>
		<td>직급</td>
		<td><input class="form-control" size="auto" id="staff_level" name="staff_level" type="text"></td>
		</tr>
		<tr>
		<td>나이</td>
		<td><input class="form-control" size="auto" id="staff_age" name="staff_age" type="text"></td>
		</tr>
		<tr>
		<td>주소</td>
		<td><input class="form-control" size="auto" id="staff_addr" name="staff_addr" type="text"></td>
		</tr>
		<tr>
		<td>성별</td>
		<td><input class="form-control" size="auto" id="staff_gender" name="staff_gender" type="text"></td>
		</tr>
		<tr>
		<td>핸드폰</td>
		<td><input class="form-control" size="auto" id="staff_phone" name="staff_phone" type="tel"></td>
		</tr>
		<tr>
		<td>가입일자</td>
		<td><input class="form-control" size="auto" id="staff_date" name="staff_date" type="date"></td>
		</tr>
	</table>
	<input class="btn btn-primary" type="submit" id="staffAdd" name="staffAdd" value="제출">
	<input class="btn btn-primary" type="reset" id="staffCancel" name="staffCancel" value="되돌림">
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/staff/staff_list">글목록</a>
	<input type="button" class="btn btn-primary" value="idcheck" onclick="javascript:chkDupStaffId();"/>
	</form>
	
</div>
</body>
</html>
