
<!DOCTYPE html>
<html>

<head>
	<title>POS SYSTEM</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="./resources/assets/css/style.css" />
	<link rel="stylesheet" href="./resources/assets/css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
	<script type="text/javascript"> 
		$(document).ready(function(){
			$('#btn').click(function(){
				 var regExp = /\s/g;//공백이 있나 확인하는 정규식
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
	
	</script>	

</head>

<body>
<form action="/PosSystem2/loginAction" name="frm" method="POST">

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
			<input type="text" id="usercode" name="usercode">
			<div id="idre" style="display:none;"></div> 
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="password" name="password">
			<div id="pwre" style="display:none;"></div>
			<br/>
			
			<button type="button" id="btn">login</button>
			<br/>
			<a href="#"><p class="small">Forgot your password?</p></a>
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