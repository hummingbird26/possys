<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문수정</title>
<%@ include file="../modal/wide_menu.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$('.addbutton').click(function(){
			
			var cls = "."+this.id;
			var menu_price = $(cls).children('#menu_price').text();
			var menu_id = $(cls).children('#menu_id').text();
			var menu_name = $(cls).children('#menu_name').text();
			if($('#menu_frame').children(cls).text()==""){

			$('#menu_frame').append
			("<div class = "+menu_id+"> 메뉴코드 : <input name ='menu_id' id ='menu_id'"
					+"class ='"+menu_id+"' type ='text' value='"+menu_id+"'readonly='readonly'/> "
					+"메뉴명 : <input name ='menu_name' id ='menu_name'"
					+"class ='"+menu_id+"' type ='text' value='"+menu_name+"'readonly='readonly'/> "
					+"수량 : <input name ='order_detail_ea' id ='order_detail_ea'"
					+"class ='"+menu_id+"' type ='text' value='1'readonly='readonly'/> "
					+"소계 : <input name ='order_detail_sum' id ='order_detail_sum'"
					+"class ='"+menu_id+"' type ='text' value='"+menu_price+"'readonly='readonly'/> "
					+"개별가격 : <input name ='menu_price' id ='menu_price'"
					+"class ='"+menu_id+"' type ='text' value='"+menu_price+"'readonly='readonly'/> "
					+"<button  type='button' id = '"+menu_id+"' class = 'delbutton'>삭제</button> "
					+"<button  type='button' id = '"+menu_id+"' class = 'plusbutton'>+</button> "
					+"<button  type='button' id = '"+menu_id+"' class = 'minusbutton'>-</button></div> "
					 
					)
			}

			
			
			
		});
		
		
		$('.catebutton').click(function(){
			var cls = "."+this.id;
			alert(cls+"히든");
			$('.all').hide();
			$(cls).show();
			
		});
		
		$(document).on("click",".delbutton",function(){
			
			var cls = "."+this.id;
			alert(cls);
			$('#menu_frame').children(cls).remove();
		});
		
		$(document).on("click",".plusbutton",function(){
			
			var cls = "."+this.id;
			var now = $(cls).children('#order_detail_ea').val();
			now = parseInt(now)+1;
			var price = $(cls).children('#menu_price').val();
			var total = now*price
			$(cls).children('#order_detail_ea').val(now);
			$(cls).children('#order_detail_sum').val(total);
			
			/* alert(total); */
			
		});
		
		$(document).on("click",".minusbutton",function(){
			
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
<body>

<br/><br/><br/>


<form id="addform" action="${pageContext.request.contextPath}/order_action" method="post">
		<input name = "table_order_id" id = "table_order_id" class = "${result_id}" type = "text" value = "${result_id}" hidden="hidden"/>
		<input name = "table_order_num" id = "table_order_num" type = "text"/>
		<div id = "menu_frame">	
	<c:forEach var="f" items="${order_list}">
		<div class = "${f.menu_id}"> 
		메뉴코드 : <input name ="menu_id" id ="menu_id" class = "${f.menu_id}" type ="text" value="${f.menu_id}"readonly="readonly"/>
		메뉴명 : <input name ="menu_name" id ="menu_name" class = "${f.menu_id}" type ="text" value="${f.menu_name}"readonly="readonly"/>
		수량 : <input name ="order_detail_ea" id ="order_detail_ea" class = "${f.menu_id}" type ="text" value="${f.order_detail_ea}"readonly="readonly"/>
		소계 : <input name ="order_detail_sum" id ="order_detail_sum" class = "${f.menu_id}" type ="text" value="${f.order_detail_sum}"readonly="readonly"/>
		개별가격 : <input name ="menu_price" id ="menu_price" class = "${f.menu_id}" type ="text" value="${f.menu_price}"readonly="readonly"/>
		
		<button  type="button" id = "${f.menu_id}" class = "delbutton">삭제</button>
		<button  type="button" id = "${f.menu_id}" class = "plusbutton">+</button>
		<button  type="button" id = "${f.menu_id}" class = "minusbutton">-</button>
		</div>
	</c:forEach>
		</div>

<br>
		<div>
			<input type="submit" id="addsubmit" value="주문">
			<!-- <input type="reset" id="reset" value="초기화"> -->
			<%-- <a href="${pageContext.request.contextPath}/order_list">취소</a> --%>
			<%-- <a href="${pageContext.request.contextPath}/order_delete?table_order_id=${order.table_order_id}">삭제</a> --%>
		</div>
	</form>
	
<h1>메뉴 목록</h1>
<button class = "catebutton" id = "all"type = "button">전체</button>
<button class = "catebutton" id = "bab"type = "button">밥</button>
<button class = "catebutton" id = "chi"type = "button">치킨</button>
<button class = "catebutton" id = "ham"type = "button">햄버거</button>
<div>전체 메뉴 목록 ${menucount}</div>
	<table border=1>
		<thead>
			<th>메뉴코드</th>
			<th>메뉴명</th>
			<th>상품카테고리</th>
			<th>가격</th>
			<th>할인여부</th>
			<th>칼로리</th>
			<th>수정 </th>
			<th>식재별 소비 </th>			
		</thead>
		
		<tbody>
			<c:forEach varStatus="status" var="m" items="${menu_list}">
			<tr class = "all ${m.menu_cate} ${m.menu_id}">			
				<!-- 사진 추가부분 -->
				<td name = "newname" id = "newname" class = "${m.menu_id} ${m.menu_cate}"><img src = "${m.newname}" width = "120" height= "120"></td>
				<td name = "menu_id" id = "menu_id" class = "${m.menu_id} ${m.menu_cate}">${m.menu_id}</td>
				<td name = "menu_name" id = "menu_name" class = "${m.menu_id} ${m.menu_cate}">${m.menu_name}</td>
				<td name = "menu_cate" id = "menu_cate" class = "${m.menu_id} ${m.menu_cate}">${m.menu_cate}</td>
				<td name = "menu_price" id = "menu_price" class = "${m.menu_id} ${m.menu_cate}">${m.menu_price}</td>
				<td name = "menu_sprice" id = "menu_sprice" class = "${m.menu_id} ${m.menu_cate}">${m.menu_sprice}</td>
				<td name = "menu_kcal" id = "menu_kcal" class = "${m.menu_id} ${m.menu_cate}">${m.menu_kcal}</td>
				<td><a href="${pageContext.request.contextPath}/menu_view?menu_id=${m.menu_id}">수정</a></td>
				<td><a href="${pageContext.request.contextPath}/menu_per_view?menu_id=${m.menu_id}&menu_name=${m.menu_name}">소비</a></td>
				<td><button class = "addbutton" id = "${m.menu_id}"type = "button">추가</button></td>
			</tr>
			</c:forEach>
		</tbody>
		
	</table>
	
	

</body>
</html>