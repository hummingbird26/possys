<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../../modal/wide_menu.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>업체 목록</title>
<script type="text/javascript">
	$(document).ready(function(){
			
		$('#ebutton').click(function(){
			
			var va = $("#selbox option:selected").val();
			
			var regexp = /\s/g;
			if(va !=null || va != "" || va != regexp){
				
				frm.submit();
			}else{
				/* alert('asd'); */
			}
		});		
	});
</script>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>업체 목록</h1>
<div>전체 업체 수 : ${ep_mcount}</div>
	<table border=1>
		<thead>
			<th>번호</th>
			<th>업체 코드 번호</th>
			<th>업체명</th>
			<th>업체 연락처</th>
			<th>업체 담당자</th>
			<th>업체 주소</th>
			<th>비고</th>
			<th>수정</th>
						
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="e" items="${list}">
			<tr>
				<td>${(ep_mcount-status.index)-((currentPage-1)*pageRow)}</td>
				<td id="ep_id">${e.ep_id}</td>
				<td id="ep_name">${e.ep_name}</td>
				<td id="ep_phone">${e.ep_phone}</td>
				<td id="ep_director">${e.ep_director}</td>
				<td id="ep_address">${e.ep_address}</td>
				<td id="ep_text">${e.ep_text}</td>
				<td><a href="${pageContext.request.contextPath}/ep_manage_modify_view?ep_id=${e.ep_id}"><button>상세보기</button></a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul>
		<c:if test="${currentPage > 1}">
			<li><a href="${pageContext.request.contextPath}/ep_manage_list?currentPage=${currentPage-1}">이전</a></li>
		</c:if>
		
<%-- 			<c:if test="${selbox != null && keyWord != null}"> --%>
<%-- 			<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1"> --%>
<%-- 				<c:choose> --%>
<%-- 					<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/ep_msearch?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:when> --%>
<%-- 					<c:otherwise><li><a href="${pageContext.request.contextPath}/ep_msearch?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:otherwise> --%>
<%-- 				</c:choose> --%>
<%-- 			</c:forEach> --%>
<%-- 			</c:if> --%>
<%-- 			<c:if test="${selbox == null && keyWord == null}"> --%>
			<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
				<c:choose>
					<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/ep_manage_list?currentPage=${i}">[${i}]</a></li></c:when>
					<c:otherwise><li><a href="${pageContext.request.contextPath}/ep_manage_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
				</c:choose>
			</c:forEach>
<%-- 			</c:if> --%>
			
			
		<c:if test="${currentPage < lastPage}">
			<li><a href="${pageContext.request.contextPath}/ep_manage_list?currentPage=${currentPage+1}">다음</a></li>
		</c:if>
	</ul>
<!-- 	<div> -->
<%-- 		<form id ="frm" name="frm" action="${pageContext.request.contextPath}/ep_msearch" method="get"> --%>
<!-- 			<select id="selbox"name="selbox" size="1"> -->
<!-- 				<option value="ep_name">업체명</option> -->
<!-- 				<option value="food_id">식재코드번호</option> -->
<!-- 			</select> -->
<!-- 			<input  size="16" name="keyWord" type="text"> -->
<!-- 			<input id="ebutton" type="button" value="검색"> -->
<!-- 		</form> -->
<!-- 	</div> -->
	
	<div>
		<a href="${pageContext.request.contextPath}/ep_manage_add_form"><button>업체 추가</button></a>
	</div>
	
</body>
</html>