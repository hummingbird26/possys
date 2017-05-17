<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 <style>
            .bu{
               /*  display: inline-block; */
                background-color: white;
                color: black;
            }
            .bu{
                color: black;
            }
            /* 마우스 오버(마우스 올렸을때) */
            .bu:hover{
                background-color: chocolate;
            }
            /* 마우스 클릭하고있을때 */
            .bu:active{
                background-color: aqua;
            }
            /* 마우스 한번클릭후 */
            .bu:visited{
                color: black;
            	background-color:#FFD8D8;
            }
        
        </style>
 <%@ include file="../modal/wide_menu.jsp" %>
</head>
<body>

<%-- <h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1> --%>

<div class="container">
	<br/>
	<br/>
	<br/>
	<br/>
    <h1>MEMBER LIST</h1>
    <div class="member">전체행의 수 : ${memberCount}</div>
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
        <tbody id="retd">
           <c:forEach var="m" items="${list}">
                <tr class="retd">
                 <td><a href="${pageContext.request.contextPath}/member_information_view?member_phone=${m.member_phone}">${m.member_phone}</a></td>
                    <td>${m.member_name}</td>
                    <td>${m.member_point}</td>
                    <td>${m.member_sign}</td>
                    <td>${m.member_join}</td>
                </tr>
           </c:forEach>
        </tbody>
        
    </table>
    <ul class="pager">
        <c:if test="${currentPage < lastpage}">
            <li class="previous"><a href="${pageContext.request.contextPath}/member_list?currentPage=${currentPage-1}">이전</a></li>
        </c:if>
      
      	<c:forEach var="i" begin="${expage}" end="${lastpage}" step="1">
             <c:choose>
                <c:when test="${i eq currentPage}"><li><a href="${pageContext.request.contextPath}/member_list?currentPage=${i}"><button class ="bu">${i}</button></a></li></c:when>
                <c:otherwise><li><a href="${pageContext.request.contextPath}/member_list?currentPage=${i}" ><button class ="bu">${i}</button></a></li></c:otherwise>
            </c:choose>

        </c:forEach>
        
        <c:if test="${currentPage > 4}">
            <li class="next"><a href="${pageContext.request.contextPath}/member_list?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript"> 
$(document).ready(function(){
		  	var jsonString = '${jsonString}';
		  	var memberList = eval("("+jsonString+")");
		  /* var pp = memberList.member_name; */
		 	var member_phone = new Array();
		  	var member_name = new Array();
		  	var member_sign = new Array();
		  	var member_join = new Array();
		  
		  for(var i=0; i < memberList.length; i++){
				var memberObject = memberList[i];
			
				console.log(memberObject.member_phone)
		
				member_phone.push(memberObject.member_phone);
				member_name.push(memberObject.member_name);
				member_sign.push(memberObject.member_sign);
				member_join.push(memberObject.member_join);
		  		}
		    /* alert(member_phone); */
		  
					$('#selBox').change(function(){
						var selbox = $('#selBox').val();
						
						
						if(selbox == 'member_phone'){
				    	$( "#search2" ).autocomplete({
					      source: member_phone
				    	});
						
						}else if(selbox == 'member_name'){
							$( "#search2" ).autocomplete({
							 source: member_name
						    });	
						}else if(selbox == 'member_sign'){
							$( "#search2" ).autocomplete({
								 source: member_sign
							    });	
						}else if(selbox == 'member_join'){
							$( "#search2" ).autocomplete({
								 source: member_join
							    });	
						}else if(selbox ==0){
						alert('선택하세요');
					
						}
					});
			});
</script>
<script type="text/javascript">
$(document).ready(function(){
		$('#button').click(function(){
			
			var va = $("#selBox option:selected").val();
			 var regExp = /\s/g;
			var search2 =$('#search2').val();
			
			if(search2 != null && search2 != "" && search2 != regExp){
				 /* alert(search); */
				frm.submit();	
			}else{
				 alert('내용을 입력 하세요');
			}
		}); 				
}); 

  </script>

    <div>
 <form id="frm" name="frm" action="${pageContext.request.contextPath}/member_select" method="get">
    	<select  id="selBox" name="selBox">
    	<option  value="0">-- 선택하세요--</option>
        <option  value="member_phone">핸드폰번호</option>
        <option  value="member_name">이름</option>
        <option  value="member_sign">가입일자</option>
        <option  value="member_join">최근방문일자</option>
        </select>
      <input type="input" name="search2" id="search2">
        <input type="button" name="button" id="button" value="검색">
     </form>
    </div>
</div>
</body>
</html>
