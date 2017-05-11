<%@ page language="java" contentType="text/html; charset=UTF-8"
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
			
            $.ajax({
                url: "http://localhost/possys/json",
                dataType: "json",
                success: function (data) {
                	alert('성공');
                	console.log(ajax.response.Text+"<<<<<<<<");
                	/* alert(data); */
                    $.each(data, function () {
                        $('#tblList').append("<tr><td>" + this.member_name + "</td><td>" + this["member_name"] + "</td></tr>");
                    });
                    $.each(data, function (index, entry) {
                        $('#tblList').append("<tr><td>" + entry.Num + "</td><td>" + entry["Name"] + "</td></tr>");
                    });
                    $('tr:odd').addClass('silver');
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
</html>