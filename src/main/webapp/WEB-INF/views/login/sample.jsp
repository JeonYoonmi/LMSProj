<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Caps Lock 성공하자!</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style type="text/css">
	.container {
		margin : 15% 20%;
	}
</style>
<script type="text/javascript" defer="defer">
    
	function fnKeyPress(e) {
		var keyCode = 0;
        var shiftKey = false;
        keyCode = e.keyCode;
        if (e.keyCode == 0) {
            keyCode = e.which;
        }
        shiftKey = e.shiftKey;
        
        
        //Shift를 누르지 않은 상태에서 대문자 범위 일 경우
        if ((keyCode >= 65 && keyCode <= 90) && !shiftKey) {
        	$('#tellCapsLockOn').show();
        	setTimeout("fnCapsHide()", 1500);
        }

		//Shift를 누른 상태에서 소문자 범위 일 경우
        if ((keyCode >= 97 && keyCode <= 122) && shiftKey) {
        	$('#tellCapsLockOn').show();
        	setTimeout("fnCapsHide()", 1500);
        }
	}
	
	 function fnCapsHide() {
         $("#tellCapsLockOn").hide();
     }
</script>
</head>
<body>
	<div class="container">
		<label>PW</label>
		<input type="text" 
			placeholder="비밀번호를 입력하세요." 
			id="memPass" 
			name="memPass"
			onkeypress="fnKeyPress(event)"
			data-toggle="tooltip"
			data-placement="bottom" 
			data-original-title=""
		/>
		<button type="button" class="btn btn-secondary">로그인</button>
		<span id="tellCapsLockOn" style="display:none;">Caps Lock이 켜져 있습니다.</span>
	</div>
</body>
</html>