<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>관리자 페이지</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
<a href="${pageContext.request.contextPath}/member_list">목록</a>
<a href="${pageContext.request.contextPath}/test">Jquery autocomplete</a>
<<<<<<< HEAD
<a href="${pageContext.request.contextPath}/tori/payment/payment_add_form">결제관리업무</a>
<a href="${pageContext.request.contextPath}/tori/staff/staff_add_form">직원관리업무</a>
=======
<!-- 원빈 -->
<a href="${pageContext.request.contextPath}/food_list">식재자 품목 목록</a>
<a href="${pageContext.request.contextPath}/drop_list">폐기 품목 목록</a>
<a href="${pageContext.request.contextPath}/ep_manage_list">발주업체 목록</a>
<!-- 원빈 끝 -->
<!-- 홍경인 -->
<a href="${pageContext.request.contextPath}/order_list">주문리스트</a>
>>>>>>> branch 'master' of https://github.com/hummingbird26/possys.git

<a href="${pageContext.request.contextPath}/menu_add_form">메뉴 입력</a>

아이디:${sessionScope.admin.admin_id}
이름:${sessionScope.admin.admin_name}
직책:${sessionScope.admin.admin_level}


</body>
</html>