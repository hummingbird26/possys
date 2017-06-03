<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
	<br><br><br><br>
	<fieldset>
	<legend>결제업무_선택</legend>
	<table class="table table-hover">
	<tr>
	<td><a href="#{pageContext.request.contextPath}/tori/payment/payment_add_form"><button class="btn btn-primary">결제관리</button></a></td>
	<td><a href="#{pageContext.request.contextPath}/tori/payment/payment_cancel_add_form"><button class="btn btn-primary">결제취소관리</button></a></td>
	</tr>
	<tr>
	<td><a href="#{pageContext.request.contextPath}/tori/payment/payment_add_form"><button class="btn btn-primary">카드결제관리</button></a></td>
	<td></td>
	</tr>
	</table>
	</fieldset>
</div>
<!-- 구성만 하는 화면 : 작성만 하고 링크를 걸지는 않는다! -->
</body>
</html>