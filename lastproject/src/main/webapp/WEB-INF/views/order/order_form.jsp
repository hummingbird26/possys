<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  
	<style>
	.addbutton{
	    background-color: #4CAF50;
	    border: none;
	    color: white;
	    padding: 15px 32px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	}
/* 		.catebutton{
	    background-color: #4CAF50;
	    border: none;
	    color: white;
	    padding: 15px 32px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 16px;
	    margin: 4px 2px;
	    cursor: pointer;
	} */
	</style>
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문수정</title>
<%@ include file="../modal/wide_menu_order.jsp" %>
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
			$('.hid').hide();
			
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
<style rel="stylesheet">
body {
  background-color: #91ced4;
}
body * {
  box-sizing: border-box;
}

.header {
  background-color: #327a81;
  color: white;
  font-size: 1.5em;
  padding: 1rem;
  text-align: center;
  text-transform: uppercase;
}

img {
  border-radius: 50%;
  height: 60px;
  width: 60px;
}

.table-users {
  border: 1px solid #327a81;
  border-radius: 10px;
  box-shadow: 3px 3px 0 rgba(0, 0, 0, 0.1);
  max-width: calc(100% - 2em);
  margin: 1em auto;
  overflow: hidden;
  width: 800px;
}

table {
  width: 100%;
}
table td, table th {
  color: #2b686e;
  padding: 10px;
}
table td {
  text-align: center;
  vertical-align: middle;
}
table td:last-child {
  font-size: 0.95em;
  line-height: 1.4;
  text-align: left;
}
table th {
  background-color: #daeff1;
  font-weight: 300;
}
table tr:nth-child(2n) {
  background-color: white;
}
table tr:nth-child(2n+1) {
  background-color: #edf7f8;
}

@media screen and (max-width: 700px) {
  table, tr, td {
    display: block;
  }
  .hid{
  	display : none;
  }

  td:first-child {
    position: absolute;
    top: 50%;
    -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
    width: 100px;
  }
  td:not(:first-child) {
    clear: both;
    margin-left: 100px;
    padding: 4px 20px 4px 90px;
    position: relative;
    text-align: left;
  }
  td:not(:first-child):before {
    color: #91ced4;
    content: '';
    display: block;
    left: 0;
    position: absolute;
  }
/*   td:nth-child(2):before {
    content: 'Name:';
    
  }
  td:nth-child(3):before {
    content: 'Email:';
  }
  td:nth-child(4):before {
    content: 'Phone:';
  }
  td:nth-child(5):before {
    content: 'Comments:';
  } */

  tr {
    padding: 10px 0;
    position: relative;
  }
  tr:first-child {
    display: none;
  }
}
@media screen and (max-width: 500px) {
  .header {
    background-color: transparent;
    color: white;
    font-size: 2em;
    font-weight: 700;
    padding: 0;
    text-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
  }

  img {
    border: 3px solid;
    border-color: #daeff1;
    height: 150px;
    margin: 0.5rem 0;
    width: 150px;
  }

  td:first-child {
    background-color: #c8e7ea;
    border-bottom: 1px solid #91ced4;
    border-radius: 10px 10px 0 0;
    position: relative;
    top: 0;
    -webkit-transform: translateY(0);
            transform: translateY(0);
    width: 100%;
  }
  td:not(:first-child) {
    margin: 0;
    padding: 5px 1em;
    width: 100%;
  }
  td:not(:first-child):before {
    font-size: .8em;
    padding-top: 0.3em;
    position: relative;
  }
  td:last-child {
    padding-bottom: 1rem !important;
  }

  tr {
    background-color: white !important;
    border: 1px solid #6cbec6;
    border-radius: 10px;
    box-shadow: 2px 2px 0 rgba(0, 0, 0, 0.1);
    margin: 0.5rem 0;
    padding: 0;
  }

  .table-users {
    border: none;
    box-shadow: none;
    overflow: visible;
  }
}

</style>

</head>
<body>


<br/><br/><br/>


<form id="addform" action="${pageContext.request.contextPath}/order_action" method="post">
		<input name = "table_order_id" id = "table_order_id" class = "${result_id}" type = "text" value = "${result_id}" hidden="hidden"/>
		<input name = "table_order_num" id = "table_order_num" type = "text"/>
		<div id = "menu_frame">	

		</div>

<br>
		<div>
			<input type="submit" id="addsubmit" value="주문">
			<!-- <input type="reset" id="reset" value="초기화"> -->
			<%-- <a href="${pageContext.request.contextPath}/order_list">취소</a> --%>
			<%-- <a href="${pageContext.request.contextPath}/order_delete?table_order_id=${order.table_order_id}">삭제</a> --%>
		</div>
	</form>
	


<div class = "table-users">
	<div class = "header">
<!-- 	<button class = "catebutton" id = "all"type = "button">전체</button>
	<button class = "catebutton" id = "bab"type = "button">밥</button>
	<button class = "catebutton" id = "chi"type = "button">치킨</button>
	<button class = "catebutton" id = "ham"type = "button">햄버거</button> -->
	 </div>
	<table>
	<tbody>
			<c:forEach varStatus="status" var="m" items="${menu_list}">
			<tr class = "all ${m.menu_cate} ${m.menu_id}">			
				<!-- 사진 추가부분 -->
				<td name = "newname" id = "newname" class = "${m.menu_id} ${m.menu_cate}"><img src = "${m.newname}"></td>
				<td name = "menu_id" id = "menu_id" class = "${m.menu_id} ${m.menu_cate} hid" style = "display:none">${m.menu_id}</td>
				<td name = "menu_name" id = "menu_name" class = "${m.menu_id} ${m.menu_cate}">${m.menu_name}</td>
				<td name = "menu_cate" id = "menu_cate" class = "${m.menu_id} ${m.menu_cate} hid" style = "display:none">${m.menu_cate}</td>
				<td name = "menu_price" id = "menu_price" class = "${m.menu_id} ${m.menu_cate}">${m.menu_price}</td>
				<td name = "menu_sprice" id = "menu_sprice" class = "${m.menu_id} ${m.menu_cate} hid" style = "display:none">${m.menu_sprice}</td>
				<td name = "menu_kcal" id = "menu_kcal" class = "${m.menu_id} ${m.menu_cate}">${m.menu_kcal}kcal</td>
				<!-- <td>테스트용 문구 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</td> -->
				<td><button class = "addbutton" id = "${m.menu_id}"type = "button">추가</button></td>
			</tr>
			</c:forEach>
		</tbody>
		
	</table>

</div>
	
	

</body>
</html>