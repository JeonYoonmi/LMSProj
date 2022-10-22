<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>당학기 성적 정보</title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<style type="text/css">
	#personalGradeInfo, #tgradeYellowBox {
		border : 1px solid lightgray;
		margin : 10px;
		padding : 10px;
	}
	#tgradeYellowBox {
		background : lightyellow;
	}
	#tgradeYellowBox  input{
		width : 80px;
		margin-left : 7px;
		margin-right : 7px;
		padding-left : 10px;
	}
	#tgradeGreenText {
		color : green;
	}
	#tgradeTable {
		width : 98%;
		height : 70px;
		border : 1px solid lightgray;
		border-collapse: collapse;
		margin : 10px;
		text-align : center;
		background-color : white;
	}
	#tgradeTable td, #tgradeTable th{
		padding-top : 5px;
		padding-bottom : 5px;
	}
	#tgradeTable tr:first-child, #tgradeTable tr:nth-child(2){
		background : rgb(244,247,253);
		color : black;
	}
	#tgradePreListRound{
		width : 90%;
		margin-left : auto;
		margin-right : auto;
	}
	.tgradePreListSelect{
		display:inline-block;
	}
	#personalGradeInfo{
		border: 1px solid lightgray;
		margin: 10px;
		padding: 10px;
		background: #f4f7fd;
		width: 100%;
		min-width: 1200px;
		max-width: 1400px;
		margin: 0 auto;
	}
	#personalGradeInfo div{
		display : inline-block;
	}
	#personalGradeInfo div:nth-child(2){
		margin-left : 254px;
	}
	#personalGradeInfo input{
		width : 180px;
	 	height: 33px;
	 	background: #F2F2F2;
	 	border: 1px solid gray;
	 	border-radius : 5px;
 		padding-left : 5px;
	}
	#personalGradeInfo label{
		text-align : right;
		width : 130px;
	}
	#grid td{
		background : #f9f9f9;
	}
	#percentageTable{
		float : right;
		margin-right : 10px;
	}
</style>
</head>
<script type="text/javascript" defer="defer">

	var memFnm;

	window.onload = function() {
		
		//로딩중 화면 띄우기
		loadingWithMask();
		setTimeout(closeLoadingWithMask, 700);
		
		//개인정보 가져오기
		$.ajax({
			url : "/tgrade/getInfo",
			type : "POST",
			dataType : "JSON",
			success : function(res) {
				//학번(memCd), 이름(memNm), 생년월일(memReg1), 연락처(memTel),
				//단과대학/전공(memNme), 입학정보(memAddr1), 변동(memAddr2), 수강신청학년(memMl)
				$('#stuCd').val(res.memCd);
				$('#memName').val(res.memNm);
				$('#memReg1').val(res.memReg1);
				$('#memTel').val(res.memTel);
				$('#college').val(res.memNme);
				$('#admission').val(res.memAddr1);
				$('#admChange').val(res.memAddr2);
				$('#yrNsem').val(res.memMl);
				
				memFnm = res.memFnm;
			}
		});
		
		//년도 및 학기 불러오기
		$.ajax({
			url : "/tgrade/getNow",
			type : "GET",
			dataType : "JSON",
			success : function(res) {
				$("#tgradePreYear").val(res.YEAR);
				$("#tgradePreSemester").val(res.SEMESTER);
			}
		});
		
		$.ajax({
			url : "/tgrade/getPreCnt",
			type : "POST",
			dataType : "JSON",
			success : function(res) {
				
				$("#tgradePreSub").text(res);
			}
		});
		
		//전체 성적 불러오기
		$.ajax({
			url : "/tgrade/getPreList",
			type : "POST",
			dataType : "JSON",
			success : function(res) {
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : res,
					scrollX : true,
					scrollY : true,
					bodyHeight : 400,
					columns : [
						{header : '년도/학기', filter : 'select', name : 'lecaCon', align : 'center'},
						{header : '과목번호', filter : 'select', name : 'subCd', align : 'center'},
						{header : '교과목명', filter : 'select', name : 'lecaNm'},
						{header : '이수구분', filter : 'select', name : 'lecaCate', align : 'center'},
						{header : '학점', filter : 'select', name : 'lecaCrd', align : 'center'},
						{header : '성적평가', filter : 'select', name : 'lecaGrade', align : 'center'},
						{header : '등급', filter : 'select', name : 'lecaNote', align : 'center'},
						{header : '평점', filter : 'select', name : 'lecaRoom', align : 'center'}
					],
					columnOptions : {
						resizable : true
					}
				});
			}
		});
		
		//백분율환산기준표 띄우기
		$('#percentageTable').on('click', function() {
			window.open("/tgrade/crdStandardPdf");
		});
		
		//사진 띄우기
		$('#photoBtn').on('click', function() {
			
			//memFnm : 이미지 이름.확장자
			if(memFnm == null) {
				alert("등록된 사진이 없습니다.");
			}else {
				
				const img = new Image();
				img.src = "/resources/profileImg/" + memFnm;
				console.log("width : " + img.width + ", height : " + img.height);
				
				window.open(
						"/tgrade/getPhoto?memFnm=" + memFnm,
						"photo",
						"width = 175, height = 210, left = 300, top = 150, history = no, resizable = no, status = no, scrollbars = yes, menubar = no"
				);
			}
		});
	}
</script>
<body>
<div id="tgradePreListRound">
	<div>
    	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 성적 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">현재 학기 성적 조회</span>
  	</div>

	<div id = "personalGradeInfo">
		<div class="round">
			<label>학번</label>
			<input type="text" name="stuCd" id="stuCd" readonly="readonly">
			<button type="button" class="btn btn-secondary" id="photoBtn">사진</button>
		</div>
		<div class="round">
			<label>이름</label>
			<input type="text" name="memName" id="memName" readonly="readonly">
		</div>
		<br>
		<div class="round">
			<label>생년월일(성별)</label>
			<input type="text" name="memReg1" id="memReg1" readonly="readonly">
		</div>
		<div class="round">
			<label>연락처</label>
			<input type="text" name="memTel" id="memTel" readonly="readonly">
		</div>
		<div class="round">
			<label>단과대학/전공</label>
			<input type="text" name="college" id="college" readonly="readonly">
		</div>
		<div class="round">
			<label>입학정보</label>
			<input type="text" name="admission" id="admission" readonly="readonly">
		</div>
		<div class="round">
			<label>변동</label>
			<input type="text" name="admChange" id="admChange" readonly="readonly">
		</div>
		<div class="round">
			<label>수강신청학년(학기)</label>
			<input type="text" name="yrNsem" id="yrNsem" readonly="readonly">
		</div>
	</div>
	
	<br><br>
	
	<p class="tgradePreListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;취득성적</p>
	<button type="button" class="btn btn-secondary" id="percentageTable">백분율환산기준표</button>
	&nbsp;&nbsp;총 <span class="tgradePreCnt" id="tgradePreSub" style="color:red;"></span>건
	<div id="tgradeYellowBox" style="height:47px;">
		<label>년도
			<input type="text" name="yrNsem" id="tgradePreYear" readonly="readonly">
		</label>
		<label>학기
			<input type="text" name="yrNsem" id="tgradePreSemester" readonly="readonly">
		</label>
		<span id="tgradeGreenText">&emsp;<i class="mdi mdi-square-medium"></i>&nbsp;증명 마감된 과목에 한해 성적이 표기됩니다.</span>
	</div>
	<br>
	<div id="grid"></div>
	
	<br><br>
	
	<p class="tgradePreListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;집계정보</p>
	<table id="tgradeTable" border="1">
		<tr>
			<th colspan="2"></th>
			<th colspan="5">교양영역</th>
			<th colspan="5">전공영역</th>
		</tr>
		<tr>
			<td>신청학점</td>
			<td>취득학점</td>
			<td>교필</td>
			<td>교선</td>
			<td>소계</td>
			<td>평점 계</td>
			<td>평균 평점</td>
			<td>전필</td>
			<td>전선</td>
			<td>소계</td>
			<td>평점 계</td>
			<td>평균 평점</td>
		</tr>
		<tr>
			<td>${totalCnt}</td>
			<td>${tgrade.GP + tgrade.GS + tgrade.JP + tgrade.JS}</td>
			<td>${tgrade.GP}</td>
			<td>${tgrade.GS}</td>
			<td>${tgrade.GCNT}</td>
			<td>${tgrade.GSUM}</td>
			<td>${tgrade.GDIV}</td>
			<td>${tgrade.JP}</td>
			<td>${tgrade.JS}</td>
			<td>${tgrade.JCNT}</td>
			<td>${tgrade.JSUM}</td>
			<td>${tgrade.JDIV}</td>
		</tr>
	</table>
</div>
</body>
</html>