<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap�� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery�� ����ϱ����� CDN�ּ� -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript�ҽ��� ����ϱ� ���� CDN�ּ� -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<script>
   
    /* �Է��� ��ȿ�� ���� �䱸����
        1. ��� ���� ���� �Ǵ� "" ���ڴ� �ԷµǸ� �ȵȴ�.
        2. ��й�ȣ�� 4���̻� �Է��Ͽ��� �Ѵ�.
    */
</script>
<title></title>
</head>
<body>
<div class="container">
    <h1></h1>
    <form id="addform" action="${pageContext.request.contextPath}/menu_add_form" method="post">
        <div class="form-group">
            <label for="menuPw"> �޴���:</label>
            <input class="form-control" name="menu_name" id="menu_name" type="text"/>
        </div>
        <div class="form-group">
            <label for="menuPw">��ǰ ī�װ� :</label>
            <input class="form-control" name="menu_cate" id="menu_cate" type="text"/>
        </div>
        <div class="form-group">
            <label for="menuName">���� :</label>
            <input class="form-control" name="menu_price" id="menu_price" type="text"/>
        </div>
        <div class="form-group">
            <label for="menuName">���ΰ��� :</label>
            <input class="form-control" name="menu_sprice" id="menu_sprice" type="text"/>
        </div>
        <div class="form-group">
            <label for="menuName">Į�θ� :</label>
            <input class="form-control" name="menu_kcal" id="menu_kcal" type="text"/>
        </div>
         <div class="form-group">
            <label for="menuName">���� :</label>
            <input class="form-control" name="menu_explanation" id="menu_explanation" type="text"/>
        </div>
        <div>
            <input class="btn btn-default" id="addmenu" type="submit" value="���"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/menu_list">�޴� ���</a>
        </div>
    </form>
</div>
</body>
</html>
