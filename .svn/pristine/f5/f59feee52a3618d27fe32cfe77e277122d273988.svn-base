<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	int code = Integer.parseInt(request.getParameter("code"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=title%></title>

<style type="text/css">
	#click2closePopUp {
		float : right;
	}
	#realPopUpBody {
		width : 500px;
		height : 480px;
		margin : auto auto;
	}
</style>
<script type="text/javascript" defer="defer">

	function setCookie(name, value) {
		var todayDate = new Date();
		todayDate.setHours(24);
		document.cookie = name + "=" + escape(value) 
						+ ";path=/;expires=" + todayDate.toGMTString() + ";";
	}
	
	window.onload = function() {
		
		//닫기 버튼
		$('#click2closePopUp').on('click', function() {
			
			if($('#click2setCookie').is(":checked")) {
				setCookie("popCookie_<%=code%>", "done");
			}
			window.close();
		});
	}
</script>
</head>
<body>
	<div>
	    <div class="realPopUpBody">
	        <div>
	        	<img src="/resources/popup/<%=name%>" 
	        	alt="<%=name%>"
	        	style="width:100%;height:100%;"/>
	        </div>
	    </div>
        <p></p>
        <div>
            <input type="checkbox" id="click2setCookie" />    
            <label for="do-not-open" >오늘 하루 열지 않기</label>
	        <a href="#a" title="닫기" class="btn-pop-close" id="click2closePopUp">
	        	<span class="hide">닫기</span>
	        </a>
        </div>
	</div>
</body>
</html>