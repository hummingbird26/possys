<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<button id="requestPermissionButton" class="btn btn-warning btn-lg btn-block">데스크탑 알림 권한 요청(<---1번 click)</button>
</br>
<div id="notificationBlock" class="form-group">
    <label class="control-label">(알림 메시지 내용 입력후 주문신청 click)</label></br>
   주문내역입력</br>
<input type="text" id="test1"></br>
<input type="text" id="test2"></br>
<input type="text" id="test3"></br>
<input type="text" id="test4">
   
   
    <div class="input-group">
        <!-- <span class="input-group-addon">메시지</span>
        <input id="notificationMessage" type="text" class="form-control" disabled/> -->
        <span class="input-group-btn">
            <button id="notificationButton" class="btn btn-info" type="button" disabled>주문신청</button>(<----2번 click)
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

//데스크탑 알림 권한 요청 버튼을 누르면,
requestPermissionButton.on("click", function () {
	//데스크탑 알림 권한 요청
    Notification.requestPermission(function (result) {

        //요청을 거절하면,
        if (result === 'denied') {
            return;
        }
        //요청을 허용하면,
        else {
            //데스크탑 알림 권한 요청 버튼을 비활성화
            requestPermissionButton.attr('disabled', 'disabled');
            //데스크탑 메시지 입력폼을 활성화
            notificationMessage.removeAttr('disabled');
            //데스크탑 메시지 요청 버튼을 활성화
            notificationButton.removeAttr('disabled');
            return;
        }
    });
});


//데스크탑 알림 버튼을 누르면,
notificationButton.on("click", function () {
	
	var test1 = $('#test1').val()+$('#test2').val()+$('#test3').val()+$('#test4').val();
	/* alert(test1); */
    /* var message = notificationMessage.val(); */
    var message = test1
    
    //메시지를 입력한 경우에만,
    if (message !== null && message.length > 0) {
        
        var options = {
            body: message,
            icon: iconDataURI
        }
       
        //데스크탑 알림 요청
        var notification = new Notification("주문신청내역", options);
        
        //알림 후 5초 뒤,
        setTimeout(function () {
            //얼람 메시지 닫기
            notification.close();
        }, 50000);
    }
});
</script>
</body>
</html>