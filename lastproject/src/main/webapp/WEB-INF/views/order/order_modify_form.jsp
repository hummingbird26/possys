<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ֹ�����</title>
</head>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<body>





<form id="addform" action="${pageContext.request.contextPath}/order_modify_action" method="post">
		
		<div>�ֹ� ��ȣ : <input name ="table_order_id" id ="table_order_id" type ="text" value="${order.table_order_id}" readonly="readonly"/></div>
		<div>���̺� ��ȣ : <input name ="table_order_num" id ="table_order_num" type ="text" value="${order.table_order_num}"/></div>
		<div>�ֹ����� : <input name ="table_order_end" id ="table_order_end" type ="text" value="${order.table_order_end}"/></div>
		<div>�ֹ���¥ : <input name ="table_order_date" id ="table_order_date" type ="text" value="${order.table_order_date}"/></div>

		
		

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