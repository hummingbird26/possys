<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>식자재 목록</title>
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
<h1>식자재 목록</h1>
<div>전체 식자재 수 : ${foodcount}</div>
	<table border=1>
		<thead>
			<th>번호</th>
			<th>식재코드번호</th>
			<th>상품명</th>
			<th>규격</th>
			<th>단위</th>
			<th>유통기한</th>
			<th>담당자</th>
			<th>등록일자</th>
			<th>수정</th>
						
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="f" items="${list}">
			<tr>
				<td>${(foodcount-status.index)-((currentPage-1)*pageRow)}</td>
				<td>${f.food_id}</td>
				<td>${f.food_name}</td>
				<td>${f.food_size}</td>
				<td>${f.food_unit}</td>
				<td>${f.food_shelflife}</td>
				<td>${f.staff_id}</td>
				<td>${f.food_date}</td>
				<td><a href="${pageContext.request.contextPath}/food_modify_view?food_id=${f.food_id}">수정</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul>
		<c:if test="${currentPage > 1}">
			<li><a href="${pageContext.request.contextPath}/food_list?currentPage=${currentPage-1}">이전</a></li>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<li><a href="${pageContext.request.contextPath}/food_list?currentPage=${currentPage+1}">다음</a></li>
		</c:if>
	</ul>
	<div>
		<form id ="frm" name="frm" action="${pageContext.request.contextPath}/food_search" method="get">
			<select id="selbox"name="selbox" size="1">
				<option value="food_id">식재코드번호</option>
				<option value="food_name">상품명</option>
			</select>
			<input  size="16" name="keyWord" type="text">
			<input id="fbutton" type="button" value="검색">
		</form>
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath}/food_add_form"><button>식자재 추가</button></a>
	</div>
	
</body>
</html>