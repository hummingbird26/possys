<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>				<!-- 미사용 -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>발주 현황 및 식재현황 상세 관리</title>
</head>
<%-- <%@ include file="../../modal/wide_menu.jsp" %> --%>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>입고 등록</h1>
	<form id="addform" action="${pageContext.request.contextPath}/ep_wh_add_form" method="post">
		<div>
			<span>발주코드 :</span>
			<input name="ep_order_id" id="ep_order_id" type="text" value="발주코드" readonly="readonly"/>
			<br>
			<span>발주 품목</span>
			<table border=1>
				<thead>
					<tr>
						<th>식재 코드번호</th>
						<th>상품명</th>
						<th>발주취소</th>
					</tr>
				</thead>
				<tbody>
					<tr>						
						<td>식재코드번호</td>
						<td>상품명</td>
						<td>발주취소</td>
					</tr>
				</tbody>
			</table>
			
		</div>
		
		

<br>
		<div>
			<input type="submit" id="addsubmit" value="등록">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/ep_manage_list">취소</a>
		</div>
	</form>
</body>
</html>