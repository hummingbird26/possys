<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- (날짜)숫자포맷변환 라이브러리 --> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>발주·주문 목록</title>
<%@ include file="../../modal/header.jsp" %>
<style type="text/css">
  
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('#div_wh').css("display","none"); // 입고등록 디스플레이 안보이기
		$('#div_sangse').css("display","none"); // 상세보기 디스플레이 안보이기
		$('.tr_reset').remove(); // 다른 버튼 클릭시 append로 추가 됐던 tr 구문 삭제
		// 입고등록 폼 전역변수
		var ep_id;
		var ep_name;
		var food_id;
		var food_name;
		var ep_order_ea;
		var ep_order_id;
		var ep_order_date;		
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
		//입고예정일 End
		
		//동적으로 상세보기 열기를 위한 ajax
	$(document).on('click','#o_sangse',function(){
		$('#div_wh').css("display","none");
		$('#div_sangse').css("display","block");
		$('.tr_reset').remove(); // 다른 버튼 클릭시 append로 추가 됐던 tr 구문 삭제
		$('.in_reset').remove(); // 다른 버튼 클릭스 append로 추가 됐던 intup 구문 삭제
		var ep_o_id = $(this).val();
				
		$.ajax({ // ajax 입력 등록폼과 일치하는 방식이니 ep_wh_add_form 으로 보냄
			type : "GET",
			url : "${pageContext.request.contextPath}/ajax/ep_wh_add_form",
			data : "ep_order_id="+ep_o_id,
			dataType : "JSON",
			success : function(data){
					
				$.each(data,function(){
// 					console.log(this.ep_id+"<<<<<");
					ep_order_id = this.ep_order_id;
// 					console.log(ep_order_id+'<<<< ep_order_id');
					$('#sangse_ep_order_id').html("발주코드 : "+ep_order_id);
					ep_id = this.ep_id;
					ep_name = this.ep_name;
					food_id = this.food_id;
					food_name = this.food_name;
					ep_order_ea = this.ep_order_ea;
					ep_order_date = this.ep_order_date;
// 					alert(ep_order_date);
// 					console.log(ep_id+ep_name+food_id+food_name+ep_order_ea)									
					$('#sangse_body').append("<tr class='tr_reset'>"
							+"<td class='ep_id'>"+ep_id+"</td>"
							+"<td class='ep_name'>"+ep_name+"</td>"
							+"<td class='food_id'>"+food_id+"</td>"
							+"<td class='food_name'>"+food_name+"</td>"
							+"<td>"
							+'<input class="_ep_order_ea" id="_ep_order_ea" name="ep_order_ea" type="text" value="'+ep_order_ea+'">'
							+'<button class="add" id="add" type="button" value="ep_order_ea">+</button>'
							+'<button id="_del" type="button" value="ep_order_ea">-</button>'
							+"</td>"
							+"<td>"
							+'<button id="order_del" type="button" value="'+ep_order_id+'/'+food_id+'">발주취소</button>'
							+"</td>"
							+"</tr>")
						
					$('#sangse_form').append("<div class='in_reset'>"
							+'<input class="sangse_input" type="hidden" id="_order_del" name="_order_del" value="'+ep_order_id+'/'+food_id+'"/>'//삭제버튼 클릭시 input 에 추가된 것도 삭제하기 위하여 삽입
							+'<input type="hidden" id="ep_order_id" name="ep_order_id" value="'+ep_order_id+'"/>'
							+'<input type="hidden" id="food_id" name="food_id" value="'+food_id+'"/>'
							+'<input class="ep_order_ea" type="hidden" id="ep_order_ea" name="ep_order_ea"/>'
							+"</div>")							
				}); //반복문 끝
									
			},			
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
			}			
		}) // 상세보기 ajax end
	}) // 상세보기 버튼 이벤트 end
	
									// 상세보기 재등록 submit
	$(document).on('click','#sangse_submit',function(){
// 		alert('등록버튼 클릭');
		var _ea = $('._ep_order_ea') //수량 클래스
		var ea = $('.ep_order_ea')
		
		for(var i=0; i<_ea.length; i++){
			ea[i].value = _ea[i].value //수량 hidden input value 값 세팅
		}
		// 현재날짜와 발주주문 날짜 비교후 1일 차이나면 submit 불가 (배송문제)
		var today = new Date(); //현재시간 변수에 담기
// 		alert(today);
		var order_day = new Date(ep_order_date);
// 		alert(order_day);
		var chk_day = (today.getTime() - order_day.getTime())/1000/60/60/24;
// 		alert(chk_day+"<< 차이");
		if(chk_day > 1){
			alert('발주 신청날의 1일이 지나서 수정이 불가능합니다.');
		}else{
			sangse_form.submit();	
		}
	})// 상세보기 재등록 submit end
	
										// 상세보기에서 발주취소 
	$(document).on('click','#sangse_cancel',function(){
// 		alert(ep_order_id);
	var re = confirm('해당 전체발주를 취소하시겠습니까?');
		if(re){
			var today = new Date(); //현재시간 변수에 담기
			var order_day = new Date(ep_order_date);
			var chk_day = (today.getTime() - order_day.getTime())/1000/60/60/24;
			if(chk_day > 1){
				alert('발주 신청날의 1일이 지나서 취소가 불가능합니다.');
			}else{
				$.ajax({
					type : "GET",
					url : "${pageContext.request.contextPath}/ajax/aj_sangse_cancel",
					data : "ep_order_id="+ep_order_id,
					success : function(data){
							alert('해당 전체발주를 취소하였습니다.');
							var cnt = 1;
							if(cnt == 1) {
							   location.reload(); // 한번 새로고침 시켜준다.
							   cnt = 0;
							}
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
					}
					
				})//ajax End
			}
		}
	}) //상세보기에서 발주취소 End
	
										//상세보기에서 해당 row 삭제 (input row도 같이 삭제)
	$(document).on('click','#order_del',function(){
		var o_del = $(this).val(); //해당 버튼의 val()값
// 		alert(o_del);
		var re = confirm('해당 식재료 발주를 취소하시겠습니까?');
		if(re){
			var today = new Date(); //현재시간 변수에 담기
			var order_day = new Date(ep_order_date);
			var chk_day = (today.getTime() - order_day.getTime())/1000/60/60/24;
			if(chk_day > 1){
				alert('발주 신청날의 1일이 지나서 취소가 불가능합니다.');
			}else{
				var sang_class = $('.sangse_input');
				if(sang_class.length > 1){ 			
					$(this).parent().parent().remove();		
					$('.sangse_input').each(function(){ //input 클래스 반복문으로 this 그자리에 val()값을 가져옴
						var o_in = $(this).val();
		//	 			alert(o_in);				
						if(o_del == o_in){ // 버튼 val()값과 input val()값이 같으면 삭제				
							$(this).parent().remove();
						}
					})
			//ajax 해당 식재 발주 취소시 DB 의 해당 발주주문이 삭제처리
				$.ajax({
					type: "post",
					url : "${pageContext.request.contextPath}/ajax/select_del",
					data : "o_del="+o_del,
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					success : function(data){
//  	 					alert('성공');
					},
					error : function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
					}						
				})//ajax end			
			}else{alert('발주 주문  1개 미만으론 삭제할수 없습니다.');}
		} // 발주신청일 1일 확인
		} // confirm 확인창 end
	})// 상세보기 row삭제 end
		
		
		
										//동적으로 입고등록창 열기를 위한 ajax
	$(document).on('click','#wh_sub',function(){
		$('#div_sangse').css("display","none");
		$('#div_wh').css("display","block");
		$('.tr_reset').remove(); // 다른 버튼 클릭시 append로 추가 됐던 tr 구문 삭제
		$('.in_reset').remove(); // 다른 버튼 클릭스 append로 추가 됐던 intup 구문 삭제
		var ep_o_id = $(this).val();
// 		alert(ep_o_id+"<-- 버튼 val() : 발주코드")
		
				// [첫번째 시도] 클래스를 주어 발주코드를 가져옴. (비효율)
// 		var wh_bt = Array();
// 		var _wh_bt = $('.wh_sub'); //등록버튼 클래스 배열로  값 가져옴
// 		// var _wh_bt = $('.wh_sub').val(); // 클래스 value값을 배열 방식으로 담음
// // 		console.log(_wh_bt+"<<<");
// // 		console.log(_wh_bt.length+"<<< 길이");
// 		for(var i=0;i<_wh_bt.length;i++){
// 			wh_bt[i] = _wh_bt[i].value;
// // 			console.log(wh_bt[i]+"<< i번째 배열");
// 			}		
// 		jQuery.ajaxSettings.traditional = true; //배열을 보내기 위해서 setting
				// [첫번째 시도] END
				
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/ajax/ep_wh_add_form",
			data : "ep_order_id="+ep_o_id,
			dataType : "JSON",
			success : function(data){
// 				alert('성공');

					// [첫번째 시도] 클래스를 주어 발주코드를 가져옴. (비효율)
// 					console.log(data[0][1].food_id+"<<<<<<<<data[0][1].food_id")
// 					console.log(data.length+"<<<<<data.length") 
// 					for(var i=0; i<data.length; i++){ //1차원 배열 크기
// 						for(var j=0; j<data[i].length; j++){ //2차원의 담은 배열 크기
// // 							console.log("("+i+","+j+")="+data[i][j].ep_order_id); //2차원 배열의 담긴값 확인
// 							if(wh_bt[i] == data[i][0]){								
// 							}
// 						}
// 					}
					// [첫번째 시도] END					
					
				$.each(data,function(){
// 					console.log(this.ep_id+"<<<<<");
					ep_order_id = this.ep_order_id;
// 					console.log(ep_order_id+'<<<< ep_order_id');
					$('#ep_order_id').html("발주코드 : "+ep_order_id);
					ep_id = this.ep_id;
					ep_name = this.ep_name;
					food_id = this.food_id;
					food_name = this.food_name;
					ep_order_ea = this.ep_order_ea;
// 					console.log(ep_id+ep_name+food_id+food_name+ep_order_ea)
									
					$('#wh_body').append("<tr class='tr_reset'>"
							+"<td class='ep_id'>"+ep_id+"</td>"
							+"<td class='ep_name'>"+ep_name+"</td>"
							+"<td class='food_id'>"+food_id+"</td>"
							+"<td class='food_name'>"+food_name+"</td>"
							+"<td>"
							+'<input class="_ep_order_wh_ea" id="_ep_order_wh_ea" name="ep_order_wh_ea" type="text" value="'+ep_order_ea+'">'
							+'<button class="add" id="add" type="button" value="ep_order_wh_ea">+</button>'
							+'<button id="del" type="button" value="ep_order_wh_ea">-</button>'
							+"</td>"
							+"<td>"
							+'<input class="_ep_order_food_shelflife" id="_ep_order_food_shelflife" name="ep_order_food_shelflife" type="date"/>'
							+"</td>"
							+"<td>"
							+'<input class="_ep_order_unit_price" type="text" value="0" id="_ep_order_unit_price" name="ep_order_unit_price"/>'
							+"</td>"
							+"<td>"
							+'<input class="_ep_order_total_price" type="text" value="0" id="_ep_order_total_price" name="ep_order_total_price"/>'
							+"</td>"							
							+"</tr>")
						
					$('#wh_form').append("<div class='in_reset'>"
							+'<input type="hidden" id="ep_order_id" name="ep_order_id" value="'+ep_order_id+'"/>'
							+'<input type="hidden" id="food_id" name="food_id" value="'+food_id+'"/>'
							+'<input class="ep_order_wh_ea" type="hidden" id="ep_order_wh_ea" name="ep_order_wh_ea"/>'
							+'<input class="ep_order_food_shelflife" type="hidden" id="ep_order_food_shelflife" name="ep_order_food_shelflife"/>'
							+'<input class="ep_order_unit_price" type="hidden" value="0" id="ep_order_unit_price" name="ep_order_unit_price"/>'
							+'<input class="ep_order_total_price" type="hidden" value="0" id="ep_order_total_price" name="ep_order_total_price"/>'
							+"</div>")							
				}); //반복문 끝
				// table 합계 화면에 자동으로 합계된 금액 들어가게하기
				var _ea = $('._ep_order_wh_ea')
				var _unit = $('._ep_order_unit_price')
				var _total = $('._ep_order_total_price')
				var total = $('.ep_order_total_price')
				$(document).on('change','.tr_reset',function(){
					for(var i=0; i<_total.length; i++){
						_total[i].value = parseInt(_ea[i].value) * parseInt(_unit[i].value);
					}
				})
				
			},			
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
			}
			
		}) // ajax		
	}) //입고등록 폼
										// 입고등록 액션	
	$(document).on('click','#wh_submit',function(){
// 		alert('등록버튼 클릭');
		var _ea = $('._ep_order_wh_ea') //수량 클래스
		var ea = $('.ep_order_wh_ea')
		var _life = $('._ep_order_food_shelflife') //유통기한 클래스
		var life = $('.ep_order_food_shelflife')
		var _unit = $('._ep_order_unit_price') // 단가
		var unit = $('.ep_order_unit_price')
		var _total = $('._ep_order_total_price')
		var total = $('.ep_order_total_price')		
		for(var i=0; i<_ea.length; i++){
			ea[i].value = _ea[i].value //수량 hidden input value 값 세팅
			life[i].value = _life[i].value //유통기한 hidden input value 값 세팅
			unit[i].value = _unit[i].value //단가 hidden input value 값 세팅
			total[i].value = _total[i].value // 합계 hidden input value 값 세팅
//			console.log(fo_life[i].value+"<< fo_life.value"+i+"번째");
		}
		wh_form.submit();		
	})
	
	
	//"+","-" 버튼 클릭시 수량 증감
	//동적으로 생성된 태그는 별도의 이벤트형식으로 지정 해줘야 함 .on
	$(document).on('click','#add',function(){
	 			//이전 형제 노드의 val()값을 add에 해당 value에 parseInt로 +1 해줘서 value에 담는다.
			var _add = $(this).prev().val();
			$(this).prev().val(parseInt(_add)+1);
// 			console.log(_add);
			var unit = $(this).parent().next().next().children().val();
			// add 버튼의 부모는 add버튼이 속한 <td> 태그 , 그 다음 형제요소는 유통기한이 속한 <td> 태그, 그 다음 형제요소는 단가가 속한 <td>태그, 그 자식요소는 단가 input입력 
// 			var total = $(this).parent().next().next().next().children().val();
// 			alert(unit+"<<< 단가") alert(total+"<<< 소계")
			var multi = parseInt((parseInt(_add)+1) * unit);
// 			alert(multi+"<< 곱하기")
			$(this).parent().next().next().next().children().val(multi);
			// 곱하기한값 삽입			
	})
	$(document).on('click','#del',function(){
			var _del = $(this).prev().prev().val();
					//parseInt 로 숫자 인식
			if(_del > 0){ // 0도 입력될수 있으니 0까지
				$(this).prev().prev().val(parseInt(_del)-1);
			}else{alert('더이상 감소 할수없습니다.');}
			var unit = $(this).parent().next().next().children().val();
			var multi = parseInt((parseInt(_del)-1) * unit);
			$(this).parent().next().next().next().children().val(multi);
	})
	$(document).on('click','#_del',function(){
			var _del = $(this).prev().prev().val();
					//parseInt 로 숫자 인식
			if(_del > 1){ // 1 이하로 삭제 불가
				$(this).prev().prev().val(parseInt(_del)-1);
			}else{alert('더이상 감소 할수없습니다.');}
			var unit = $(this).parent().next().next().children().val();
			var multi = parseInt((parseInt(_del)-1) * unit);
			$(this).parent().next().next().next().children().val(multi);
	}) // +,- End
	
	
	
	
	}); //ready
	</script>
</head>
<body>
<%-- <jsp:useBean id="today" class="java.util.Date"/> <!-- 현재 날짜 --> --%>


<h1>발주·주문 목록</h1>

	<div class="col-sm-5">
		<h4>발주·주문 목록 수 : ${_ep_o_count}</h4>
		<br>
		<div style="overflow:auto;height:500px;">
		<table class="chkclass table table-hover" border=1>
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
					<td><button class="o_sangse" id="o_sangse" type="button" value="${o.ep_order_id}">상세보기</button></td>										
				</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>	
	</div> <!-- 발주/주문목록 div끝 -->
	<div id="div_wh" class="col-sm-6">
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
			<form id="wh_form" action="${pageContext.request.contextPath}/ep_order_add" method="get"> <!-- 배열이라서 그런지 get방식으로 보낸다 -->
<!-- 				hidden 처리 하고 값 보냄 // 업체코드,식재코드 등등 -->
							
			</form>
			<button type="button" id="wh_submit" name="wh_submit" value="등록">등록</button>
			<button type="button" id="wh_cancel" name="wh_cancel" value="취소">취소</button>
		</div>		
	</div> <!-- 입고등록 폼 end -->
	
	<!-- 상세보기 보기 폼 start -->
	<div id="div_sangse" class="col-sm-6">
	<h4>상세보기</h4>
		<span id="sangse_ep_order_id"></span>
		<div style="overflow:auto;height:500px;">
		<table  border=1>
			<thead>
				<tr style='position:relative;top:expression(this.offsetParent.scrollTop);background:black;color:white;" align="left"'>
					<th>업체코드</th>
					<th>업체명</th>
					<th>식재코드</th>
					<th>상품명</th>
					<th>발주 신청 수량</th>
					<th>발주 취소</th>					
				</tr>
			</thead>
			<tbody id="sangse_body" style='width:100%;max-height:100px;overflow:auto;'>
				<!-- ajax append 들어감 -->				
			</tbody>
		</table>
			<form id="sangse_form" action="${pageContext.request.contextPath}/ep_order_update" method="post"> 
<!-- 				hidden 처리 하고 값 보냄 // 업체코드,식재코드 등등 -->
<!-- 				<input type="text" id="ep_order_id" name="ep_order_id"/> -->
<!-- 				<input type="text" id="food_id" name="food_id"/> -->
							
			</form>
			<button type="button" id="sangse_submit" name="sangse_submit">발주 재등록</button>
			<button type="button" id="sangse_cancel" name="sangse_cancel">발주 취소</button>
		</div>		
	</div> <!-- 상세보기 end -->	
			
</body>
</html>