<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>조건별결제내역검색</title>
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
<br><br>
<div class="container">
	<form id="form" name="form" class="form-inline" action="${pageContext.request.contextPath}/tori/staff/staff_search_list" method="get">
		<select id="select" name="select" class="form-inline" value="선택하세요">
			<option value="staff_id">직원아이디</option>
			<option value="staff_name">직원이름</option>
			<option value="staff_level">직급</option>
			<option value="staff_gender">직원성별</option>
		</select>
		<input type="text" class="form-inline" name="keyWord" id="keyWord">
		<input type="submit" class="form-inline btn btn-primary" name="search" id="search" value="조건별검색">
	
	</form>
</div>
</body>
</html>