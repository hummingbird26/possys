<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�޴� ���</title>
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
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>�޴� ���</h1>
<div>��ü �޴� ��� ${menucount}</div>
	<table border=1>
		<thead>
			<th>�޴��ڵ�</th>
			<th>�޴���</th>
			<th>��ǰī�װ�</th>
			<th>����</th>
			<th>���ο���</th>
			<th>Į�θ�</th>
			<th>���� </th>
						
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
				<td><a href="${pageContext.request.contextPath}/menu_view?menu_id=${m.menu_id}">����</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<ul>
		<c:if test="${currentPage > 1}">
			<li><a href="${pageContext.request.contextPath}/menu_list?currentPage=${currentPage-1}">����</a></li>
		</c:if>
		<c:if test="${currentPage < lastPage}">
			<li><a href="${pageContext.request.contextPath}/menu_list?currentPage=${currentPage+1}">����</a></li>
		</c:if>
	</ul>
	<div>
		<form id ="frm" name="frm" action="${pageContext.request.contextPath}/menu_search" method="get">
			<select id="selbox"name="selbox" size="1">
				<option value="menu_id">�޴��ڵ�</option>
				<option value="menu_name">�޴���</option>
			</select>
			<input  size="16" name="keyWord" type="text">
			<input id="fbutton" type="submit" value="�˻�">
		</form>
	</div>
	
	<div>
		<a href="${pageContext.request.contextPath}/menu_add_form"><button>�޴� �߰�</button></a>
	</div>
	
</body>
</html>