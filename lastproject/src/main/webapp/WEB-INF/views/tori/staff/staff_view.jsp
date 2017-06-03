<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>직원 상세정보</title>

 <!-- start: Css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/bootstrap.min.css">

      <!-- plugins -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/font-awesome.min.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/simple-line-icons.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/animate.min.css"/>
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/asset/css/plugins/fullcalendar.min.css"/>
	<link href="${pageContext.request.contextPath}/resources/asset/css/style.css" rel="stylesheet">
	<!-- end: Css -->

	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/asset/img/logomi.png">
   
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<%@ include file="../../modal/header.jsp" %>
</head>
<body>
</br></br></br></br></br>
<div class="container">
<br><br>
<div>
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
			<td>직원비밀번호
			</td>
			<td>${staff.staff_pw}
			</td>
			</tr>
			<tr>
			<td>직원이메일</td>
			<td>${staff.staff_email}</td>
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