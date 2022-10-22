<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
<meta content="Coderthemes" name="author" />

<title>인재대학교 교내메일</title>

<!-- App favicon -->
<link rel="shortcut icon" href="/resources/images/logo.png">

<script src="/resources/js/jquery-3.6.0.js"></script>
	
<!-- third party css -->
<link href="/resources/Hyper/dist/saas/assets/css/vendor/jquery-jvectormap-1.2.2.css" rel="stylesheet" type="text/css" />
<!-- third party css end -->

<!-- App css -->
<link href="/resources/Hyper/dist/saas/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/Hyper/dist/saas/assets/css/app.min.css" rel="stylesheet" type="text/css" id="light-style" />
</head>
<body>
	<%--  | <%=((Map)session.getAttribute("mem")).get("memCd") %> --%>
	<c:if test="${ memSession.managerVO.mgrCd != null }">
	<script type="text/javascript" defer="defer"> 
		var idleTime = 0; 
		$(function () { //1분마다 유휴 시간 카운터를 증가
		 	var idleInterval = setInterval(timerIncrement, 60000); //1분
		 	//일정시간 움직임이 있으면 초기화
		 	$(this).mousemove(function (e) { idleTime = 0; }); 
		 	$(this).keypress(function (e) { idleTime = 0; });
		});
		 function timerIncrement() { 
		  	idleTime = idleTime + 1;
		  	if (idleTime > 9) { // 10분일 경우
				alert("자동 로그아웃이 되었습니다.");
		   		location.href = "/main/logout";
			}
		}
	</script>
	</c:if>
	<div class="row">
		<!-- Right Sidebar -->
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<!-- Left sidebar -->
					<tiles:insertAttribute name="aside" />
					<!-- End Left sidebar -->

					<div class="page-aside-right" style="background: #f1f1f1;">
						<tiles:insertAttribute name="body" />
					<!-- end inbox-rightbar-->
					<!-- end card-body -->
					<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<!-- end card-box -->

		</div>
		<!-- end Col -->
	</div>
	<!-- End row -->

	<!-- bundle -->
	<script src="/resources/Hyper/dist/saas/assets/js/vendor.min.js"></script>
	<script src="/resources/Hyper/dist/saas/assets/js/app.min.js"></script>
	
<!-- 	<!-- SimpleMDE js --> -->
<!-- 	<script src="/resources/Hyper/dist/saas/assets/js/vendor/simplemde.min.js"></script> -->

<!-- 	<!-- Page init js --> -->
<!-- 	<script src="/resources/Hyper/dist/saas/assets/js/pages/demo.inbox.js"></script> -->
</body>
</html>