<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>메뉴 목록</title>
<script type="text/javascript">
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
</script>
</head>
<body>
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
		<form action="${pageContext.request.contextPath}/menu_search" method="post">
			<select size="1">
				<option value="menu_id">메뉴코드</option>
				<option value="menu_name">메뉴명</option>
			</select>
			<input size='16' name="keyWord" type="text">
			<input type="submit" value="검색">
		</form>
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath}/menu_add_form"><button>메뉴 추가</button></a>
	</div>
	
</body>
</html>