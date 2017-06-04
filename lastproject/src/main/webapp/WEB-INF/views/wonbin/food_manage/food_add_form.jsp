<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소버튼 클릭시 새창 닫기
		$(document).on('click','#censel',function(){
			self.close(); //닫기
		}) //취소버튼
		//등록버튼 클릭
		$(document).on('click','#addfood',function(){
			var addform = $('#addform').serialize(); // Form 태그내의 항목들을 자동으로 읽어와 queryString 형식으로 변환시켜 준다
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/food_add_form",
				data : addform,
				success : function(data){
					alert('등록되었습니다.');
					var cnt = 1;
					if(cnt == 1) {
					   opener.location.reload(); // 부모창을 한번 새로고침 시켜준다.
					   cnt = 0;
					}
					self.close(); // insert 로직실행후 창을 닫는다
				},
				error : function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);			
				}
			});//ajax 끝
		});
		
	}) // ready
</script>
<title>식자재 품목관리</title>

<%-- <%@ include file="../../modal/header.jsp" %> --%>

</head>
<body>
<br>
<br>
<div class="container">
<h2>식자재 입력폼</h2>

	<br>
	<br>	
	<br>
	<form class="form-horizontal col-sm-12" id="addform" <%-- action="${pageContext.request.contextPath}/food_add_form" method="post" --%>>
		<div class="form-group">
			<label class="control-label col-sm-2">상품명</label>
			<div class="col-xs-7">
				<input  class="form-control" name ="food_name" id ="food_name" type ="text" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">단위</label>
			<div class="col-xs-7">
				<input  class="form-control" name ="food_unit" id ="food_unit" type ="text" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">유통기한</label>
			<div class="col-xs-7">
				<input  class="form-control" name ="food_shelflife" id ="food_shelflife" type ="text" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2">담당자</label>
			<div class="col-xs-7">
				<input  class="form-control" name ="staff_id" id ="staff_id" type ="text" value="${sessionScope.admin.admin_id}" readonly="readonly"/>
			</div>
		</div>
		<br>
		<div class="form-group col-sm-10">
				<center>
				<input class="btn btn-default" type="button" id="addfood" value="등록">
				<input class="btn btn-default" type="reset" id="reset" value="초기화">
				<button class="btn" type="button" id="censel">취소</button>
				</center>
		</div>
			
		
	</form>

</div>
</body>
</html>