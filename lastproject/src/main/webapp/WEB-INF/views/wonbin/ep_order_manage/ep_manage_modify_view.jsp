<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>수정 화면</title>
<script type="text/javascript">
	$(document).ready(function(){
		$(document).on('click','#all_del',function(){
			alert('정말 삭제 하시겠습니까?');
			var re = confirm('업체를 삭제하시면 관련 식재료를 다시 설정해주셔야합니다. 계속 진행하시겠습니까?');
			if(re){
// 				alert('true');
// 				var input = ${'#all_del'}.val();
				
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/ep_manage_delete",
					data : "ep_id="+$("#all_del").val(),
					success : function(data){
						alert('성공');
						fm_del.submit();
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
					}						
				});				
			}else{				
// 				alert("else");
			}
		});
	});//jquery ready


</script>
<%@ include file="../../modal/header.jsp" %>

</head>
<body>


<h1>업체코드 - ${ep_m.ep_id} 상세보기</h1>
<br>

<form id="addform" action="${pageContext.request.contextPath}/ep_manage_modify" method="post">
		
		<div>업체 번호 : <input name ="ep_id" id ="ep_id" type ="text" value="${ep_m.ep_id}" readonly="readonly"/></div>
		<div>
			<p>발주 품목</p>
			<table border=1>
				<thead>
					<th>식재 코드번호</th>
					<th>상품명</th>
					<th>삭제</th>
				</thead>
				<tbody>
					<c:forEach var="f" items="${ep_m_fv}">
					<tr>						
						<td>${f.food_id}</td>
						<td>${f.food_name}</td>
						<td><a href="${pageContext.request.contextPath}/f_del_bt?food_id=${f.food_id}&ep_id=${ep_m.ep_id}"><input type="button" id="f_del_bt" value="삭제"/></a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>			 
			
		<div>업체명 : <input name ="ep_name" id ="ep_name" type ="text" value="${ep_m.ep_name}" readonly="readonly"/></div>
		<div>연락처 : <input name ="ep_phone" id ="ep_phone" type ="text" value="${ep_m.ep_phone}"/></div>
		<div>업체 담당자 : <input name ="ep_director" id ="ep_director" type ="text" value="${ep_m.ep_director}"/></div>
		<div>주소 : <input name ="ep_address" id ="ep_address" type ="text" value="${ep_m.ep_address}"/></div>
		<div>비고 : <input name ="ep_text" id ="ep_text" type ="text" value="${ep_m.ep_text}"/></div>
		
		

<br>
		<div>
			<input type="submit" id="addsubmit" value="수정">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/ep_manage_list"><button type="">취소</button></a>
		</div>
	</form>
	<form id="fm_del" action="${pageContext.request.contextPath}/ep_manage_list"method="GET">
		<button id="all_del" type="button" name="ep_id" value="${ep_m.ep_id}">전체 삭제</button>
	</form>
	


</body>
</html>