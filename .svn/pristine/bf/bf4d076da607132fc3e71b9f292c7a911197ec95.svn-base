<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#alarm {
    background: white;
}

.alarm {
/* 	position: relative; */
/* 	padding-right: 50px; */
/* 	width: 100%; */
/* 	display: inline-block; */
	float: left;
	margin-top: 10px;
    width: 70%;
}

.alarm div:nth-child(1){
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.deleteAlarm {
/* 	position : relative; */
/* 	left : 280px; */
/* 	bottom : 40px; */
/* 	z-index : 1; */
/* 	cursor : pointer; */
	float: right;
    float: right;
    margin-top: 19px;
    margin-right: 10px;
    width: 5%;
}
.deleteAlarm::before {
/* 	display: inline-block; */
/* 	width: 30px; */
}

.topBarLogo{
	position : sticky;
}

.clear{
	clear: both;
}

.alarmDiv{
	height: 60px;
	cursor: pointer;
	border: 1px solid #eee;
}

.alarmDiv:hover {
	background: #eee;
}

.ntcIcon{
    width: 30px;
    background: #0f3970;
    height: 30px;
    float: left;
    margin: 4.7% 4%;
    border-radius: 50%;
}

.ntcIcon i{
    margin: 1px 5px;
    font-size: 1.4em;
    color: lightgray;
}
</style>
<script>

/*전역변수*/
	var initMinute; // 최초 설정할 시간(min)
	var remainSecond;  // 남은시간(sec)

function timeForToday(value) {
    const today = new Date();
    const timeValue = new Date(value);
	
//     console.log("today >> " + today + "/ timeValue >> " + timeValue);
    
    const betweenTime = Math.floor((today.getTime() - timeValue.getTime())/1000/60);
    if (betweenTime < 1) return '방금전';
    if (betweenTime < 60) {
//     	console.log("betweenTime >> " + betweenTime);
        return betweenTime + "분전";
    }

    const betweenTimeHour = Math.floor(betweenTime / 60);
    if (betweenTimeHour < 24) {
//     	console.log("betweenTimeHour >> " + betweenTimeHour);
        return betweenTimeHour + "시간전";
    }

    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
    if (betweenTimeDay < 365) {
//     	console.log("betweenTimeDay >> " + betweenTimeDay);
        return betweenTimeDay + "일전";
    }

    return Math.floor(betweenTimeDay / 365) + "년전";
}
	

$(function() {
	setTimeout(function alarm() {
// 		console.log("alarm");
		$.ajax({
				url : "/notification/getNotification",
				type : 'get',
				success : function(result) {
// 					console.log(JSON.stringify(result));

					if(result.length == ''){
						$('#cnt').text('0');
					}else{
						$('#cnt').text(result.length);
					}
					
					code = "";
					$.each(result, function(i, v) {
						code += '<div class="alarmDiv">';
						code += '<div class="ntcIcon">';
                        code += '<i class="mdi mdi-comment-account-outline"></i>';
                        code += '</div>';
						code += '<div class="alarm" data-url='+ v.ntfUrl + ' data-ntf-cd=' + v.ntfCd + '><div>'
						code += v.ntfCon + '</div>';
						code += '<div><small class="text-muted">'+ timeForToday(v.ntfTm)+ '&emsp;</small></div></div>';
						code += '<div class="deleteAlarm" data-ntf-cd=' + v.ntfCd + '><i class="dripicons-cross"></i></div>';
						code += '</div>';
						code += '<div class="clear"></div>';
// 						code += '<a href="#" class="dropdown-item notify-item alarm noticeBody" data-url='+ v.ntfUrl + ' data-ntf-cd=' + v.ntfCd + '>';
// 						code += '<div class="notify-icon bg-primary">';
// 						code += '<i class="mdi mdi-comment-account-outline"></i></div>';
// 						code += '<p class="notify-details alarmCon">'+ v.ntfCon;
// 						code += '<small class="text-muted">'+ timeForToday(v.ntfTm)+ '&emsp;</small></p>';
// 						code += '</a>';
// 						code += '<i class="dripicons-cross deleteAlarm" data-ntf-cd=' + v.ntfCd + '></i>';
					});
					$('#alarm').html(code);
					if (result.length > 0) {
						$('.alarmS').html('<i class="dripicons-bell noti-icon"></i><span class="noti-icon-badge"></span>');
					} else {
						$('.alarmS').html('<i class="dripicons-bell noti-icon"></i>');
					}
				},
				dataType : 'json'
		});
		setTimeout(alarm, 1000);
	}, 100);
	
	$(document).on('click', '.alarm', function() {
		var url = $(this).data("url");
		var ntfCd = $(this).data("ntfCd");
		
		var data = { "ntfCd" : ntfCd }

		$.ajax({
			url : "/notification/updateNtfYn",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : 'post',
			success : function(result) {
				location.href = url;
			},
				dataType : 'json'
		});
	});

	// x표시 눌렀을 때
	$(document).on("click", '.deleteAlarm', function() {
		var ntfCd = $(this).data("ntfCd");
		var data = { "ntfCd" : ntfCd };

		$.ajax({
			url : "/notification/updateNtfYn",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : 'post',
			success : function(result) {
				
			},
			dataType : 'json'
		});
	});
	
	$(".deleteAlarm").mouseover(function(){
		$(".deleteAlarm").css("background","#eee");
	});
	
	
	
	//---------------------------세션타이머를 위한 코드 시작---------------------------
	clearSessionTime(60); // 세션 만료 적용 시간 
	setSessionTimer();    // 문서 로드시 타이머 시작
	
	function clearSessionTime(min){//타이머 초기화 함수
		initMinute = min; 
		remainSecond = min*60; 
	}
	
	function setSessionTimer(){//1초 간격으로 호출할 타이머 함수
		//hh:mm으로 남은 시간 표기하기 위한 변수
		remainMinute_ = parseInt(remainSecond/60);
		remainSecond_ = remainSecond%60;
		
		if(remainSecond > 0){
			$("#timer").empty();
			$("#timer").append(Lpad(remainMinute_,2) + ":" + Lpad(remainSecond_,2));
			remainSecond--;
		}else{
			alert('세션이 종료되었습니다. 자동 로그아웃이 됩니다.');
			/*세션 종료 시 작동할 이벤트*/
			location.href="/main/logout";
		}
		
	}
	
	let count = 0;
	setInterval(() => setSessionTimer(), 1000);
	
	function Lpad(str,len){
		str = str + "";
		while(str.length<len){
			str="0" + str;
			
		}
		return str;
	}
	
	$("#loginExtension").on('click',function(){
		clearSessionTime(60); // 세션 만료 적용 시간 
		setSessionTimer();    // 문서 로드시 타이머 시작
	})
	//---------------------------세션타이머를 위한 코드 끝---------------------------
	
});
</script>
<!-- 세션 연장/로그아웃 선택 창 -->
<div class="navbar-custom topnav-navbar">
	<!-- LOGO -->
	<a href="/main/mainPage" class="logo text-center logo-light">
		<span class="logo-lg">
			<img class="logoName" src="/resources/images/logoName.png" alt="" height="50">
		</span>
		<span class="logo-sm">
			<img src="/resources/images/logo.png" alt="" height="50">
		</span>
	</a>

	<!-- LOGO -->
	<a href="/main/mainPage" class="logo text-center logo-dark">
		<span	class="logo-lg">
			<img src="/resources/images/logoName.png" alt="" height="50">
		</span>
		<span class="logo-sm">
			<img src="/resources/images/logo.png" alt="" height="50">
		</span>
	</a>
	<div class="container-fluid">


		<ul class="list-unstyled topbar-right-menu float-right mb-0">
			<li class="dropdown notification-list topbar-dropdown"><a
				class="nav-link dropdown-toggle arrow-none"
				data-bs-toggle="dropdown" href="#" role="button"
				aria-haspopup="false" aria-expanded="false"> <span
					class="align-middle d-none d-sm-inline-block" id="timer"></span>
			</a></li>

			<li class="dropdown notification-list topbar-dropdown" id="loginExtension"><a
				class="nav-link dropdown-toggle arrow-none"
				data-bs-toggle="dropdown" href="#" role="button"
				aria-haspopup="false" aria-expanded="false"> <span
					class="align-middle d-none d-sm-inline-block">로그인연장&emsp;|</span>
			</a></li>

			<li class="dropdown notification-list topbar-dropdown"><a
				class="nav-link dropdown-toggle arrow-none"
				data-bs-toggle="dropdown" href="/main/logout" role="button"
				aria-haspopup="false" aria-expanded="false"> <span
					class="align-middle d-none d-sm-inline-block">로그아웃</span>
			</a></li>

			<li class="dropdown notification-list"><a
				class="nav-link dropdown-toggle arrow-none alarmS"
				data-toggle="dropdown" href="#" id="topbar-notifydrop" role="button"
				aria-haspopup="true" aria-expanded="false"> <i
					class="dripicons-bell noti-icon"></i>
			</a>
				<div
					class="dropdown-menu dropdown-menu-right dropdown-menu-animated dropdown-lg"
					aria-labelledby="topbar-notifydrop" style="max-height: 230px;">

					<!-- item-->
					<div class="dropdown-item noti-title">
						<h5 class="m-0">
							<span class="float-right">
								<a href="javascript: void(0);" class="text-dark"> </a>
							</span>알림(<span id="cnt" style="color: #999;"></span>)
						</h5>
					</div>
					<div class="ntcWrapper" style="max-height: 238px;" data-simplebar>
						<div id="alarm"></div>
					</div>

				</div></li>

			<li class="dropdown notification-list">
			<a
				class="nav-link dropdown-toggle nav-user arrow-none mr-0" href="#"
				role="button" aria-haspopup="true" aria-expanded="false"> <span
					class="account-user-avatar">
					<c:if test="${ sessionScope.memSession.memFnm != null }">
						<img class="rounded-circle" src="/resources/profileImg/${ sessionScope.memSession.memFnm }">
					</c:if>
					<c:if test="${ sessionScope.memSession.memFnm == null }">
						<img class="rounded-circle" src="/resources/profileImg/mem_adult.png">
					</c:if>
				</span> <span> <span class="account-user-name">${ memSession.memNm }</span>
						<c:if test="${ memSession.studentVO.stuCd != null }">
							<span class="account-position">${ memSession.studentVO.depNm }
								| ${ memSession.memCd }</span>
						</c:if> <c:if test="${ memSession.professorVO.proCd != null }">
							<span class="account-position">${ memSession.professorVO.depNm }
								| ${ memSession.memCd }</span>
						</c:if> <c:if test="${ memSession.managerVO.mgrCd != null }">
							<span class="account-position">${ memSession.managerVO.mgrDivNm }
								| ${ memSession.memCd }</span>
						</c:if>
				</span>
			</a></li>
		</ul>
	</div>
</div>
