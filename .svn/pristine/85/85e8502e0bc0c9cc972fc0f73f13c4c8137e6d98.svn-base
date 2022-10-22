<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link rel="stylesheet" href="/resources/css/loginPage.css">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" defer="defer">

$(function(){
	
	var roll = 0;
	
	setInterval(function(){
		
		roll ++;
		
		if(roll == 10){
			roll = 0;
		}
		
		$("#roll").fadeTo(800, 0.6, function(){
			$("#roll").attr("src", "/resources/images/login_" + (roll+1)+ ".jpg");
			$("#roll").fadeTo(1000, 1);
		});
		
	},3000);
	
	//저장된 쿠키값을 가져와서 ID칸에 넣어주는데 없으면 공백으로 들어감.
	var key = getCookie("key");
	$('#rememberId').val(key);
	
	//그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력칸에 저장된 ID가 표시된 상태라면,
	if($('#id').val(key) != ""){
		$('#rememberId').attr("checked",true);//ID저장하기를 체크 상태로 두기
	}
	
	var inputPass = document.getElementById("memPass");
	inputPass.addEventListener("keyup", function(event) {
	  //엔터키로 로그인하기
      if(event.keyCode === 13) {
        event.preventDefault();
        document.getElementById("loginBtn").click();
      }
    });
	
});
	$('#checkId').change(function(){//체크박스에 변화가 있다면,
		if($('#rememberId').is(":checkd")){//ID저장하기 체크 시
			setCookie("key",$('#id').val(),time()+60*60*1);//1시간 동안 쿠키 보관
		}else{//ID저장하기 체크 해제 시,
			deleteCookie("key");
		}
	});
	
	//ID저장하기를 체크한 상태에서 ID를 입력하는 경우에도 쿠키 저장
	$('#id').keyup(function(){
		if($('#rememberId').is(":checked")){
			setCookie("key",$("#id").val(),time()+60*60*1);
		}
	})
	
	//쿠키 저장하기
	//setCookie => 쿠키를 생성하고 지워주는 역할
	function setCookie(cookieName, value, exdays){
		var exdate = new Date();
		exdate.setDate(exdate.getDate() + exdays);
		var cookieValue = escape(value)
							+ ((exdays == null)? "" : ";expires = " + exdate.toGMTString());
		document.cookie = cookieName + "=" + cookieValue;
	}
	
	//쿠키 삭제
	function deleteCookie(cookieName){
		var expireDate = new Date();
		expireDate.setDate(expireDate.getDate() - 1);
		document.cookie = cookieName + "=" + "; expires=" + expireDate.toGMTString();
	}
	
	function getCookie(cookieName){
		cookieName = cookieName + "=";
		var cookieData = document.cookie;
		var start = cookieData.indexOf(cookieName);
		var cookieValue = '';
		if(start != -1){//쿠키가 존재하면
			start += cookieName.length;
			var end = cookieData.indexOf(';',start);
			if(end==-1)//쿠키 값의 마지막 위치 인덱스 번호 설정
				end = cookieData.length;
			console.log("end위치 : " + end);
			cookieValue = cookieData.substring(start,end);
		}
		return unescape(cookieValue);
	}

	function login() {
		if( $('#memCd').val().trim() == '' ) {
			alert('아이디를 입력하세요!');
			$('#memCd').focus();
			return;
		} else if( $('#memPass').val().trim() == '' ) {
			alert('비밀번호를 입력하세요!');
			$('#memPass').focus();
			return;
		}
		
		let data = {"id":$('#memCd').val(), "pw":$('#memPass').val() };
		
		$("#frm").submit();
	}
	
	//Caps Lock 이벤트
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
			$('#alertCapsLock').text("CapsLock이 켜져 있습니다.");
			setTimeout("fnCapsHide()", 1500);
		}
	
		//Shift를 누른 상태에서 소문자 범위 일 경우
		if ((keyCode >= 97 && keyCode <= 122) && shiftKey) {
			$('#alertCapsLock').text("CapsLock이 켜져 있습니다.");
			setTimeout("fnCapsHide()", 1500);
		}
	}
	
	function fnCapsHide() {
		$('#alertCapsLock').text("");
	}
	
	//학생 자동 로그인
	function stuAutoLogin() {
		$('#memCd').val('20163530');
		$('#memPass').val('java');
		$('#frm').submit();
	}
	//교수 자동 로그인
	function proAutoLogin() {
		$('#memCd').val('200231111');
		$('#memPass').val('java');
		$('#frm').submit();
	}
	//관리자 자동 로그인
	function manAutoLogin() {
		$('#memCd').val('202203');
		$('#memPass').val('java');
		$('#frm').submit();
	}

</script>
</head>
<body>
<c:if test="${param.result== 0}">
	<script type="text/javascript" defer="defer">alert('아이디나 비밀번호가 일치하지 않습니다!');</script>
</c:if>

<div class="imgSlide">
	<ul class="slides">
		<li><img src="/resources/images/login_1.jpg" id="roll" style="filter: brightness(0.5);"/></li>
	</ul>
</div>

<div id="allRound">
	<!--
		인재의 바람을 이루고, 세상의 바람을 이끌며, 시대를 이롭게 하는
		IJU의 미래로 우리의 큰걸음을 내딛습니다.
	-->
	<div class="pContainer">
		<p class="pMent"><img id="logoImg" alt="다운로드-removebg-preview.png" src="/resources/images/다운로드-removebg-preview.png"></p>
		<p class="pMent" id="pMent1">인재의 바람을 이루고, 세상의 바람을 이끌며, 시대를 이롭게 하는</p>
		<p class="pMent" id="pMent2">IJU의 미래로 우리의 큰걸음을 내딛습니다.</p>
	</div>

	<div class="containers">
	<!-- ----------------- 500 오류 메시지 시작 ------------------------------ -->
	<div class="card border-dark mb-3" style="width:100%;"> 
	  <div class="card-header">
	  	<div style="float:left;">웹페이지를 표시할 수 없습니다</div>
	  	<div style="float:right;"><a href="/login/loginForm" class="btn btn-primary">Back to home</a></div>
	  </div>
	  <div class="card-body text-dark">
<!-- 	    <h5 class="card-title">Dark card title</h5> -->
	    <p class="card-text" style="text-align:center;">
	    	<img src="/resources/images/error500.png" alt="page-misc-error-light" style="width:60%;" class="img-fluid" data-app-dark-img="/resources/images/error500.png" data-app-light-img="/resources/images/error500.png">
	    </p>
	  </div>
	</div>
	<!-- ----------------- 500 오류 메시지 끝 ------------------------------ -->
	</div>
</div>
</body>
</html>