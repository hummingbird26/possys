<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�Ŵ��� ������</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/logout">�α׾ƿ�</a>
<a href="${pageContext.request.contextPath}/member_list">���</a>
<!-- ���� -->
<a href="${pageContext.request.contextPath}/food_list">������ ǰ�� ���</a>
<a href="${pageContext.request.contextPath}/drop_list">��� ǰ�� ���</a>
<a href="${pageContext.request.contextPath}/ep_manage_list">���־�ü ���</a>
<!-- ���� �� -->


���̵�:${sessionScope.Staff.Staff_id}
�̸�:${sessionScope.Staff.Staff_name}
��å:${sessionScope.Staff.Staff_level}
</body>
</html>