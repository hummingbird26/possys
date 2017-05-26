<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<title>POS SYSTEM</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			$('#btn').click(function(){
				 var regExp = /\s/g;//ê³µë°±ì´ ìë íì¸íë ì ê·ì
				 var id = $('#usercode').val();
				 var pw = $('#password').val();
			if($('#usercode').val()==""||id.match(regExp)) {
				$('#idre').html("<font color=red>Check the spaces in the box.</font>");
				$('#idre').show();
				$('#usercode').focus();
			}
			else if($('#password').val()==""||pw.match(regExp)) {
				$('#idre').hide();
				$('#pwre').html("<font color=red>Check the space in the Password box.</font>");
				$('#pwre').show();	
				$('#password').focus();
			}
			else{
				frm.submit();
			}
			
			
			});
		});
	
		/* 팝업창이나 띄우자 */
		
		function open_win(){
			window.open('popup.html','popup','width=300,height=200,left=0,top=0,toolbar=no,locaton=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=no,copyhistory=no');
			
		}
	</script>	

</head>

<body onLoad="javascript:open_win();">

<form action="${pageContext.request.contextPath}/loginAction" name="frm" method="POST">

	<div class="container">
		<div class="top">
			<h1 id="title" class="hidden"><span id="logo">POS SYSTEM</span></h1>
		</div>
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>LogIn</h2>
			</div>
			<label for="usercode">Usercode</label>
			<br/>
			<input type="text" id="usercode" name="usercode" value="id001">
			<div id="idre" style="display:none;"></div> 
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password" name="password" value="pw001">
			<div id="pwre" style="display:none;"></div>
			<br/>
			
			<button type="button" id="btn">login</button>
			<br/>
			<a href="${pageContext.request.contextPath}/repw"><p class="small">비밀번호 찾기(click)</p></a>
		</div>
	</div>
	</form>
</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#usercode').focus(function() {
		$('label[for="usercode"]').addClass('selected');
	});
	$('#usercode').blur(function() {
		$('label[for="usercode"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>

</html>