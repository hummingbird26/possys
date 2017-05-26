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
<style>
* { box-sizing:border-box; }

/* basic stylings ------------------------------------------ */
body 		
.container 		{ 
  font-family:'Roboto';
  width:600px; 
  margin:30px auto 0; 
  display:block; 
  background:#FFF;
  padding:10px 50px 50px;
}
h2 		 { 
  text-align:center; 
  margin-bottom:50px; 
}
h2 small { 
  font-weight:normal; 
  color:#888; 
  display:block; 
}
.footer 	{ text-align:center; }
.footer a  { color:#53B2C8; }

/* form starting stylings ------------------------------- */
.group 			  { 
  position:relative; 
  margin-bottom:45px; 
}
input 				{
  font-size:18px;
  padding:10px 10px 10px 5px;
  display:block;
  width:300px;
  border:none;
  border-bottom:1px solid #757575;
}
input:focus 		{ outline:none; }

/* LABEL ======================================= */
label 				 {
  color:#999; 
  font-size:18px;
  font-weight:normal;
  position:absolute;
  pointer-events:none;
  left:5px;
  top:0px;
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}

/* active state */
input:focus ~ label, input:valid ~ label 		{
  top:-20px;
  font-size:14px;
  color:#5264AE;
}

/* BOTTOM BARS ================================= */
.bar 	{ position:relative; display:block; width:300px; }
.bar:before, .bar:after 	{
  content:'';
  height:2px; 
  width:0;
  bottom:1px; 
  position:absolute;
  background:#5264AE; 
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}
.bar:before {
  left:50%;
}
.bar:after {
  right:50%; 
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
  width:50%;
}

/* HIGHLIGHTER ================================== */
.highlight {
  position:absolute;
  height:60%; 
  width:100px; 
  top:25%; 
  left:0;
  pointer-events:none;
  opacity:0.5;
}

/* active state */
input:focus ~ .highlight {
  -webkit-animation:inputHighlighter 0.3s ease;
  -moz-animation:inputHighlighter 0.3s ease;
  animation:inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@-webkit-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@-moz-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
body {
    background-image: url(http://p1.pichost.me/i/11/1344899.jpg);
    background-size: cover;
    background-repeat: no-repeat;
   font-family: Arial, sans-serif;
    font-weight: bold;
    font-size: 14px;
}

.wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    margin-top: -86px;
    margin-left: -89px;
    text-align: center;
}

a {
    -webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
    -moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
    -ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
    -o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
    transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
    display: block;
    margin: 20px auto;
    max-width: 180px;
    text-decoration: none;
    border-radius: 4px;
    padding: 20px 30px;
}

.repw_btn {
    color: rgba(30, 22, 54, 0.6);
    box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

.repw_btn:hover {
    color: rgba(255, 255, 255, 0.85);
    box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

.repw_btn2 {
    color: rgba(30, 22, 54, 0.6);
    box-shadow: rgba(30, 22, 54, 0.4) 0 0px 0px 2px inset;
}

.repw_btn2:hover {
    color: rgba(255, 255, 255, 0.85);
    box-shadow: rgba(30, 22, 54, 0.7) 0 80px 0px 2px inset;
}
</style>
</head>
<body>
<div class="container">
<form action="${pageContext.request.contextPath}/mail/mailSending" id="frm"  method="post">
	 <div class="group" id="idre" style="display:none;"></div>
	<div class="group" align="center"><!-- 기존 아이디 -->	
     <input type="text" id="id" name="id" size="40" style="width:auto" placeholder="아이디를 입력 해주세요" class="form-control" >
      <span class="highlight"></span>
      <span class="bar"></span>
    </div>
    <div class="group" align="center">
    <!--  <input type="button" id="checkbtn" class="repw_btn" value="아이디확인" > -->
  <a id="checkbtn" class="repw_btn">아이디확인</a>
    </div>
    <div class="group" id="idre" style="display:none;"></div>      
    <div class="group" align="center"><!--이 름 -->
      <input type="text" id="name" name="name" size="40" style="width:auto" placeholder="이름을 입력 해주세요" class="form-control" > 
      <span class="highlight"></span>
      <span class="bar"></span>
   </div>
    <div class="group" align="center">
    <a  id="checkname" class="repw_btn" disabled="disabled">이름확인 </a>
      <!-- <input type="button" id="checkname" class="repw_btn" value="이름확인" disabled="disabled"> -->
	</div>
    
    <div class="group" id="namere" style="display:none;"></div> 
    
   	<div class="group" align="center"><!--email -->
      <input type="text" id="email" name="email" size="40" style="width:auto" placeholder="비밀번호를 발급 받으실 email을 입력 해주세요" class="form-control" >
      <span class="highlight"></span>
      <span class="bar"></span>
      
      
    </div>
    
    <div class="group" align="center">
      <a class="repw_btn2" disabled="disabled" id ="rebtn" >비밀번호 재발급 신청</a>
      <!-- <input type="button" id ="rebtn" value="비밀번호 재발급 신청"  disabled="disabled" class="repw_btn2"> -->
    </div>
</form>
</div>
</body>
</html>