<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>식자재 목록</title>
<script type="text/javascript">
	$(document).ready(function(){
		//검색 
		$('#fbutton').click(function(){
			
			var va = $("#selbox option:selected").val();
			
			var regexp = /\s/g;
			if(va !=null || va != "" || va != regexp){
				
				frm.submit();
			}else{
				/* alert('asd'); */
			}
		});
		//체크박스 전체 선택/해제
		$("#food_chkall").click(function(){
			if($("#food_chkall").prop("checked")){
				$("input[name=food_id]").prop("checked",true);
			}else{
				$("input[name=food_id]").prop("checked",false);
			}
		});
	//발주업체 관리 버튼을 클릭하면 체크박스 행(row) 값 가져오기
		$("#ep_submit").click(function(){
			if($("input[name=food_id]").is(":checked") == false){
				alert("선택된 항목이 없습니다.");
				return;	
			}else{ /* alert("선택됐습니다."); */
				ep_chkbox.submit();
				/* $("input[name=food_chk]:checked").each(function() {
					var test = $(this).val();
					var food_id = $(this).closest("tr").find(".td_id").text();
					var food_name = $(this).closest("tr").find("#td_name").text(); */
// 					var param = "";
// 						if(param == "")
// 							param = "food_id="+id
// 						else param = param + "&food_id"+id
// 						param = param + "&food_name="+name
//						ep_chkbox.submit();
// 					 console.log(food_id);
//				})
			}
		});
		
	});
</script>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>식자재 목록</h1>
<div>전체 식자재 수 : ${foodcount}</div>
	<form id="ep_chkbox" action="${pageContext.request.contextPath}/ep_chkbox" method="post">
	<input id="ep_submit" type="button" value="발주업체 관리"/>
	
		<table class="chkclass" border=1>
			<thead>
				<th><input type="checkbox" id="food_chkall"/> ▼</th>
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
					<td><input class = "td_chk" type="checkbox" name="food_id" value="${f.food_id}"></td>
					<td>${(foodcount-status.index)-((currentPage-1)*pageRow)}</td>
					<td>${f.food_id}</td>
					<td>${f.food_name}</td>
					<td>${f.food_size}</td>
					<td>${f.food_unit}</td>
					<td>제조일로 부터 ${f.food_shelflife}일 까지</td>
					<td>${f.staff_id}</td>
					<td>${f.food_date}</td>
					<td><a href="${pageContext.request.contextPath}/food_modify_view?food_id=${f.food_id}">수정</a></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	
	<ul>
		<c:if test="${currentPage > 1}">
			<li><a href="${pageContext.request.contextPath}/food_list?currentPage=${currentPage-1}">이전</a></li>
		</c:if>
		
			<c:if test="${selbox != null && keyWord != null}">
			<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
				<c:choose>
					<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/food_search?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:when>
					<c:otherwise><li><a href="${pageContext.request.contextPath}/food_search?currentPage=${i}&selbox=${selbox}&keyWord=${keyWord}">[${i}]</a></li></c:otherwise>
				</c:choose>
			</c:forEach>
			</c:if>
			<c:if test="${selbox == null && keyWord == null}">
			<c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
				<c:choose>
					<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/food_list?currentPage=${i}">[${i}]</a></li></c:when>
					<c:otherwise><li><a href="${pageContext.request.contextPath}/food_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
				</c:choose>
			</c:forEach>
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