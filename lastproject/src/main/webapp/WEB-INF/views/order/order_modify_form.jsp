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
${order.table_order_id}
${order.table_order_num}
${order.table_order_end}
${order.table_order_date}


</body>
</html>