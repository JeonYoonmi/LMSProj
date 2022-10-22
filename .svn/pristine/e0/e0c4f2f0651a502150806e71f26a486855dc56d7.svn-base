<%@page import="kr.ac.lms.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/register.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/register.css" type="text/css">
<link rel="stylesheet" href="/resources/css/topTable.css" type="text/css">
</head>
<script type="text/javascript" defer="defer">
	var socket = null;
	var grid;
	var grid1;
	var colorArr = [
		"#fbf8cc", "#fde4cf", "#ffcfd2", "#f1c0e8", "#cfbaf0",
		"#a3c4f3", "#90dbf4", "#8eecf5", "#98f5e1", "#b9fbc0"
	];
	var colorNum = 0;
	var subCd = '';
	var socketMessage = '';
	//검색 버튼을 누를 때 값을 저장한다.
	var yearVal = '${map.YEAR}';
	var semVal = '${map.SEMESTER}';
	var depVal = '';
	var cateVal = '';
	var subVal = '';
	
	$(document).ready(function() {
		
		loadingWithMask(); //로딩중 화면 띄우기
		getInfo(); //개인정보 가져오기
		getDepartment(); //개설학과 불러오기
		getList(); //개설강좌 불러오기 (장바구니에 담은 과목이 위에 출력)
		getRegList(); //수강신청 완료 리스트 불러오기
		getCnt(); //수강신청 학점 및 과목수 불러오기
		getTime(); //수강신청 시간표 가져오기
		
		//192.168.146.49
		if(${sessionScope.memSession.memCd != null}) {
			
			//소켓 객체 생성 후 전역변수에 담음
			var soc = new SockJS("/alram");
			socket = soc;
			
			//소켓 연결 함수
			soc.onopen = function() {
				//var msg = "${sessionScope.memSession.memNm}님이 접속했습니다.,all";
				//socket.send(msg);
			};
			
			//메시지 수신 함수
			soc.onmessage = function(data) {
				socketMessage += data.data;
			};
		}
		
		//1초에 한번씩 socketMessage 변화가 있는지 확인하기
		setInterval(function() {
			
			console.log("msg : " + socketMessage);
			
			if(socketMessage != '') {
				
				//socketMessage를 비워주기
				socketMessage = '';
				
				let dataObject = {
					year :  yearVal,
					semester : semVal,
					department : depVal,
					category : cateVal,
					subject : subVal
				};
				//lec_hcnt만 불러와서 grid, grid1에 값 넣기
				updateCntList(dataObject);
				updateCntWishList();
			}
		}, 500);
		
		//과목번호 및 과목명 입력 후 엔터키를 눌러도 조회 버튼 클릭으로 연결됨
		var inputSubject = document.getElementById("subject");
		
		inputSubject.addEventListener("keyup", function(event) {
	      if(event.keyCode === 13) {
	        event.preventDefault();
	        document.getElementById("btn2GetList").click();
	      }
	    });
		
		//개설강좌 검색
		$('#btn2GetList').on('click', function() {
			
			yearVal = $('#year').val();
			semVal = $('#semester').val();
			depVal = $('#department').val();
			cateVal = $('#category').val();
			subVal = $('#subject').val();
			
			let dataObject = {
				year :  yearVal,
				semester : semVal,
				department : depVal,
				category : cateVal,
				subject : subVal
			};
			getListAgain(dataObject);
		});
		
		//시간표 열기 버튼
		$('#timeTableOpen').on('click', function() {
			$('#timeTableDiv').show();
			$('#timeTableClose').show();
			$('#timeTableOpen').hide();
			$('#gridDiv').css('width', '1110px')
			 .css('padding-right', '0px');
			
			let dataObject = {
				year :  yearVal,
				semester : semVal,
				department : depVal,
				category : cateVal,
				subject : subVal
			};
			getListAgain(dataObject);
			getRegListAgain();
		});
		
		//시간표 닫기 버튼
		$('#timeTableClose').on('click', function() {
			$('#timeTableDiv').hide();
			$('#timeTableClose').hide();
			$('#timeTableOpen').show();
			$('#gridDiv').css('width', '1600px')
			 .css('padding-right', '35px');
			
			let dataObject = {
				year :  yearVal,
				semester : semVal,
				department : depVal,
				category : cateVal,
				subject : subVal
			};
			getListAgain(dataObject);
			getRegListAgain();
		});
	});
</script>
<body>
<div>
	<div style="width:100%;">
    	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">본수강신청</span>
  	</div>
  	
  	<br>
  	
  	<table id="stuInfoTable">
  		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
		<tr>
			<th>소속</th>
			<td>
				<input class="infoText" type="text" name="college" id="college" readonly="readonly">
			</td>
			<th>기준학점</th>
			<td>
				<input class="infoText" type="text" name="credit" id="credit" readonly="readonly">
			</td>
			<th>신청가능학점</th>
			<td>
				<input class="infoText" type="text" name="myCredit" id="myCredit" readonly="readonly">
			</td>
			<th>학년</th>
			<td>
				<input class="infoText" type="text" name="yrNsem" id="yrNsem" readonly="readonly">
			</td>
			<th></th>
		</tr>
  		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
  	</table>
  	
  	<br><br>
  	
  	<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;검색
	<p></p>
  	<table id="stuInfoTable1">
		<tr>
			<td colspan="7" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
		<tr>
			<th>년도</th>
			<td>
				<select class="infoText" name="year" id="year">
					<option value="${map.YEAR}" selected>${map.YEAR}</option>
				</select>
			</td>
			<th>학기</th>
			<td>
				<select class="infoText" name="semester" id="semester">
					<option value="${map.SEMESTER}" selected>${map.SEMESTER}학기</option>
				</select>
			</td>
			<th>학과전공</th>
			<td>
				<select class="infoText" name="department" id="department">
					<option value="">전체</option>
				</select>
			</td>
			<th></th>
		</tr>
		<tr>
			<td colspan="7" style="background: #F3F8FF; height: 5px;"></td>
		</tr>
		<tr>
			<th>이수구분</th>
			<td>
				<select class="infoText" name="category" id="category">
					<option value="">전체</option>
					<option value="전필">전공필수(전필)</option>
					<option value="전선">전공선택(전선)</option>
					<option value="교필">교양필수(교필)</option>
					<option value="교선">교양선택(교선)</option>
				</select>
			</td>
			<th>과목번호/명</th>
			<td>
				<input class="infoText" type="text" name="subject" id="subject" placeholder="미입력시 전체조회">
			</td>
			<td colspan="2">
				<button type="button" class="btn btn-secondary" id="btn2GetList" style="height: 28px;margin-top:-2px;">
					<p style="margin-top: -4px;">조회</p>
				</button>
			</td>
			<th></th>
		</tr>
		<tr>
			<td colspan="7" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
	</table>
	
<!-- 	<div id="courseInfo"> -->
<!-- 	<label>년도 -->
<!-- 		<select name="year" id="year"> -->
<%-- 			<option value="${map.YEAR}" selected>${map.YEAR}</option> --%>
<!-- 		</select> -->
<!-- 	</label> -->
<!-- 	<label>학기 -->
<!-- 		<select name="semester" id="semester"> -->
<%-- 			<option value="${map.SEMESTER}" selected>${map.SEMESTER}학기</option> --%>
<!-- 		</select> -->
<!-- 	</label> -->
<!-- 	<br><br> -->
<!-- 	<label>학과전공 -->
<!-- 		<select name="department" id="department"> -->
<!-- 			<option value="">전체</option> -->
<!-- 		</select> -->
<!-- 	</label> -->
<!-- 	<label>이수구분 -->
<!-- 		<select name="category" id="category"> -->
<!-- 			<option value="">전체</option> -->
<!-- 			<option value="전필">전공필수(전필)</option> -->
<!-- 			<option value="전선">전공선택(전선)</option> -->
<!-- 			<option value="교필">교양필수(교필)</option> -->
<!-- 			<option value="교선">교양선택(교선)</option> -->
<!-- 		</select> -->
<!-- 	</label> -->
<!-- 	<br><br> -->
<!-- 	<label>과목번호/명 -->
<!-- 			<input type="text" name="subject" id="subject"> 미입력시 전체 조회 -->
<!-- 	</label> -->
<!-- 	<button type="button" class="btn btn-secondary" id="btn2GetList">조회</button> -->
<!-- 	</div> -->
	
	<br><br>
	
	<div id="timeTableDiv" style="float:left; display:none;">
	<b>[시간표]</b>
	<p style="margin-bottom:15px;"></p>
	
		<table id ="showTimeTable" border="1">
			<tr><th style="height : 40px;"></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th></tr>
  			<tr><th rowspan="2" style="height : 70px;">1교시</th><td></td><td></td><td></td><td></td><td></td></tr>
  			<tr><td></td><td></td><td></td><td></td><td></td></tr>
  			<tr><th rowspan="2" style="height : 70px;">2교시</th><td></td><td></td><td></td><td></td><td></td></tr>
  			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2" style="height : 70px;">3교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2" style="height : 70px;">4교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2" style="height : 70px;">5교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2" style="height : 70px;">6교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2" style="height : 70px;">7교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2" style="height : 70px;">8교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2" style="height : 70px;">9교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
		</table>
	</div>
	
	<div id="gridDiv" style="float:left; width:1600px;padding-right:35px;">
		<b>[개설강좌]</b>
		&emsp;
		<span id="beRed">▶ 개설강좌 윗부분에는 장바구니 목록, 아랫부분에는 장바구니에 없는 강의 목록이 출력됩니다.</span>
		<button type="button" class="btn btn-secondary ttBtn" id="timeTableOpen" style="float:right;">시간표 열기</button>
		<button type="button" class="btn btn-secondary ttBtn" id="timeTableClose" style="display:none;float:right;">시간표 닫기</button>
		<p></p>
		
		<div id="grid"></div>
		
		<br><br>
		
		<b>[수강신청 내역]</b>
		<span style="float:right">
			<label class="labelRegCnt">신청학점 : </label> 
			<span class="registerCnt" id="registerCrd"></span>
			<label class="labelRegCnt">신청과목수 : </label>
			<span class="registerCnt" id="registerSub"></span>
		</span>
		<br><br>
		<div id="grid1"></div>
	</div>
	
</div>
</body>
</html>