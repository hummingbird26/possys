<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>메뉴 화면</title>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>메뉴 - ${menu.menu_id} 식재 화면</h1>
<br>

<form id="addform" action="${pageContext.request.contextPath}/menu_modify" method="post">
		
		<div>메뉴코드 : <input name ="menu_id" id ="menu_id" type ="text" value="${menu.menu_id}" readonly="readonly"/></div>
		<div>메뉴명: <input name ="menu_name" id ="menu_name" type ="text" value="${menu.menu_name}"/></div>
<table border=1>
		<thead>
			<th>식재코드</th>
			<th>상품명</th>
			<th>추가</th>					
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="f" items="${list}">
			<tr>			
				<td>${f.food_id}</td>
				<td>${f.food_name}</td>
				<td><a href="${pageContext.request.contextPath}/menu_per_view?menu_id=${m.menu_id}">소비</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>		
		<div class="form-group">
            <label for="menuPw"> 수량:</label>
            <input class="form-control" name="menu_name" id="menu_name" type="text"/>
        </div>
        <div class="form-group">
            <label for="menuPw"> 단위:</label>
            <input class="form-control" name="menu_name" id="menu_name" type="text"/>
        </div>
<br>
		<div>
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/menu_list">취소</a>
			<a href="${pageContext.request.contextPath}/menu_delete?menu_id=${menu.menu_id}">삭제</a>
		</div>
	</form>

</body>
</html>