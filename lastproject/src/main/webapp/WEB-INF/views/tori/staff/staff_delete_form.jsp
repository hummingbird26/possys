<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>STAFF DELETE</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ include file="../../modal/wide_menu.jsp" %>
<%-- <%@ include file="../../modal/header.jsp" %> --%>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
	<div class="container">
		<form class="form-inline" action="${pageContext.request.contextPath}/tori/staff/staff_delete_action" method="POST">
			<div><label for="staff_id">회원아이디 :</label></div>
			<div><input type="text" class="form-control" size="auto" id="staff_id" name="staff_id" value="${staff.staff_id}" readonly></div><br>
			<div><label for="staff_id">비밀번호 :</label></div>
			<div><input type="password" class="form-control" size="auto" id="staff_pw" name="staff_pw"></div><br>
			<div><input class="btn btn-primary" type="submit" id="staffUpdate" name="staffUpdate" value="제출"></div>
		</form>
	
	
	</div>
</body>
</html>