<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>예비 수강신청</title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<script type="text/javascript" src="/resources/js/pregister.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/pregister.css" type="text/css">
<link rel="stylesheet" href="/resources/css/topTable.css" type="text/css">
</head>
<script type="text/javascript" defer="defer">
	var gridData;
	var grid;
	var grid1;
	var timeArr = [];
	var preTimeArr = [];
	var colorArr = [
			"#fbf8cc", "#fde4cf", "#ffcfd2", "#f1c0e8", "#cfbaf0",
			"#a3c4f3", "#90dbf4", "#8eecf5", "#98f5e1", "#b9fbc0"
	];
	var colorNum = 0;
	var subCd = '';
	var flag = true;
	
	window.onload = function() {
		
		loadingWithMask(); //로딩중 화면 띄우기
		getInfo(); //개인정보 불러오기
		getDepartments(); //개설학과 리스트 불러오기
		getCnt(); //장바구니 신청학점, 신청과목수 불러오기
		getList(); //개설강좌 리스트 불러오기
		getWishList(); //장바구니 리스트 불러오기
		
		//과목번호 및 과목명 입력 후 엔터키 -> 개설강좌 검색
		document.getElementById("subject").addEventListener("keyup", function(event) {
	      if(event.keyCode === 13) {
	        event.preventDefault();
	        document.getElementById("btn2GetList").click();
	      }
	    });
		
		//개설강좌 검색
		$('#btn2GetList').on('click', function() {
			let dataObject = {
				year :  $('#year').val(),
				semester : $('#semester').val(),
				department : $('#department').val(),
				category : $('#category').val(),
				subject : $('#subject').val()
			};
			getListAgain(dataObject); //검색 후 개설강좌 리스트 불러오기
		});
		
		//시간표 열기 버튼
		$('#timeTableOpen').on('click', function() {
			$('#timeTableDiv').show();
			$('#timeTableClose').show();
			$('#timeTableOpen').hide();
			$('#gridDiv').css('width', '1110px')
						 .css('padding-right', '0px');
			let dataObject = {
				year :  $('#year').val(),
				semester : $('#semester').val(),
				department : $('#department').val(),
				category : $('#category').val(),
				subject : $('#subject').val()
			};
			getListAgain(dataObject);
			getWishListAgain();
		});
		
		//시간표 닫기 버튼
		$('#timeTableClose').on('click', function() {
			$('#timeTableDiv').hide();
			$('#timeTableClose').hide();
			$('#timeTableOpen').show();
			$('#gridDiv').css('width', '1600px')
						 .css('padding-right', '35px');
			let dataObject = {
				year :  $('#year').val(),
				semester : $('#semester').val(),
				department : $('#department').val(),
				category : $('#category').val(),
				subject : $('#subject').val()
			};
			getListAgain(dataObject);
			getWishListAgain();
		});
	}
</script>
<body>
<script type="text/javascript" defer="defer">
	tui.Grid.setLanguage('ko');

	tui.Grid.applyTheme('default', {
		row : {
			hover : {
				background : 'yellow'
			}
		}
	});
</script>
<div id="pregisterListRound">
	<div>
    	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">예비수강신청</span>
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
					<option value="전필" <c:if test="${param.year == '전필'}">selected</c:if>>전공필수(전필)</option>
					<option value="전선" <c:if test="${param.year == '전선'}">selected</c:if>>전공선택(전선)</option>
					<option value="교필" <c:if test="${param.year == '교필'}">selected</c:if>>교양필수(교필)</option>
					<option value="교선" <c:if test="${param.year == '교선'}">selected</c:if>>교양선택(교선)</option>
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
<!-- 	<div class="round"> -->
<!-- 		<label>년도</label> -->
<!-- 		<select name="year" id="year"> -->
<%-- 			<option value="${map.YEAR}" selected>${map.YEAR}</option> --%>
<!-- 		</select> -->
<!-- 	</div> -->
<!-- 	<div class="round"> -->
<!-- 		<label>학기</label> -->
<!-- 		<select name="semester" id="semester"> -->
<%-- 			<option value="${map.SEMESTER}" selected>${map.SEMESTER}학기</option> --%>
<!-- 		</select> -->
<!-- 	</div> -->
<!-- 	<div class="round"> -->
<!-- 		<label>학과전공</label> -->
<!-- 			<select name="department" id="department"> -->
<!-- 				<option value="">전체</option> -->
<!-- 			</select> -->
<!-- 	</div> -->
<!-- 	<div class="round"> -->
<!-- 		<label>이수구분</label> -->
<!-- 		<select name="category" id="category"> -->
<!-- 			<option value="">전체</option> -->
<%-- 			<option value="전필" <c:if test="${param.year == '전필'}">selected</c:if>>전공필수(전필)</option> --%>
<%-- 			<option value="전선" <c:if test="${param.year == '전선'}">selected</c:if>>전공선택(전선)</option> --%>
<%-- 			<option value="교필" <c:if test="${param.year == '교필'}">selected</c:if>>교양필수(교필)</option> --%>
<%-- 			<option value="교선" <c:if test="${param.year == '교선'}">selected</c:if>>교양선택(교선)</option> --%>
<!-- 		</select> -->
<!-- 	</div> -->
<!-- 	<div class="round"> -->
<!-- 		<label>과목번호/명</label> -->
<!-- 		<input type="text" name="subject" id="subject"> 미입력시 전체 조회 -->
<!-- 		<button type="button" class="btn btn-secondary" id="btn2GetList">조회</button> -->
<!-- 	</div> -->
<!-- 	</div> -->
	
	<br><br>
	
	<div id="timeTableDiv" style="float:left; display:none;">
		<b>[시간표]</b>
		<p style="margin-bottom:15px;"></p>
		
		<table id="showTimeTable" border="1">
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
	<div id="gridDiv" style="width:1600px;padding-right:35px;">
		<b>[개설강좌]</b>
		&emsp;
		<span id="beRed">▶ 본 화면은 예비 수강신청 화면입니다. 실제 수강신청 확정은 수강신청 화면에서 이루어집니다.</span>
		<button type="button" class="btn btn-secondary ttBtn" id="timeTableOpen" style="float:right;">시간표 열기</button>
		<button type="button" class="btn btn-secondary ttBtn" id="timeTableClose" style="display:none;float:right;">시간표 닫기</button>
		<p></p>

		<div id="grid"></div>
		
		<br><br>
		
		<b>[장바구니 신청내역]</b>
		<span style="float:right">
			<label class="labelRegCnt">신청학점 : </label> 
			<span class="pregisterCnt" id="pregisterCrd"></span>
			<label class="labelRegCnt">신청과목수 : </label> 
			<span class="pregisterCnt" id="pregisterSub"></span>
		</span>
		<br><br>
		<div id="grid1"></div>
	</div>
</div>
</body>
</html>