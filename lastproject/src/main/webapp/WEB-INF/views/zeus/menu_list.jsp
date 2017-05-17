<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>메뉴 목록</title>
<script type="text/javascript">
	$(document).ready(function(){
			
		$('#fbutton').click(function(){
			
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
<h1><center><a href="${pageContext.request.contextPath}/home">홍락이짱</a></center></h1>
<h1>메뉴 목록</h1>
<div>전체 메뉴 목록 ${menucount}</div>
	<table border=1>
		<thead>
			<th>메뉴코드</th>
			<th>메뉴명</th>
			<th>상품카테고리</th>
			<th>가격</th>
			<th>할인여부</th>
			<th>칼로리</th>
			<th>수정 </th>
			<th>식재별 소비 </th>			
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="m" items="${list}">
			<tr>			
				<td>${m.menu_id}</td>
				<td>${m.menu_name}</td>
				<td>${m.menu_cate}</td>
				<td>${m.menu_price}</td>
				<td>${m.menu_sprice}</td>
				<td>${m.menu_kcal}</td>
				<td><a href="${pageContext.request.contextPath}/menu_view?menu_id=${m.menu_id}">수정</a></td>
				<td><a href="${pageContext.request.contextPath}/menu_per_view?menu_id=${m.menu_id}&menu_name=${m.menu_name}">소비</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul>
		<c:if test="${currentPage > 1}">
			<li><a href="${pageContext.request.contextPath}/menu_list?currentPage=${currentPage-1}">이전</a></li>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<li><a href="${pageContext.request.contextPath}/menu_list?currentPage=${currentPage+1}">다음</a></li>
		</c:if>
	</ul>
	<div>
		<form id ="frm" name="frm" action="${pageContext.request.contextPath}/menu_search" method="get">
			<select id="selbox"name="selbox" size="1">
				<option value="menu_id">메뉴코드</option>
				<option value="menu_name">메뉴명</option>
			</select>
			<input  size="16" name="keyWord" type="text">
			<input id="fbutton" type="submit" value="검색">
		</form>
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath}/menu_add_form"><button>메뉴 추가</button></a>
	</div>
	
</body>
</html>