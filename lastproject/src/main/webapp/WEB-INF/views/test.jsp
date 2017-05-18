<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<!-- 에이작스 테스트 -->
 <script>

	 $(document).ready(function () {
		 $('#tags').keyup(function(){
			$('.test').remove();
			var insert = $('#tags').val();
			var input ={"insert":insert};
			
			/* alert(insert); */
			$.ajax({
                type:'GET',
				url: "${pageContext.request.contextPath}/json",
                dataType: "JSON",
                data : input,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                success: function (data) {
                	
                	decodeURIComponent( data.member_name );
                	console.log(insert);
                	console.log(data);
                	var member_phone = [];
                	
                	
	             for(var i=0; i<data.length; i++){
	                	member_phone.push(data[i]["member_phone"])		
	                	var mp = data[i]["member_phone"];
	             	
	             }
                	

                	
                    $.each(data, function () {
                    	
                        $('#tb').append("<tr class = 'test'><td>"
                        		+ this.member_phone + "</td><td>"
                        		+ this.member_name  +"</td><td>"
                        		+ this.member_join  +"</td><td>"
                        		+ this.member_point +"</td><td>"
                        		+ this.member_sign + "</td></tr>");
                    });
                    $('tr:odd').addClass('table table-striped');
	                },
	                error: function () { alert('에러발생'); }
	        	});
		 });
	 });
  </script>
 


  <script>
  $(function(){
  	var jsonString = '${jsonString}';
  	var memberList = eval("("+jsonString+")");
  /* var pp = memberList.member_name; */
 	var member_phone = new Array();
 	
  	var member_name = new Array();
  
  for(var i=0; i < memberList.length; i++){
		var memberObject = memberList[i];
	
		console.log(memberObject.member_phone)

		member_phone.push(memberObject.member_phone);
		member_name.push(memberObject.member_name);
		 
  		}
    
  
			$('#selbox').change(function(){
				var selbox = $('#selbox').val();
				alert(selbox);
				
				if(selbox == 1){
		    	$( "#tags" ).autocomplete({
			      source: member_phone
		    	});
				
				}else if(selbox ==2){
					$( "#tags" ).autocomplete({
					 source: member_name
				    });	
				}else if(selbox ==0){
					alert('선택하세요');
				}
		
	  	}); 
						
	});
			
 
  	
  </script>
</head>
<body>
<!--  <b>ㅡ2조 POS_SYSTEM 메뉴얼 입니다.ㅡ</b> 
</br>
 아직 진행 상태가 미흡한 점 양해 부탁드립니다.
 현재 상태는 수업시간에 배운 기본적인 게시판의 응용상태입니다
 로그인 후 cateGory에서 원하는 메뉴에 해당하는 사진을 클릭하시면
 해당 메뉴로 이동합니다.
 로그아웃시 /home을 주소창에 입력해도 home으로 이동할 수 없습니다.
 앞으로 몇가지 기능들을 더 추가할 예정입니다. -->

<div class="ui-widget">
	
  <label for="tags">Tags: </label>  
  <input id="tags" />
  
  
  <select id="selbox">
  <option value="0">선택하세요</option>
  <option value="1">핸드폰</option>
  <option value="2">이름</option>
  </select>
    <table class="table table-striped">
        <thead>
            <tr>
                <th>member_phone</th>
                <th>member_name</th>
                <th>member_point</th>
                <th>member_sign</th>
                <th>member_join</th>
            </tr>
        </thead>
        <tbody  id="tb">
         
                <tr>
                  
                </tr>
           
        </tbody>
    </table>
   <table class="table table-striped">
        <thead>
            <tr>
                <th>member_phone</th>
                <th>member_name</th>
                <th>member_point</th>
                <th>member_sign</th>
                <th>member_join</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="m" items="${list}">
                <tr>
                  <td><a href="${pageContext.request.contextPath}/member_information_view?member_phone=${m.member_phone}">${m.member_phone}</a></td>
                    <td id="tags"></td>
                    <td>${m.member_name}</td>
                    <td>${m.member_point}</td>
                    <td>${m.member_sign}</td>
                    <td>${m.member_join}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
              
</div>
</body>
</html> --%><?xml version="1.0" encoding="UTF-8"?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<title>http://www.blueb.co.kr</title>

<style type="text/css">
.highlight {
    background-color: #fff34d;
    -moz-border-radius: 5px; /* FF1+ */
    -webkit-border-radius: 5px; /* Saf3-4 */
    border-radius: 5px; /* Opera 10.5, IE 9, Saf5, Chrome */
    -moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); /* FF3.5+ */
    -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); /* Saf3.0+, Chrome */
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.7); /* Opera 10.5+, IE 9.0 */
}

.highlight {
    padding:1px 4px;
    margin:0 -4px;
}
#container {
    height: 400px; 
    min-width: 310px; 
    max-width: 800px;
    margin: 0 auto;
}
</style>

</head>

<body>

<!-- <strong>아래 문장에 있는 단어를 검색해보세요.</strong><br/><br/>

검색어입력 : <input type="text" id="text-search" />

<br/><br/>
너무 반짝 반짝<br/>
눈이 부셔 No No No No No<br/>
너무 깜짝 깜짝<br/>
놀란 나는 Oh Oh Oh Oh Oh<br/>
너무 짜릿 짜릿<br/>
몸이 떨려 Gee Gee Gee Gee Gee<br/>
Oh! 젖은 눈빛 Oh Yeah~<br/>
Oh! 좋은 향기 Oh Yeah Yeah Yeah~<br/><br/>

Oh! 너무 너무 예뻐<br/>
맘이 너무 예뻐<br/>
첫 눈에 반했어 꼭 짚은 Girl<br/>
Gee Gee Gee Gee Baby Baby Baby Baby<br/>
Gee Gee Gee Gee Baby Baby Baby Baby<br/>

 -->

<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources//modal/jquery-1.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources//modal/highlight.js"></script>
 --%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

<div id="container" style="width:100%; height:400px;"></div>

<input type="button" id="pbtn" value="클릭">


<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#pbtn').click(function(){
	/* alert('pbtn 실행 확인'); */		
	var date = new Array();
	var Ptotal = new Array();
	alert('pbtn 실행 확인');
		
	$.ajax({
			type:'GET',
			url:"${pageContext.request.contextPath}/graph",
			async:false,
			dataType:"JSON",
			success:function(data){
					
				
				/* 반복문 시작 */
				$.each(data, function(){
				
				date.push(this.payment_date);
				Ptotal.push(this.payment_total);
				/* Ptotal += this.payment_total+",";
				 */
				console.log('ajax 내부 each 내부'+date);
				
				});	
				
				 console.log('ajax 내부 each 외부'+date);
			}
		});
				
					console.log('ajax 외부 each 외부'+ date)
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
					        name: 'John',
					        data: Ptotal,
					        stack: 'male'
					    
					    }]
					});
				
	});
});
	
/* $(function() {
    $('#text-search').bind('keyup change', function(ev) {
        // pull in the new value
        var searchTerm = $(this).val();

        // remove any old highlighted terms
        $('body').removeHighlight();

        // disable highlighting if empty
        if ( searchTerm ) {
            // highlight the new term
            $('body').highlight( searchTerm );
        }
    });
}); */
</script>

</body>
</html>