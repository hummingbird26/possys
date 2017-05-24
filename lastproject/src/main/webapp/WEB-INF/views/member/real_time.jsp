<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
 <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<%@ include file="../modal/wide_menu.jsp" %>

<style type="text/css">
.highlight {
    background-color: #fff34d;
    -moz-border-radius: 2px; /* FF1+ */
    -webkit-border-radius: 2px; /* Saf3-4 */
    border-radius: 2px; /* Opera 10.5, IE 9, Saf5, Chrome */
    -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); /* FF3.5+ */
    -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1); /* Saf3.0+, Chrome */
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1); /* Opera 10.5+, IE 9.0 */
}

.highlight {
    padding:1px 1px;
    margin:0 2px;
}
</style>
</head>

<body>
 <script>

	 $(document).ready(function () {
		 if($('#tags').val()==""){
			 var insert = $('#tags').val();
			 var input ={"insert":insert};
				
			 $.ajax({
	                type:'GET',
					url: "${pageContext.request.contextPath}/E_real_time",
	                dataType: "JSON",
	                data : input,
	                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
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
		 		}
			 });
			 
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources//modal/jquery-1.5.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources//modal/highlight.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('#tags').keyup(function(){
			var insert = $('#tags').val();
			var input ={"insert":insert};
			/* alert(insert); */
			/* 검색어 하이라이트 */
			var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 
			
			
			$('#tags').bind('keydown change', function(ev) {
			 var go = $(this).val();

	        // remove any old highlighted terms
	     	 $('body').removeHighlight();

	        // disable highlighting if empty
		        if (go) {
		            // highlight the new term
		            $('table').highlight(go);
		        }    
		        
			});
	        
		if($('#tags').val()!=""){
			$('.test').remove();
			$('.retd').remove();
			/* var insert = $('#tags').val();
			var input ={"insert":insert};
 */			
 		//한글체크 if문 시작
			if(check.test(insert)){
				console.log('한글이 있습니다.');

				$.ajax({
	                type:'GET',
					url: "${pageContext.request.contextPath}/K_real_time",
	                dataType: "JSON",
	                data : input,
	                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
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
			
			}else{
				console.log('한글이 없습니다');
			
			
			$.ajax({
                type:'GET',
				url: "${pageContext.request.contextPath}/E_real_time",
                dataType: "JSON",
                data : input,
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
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
		//한글체크 if문 끝
			}
			
			
			
			 }
		 });
	 <!-- 하이라이트 기능 -->
	/*  $('#tags').bind('keyup change', function(ev) {
	        // pull in the new value
	        var searchTerm = $(this).val();

	        // remove any old highlighted terms
	        $('body').removeHighlight();

	        // disable highlighting if empty
	        if ( searchTerm ) {
	            // highlight the new term
	            $('body').highlight( searchTerm );
	        }
	    }); */ 
 });
  </script>
  <div class="container">
<br/>
<br/>
<br/>
<br/>



     <h1>실시간 검색</h1>
  <div class="member">전체행의 수 : ${memberCount}</div>
    <label for="tags">검색어를 입력하세요: </label>  
  <input type="text" id="tags" />
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
        <tbody id="tb"> 
               <tr> 
                </tr>
        </tbody>

    </table>
    
   <%-- <ul class="pager">
        <c:if test="${currentPage < lastpage}">
            <li class="previous"><a href="${pageContext.request.contextPath}/real_time?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
      
      	<c:forEach var="i" begin="${expage}" end="${lastpage}" step="1">
             <c:choose>
                <c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/real_time?currentPage=${i}"><button class ="bu">${i}</button></a></li></c:when>
                <c:otherwise><li><a href="${pageContext.request.contextPath}/real_time?currentPage=${i}" ><button class ="bu">${i}</button></a></li></c:otherwise>
            </c:choose>

        </c:forEach>
        
        <c:if test="${currentPage > 4}">
            <li class="next"><a href="${pageContext.request.contextPath}/real_time?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul> --%>
     	
  </div>
  
<!--   <select id="selbox">
  <option value="0">선택하세요</option>
  <option value="1">핸드폰</option>
  <option value="2">이름</option>
  </select> -->
  
</body>
</html>