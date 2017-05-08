<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<script>
$(document).ready(function(){
	$('#btn').click(function(){
	alert('탈퇴 승인 처리 되었습니다.');
		frm.submit();
	});
});
</script>
<title>회원 탈퇴 Page</title>
</head>
<body>
<div class="container">
<h1>회원 탈퇴 화면</h1>
 
      <form id="frm" action="${pageContext.request.contextPath}/member_SecedeAction" method="post">
        <div class="form-group">전화번호 :
            <input class="form-control" name="member_phone" id ="member_phone" value="${Member.member_phone}" type="text" readonly="readonly"/>
        </div>
        <div id="phone_re" style="display:none;"></div> 
        <div class="form-group">
            <label for="boardPw">이름 :</label>
            <input class="form-control" name="member_name" id="member_name" value="${Member.member_name}" type="text" readonly="readonly"/>
        </div>
        <div id="name_re" style="display:none;"></div>     
        <div class="form-group">
            <label for="member_point">마일리지 :</label>
            <input class="form-control" name="member_point" id="member_point" value="${Member.member_point}" type="text" readonly="readonly"/>
        </div>
        <div id="point_re" style="display:none;"></div> 
        <div class="form-group">가입일자 :
            <input class="form-control" name="member_sign" id="member_sign" value="${Member.member_sign}" type="text"  readonly="readonly"/>
        </div>
          <div class="form-group">
            <label for="member_join">최근방문일자 :</label>
            <input class="form-control" name="member_join" id="member_join" value="${Member.member_join}" type="text"  readonly="readonly"/>
        </div>
        <input class="btn btn-default" type="button" id="btn" value="삭제">
        <a class="btn btn-default" href="${pageContext.request.contextPath}/member_list">글목록</a>
    </form>
    
</div>
</body>
</html>
