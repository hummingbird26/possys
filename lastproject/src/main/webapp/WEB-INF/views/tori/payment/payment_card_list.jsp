<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�������</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
	<div class="container">
    <h1>Payment Cancel List</h1>
    <div>��ü���� �� : ${paymentcardcount}</div>
    <table class="table table-striped table-hover" border="1">
        <thead>
            <tr>
                <th>���ι�ȣ</th>
                <th>������ȣ</th>
                <th>���α���</th>
                <th>��������</th>
                <th>ī���</th>
                <th>ī������ݾ�</th>
                <th>ī����ް���</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach varStatus="status" var="cp" items="${list}">
                <tr>
                    <td><a href="${pageContext.request.contextPath}/tori/payment/payment_card_view?card_id=${cp.card_id}">${cp.card_id}</a></td>
                    <td>${cp.payment_id}</td>
                    <td>${cp.card_app}</td>
                    <td>${cp.card_date}</td>
                    <td>${cp.card_company}</td>
                    <td>${cp.card_total}</td>
                    <td>${cp.card_price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/tori/payment/payment_card_list?currentPage=${currentPage-1}">����</a></li>
        </c:if>
        <c:if test="${selbox != null && keyWord != null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/tori/payment/payment_card_list?currentPage=${i}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/tori/payment/payment_card_list?currentPage=${i}">[${i}]</a></li>></c:otherwise>
        	</c:choose>
        </c:forEach>
        </c:if>
         <c:if test="${selbox == null && keyWord == null}">
        <c:forEach var="i" begin="${expage}" end="${lastPage}" step="1">
        	<c:choose>
        		<c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/tori/payment/payment_card_list?currentPage=${1}">[${i}]</a></li></c:when>
        		<c:otherwise><li><a href="${pageContext.request.contextPath}/tori/payment/payment_card_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
        		</c:choose>
        	</c:forEach>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/tori/payment/payment_card_list?currentPage=${currentPage+1}">����</a></li>
        </c:if>
    </ul>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/tori/payment/payment_card_form">�Խñ� �Է�</a>
        <a href="${pageContext.request.contextPath}/tori/payment/payment_card_search_form" class="btn btn-default">���ǰ˻�</a>
    </div>
    <br><br>
    <div>
    <!-- payment_search_date.jsp�� payment_search_form.jsp�� �̸��� �����Ͽ���.
    �ֳ��ϸ� form���� ��¥���˻�, ī������˻� ���� �����ϱ� ���ؼ� -->
	    <!-- <button class="btn btn-default">ī����������̵�</button>
		<button class="btn btn-default">������ҳ���Ȯ��</button>
		<button class="btn btn-default">���ǰ˻�</button> -->
		<%-- <a href="${pageContext.request.contextPath}/tori/payment/payment_card_form?payment_cate=${p.payment_cate}" class="btn btn-default">ī���������</a>
		<a href="${pageContext.request.contextPath}/tori/payment/payment_cancel_form?payment_state=${p.payment_state}" class="btn btn-default">������ҳ���</a> --%>
		
    </div>
</div>
</body>
</html>