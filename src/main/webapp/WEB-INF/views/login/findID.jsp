<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/비밀번호 찾기</title>
<link rel="stylesheet" href="/resources/css/findID.css"/>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" defer="defer">
$(function(){
	
	//배경화면
	var roll = 0;
	
	setTimeout(function images(){
		
		roll ++;
		
		if(roll == 10){
			roll = 0;
		}
		
		setTimeout(function() {}, 1000);
		
		$("#roll").fadeTo(1000, 0.6, function(){
			$("#roll").attr("src", "/resources/images/login_" + (roll+1)+ ".jpg");
// 			$("#roll").fadeTo(1000, 0.6);
		});
		
		$("#roll").fadeTo(1000, 1);
		
		setTimeout(images, 3000);
	}, 3000);
	
	$('#findId').on('click',function(){
		$('#passForm').hide();
		$('#findForm form').show();
		$('#findId')
		.css('background','white')
		.css('color','#001353')
		.css('opacity','70%')
		.css('padding', '10px')
		.css('border','3px solid white');
		
		$('#findPass')
		.css('background','#001353')
		.css('color','white')
		.css('opacity', '70%')
		.css('padding', '10px')
		.css('border', '3px solid #001353');
		
	});
	
	$('#findPass').on('click',function(){
		$('#findForm form').hide();
		$('#passForm').show();
		$('#findPass')
		.css('background','white')
		.css('color','#001353')
		.css('opacity','70%')
		.css('padding', '10px')
		.css('border','3px solid white');
		
		$('#findId')
		.css('background','#001353')
		.css('color','white')
		.css('opacity', '70%')
		.css('padding', '10px')
		.css('border', '3px solid #001353');
	});
	
	$('#confirmId').on('click', function() {
		
		memNm = $('#memNm').val();
		memReg1 = $('#memReg1').val();
		depNm = $('#depNm').val();
		
		
		$.ajax({
			type: 'post',
			url: '/login/confirmId',
			data: { 
					memNm : memNm,
					memReg1 : memReg1,
					depNm : depNm
					},
			success :function(res){
				console.log(res);
				//alert("회원님의 아이디는 " + res + "입니다.");
				
				if(res == null || res == '') {
					$('#alertId').text("일치하는 아이디가 없습니다.");
				}else {
					$('#alertId').text("회원님의 아이디는 " + res + "입니다.");
				}
			},
			error: function(req, text) {
				 alert(text + ': ' + req.status);
		 	}
		});
	});
	
	
	$('#confirmPass').on('click', function() {
		
		let memCd = $("#memCd").val();
		let tel = $('#tel').val();
		let tel1 = $('#tel1').val();
		let tel2 = $('#tel2').val();
		
		if(memCd == '') {
			alert("아이디를 입력해주세요.");
			return;
		}else if(tel1 == '' || tel2 == '') {
			alert("전화번호를 입력해주세요.");
			return;
		}
		
		tel = tel + "-" + tel1 + "-" + tel2;
		
		let data = {"memCd":memCd,"tel":tel};
		
		console.log("data : " + JSON.stringify(data));
		
		$.ajax({
			type: 'post',
			url: '/login/confirmPass',
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			success :function(res){
				console.log("res : " + JSON.stringify(res));
				alert(res + "\n(으)로 임시비밀번호를 전송하였습니다.");
			},
			error: function(req, text) {
				 alert(text + ': ' + req.status);
		 	}
		});
		
	});


	$('#idInfoInsertBtn').on('click',function(){
		$('#memNm').attr('value','이도현');
		$('#memReg1').attr('value','950411');
		$('#depNm').attr('value','국어국문학과');
	})
	
	$('#passInfoInsertBtn').on('click',function(){
		$('#memCd').attr('value','20220001');
		$('#tel').attr('value','010');
		$('#tel1').attr('value','4929');
		$('#tel2').attr('value','0808');
	})
	
});
</script>
</head>
<body>
<div class="imgSlide">
	<ul class="slides">
		<li><img src="/resources/images/login_1.jpg" id="roll" style="filter: brightness(0.5);"/></li>
	</ul>
</div>

<div id="fullScreen">
<!-- 	<img alt="이미지" src="/resources/images/campus2.png" id="img"> -->
	
	<div id="findForm">
		<button id="findId">아이디 찾기</button>
		<button id="findPass">비밀번호 찾기</button>
		
		<form action="/login/hi" method="post">
			<label>이름</label>
			<input type="text" id="memNm" placeholder="이름을 입력하세요."/>
			<br>
			<label>생년월일</label>
			<input type="text" id="memReg1" placeholder="주민번호 앞자리를 입력하세요."/>
			<br>
			<label>학과</label>
			<input type="text" id="depNm" placeholder="학과를 입력하세요."/>
			<button type="button" class="btn btn-outline-dark" id="confirmId">확인</button>
			<button type="button" id="idInfoInsertBtn" class="btn btn-secondary" style="position:absolute; top:500px;right:310px;">자동입력</button>
			<span id="alertId"></span>
			<p>
				<a href="/login/loginForm" id="goBackToLogin" style="text-decoration: none;">
					<i class="dripicons-reply" id="goBackToLoginIcon" style="color : #001353;"></i>
					&nbsp;로그인 페이지로 돌아가기
				</a>
			</p>
		</form>
		
		
		<div id="passForm" style="display:none;">
			<label>ID</label><input type="text" id="memCd" placeholder="ID를 입력하세요."/>
			
			<br>
			
			<label>전화번호</label>
			<select id="tel">
				<option selected>010</option>
				<option>011</option>
				<option>016</option>
				<option>017</option>
				<option>018</option>
				<option>019</option>
			</select>
			-<input type="text" id="tel1"/>
			-<input type="text" id="tel2"/>
			
			<br>
			
			<button type="button" class="btn btn-outline-dark" id="confirmPass">임시 비밀번호 전송</button>
			<button type="button" id="passInfoInsertBtn" class="btn btn-secondary" style="position:absolute; top:500px;right:310px;">자동입력</button>
			<span id="spanForMargin"></span>
			<p>
				<a href="/login/loginForm" id="goBackToLogin" style="text-decoration: none;">
					<i class="dripicons-reply" id="goBackToLoginIcon" style="color : #001353;"></i>
					&nbsp;로그인 페이지로 돌아가기
				</a>
			</p>
		</div>
	</div>
</div>
</body>
</html>