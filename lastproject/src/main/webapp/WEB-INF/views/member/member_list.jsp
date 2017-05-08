<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>BOARD LIST(모델2 방식)</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
</head>
<body>
<div class="container">
    <h1>MEMBER LIST</h1>
    <div>전체행의 수 : ${memberCount}</div>
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
                <c:when test="${i eq currentPage}"><li class="previous"><a href="${pageContext.request.contextPath}/member_list?currentPage=${i}" class="choice">[${i}]</a></li></c:when>
                <c:otherwise><li class="previous"><a href="${pageContext.request.contextPath}/member_list?currentPage=${i}">[${i}]</a></li></c:otherwise>
            </c:choose>

        </c:forEach>
        
        <c:if test="${currentPage > 4}">
            <li class="next"><a href="${pageContext.request.contextPath}/member_list?currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript"> 
$(document).ready(function(){
	$('#button').click(function(){
		
		var va = $("#selBox option:selected").val();
		 var regExp = /\s/g;
		if(va != null || va != "" || va !=regExp){
			/* alert(va); */
			frm.submit();	
		}else{
			 alert('검색조건을 선택하세요');
		}
		
	});
});
</script>

    <div>
    <form id="frm" name="frm" action="${pageContext.request.contextPath}/member_select" method="get">
    	<select  id="selBox" name="selBox">
    	<option>-- 선택하세요--</option>
        <option  value="member_phone">핸드폰번호</option>
        <option  value="member_name">이름</option>
        <option  value="member_sign">가입일자</option>
        <option  value="member_join">최근방문일자</option>
        </select>
        <input type="search" name="search" id="search">
        <input type="button" name="button" id="button" value="검색">
     </form>
    </div>
</div>
</body>
</html>
