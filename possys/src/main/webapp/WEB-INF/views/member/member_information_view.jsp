<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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

<title>회원 개인정보 화면</title>
</head>
<body>
<div class="container">
    <h1>회원정보 화면</h1>
     <table class="table">
         <tbody>
             <tr>
                <td>member_phone :</td>
                <td>${Member.member_phone}</td>
               </tr>
            <tr>
                   <td>member_name :</td>
                   <td>${Member.member_name}</td>
            </tr>
            <tr>
                   <td>member_point :</td>
                   <td>${Member.member_point}</td>
            </tr>
            <tr>
                   <td>member_sign :</td>
                   <td>${Member.member_sign}</td>
            </tr>
            <tr>
                   <td>member_join :</td>
                   <td>${Member.member_join}</td>
            </tr>
        </tbody>
    </table>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/member_update?member_phone=${Member.member_phone}">수정</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/member_Secede?member_phone=${Member.member_phone}">삭제</a>
    <a class="btn btn-default" href="${pageContext.request.contextPath}/member_list">글목록</a>
</div>
</body>
</html>

