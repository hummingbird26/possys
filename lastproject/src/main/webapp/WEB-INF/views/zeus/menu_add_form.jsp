<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 	<%@ include file="../modal/wide_menu.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<script>

   	$(document).ready(function (){
   		var reg_id = /^[a-z0-9_-]{3,12}$/; 
   		var ckeck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; 	
   	$('#addmenu').click(function(){
   		if(ckeck.test($('#menu_name').val())){ 
   			$('#menu_cate').focus();
   		}else{
   			$('#menu_name').focus();
   		}
   		if(ckeck.test($('#menu_cate').val())){
   			$('#menu_price').focus();
   	    if(!reg_id.test($('#menu_price').val())){
	   		alert("가격은 3자 이상이여야 하며 \n"+"마침표, '-', '_'를 제외한 문자는 사용하실수 없습니다.");
	   		$('#menu_price').focus();
	   	}else if(!reg_id.test($('#menu_sprice').val())){
	   		alert("할인가격은 3자 이상이여야 하며 \n"+"마침표, '-', '_'를 제외한 문자는 사용하실수 없습니다.");
	   		$('#menu_sprice').focus();
	   	}else if(!reg_id.test($('#menu_kcal').val())){
	   		alert("칼로리는 3자 이상이여야 하며 \n"+"마침표, '-', '_'를 제외한 문자는 사용하실수 없습니다.");
	   		$('#menu_kcal').focus();
	   	}else {
	   		addform.submit();
	   		}
   		}else{
   			alert('상품카테고리 3자 이상 입력해주세요');
   		$('#menu_cate').focus();		
   		}
   		}); 		
   	});
</script>
<title></title>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">홍락이짱</a></center></h1>
<div class="container">
    <h1></h1>
    <form id="addform" action="${pageContext.request.contextPath}/menu_add_form" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="menuPw"> 메뉴명:</label>
            <input class="form-control" name="menu_name" id="menu_name" type="text" placeholder="메뉴명을 입력해주세요"/>
        </div>
        <div class="form-group">
            <label for="menuPw">상품카테고리:</label>
            <input class="form-control" name="menu_cate" id="menu_cate" type="text" placeholder="상품 카테고리를 입력해주세요"/>
        </div>
        <div class="form-group">
            <label for="menuName">가격:</label>
            <input class="form-control" name="menu_price" id="menu_price" type="text" placeholder="가격을 입력해주세요 (숫자 3자 이상)"/>
        </div>
        <div class="form-group">
            <label for="menuName">할인가격:</label>
            <input class="form-control" name="menu_sprice" id="menu_sprice" type="text" placeholder="할인가격을 입력해주세요 (숫자 3자 이상)"/>
        </div>
        <div class="form-group">
            <label for="menuName">칼로리 :</label>
            <input class="form-control" name="menu_kcal" id="menu_kcal" type="text" placeholder="칼로리를 입력해주세요(숫자 3자 이상)"/>
        </div>
        <div class="form-group">
            <label for="order_file">사진:</label>
            <input  class="form-control" type="file" id="order_file" name="order_file"> <!-- 이미지 파일 -->
        </div>
        <div>
			<input type="button" id="addmenu" value="등록">
			<input type="reset" id="reset" value="초기화">
		</div>

    </form>
</div>
</body>
</html>
