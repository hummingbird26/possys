<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<title>회원정보 수정화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			$('#btn').click(function(){
				 var regExp = /\s/g;//공백검사 정규식
				 var phone = $('#member_phone').val();
				 var name = $('#member_name').val();
				 var point = $('#member_point').val();
			if($('#member_phone').val()==""||phone.match(regExp)) {
				$('#phone_re').html("<font color=red>Check the spaces in the box.</font>");
				$('#phone_re').show();
				$('#member_phone').focus();
			}
			else if($('#member_name').val()==""||name.match(regExp)) {
				$('#phone_re').hide();
				$('#name_re').html("<font color=red>Check the space in the name box.</font>");
				$('#name_re').show();	
				$('#member_name').focus();
			}
			else if($('#member_point').val() ==""||point.match(regExp)){
				$('#phone_re').hide();
				$('#name_re').hide();
				$('#point_re').html("<font color=red>Check the space in the point box.</font>");
				$('#point_re').show();	
				$('#member_point').focus();
			}
			else{
				frm.submit();
			}
			
			
			});
		});
	
	</script>	

</head>
<body>
<h1>식자재 입력폼</h1>
	<form id="frm" action="${pageContext.request.contextPath}/member_update" method="post">
        <div class="form-group">전화번호 :
            <input class="form-control" name="member_phone" id ="member_phone" value="${Member.member_phone}" type="text" readonly="readonly"/>
        </div>
        <div id="phone_re" style="display:none;"></div> 
        <div class="form-group">
            <label for="boardPw">이름 :</label>
            <input class="form-control" name="member_name" id="member_name" value="${Member.member_name}" type="text"/>
        </div>
        <div id="name_re" style="display:none;"></div>     
        <div class="form-group">
            <label for="member_point">마일리지 :</label>
            <input class="form-control" name="member_point" id="member_point" value="${Member.member_point}" type="text"/>
        </div>
        <div id="point_re" style="display:none;"></div> 
        <div class="form-group">가입일자 :
            <input class="form-control" name="member_sign" id="member_sign" value="${Member.member_sign}" type="text"  readonly="readonly"/>
        </div>
          <div class="form-group">
            <label for="member_join">최근방문일자 :</label>
            <input class="form-control" name="member_join" id="member_join" value="${Member.member_join}" type="text"  readonly="readonly"/>
        </div>
        <input type="button" id="btn" value="등록">
		<input type="reset" id="reset" value="초기화">
    </form>
</body>
</html>