<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Demo fsortable</title>
    <script src="${pageContext.request.contextPath}/resources/table/jquery-1.10.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/table/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/src/jquery-fsortable.js"></script>
    <script src="${pageContext.request.contextPath}/resources/demo/demo.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/demo/demo.css">
<script src="${pageContext.request.contextPath}/resources/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/dist/sweetalert.css">
<style>
swal({
  title: "An input!",
  text: "Write something interesting:",
  type: "input",
  showCancelButton: true,
  closeOnConfirm: false,
  animation: "slide-from-top",
  inputPlaceholder: "Write something"
})
</style>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	
	$(document).on("click",".table_move",function(){
		
		var table_order_id =  $(this).val();
		/* 
		alert(table_order_id);
 		 */
		
		
	for(var i=0; i<15; i++){
		var k = parseInt(i) +1;
		var cls = '.'+k;
		$(cls).detach(":contains('사용중인 테이블')");
		
		}
	
		$('.t1').click(function(){
			var table_num = $(this).attr("value");
		/* 	alert(table_num); */
			
				var result = confirm('테이블을 변경 하시겠습니까?');
				if(result){
				 	var input = {"table_order_id":table_order_id,"table_num":table_num};
					$.ajax({
						 type:'POST',
						 url: "${pageContext.request.contextPath}/table_move",
						 dataType: "JSON",
						 data: input,
				         contentType: "application/x-www-form-urlencoded; charset=UTF-8",
				         success:function(data){
				        	/* alert('성공'); */
				         }
					});
					 location.reload();
				}else{
					
				} 
			
			});	 
		
	}); 
});
</script>

<script>
$(document).ready(function(){
	/* alert('ttt');
	alert($('.t1').attr("value")); */
	/* var table_state = new Array(); */

	playAlert = setInterval(function() {
	var t_num = new Array();
	var db_num = new Array();
	var menu_name = new Array();
	var order_detail_ea = new Array();	
	var order_detail_sum = new Array();
	
	
	var menu_name = new Array();
	var menu_price = new Array();
	var order_detail_ea = new Array();
	var order_detail_sum = new Array();
	var order_detail_end = new Array();
	var table_order_end = new Array();
	var table_order_id = new Array();
	for(var i=1; i<=15; i++){
		var cls = '.'+i
		t_num[i-1] = $(cls).attr("value");
		/* alert(t_num[i]); */
	}
	
	/* alert(t_num); */
	
	$.ajax({
		 type:'GET',
		 url: "${pageContext.request.contextPath}/table_state",
         dataType: "JSON",
         contentType: "application/x-www-form-urlencoded; charset=UTF-8",
         success:function(data){
         		/* alert('데이터 통신 실행'); */
         		$.each(data, function(){
         			db_num.push(this.table_order_num);
         			menu_name.push(this.menu_name);
         			order_detail_ea.push(this.order_detail_ea);
         			order_detail_sum.push(this.order_detail_sum);
         			table_order_id.push(this.table_order_id);
         			/* console.log(this.table_order_end); *//* 
         			console.log(t_num+"ajax내부"+"each내부"+"t_num값");
         			console.log(db_num+"ajax내부"+"each내부"+"db_num값"); */
         			/* table_state.push(this.table_order_end);
         			this.table_order_num */
         		});
         		console.log(db_num+"ajax내부"+"each외부"+"db_num값");
         		console.log(menu_name+"ajax내부"+"each외부"+"menu_name값");
     			console.log(order_detail_sum+"ajax내부"+"each외부"+"order_detail_sum값");
     			console.log(table_order_id+"ajax내부"+"each외부"+"table_order_id값");
     			for(var i = 0; i < 15 ; i++){

      				var k = parseInt(i) +1;
     				var cls = '.'+k
     				var test1 = " ";
     				$(cls).html(i+1+"<br/>미사용")
     				$(cls).attr('style','background-color:#FFFFF0');
         			for(var j = 0; j< db_num.length; j++){

         				 if(t_num[i]==db_num[j]){
         					
/*          					$('#table_move').click(function(){
         							
         						$(cls).remove();
         
         						
         					}); */
						
         					 	var test2 =table_order_id[j]; 
								test1  = test1+menu_name[j]+" "+"*"+" "+order_detail_ea[j]+"<br>"
								
             				console.log(cls);
         					$(cls).html("<font><b>사용중인 테이블</b></font>"+"<br/><br/>"+test1+"<br/><button class='table_move' value='"+test2+"'>자리이동</button>")
         					$(cls).attr('style','background-color:red');
         					
         				 
         				 }
         			}
         		}	
         				
         	} 
		});
	 }, 600); 
	/* alert(table_state); */
	$('.t1').dblclick(function(){
		$(this).toggleClass('blue');
		var table_order_num = $(this).attr("value");
		var input = {"table_order_num":table_order_num}
		/* alert('test실행');
		alert(input); */
		
		
		
	$.ajax({
		 type:'GET',
		 url: "${pageContext.request.contextPath}/table_order",
         dataType: "JSON",
         data : input,
         contentType: "application/x-www-form-urlencoded; charset=UTF-8",
         success:function(data){
/*         	 alert('통신성공');
        	 alert(menu_name); */
        	
        	 
				/* if(result){
					
				} */
        		menu_name = [];
        		menu_price = [];
        		order_detail_ea = [];
        		order_detail_sum = [];
        		table_order_end = [];
        		table_order_id = [];
        		order_detail_end = [];
        		var total = 0;
        	$.each(data,function(){
        		order_detail_end.push(this.order_detail_end);
        		menu_name.push(this.menu_name);
        		menu_price.push(this.order_detail_sum/this.order_detail_ea);
        		order_detail_ea.push(this.order_detail_ea)
        		order_detail_sum.push(this.order_detail_sum); 
        		table_order_end.push(this.table_order_end); 
        		table_order_id.push(this.table_order_id);
        		total = parseInt(total)+parseInt(this.order_detail_sum);
        		
        	 });
        		if(table_order_id.length >0){
        			var result = new Array();
        			var result2 = "";	
        		for(var i = 0; i < table_order_id.length; i++){
        			result.push("메뉴명 : "+menu_name[i]
        			+" * "+order_detail_ea[i]
        			+" \n단품가격 : "+menu_price[i]
        			+" \n수량 합계 : "+order_detail_sum[i]
        			+" \n주문상태 : "+order_detail_end[i]+"\n\n"
        			);
        			result2 = result2 + result[i];
        		}
        		sweetAlert(result2+" 총 합:"+total+"\n");
/*  			        	"메뉴명"+menu_name
			        	+"\n단품 가격"+menu_price
			        	+"\n수량"+order_detail_ea
			        	+"\n수량 합계"+order_detail_sum
			        	+"\n주문상태"+table_order_end
			        	+"\n총액 : "+total */
			        	
			        	
        		}
         /* console.log(table_order_id+"<<<<<<<<<ajax내부"+"each외부"); */
         },
         error: function () { alert('에러발생'); }
		});
	/* console.log(table_order_id+"ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡajax외부"+"each외부"); */
	
	});
});  
</script>
<meta charset="utf-8">
<%-- <%@ include file="../modal/wide_menu.jsp" %> --%>
  </head>
  <body>
 
    <div class="demo">
      <div class="bg">
     <c:forEach var="d" begin="1" end="15">
     <div  style="height:300; background-color: #FFFFF0" class="t1 ${d}" id="${d}" value="${d}" style="cursor: pointer;">${d}</div>
     </c:forEach>
   
	
 	
  </body>
</html>