<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

		<div>�ֹ� ��ȣ : ${order.table_order_id}</div>
		<div>���̺� ��ȣ : ${order.table_order_num}</div>
		<div>�ֹ����� :${order.table_order_end}</div>
		<div>�ֹ���¥ :${order.table_order_date}</div>
				<c:forEach var="f" items="${order_list}">
					<div>�޴��ڵ� : ${f.menu_id}" �޴��� : ${f.menu_name}" ���� : ${f.order_detail_ea}" �Ұ� :"${f.order_detail_sum}"</div>
										
				</c:forEach>

<br>
		<div>
			<input type="submit" id="addsubmit" value="����">
			<input type="reset" id="reset" value="�ʱ�ȭ">
			<a href="${pageContext.request.contextPath}/order_list">���</a>
			<a href="${pageContext.request.contextPath}/order_delete?table_order_id=${order.table_order_id}">����</a>
		</div>


</body>
</html>