<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>������ ������</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/logout">�α׾ƿ�</a>
<a href="${pageContext.request.contextPath}/member_list">���</a>
<a href="${pageContext.request.contextPath}/test">Jquery autocomplete</a>
<!-- ���� -->
<a href="${pageContext.request.contextPath}/food_list">������ ǰ�� ���</a>
<a href="${pageContext.request.contextPath}/drop_list">��� ǰ�� ���</a>
<a href="${pageContext.request.contextPath}/ep_manage_list">���־�ü ���</a>
<!-- ���� �� -->

<a href="${pageContext.request.contextPath}/menu_add_form">�޴� �Է�</a>

���̵�:${sessionScope.admin.admin_id}
�̸�:${sessionScope.admin.admin_name}
��å:${sessionScope.admin.admin_level}


</body>
</html>