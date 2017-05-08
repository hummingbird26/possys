<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>폐기 목록</title>
<script type="text/javascript">
	$(document).ready(function(){
			
		$('#dbutton').click(function(){
			
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
<h1>폐기 목록</h1>
<div>전체 식자재 수 : ${dropcount}</div>
	<table border=1>
		<thead>
			<th>번호</th>
			<th>폐기 번호</th>
			<th>상품 번호</th>
			<th>수량</th>
			<th>폐기 사유</th>
			<th>담당자</th>
			<th>폐기 일자</th>
			<th>수정</th>
						
		</thead>
		<tbody>
			<c:forEach varStatus="status" var="d" items="${list}">
			<tr>
				<td>${(dropcount-status.index)-((currentPage-1)*pageRow)}</td>
				<td>${d.drop_id}</td>
				<td>${d.food_id}</td>
				<td>${d.drop_ea}</td>
				<td>${d.drop_reason}</td>
				<td>${d.staff_id}</td>
				<td>${d.drop_date}</td>				
				<td><a href="${pageContext.request.contextPath}/drop_modify_view?drop_id=${d.drop_id}">수정</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul>
		<c:if test="${currentPage > 1}">
			<li><a href="${pageContext.request.contextPath}/drop_list?currentPage=${currentPage-1}">이전</a></li>
		</c:if>
		
			<c:if test="${selbox != null && keyWord != null}">
			<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
				<c:choose>
					<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/drop_search?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:when>
					<c:otherwise><li><a href="${pageContext.request.contextPath}/drop_search?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:otherwise>
				</c:choose>
			</c:forEach>
			</c:if>
			<c:if test="${selbox == null && keyWord == null}">
			<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
				<c:choose>
					<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/drop_list?currentPage=${i}">[${i}]</a></li></c:when>
					<c:otherwise><li><a href="${pageContext.request.contextPath}/drop_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
				</c:choose>
			</c:forEach>
			</c:if>
			
			
		<c:if test="${currentPage < lastPage}">
			<li><a href="${pageContext.request.contextPath}/drop_list?currentPage=${currentPage+1}">다음</a></li>
		</c:if>
	</ul>
	<div>
		<form id ="frm" name="frm" action="${pageContext.request.contextPath}/drop_search" method="get">
			<select id="selbox"name="selbox" size="1">
				<option value="drop_id">폐기번호</option>
				<option value="food_id">상품번호</option>
			</select>
			<input  size="16" name="keyWord" type="text">
			<input id="dbutton" type="button" value="검색">
		</form>
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath}/drop_add_form"><button>식자재 추가</button></a>
	</div>
	
</body>
</html>