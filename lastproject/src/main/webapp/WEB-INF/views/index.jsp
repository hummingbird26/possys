<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a href="/PosSystem2/logout">로그아웃</a>
<a href="/PosSystem2/test">목록</a>

아이디:${sessionScope.admin.admin_id}
이름:${sessionScope.admin.admin_name}
</body>
</html>