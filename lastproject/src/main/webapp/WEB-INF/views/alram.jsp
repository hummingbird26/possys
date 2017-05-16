<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<button id="requestPermissionButton" class="btn btn-warning btn-lg btn-block">����ũž �˸� ���� ��û</button>
<hr />
<div id="notificationBlock" class="form-group">
    <label class="control-label">�˸� �޽���</label>
    <div class="input-group">
        <span class="input-group-addon">�޽���</span>
        <input id="notificationMessage" type="text" class="form-control" disabled/>
        <span class="input-group-btn">
            <button id="notificationButton" class="btn btn-info" type="button" disabled>�˸�</button>
        </span>
    </div>
</div>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
<script>
var requestPermissionButton = $("#requestPermissionButton");
var notificationButton = $("#notificationButton");
var notificationMessage = $("#notificationMessage");
var iconDataURI = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAKBJREFUeNpiYBjpgBFd4P///wJAaj0QO9DEQiAg5ID9tLIcmwMYsDgABhqoaTHMUHRxpsGYBv5TGqTIZsDkYWLo6gc8BEYdMOqAUQeMOoAqDgAWcgZAfB9EU63SIAGALH8PZb+H8v+jVz64KiOK6wIg+ADEArj4hOoCajiAqMpqtDIadcCoA0YdQIoDDtCqQ4KtBY3NAYG0csQowAYAAgwAgSqbls5coPEAAAAASUVORK5CYII=";

//����ũž �˸� ���� ��û ��ư�� ������,
requestPermissionButton.on("click", function () {
	//����ũž �˸� ���� ��û
    Notification.requestPermission(function (result) {

        //��û�� �����ϸ�,
        if (result === 'denied') {
            return;
        }
        //��û�� ����ϸ�,
        else {
            //����ũž �˸� ���� ��û ��ư�� ��Ȱ��ȭ
            requestPermissionButton.attr('disabled', 'disabled');
            //����ũž �޽��� �Է����� Ȱ��ȭ
            notificationMessage.removeAttr('disabled');
            //����ũž �޽��� ��û ��ư�� Ȱ��ȭ
            notificationButton.removeAttr('disabled');
            return;
        }
    });
});


//����ũž �˸� ��ư�� ������,
notificationButton.on("click", function () {
	$.ajax({
		type:'GET',
		url:"${pageContext.request.contextPath}/json",
		
	});
    var message = notificationMessage.val();
    
    //�޽����� �Է��� ��쿡��,
    if (message !== null && message.length > 0) {
        
        var options = {
            body: message,
            icon: iconDataURI
        }
       
        //����ũž �˸� ��û
        var notification = new Notification("����ũž �˸� ���� Ÿ��Ʋ", options);
        
        //�˸� �� 5�� ��,
        setTimeout(function () {
            //��� �޽��� �ݱ�
            notification.close();
        }, 5000);
    }
});
</script>
</body>
</html>