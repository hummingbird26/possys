<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문수정</title>
<script type="text/javascript">
	$(document).ready(function(){
		$('.delbutton').click(function(){
			
			var cls = "."+this.id;
			alert(cls);
			$(cls).remove();
		});
		
		$('.plusbutton').click(function(){
			
			var cls = "."+this.id;
			var now = $(cls).children('#order_detail_ea').val();
			now = parseInt(now)+1;
			var price = $(cls).children('#menu_price').val();
			var total = now*price
			$(cls).children('#order_detail_ea').val(now);
			$(cls).children('#order_detail_sum').val(total);
			
			/* alert(total); */
			
		});
		
		$('.minusbutton').click(function(){
			
			var cls = "."+this.id;
			var now = $(cls).children('#order_detail_ea').val();
			now = parseInt(now)-1;
			var price = $(cls).children('#menu_price').val();
			var total = now*price
			$(cls).children('#order_detail_ea').val(now);
			$(cls).children('#order_detail_sum').val(total);
			
			/* alert(total); */
			
			
			
		});
		
		
		
		
		
	});
</script>
</head>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<body>


<form id="addform" action="${pageContext.request.contextPath}/order_modify_action" method="post">
		
		<div>주문 번호 : <input name ="table_order_id" id ="table_order_id" type ="text" value="${order.table_order_id}" readonly="readonly"/></div>
		<div>테이블 번호 : <input name ="table_order_num" id ="table_order_num" type ="text" value="${order.table_order_num}"readonly="readonly"/></div>
		<div>주문종결 : <input name ="table_order_end" id ="table_order_end" type ="text" value="${order.table_order_end}"readonly="readonly"/></div>
		<div>주문날짜 : <input name ="table_order_date" id ="table_order_date" type ="text" value="${order.table_order_date}"readonly="readonly"/></div>
	<c:forEach var="f" items="${list}">
		<div class = "${f.menu_id}"> 
		메뉴코드 : <input name ="menu_id" id ="menu_id" class = "${f.menu_id}" type ="text" value="${f.menu_id}"readonly="readonly"/>
		메뉴명 : <input name ="menu_name" id ="menu_name" class = "${f.menu_id}" type ="text" value="${f.menu_name}"readonly="readonly"/>
		수량 : <input name ="order_detail_ea" id ="order_detail_ea" class = "${f.menu_id}" type ="text" value="${f.order_detail_ea}"readonly="readonly"/>
		소계 : <input name ="order_detail_sum" id ="order_detail_sum" class = "${f.menu_id}" type ="text" value="${f.order_detail_sum}"readonly="readonly"/>
		개별가격 : <input name ="order_detail_sum" id ="menu_price" class = "${f.menu_id}" type ="text" value="${f.menu_price}"readonly="readonly"/>
		
		<button  type="button" id = "${f.menu_id}" class = "delbutton">삭제</button>
		<button  type="button" id = "${f.menu_id}" class = "plusbutton">+</button>
		<button  type="button" id = "${f.menu_id}" class = "minusbutton">-</button>
		</div>
	</c:forEach>

<br>
		<div>
			<input type="submit" id="addsubmit" value="수정">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/order_list">취소</a>
			<a href="${pageContext.request.contextPath}/order_delete?table_order_id=${order.table_order_id}">삭제</a>
		</div>
	</form>

</body>
</html>