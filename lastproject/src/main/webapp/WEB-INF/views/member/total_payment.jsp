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
					        text: '매출 현황 조회'
					    },
					
					    xAxis: {
					    	
					    	categories:date
					    	
					    	
					    	/* categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
					         */
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
					        data: Ptotal,
					        stack: 'male'
					    
					    }]
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
					Highcharts.chart('Mcate', {
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
						        text: '현금매출 현황 조회'
						    },
						
						    xAxis: {
						    	
						    	categories:Mdate
						    	
						    	
						    	/* categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
						         */
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
						        name: '현금 결제금액',
						        data: Mcate,
						        stack: 'male'
						    
						    }]
						});
					
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
						Highcharts.chart('CDcate', {
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
						        text: '카드 매출현황 조회'
						    },
						
						    xAxis: {
						    	
						    	categories:CDate
						    	
						    	
						    	/* categories: ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
						         */
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
						        name: '카드 결제금액',
						        data: CDcate,
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
<div id="Mcate" style="width:100%; height:100%;"></div>
<div id="container" style="width:100%; height:100%;"></div>
<div id="CDcate" style="width:100%; height:100%;"></div>

<!-- <input type="button" id="pbtn" value="클릭"> -->
</body>
</html>