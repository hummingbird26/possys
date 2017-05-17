<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>발주 업체 관리</title>
<script type="text/javascript">
	$(document).ready(function(){
			//실행시키면 ep_id div 태그를 displat:none 시켜라
		$('#ep_id_div').css("display","none");
				//식재코드 삭제시 카운트 
		$(document).on('click','#chk_delete',function(){
// 			alert($('input[name=food_id]').length);
// 			input 태그 중 name이 food_id인 갯수 가 2보다 작으면
			if($('input[name=food_id]').length < 2){
				alert('더 이상 삭제 할 수 없습니다.');
			}else{
				$(this).parent().remove();
			}
		});
				
		//@@@@@@@@@@@@@@@@@@@@@@업체 select 값 정보 view 표시@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
		
		//업체면 셀렉트시 그 val()값
				//01_선택한 값 호출 확인
// 		var sel = $('#sel_ep_name option:selected').text();
// 		alert(sel);
				//02_선택 변경값 호출확인
	
		$('#sel_ep_name').change(function(){
			var chg_data = $(this).val()
				//03_다른 방법으로 선택 변경값 호출확인
// 			alert($(this).children('option:selected').text());
// 			alert(sel2);				
			if(chg_data == "선택"){
				//select 가 선택으로 되있으면 ep_id div 태그를 displat:none 시켜라
				$('#ep_id_div').css("display","none");				
// 				alert("선택이다");
			}else{
				//select 가 다른 업체명으로 선택 되었으면 ep_id div 태그를 displat:block 시켜라
				$('#ep_id_div').css("display","block");
// 				alert("선택이아니다")
				//04_ajax로 비동기식 업체정보호출
				var sel_id = $("#sel_ep_name option:selected").val(); //셀렉트 된 val 값을 가져옴
				var sel_name = $("#sel_ep_name option:selected").text(); // 셀렉트 된 text 값을 가져옴
// 				alert(sel_id);
// 				var sel_name = $(this).find("option[value='"+$(this).val()+"']").text(); // 셀렉트된 자식요소 value에 해당하는 text를 가져옴
// 				alert(sel_name);
// 				alert(sel_name);
				$.ajax({
					type :"POST", // 전송 방식
					cache : true,	// 캐쉬 안적으면 true
					contentType:"application/x-www-form-urlencoded; charset=UTF-8",
					url : "${pageContext.request.contextPath}/ajax/sel_ep",
					data : "ep_id="+$("#sel_ep_name option:selected").val(),/* +"&ep_name="+$("#sel_ep_name option:selected").text() */
					dataType : "JSON",
					success : function(data){
// 						console.log(data);
						var ep_id = data.ep_id;
						var ep_name = data.ep_name;
						var ep_phone = data.ep_phone;
						var ep_address = data.ep_address;
						var ep_director = data.ep_director;
						var ep_text = data.ep_text;
						$('#ep_id').val(ep_id);
						$('#ep_name').val(ep_name);
						$('#ep_phone').val(ep_phone);
						$('#ep_address').val(ep_address);
						$('#ep_director').val(ep_director);
						$('#ep_text').val(ep_text);
					},
					error : function(xhr, status, error){
						alert("실패");	
					}
				})
			}
		}); // sel_change
		
		//@@@@@@@@@@@@@@@@@@@@@@식재료 코드 중복 체크@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@	
		$(document).on('click','#chk_jungbok',function(){
			var obj = new Object(); //key, value형태로 저장할 Object
			var arr = new Array(); //Object를 배열로 저장할 Array
			//jstl 도 jquery에서 쓸수있다.
			<c:forEach var="f" items="${list}">
				arr.push("${f.food_id}");
			</c:forEach>
			console.log(arr);
								
// 			$.ajax({
// 				type:"POST",
// 				url : "${pageContext.request.contextPath}/ajax/food_chck"
// 				data : 
				
// 			});
			
		});
		
	}); //jquery Ready

</script>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<h1>발주 업체 관리</h1>





	<form id="addform" action="${pageContext.request.contextPath}/ep_manage_add_form" method="post">
		
		<div id="ep_id_div">업체코드 :
			 <input name="ep_id" id="ep_id" type="text" readonly="readonly"/>
		</div>
		
		<div>식재 코드 번호 : 
		<c:forEach var="f" items="${list}">
		<div>
			<input class="input_fo_id" name ="food_id" id ="food_id" type ="text" value="${f.food_id}" readonly="readonly"/>(${f.food_name})
			
			<button type="button" id="chk_delete">X</button>
		</div>
		</c:forEach>
		<br>			
		<div>
			<button type="button" id="chk_jungbok">식재 중복체크</button>
			
			<div style="visibility: hidden">
			<!-- 중복체크 클릭시 이상이없으면 checked 시킴 -->
			<!-- hidden type은 checked 속성이 없다
			checked 는 radio, checkbox에만 있다 그러므로 div속에 숨겨야한다 --> 
				<input type="checkbox" id="chk_jung" name="chk_jung"/>
			</div>
		</div>
		</div>
	
		<div>
		업체명 : <input name ="ep_name" id ="ep_name" type ="text"/>
		
		<select name = "sel_ep_name" id = "sel_ep_name">
			<option>선택</option>
			<c:forEach var="sel" items="${sel_list}">
			<option value="${sel.ep_id}">${sel.ep_name}</option>
			</c:forEach>
		</select>
		</div>
		<div>연락처 : <input name ="ep_phone" id ="ep_phone" type ="text" value="${ep_m.ep_phone}"/></div>
		<div>업체 담당자 : <input name ="ep_director" id ="ep_director" type ="text"/></div>
		<div>주소 : <input name ="ep_address" id ="ep_address" type ="text"/></div>
		<div>비고 : <input name ="ep_text" id ="ep_text" type ="text"/></div>
		
		

<br>
		<div>
			<input type="submit" id="addsubmit" value="등록">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/ep_manage_list">취소</a>
		</div>
	</form>
</body>
</html>