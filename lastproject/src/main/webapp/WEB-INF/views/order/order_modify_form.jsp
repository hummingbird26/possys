<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ֹ�����</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('button').click(function(){
			var cls = "."+this.id;
			alert(cls);
			$(cls).remove();

			
			/* $(cls).remove(); */
		});
		
		
	});
</script>
</head>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<body>





<form id="addform" action="${pageContext.request.contextPath}/order_modify_action" method="post">
		
		<div>�ֹ� ��ȣ : <input name ="table_order_id" id ="table_order_id" type ="text" value="${order.table_order_id}" readonly="readonly"/></div>
		<div>���̺� ��ȣ : <input name ="table_order_num" id ="table_order_num" type ="text" value="${order.table_order_num}"/></div>
		<div>�ֹ����� : <input name ="table_order_end" id ="table_order_end" type ="text" value="${order.table_order_end}"/></div>
		<div>�ֹ���¥ : <input name ="table_order_date" id ="table_order_date" type ="text" value="${order.table_order_date}"/></div>
	<c:forEach var="f" items="${list}">
		<div class = "${f.menu_id}"> �޴��ڵ� : <input name ="menu_id" id ="menu_id" class = "${f.menu_id}" type ="text" value="${f.menu_id}"/>�޴��� : <input name ="menu_name" id ="menu_name" class = "${f.menu_id}" type ="text" value="${f.menu_name}"/>���� : <input name ="order_detail_ea" id ="order_detail_ea" class = "${f.menu_id}" type ="text" value="${f.order_detail_ea}"/>�Ұ� : <input name ="order_detail_sum" id ="order_detail_sum" class = "${f.menu_id}" type ="text" value="${f.order_detail_sum}"/><button  type="button" id = "${f.menu_id}" class = "plusbutton">+</button></div>
	</c:forEach>

<br>
		<div>
			<input type="submit" id="addsubmit" value="����">
			<input type="reset" id="reset" value="�ʱ�ȭ">
			<a href="${pageContext.request.contextPath}/order_list">���</a>
			<a href="${pageContext.request.contextPath}/order_delete?table_order_id=${order.table_order_id}">����</a>
		</div>
	</form>

</body>
</html>