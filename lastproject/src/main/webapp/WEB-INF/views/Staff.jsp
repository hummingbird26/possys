<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>매니저 페이지</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
<a href="${pageContext.request.contextPath}/member_list">목록</a>

아이디:${sessionScope.Staff.Staff_id}
이름:${sessionScope.Staff.Staff_name}
직책:${sessionScope.Staff.Staff_level}
</body>
</html>