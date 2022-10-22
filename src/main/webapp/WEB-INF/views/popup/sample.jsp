<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>샘플 팝업 띄우기</title>
<script type="text/javascript" defer="defer">

function getCookie(cName) {
	var x, y;
	var val = document.cookie.split(';');
	for(var i = 0; i < val.length; i++) {
		x = val[i].substr(0, val[i].indexOf('='));
		y = val[i].substr(val[i].indexOf('=') + 1);
		x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
		if (x == cName) {
			return unescape(y); // unescape로 디코딩 후 값 리턴
		}
	}
}

window.onload = function() {
// 	var img = new Image();
// 	var url = "/resources/popup/20220913_kimbap.jpg"
// 	img.src = url;
	
// 	var img_width = img.width;
// 	var win_width = img.width + 25;
// 	var height = img.height + 30;
	
// 	var OpenWindow = window.open(
// 			'',
// 			'_blank',
// 			'width=' + img_width + ',height=' + height + ', menubars=no, scrollbars=auto'
// 	);
// 	OpenWindow.document.write("<img src='" + url + "' width='" + win_width + "'>");
	
	$.ajax({
		url : "/popup/popupList",
		type : "GET",
		dataType : "JSON",
		success : function(res) {
			if(res != null) {
				
				leftval = 10;
				topval = 10;
				
				$.each(res, function(i, v) {
					
					if(getCookie('popCookie_' + v.popCd) == 'done') {
						
					}else {
						
						leftval += 10;
						topval += 10;
						
						window.open(
								"/popup/popUpFrame?title=" + v.popTtl + "&name=" + v.popFnm + "&code=" + v.popCd,
								"pop" + v.popCd,
								"width = 400, height = 410, left = " + leftval + " top = " + topval + " history = no, resizable = no, status = no, scrollbars = yes, menubar = no"
						);
					}
					
				});
			}
		}
	});
}
</script>
</head>
<body>
하위
</body>
</html>