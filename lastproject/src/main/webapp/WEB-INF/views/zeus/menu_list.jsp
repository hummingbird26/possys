<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="../modal/header.jsp" %>
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
		
		
		$('.catebutton').click(function(){
			var cls = "."+this.id;
			alert(cls+"히든");
			$('.all').hide();
			$(cls).show();
			
		});
	});
</script>


</head>
<body>
</br></br></br></br></br>
<h1>메뉴 목록</h1>
<div>전체 메뉴 목록 ${menucount}</div>
<button class = "catebutton" id = "all"type = "button">전체</button>
<button class = "catebutton" id = "bab"type = "button">밥</button>
<button class = "catebutton" id = "chi"type = "button">치킨</button>
<button class = "catebutton" id = "ham"type = "button">햄버거</button>
	<table border=1>
		<thead>
			<th><h3>메뉴코드</h3></th>
			<th><h3>메뉴명</h3></th>
			<th><h3>상품카테고리</h3h></th>
			<th><h3>가격</h3></th>
			<th><h3>할인여부</h3></th>
			<th><h3>칼로리</h3></th>
			<th><h3>수정</h3></th>
			<th><h3>식재별 소비</h3></th>
			<th><h3>이미지</h3></th>			
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="m" items="${list}">
			<tr class = "all ${m.menu_cate} ${m.menu_id}">			
				<td name = "menu_id" id = "menu_id" class = "${m.menu_id} ${m.menu_cate}">${m.menu_id}</td>
				<td name = "menu_name" id = "menu_name" class = "${m.menu_id} ${m.menu_cate}">${m.menu_name}</td>
				<td name = "menu_cate" id = "menu_cate" class = "${m.menu_id} ${m.menu_cate}">${m.menu_cate}</td>
				<td name = "menu_price" id = "menu_price" class = "${m.menu_id} ${m.menu_cate}">${m.menu_price}</td>
				<td name = "menu_sprice" id = "menu_sprice" class = "${m.menu_id} ${m.menu_cate}">${m.menu_sprice}</td>
				<td name = "menu_kcal" id = "menu_kcal" class = "${m.menu_id} ${m.menu_cate}">${m.menu_kcal}</td>
				<td><a href="${pageContext.request.contextPath}/menu_view?menu_id=${m.menu_id}"><h3>수정</a></td>
				<td><a href="${pageContext.request.contextPath}/menu_per_view?menu_id=${m.menu_id}&menu_name=${m.menu_name}"><h3>등록</h3></a></td>
				<!-- 사진 추가부분 -->
				<td><img src = "${m.newname}" width = "120" height= "120"></td>
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
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/menu_add_form"><button><h3>메뉴 추가</h3></button></a>
	</div>
	
</body>
</html>