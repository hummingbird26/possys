<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 재발급</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* var check_id,check_name; */
	$('#name').attr('readonly', true);
	$('#checkbtn').click(function(){
		var input ={"id":id};
		var id = $('#id').val();
		var regExp = /\s/g;
		var name = $('#name').val();
		
		
		if(id==""||id.match(regExp)){
			$('#idre').html("<font color=red>입력란에 공백이 존재하면 안됩니다.</font>");
			$('#idre').show();
		}else{
			var input ={"id":id};
			var id = $('#id').val();
			var name = $('#name').val();
	    
		 
		 

		 $('#id').attr('readonly', true);
		 $('#name').attr('readonly', false);
		var check_id,check_name;

		
		
		
		$.ajax({
			type:'POST',
			url: "${pageContext.request.contextPath}/idcheck",
            dataType: "JSON",
            data : input,
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success:function(data){
				/* alert('통신성공'); */
				console.log(data);
				$.each(data, function(){
					
					check_id += this.staff_id;
					check_name += this.staff_name;
					console.log(check_id+'<-ajax 내부 each문 내부 가져온 id값');
					console.log(check_name+'<-ajax 내부 each문 내부 가져온 name값');
				});
			
						if(check_id.length>=1){
						var sub_id = check_id.substr(9,check_id.length);
						if(id==sub_id){
							$('#idre').html("<font color=blue>아이디가 일치합니다.</font>"+"<br/><font color=blue> 이름을 입력 해주세요</font>");
							$('#idre').show();
							console.log(id+'<-입력한 아이디값');
							console.log(sub_id+'<-DB 아이디값');
							
							namebtn = document.getElementById('checkname');
							namebtn.disabled = false;	
						}
						
						}else{
							
							$('#idre').html("<font color=red>일치하는 아이디가 없습니다.</font>"+"<br/><font color=red> 새로고침 후 다시 입력해 주세요</font>");
							$('#idre').show();
						}
						
						$('#checkname').click(function(){
							if(check_name.length>=1){
							var sub_name = check_name.substr(9,check_name.length);
								if($('#name').val()== sub_name){
									var insert_name = $('#name').val()
									$('#namere').html("<font color=blue>이름이 일치합니다.</font>");
									$('#idre').hide();
									$('#namere').show();
									console.log(sub_name+'<-DB 이름값');
									console.log('모두 일치');
									$('#name').attr('readonly', true);
									btn = document.getElementById('rebtn');
									btn.disabled = false;
								}else{
									var insert_name = $('#name').val()
									$('#namere').html("<font color=red>이름이 일치하지 않습니다.</font>");
									$('#idre').hide();
									$('#namere').show();
									console.log(insert_name+'<-입력한 이름값');
									console.log(sub_name+'<-DB 이름값');
									console.log('이름 불일치');
								}
							 }
						   }); 					
						 $('#rebtn').click(function(){	
							 /*if($('#name').val()==""||name.match(reExp)){
										$('#namere').html("<font color=red>입력란에 공백을 확인 해주세요</font>");
										$('#idre').hied();
										$('#namere').show();
									}else{ */
									alert('임시 비밀번호가 발급 되었습니다.');
									$('#frm').submit();
									/* } */
						
							});
						}
					});
				}
			/* this.reset(); */			
			
		 
    });
 });					

</script>
</head>
<body>
<div class="container">
<form action="${pageContext.request.contextPath}/mail/mailSending" id="frm"  method="post">
<div align="center"><!-- 기존 아이디 -->

      <input type="text" id="id" name="id" size="120" style="width:100%" placeholder="아이디를 입력 해주세요" class="form-control" ><input type="button" id="checkbtn" value="아이디확인" >
    </div>
    <div id="idre" style="display:none;"></div>      
    <div align="center"><!--이 름 -->
      <input type="text" id="name" name="name" size="120" style="width:100%" placeholder="이름을 입력 해주세요" class="form-control" ><input type="button" id="checkname" value="이름확인" disabled="disabled">
    </div>
    <div id="namere" style="display:none;"></div> 
    <div align="center">
      <input type="button" id ="rebtn" value="비밀번호 재발급 신청"  disabled="disabled" class="btn btn-warning">
    </div>
   
</form>
</div>
</body>
</html>