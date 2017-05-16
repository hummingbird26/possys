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
			/* 검색어 하이라이트 */
		 $('#tags').bind('keyup change', function(ev) {
		 

	        // remove any old highlighted terms
	        $('body').removeHighlight();

	        // disable highlighting if empty
		        if (insert) {
		            // highlight the new term
		            $('body').highlight(insert);
		        }
			 });
	        
		if($('#tags').val()!=""){
			$('.test').remove();
			$('.retd').remove();
			/* var insert = $('#tags').val();
			var input ={"insert":insert};
 */			
			
			
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
    
  
     	
  </div>
  
<!--   <select id="selbox">
  <option value="0">선택하세요</option>
  <option value="1">핸드폰</option>
  <option value="2">이름</option>
  </select> -->
  
</body>
</html>