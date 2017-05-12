<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
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
   
    /* 입력폼 유효성 관련 요구사항
        1. 모든 폼은 공백 또는 "" 문자는 입력되면 안된다.
        2. 비밀번호는 4자이상 입력하여야 한다.
    */
</script>
<title></title>
</head>
<body>
<h1><center><a href="${pageContext.request.contextPath}/home">home</a></center></h1>
<div class="container">
    <h1></h1>
    <form id="addform" action="${pageContext.request.contextPath}/per_add_form" method="post">
        <div class="form-group">
            <label for="menuPw"> 메뉴코드:</label>
            <input class="form-control" name="menu_id" id="menu_id" type="text"/>
        </div>
        <div class="form-group">
            <label for="menuPw">식재코드 :</label>
            <input class="form-control" name="food_id" id="food_id" type="text"/>
        </div>
        <div class="form-group">
            <label for="menuName">메뉴명:</label>
            <input class="form-control" name="menu_name" id="menu_name" type="text"/>
        </div>
        <div class="form-group">
            <label for="menuName">수량:</label>
            <input class="form-control" name="fpm_ea" id="fpm_ea" type="text"/>
        </div>
        <div class="form-group">
            <label for="menuName">단위 :</label>
            <input class="form-control" name="fpm_unit" id="fpm_unit" type="text"/>
        </div>
         <div>
			<input type="submit" id="addmenu" value="등록">
			<input type="reset" id="reset" value="초기화">
			<a href="${pageContext.request.contextPath}/menu_list">취소</a>
		</div>
    </form>
</div>
</body>
</html>
