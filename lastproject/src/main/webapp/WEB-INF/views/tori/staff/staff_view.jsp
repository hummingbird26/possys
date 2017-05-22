<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>직원 상세정보</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<%@ include file="../../modal/wide_menu.jsp" %>
</head>
<body>

<div class="container">
<br><br>
<div>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
	<div class="col-sm-6">
		<img src="" height="auto" width="auto" alt="결제회사정보">
	
	</div>
	<div class="col-sm-6">
		<table class="table table-hover table-stripped">
		<caption>직원관리기본정보</caption>
			<tr>
			<td>직원ID
			</td>
			<td>${staff.staff_id}
			</td>
			</tr>
			<tr>
			<td>직원이름
			</td>
			<td>${staff.staff_name}
			</td>
			</tr>
			<tr>
			<td>직급
			</td>
			<td>${staff.staff_level}
			</td>
			</tr>
			<tr>
			<td>성별
			</td>
			<td>${staff.staff_gender}
			</td>
			</tr>
			<tr>
			<td>전화번호
			</td>
			<td>${staff.staff_phone}
			</td>
			</tr>
			<tr>
			<td>직원등록일자
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
	<caption>추가정보</caption>
			<tr>
			<td>회원비밀번호
			</td>
			<td>${staff.staff_pw}
			</td>
			</tr>
			<tr>
			<td>직원연령
			</td>
			<td>${staff.staff_age}
			</td>
			</tr>
			<tr>
			<td>직원주소
			</td>
			<td>${staff.staff_addr}
			</td>
			</tr>
	</table>
	<br><br>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/staff/staff_update_form?staff_id=${staff.staff_id}">수정</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/staff/staff_delete_form?staff_id=${staff.staff_id}">삭제</a>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/tori/staff/staff_list">리스트로</a>
</div>

</div>

</body>
</html>