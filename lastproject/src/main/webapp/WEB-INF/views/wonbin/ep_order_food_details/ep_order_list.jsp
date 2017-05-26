<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 숫자포맷변환 라이브러리 --> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>발주·주문 목록</title>
<%-- <%@ include file="../../modal/wide_menu.jsp" %> --%>
<style type="text/css">
  [class*="col-"] {
  padding: 8px;
  border: 1px solid gray;  
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		
		
		// 입고등록 폼 전역변수
		var ep_id;
		var ep_name;
		var food_id;
		var food_name;
		var ep_order_ea;
		var ep_order_food_shelflife = Array();
		//입고예정일 계산 jquery
// 		var date = $('.date').html();
// 		var d_date = new Date(date);
// 		console.log(d_date);
// 		console.log(d_date.toLocaleString()); // 값 확인
// 		d_date.setDate(d_date.getDate()-20); // 20일 빼기
// 		console.log(d_date.toLocaleString());
// 		d_date.setMonth(d_date.getMonth()+1); // 달수는 0~11로 나오니 +1 시켜준다.
// 		d_date.setDate(d_date.getDate()+3); //3일 더하기
// 		var resultDate = d_date.getFullYear()+'-'+d_date.getMonth()+'-'+d_date.getDate();
		var count = 0;
		var date = $('.date');	
		var p_date = $('.p_date');
		for(var i=0;i<date.length;i++){
			var d_date = date[i].value;
			var _d_date = new Date(d_date);
// 			console.log(_d_date);
			_d_date.setMonth(_d_date.getMonth()+1);
			_d_date.setDate(_d_date.getDate()+3);
			var resultDate = _d_date.getFullYear()+'-'+_d_date.getMonth()+'-'+_d_date.getDate();
			p_date[i] = resultDate
			$('.p_date').eq(i).html(p_date[i]); // p_date 클래스 배열 i번재 html에 p_date[i] 담긴값을 넣음.
			count++;			
		}
// 		console.log(p_date[0]+'<<<0번째');
// 		console.log(p_date[1]+'<<<1번째');
		//동적으로 입고등록창 열기를 위한 ajax
	$(document).on('click','#wh_sub',function(){
		
		var wh_bt = $('#wh_sub').val(); //등록버튼 val()값 가져옴
		alert(wh_bt);
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/ep_wh_add_form",
			data : "ep_order_id="+wh_bt,
			dataType : "JSON",
			success : function(data){
				alert('성공');
// 				console.log(data[0].ep_order_id);
				var ep_order_id = data[0].ep_order_id;
				$('#ep_order_id').html("발주코드 : "+ep_order_id);
				$.each(data,function(){
// 					console.log(this.ep_id+"<<<<<");
					
					ep_id = this.ep_id;
					ep_name = this.ep_name;
					food_id = this.food_id;
					food_name = this.food_name;
					ep_order_ea = this.ep_order_ea;
					console.log(ep_id+ep_name+food_id+food_name+ep_order_ea)
					$('#wh_body').append("<tr>"
							+"<td>"+ep_id+"</td>"
							+"<td>"+ep_name+"</td>"
							+"<td>"+food_id+"</td>"
							+"<td>"+food_name+"</td>"
							+"<td>"
							+'<input id="ep_order_wh_ea" name="ep_order_wh_ea" type="text" value="'+ep_order_ea+'">'
							+'<button class="add" id="add" type="button" value="ep_order_wh_ea">+</button>'
							+'<button id="del" type="button" value="ep_order_wh_ea">-</button>'
							+"</td>"
							+"<td>"
							+'<input id="ep_order_food_shelflife" name="ep_order_food_shelflife" type="date"/>'
							+"</td>"
							+"<td>"
							+'<input type="text" value="원" id="ep_order_unit_price" name="ep_order_unit_price"/>'
							+"</td>"
							+"<td>"
							+'<input type="text" value="합계" id="ep_order_total_price" name="ep_order_total_price"/>'
							+"</td>"							
							+"</tr>")
							
						});
			},			
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
			}
			
		}) // ajax		
	}) //입고등록 폼
	// 입고등록 액션
	$(document).on('click','#wh_submit',function(){
		ep_order_food_shelflife.push($('#ep_order_food_shelflife').val())
		console.log(ep_order_food_shelflife[0]);
	})
	
	}); //ready
	</script>
</head>
<body>
<%-- <jsp:useBean id="today" class="java.util.Date"/> <!-- 현재 날짜 --> --%>

<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>발주·주문 목록</h1>

	<div class="col-sm-4">
		<h4>발주·주문 목록 수 : ${_ep_o_count}</h4>
		<br>
		<div style="overflow:auto;height:500px;">
		<table class="chkclass" border=1>
			<thead>
				<tr style='position:relative;top:expression(this.offsetParent.scrollTop);background:black;color:white;" align="left"'>
					<th>번호</th>
					<th>발주코드</th>
					<th>발주일자</th>
					<th>입고예정일자</th>
					<th>등록</th>
					<th>상세보기</th>
				</tr>
			</thead>
			<tbody style='width:100%;max-height:100px;overflow:auto;'>
				<c:forEach varStatus="status" var="o" items="${list}">
				<tr>					
					<td>${(_ep_o_count-status.index)}</td>
					<td>${o.ep_order_id}</td>
					<td>${o.ep_order_date}<input class="date"type="hidden" value="${o.ep_order_date}"/></td>
					<td class="p_date"></td>
					<td><button class="wh_sub" id="wh_sub" type="button" value="${o.ep_order_id}">입고등록</button></td>
					<td><button id="o_sangse" type="button">상세보기</button></td>										
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>	
	</div> <!-- 발주/주문목록 div끝 -->
	<div class="col-sm-6">
	<h4>입고 등록</h4>
		<span id="ep_order_id"></span>
		<div style="overflow:auto;height:500px;">
		<table  border=1>
			<thead>
				<tr style='position:relative;top:expression(this.offsetParent.scrollTop);background:black;color:white;" align="left"'>
					<th>업체코드</th>
					<th>업체명</th>
					<th>식재코드</th>
					<th>상품명</th>
					<th>수량</th>
					<th>유통기한</th>
					<th>단가</th>
					<th>소계</th>
				</tr>
			</thead>
			<tbody id="wh_body" style='width:100%;max-height:100px;overflow:auto;'>
				<!-- ajax append 들어감 -->				
			</tbody>
		</table>
<%-- 			<form id="wh_form" action="${pageContext.request.contextPath}/ep_order_add" method="post"> --%>
<!-- 				hidden 처리 하고 값 보냄 // 업체코드,식재코드 등등 -->
<!-- 				<input type="hidden" id="food_id" name="food_id" value=""/> -->
<!-- 				<input type="text" id="ep_id" name="ep_id" value="ep_id"/> -->
<!-- 				<input type="text" id="ep_order_wh_ea" name="ep_order_wh_ea" value="ep_order_wh_ea"> -->
<!-- 				<input type="date" id="ep_order_food_shelflife" name="ep_order_food_shelflife"/> -->
<!-- 				<input type="text" value="원" id="ep_order_unit_price" name="ep_order_unit_price"/> -->
<!-- 				<input type="text" value="합계" id="ep_order_total_price" name="ep_order_total_price"/> -->
				
				
				
<!-- 			</form> -->
			<button type="button" id="wh_submit" name="wh_sub" value="등록">등록</button>
			<button type="button" id="wh_cancel" name="wh_cancel" value="취소">취소</button>
		</div>
		
	</div>	
		
</body>
</html>