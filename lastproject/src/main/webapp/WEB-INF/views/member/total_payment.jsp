<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>매출 현황 조회</title>
<%@ include file="../modal/wide_menu.jsp" %>
</head>
<body>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	if($('#pbtn').val()==null){
		/* alert('조회하실 목록을 선택하세요'); */
		 $('#container').remove(); 
		 $('#C_container').remove();
		 
	}
	$('#pbtn').change(function(){
	var selbox = $('#pbtn').val();
	 /* alert(selbox+'pbtn 실행 확인'); */
	var input ={"selbox":selbox};
	var date = new Array();
	var Ptotal = new Array();
	
	var Mdate = new Array();
	var Mcate = new Array();
	
	var CDate = new Array();
	var CDcate = new Array();
	/* alert('pbtn 실행 확인'); */
	
	//통합매출내역	
	$.ajax({
			type:'GET',
			url:"${pageContext.request.contextPath}/graph",
			async:false,
			data:input,
			dataType:"JSON",
			success:function(data){
					
			
				
				/* 반복문 시작 */
				$.each(data, function(){
				date.push(this.payment_date);
				Ptotal.push(this.payment_total);
				
				/* Ptotal += this.payment_total+",";
				 */
				/* console.log('ajax 내부 each 내부'+date); */
				
				});	
				/*  console.log('ajax 내부 each 외부'+date); */
			}
		});
	//현금결제
	$.ajax({
		type:'GET',
		url:"${pageContext.request.contextPath}/Mcate",
		async:false,
		data:input,
		dataType:"JSON",
		success:function(data){
				
		
			
			/* 반복문 시작 */
			$.each(data, function(){
			Mdate.push(this.payment_date);
			Mcate.push(this.payment_total);
			
			/* console.log('ajax 내부 each 내부'+date); */
			
			});	
			 console.log('Mcate ajax 내부 each 외부'+Mcate+Mdate);
		}
	})
	
				
		//카드결제
		$.ajax({
			type:'GET',
			url:"${pageContext.request.contextPath}/CDcate",
			async:false,
			data:input,
			dataType:"JSON",
			success:function(data){
					
			
				
				/* 반복문 시작 */
				$.each(data, function(){
				CDate.push(this.payment_date);
				CDcate.push(this.payment_total);
				
				/* console.log('ajax 내부 each 내부'+date); */
				
				});	
				 console.log('CDate ajax 내부 each 외부'+CDate+CDcate);
			}
		})
				
					/* console.log('ajax 외부 each 외부'+ date) */
 				Highcharts.chart('container', {
					    chart: {
					        type: 'column',
					        options3d: {
					            enabled: true,
					            alpha: 15,
					            beta: 15,
					            viewDistance: 25,
					            depth: 40
					        }
					    },
					
					    title: {
					        text: '매출 현황 조회(정상 처리)'
					    },
					
					    xAxis: {
					    	
					    	categories:date
					    	
					    	
					    },
					
					    yAxis: {
					        allowDecimals: false,
					        min: 0,
					        title: {
					            text: 'Number of fruits'
					        }
					    },
					
					    tooltip: {
					        headerFormat: '<b>{point.key}</b><br>',
					        pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
					    },
					
					    plotOptions: {
					        column: {
					            stacking: 'normal',
					            depth: 40
					        }
					    },
					
					    series: [{
					        name: '전체 매출액',
					        data:  Ptotal,
					        stack: 'male'
					    
					    },{
					        name: '현금 매출액',
					        data: Mcate,
					        stack: 'male'
					    
					    },{
					        name: '카드 매출액',
					        data: CDcate,
					        stack: 'male'
					    
					    }]
					}); 
	var C_date = new Array();
	var C_Ptotal = new Array();
	
	var C_Mdate = new Array();
	var C_Mcate = new Array();
	
	var C_CDate = new Array();
	var C_CDcate = new Array();
	//통합매출내역(취소)	
	$.ajax({
			type:'GET',
			url:"${pageContext.request.contextPath}/C_graph",
			async:false,
			data:input,
			dataType:"JSON",
			success:function(data){
					
			
				
				/* 반복문 시작 */
				$.each(data, function(){
					C_date.push(this.payment_cancel_date);
					C_Ptotal.push(this.payment_cancel_total);
				
				/* Ptotal += this.payment_total+",";
				 */
				/* console.log('C_ajax 내부 each 내부'+C_date); */
				
				});	
				/*  console.log('ajax 내부 each 외부'+date); */
			}
		});
	//현금결제(취소)
	$.ajax({
		type:'GET',
		url:"${pageContext.request.contextPath}/C_Mcate",
		async:false,
		data:input,
		dataType:"JSON",
		success:function(data){
				
		
			
			/* 반복문 시작 */
			$.each(data, function(){
				C_Mdate.push(this.payment_cancel_date);
				C_Mcate.push(this.payment_cancel_total);
			
			/* console.log('ajax 내부 each 내부'+date); */
			
			});	
			 console.log('C_Mcate ajax 내부 each 외부'+C_Mcate+C_Mdate);
		}
	})
	
				
		//카드결제(취소)
		$.ajax({
			type:'GET',
			url:"${pageContext.request.contextPath}/C_CDcate",
			async:false,
			data:input,
			dataType:"JSON",
			success:function(data){
					
			
				
				/* 반복문 시작 */
				$.each(data, function(){
					C_CDate.push(this.payment_cancel_date);
					C_CDcate.push(this.payment_cancel_total);
				
				/* console.log('ajax 내부 each 내부'+date); */
				
				});	
				 console.log('C_CDate ajax 내부 each 외부'+C_CDate+C_CDcate);
			}
		})					
				//취소 결제내역 그래프
				Highcharts.chart('C_container', {
				    chart: {
				        type: 'column',
				        options3d: {
				            enabled: true,
				            alpha: 15,
				            beta: 15,
				            viewDistance: 25,
				            depth: 40
				        }
				    },
				
				    title: {
				        text: '매출 현황 조회(취소 처리)'
				    },
				
				    xAxis: {
				    	
				    	categories:C_date
				    	
				    	
				    },
				
				    yAxis: {
				        allowDecimals: false,
				        min: 0,
				        title: {
				            text: 'Number of fruits'
				        }
				    },
				
				    tooltip: {
				        headerFormat: '<b>{point.key}</b><br>',
				        pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
				    },
				
				    plotOptions: {
				        column: {
				            stacking: 'normal',
				            depth: 40
				        }
				    },
				
				    series: [{
				        name: '전체 취소내역',
				        data:  C_Ptotal,
				        stack: 'male'
				    
				    },{
				        name: '현금 취소내역',
				        data: C_Mcate,
				        stack: 'male'
				    
				    },{
				        name: '카드 취소내역',
				        data: C_CDcate,
				        stack: 'male'
				    
				    }]
				});
				

								
			});
	});
</script>

</br>
</br>
</br>
<h1>조회하실 내역을 선택하세요</h1>
<select id="pbtn">
<option value="null">선택하세요</option>
<option value="%Y-%m-%d">일자별 조회</option>
<option value="%Y-%m">월별 조회</option>
<option value="%Y">연도별 조회</option>
</select>

<div id="container" style="width:100%; height:100%;"></div>
<div id="C_container" style="width:100%; height:100%;"></div>

<!-- <input type="button" id="pbtn" value="클릭"> -->
</body>
</html>