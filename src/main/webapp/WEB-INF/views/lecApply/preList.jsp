<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의계획서 신청</title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/topTable.css" type="text/css">
<link rel="stylesheet" href="/resources/css/suwon.css" type="text/css">
<style type="text/css">
#personalProInfo {
	border : 1px solid lightgray;
	margin : 10px;
}
#lecApplyPreListRound{
	width : 100%;
}
#lecApplyPreListSelect{
	display:inline-block;
	margin-left : 2%;
}
#personalProInfo{
 	border: 1px solid #001353;
	padding: 10px;
	background: #F3F8FF;
	width: 100%;
	min-width: 1200px;
	max-width: 1700px;
	margin: 0 auto;
	border-radius : 10px;
}
#personalProInfo div{
	display : inline-block;
	width : 24%;
}
#personalProInfo input{
	width: 180px;
	height: 33px;
	background: #F9F9F9;
	border: 1px solid gray;
	border-radius: 5px;
	padding-left: 5px;
	text-align: center;
}
#personalProInfo label{
	text-align : right;
	width : 100px;
}
#lecRegisterBtn{
	float : right;
	margin-right : 10px;
	margin-bottom : 15px;
}
.btn-primary{
 	background : #2a5388;
 	border : #2a5388;
 	box-shadow : #2a5388;
 }
.btn-primary:hover{
 	background : #4671af;
 	border : #4671af;
 	box-shadow : #4671af;
 }
 #newLecApplyBtn{
 	float : right;
 	margin-top : -7px;
 	margin-left : 10px;
 	height : 40px;
 }
</style>
</head>
<script type="text/javascript" defer="defer">

//작업 끝나고 spinner.js 추가하기


	//임시저장 강의계획서 불러오기
	function getTempSyllabus(lecaCd) {
		window.open("/lecApply/getPreListPdf/" + lecaCd, "lecApplyForm" + lecaCd, "width=1000, height=800, left=100, top=50");
	}
	
	window.onload = function() {
		
		//로딩중 화면 띄우기
		loadingWithMask();
		setTimeout(closeLoadingWithMask, 1000);
		
		var memFnm;
		
		//교수 개인정보 가져오기
		$.ajax({
			url : "/lecApply/getInfo",
			type : "POST",
			dataType : "JSON",
			success : function(res) {
				//교번(memCd), 이름(memNm), 생년월일(memReg1), 연락처(memTel),
				//소속(memNme), 직책(memAddr1), 재직상태(memAddr2)
				$('#proCd').val(res.memCd);
				$('#memName').val(res.memNm);
				$('#memReg1').val(res.memReg1);
				$('#memTel').val(res.memTel);
				$('#college').val(res.memNme);
				$('#position').val(res.memAddr1);
				$('#joinYN').val(res.memAddr2);
				
				memFnm = res.memFnm;
			}
		});
		
		//임시저장 강의계획서 리스트 가져오기
		$.ajax({
			url : "/lecApply/getTempList",
			type : "POST",
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				
				$.each(res, function(i,v){
					res[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;" onclick="getTempSyllabus(' + v.lecaCd + ')">강의계획서</button>';
				});
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : res,
					scrollX : true,
					scrollY : true,
					bodyHeight : 380,
					columns : [
						{header : '년도/학기', name : 'lecaCon', filter : 'select', width : 150, align : 'center'},
						{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
						{header : '과목번호', name : 'subCd', filter : 'select', width : 100, align : 'center'},
						{header : '과목명', name : 'lecaNm', filter : 'select'},
						{header : '개설이수구분', name : 'lecaCate', width : 100, align : 'center'},
						{header : '학점', name : 'lecaCrd', width : 50, align : 'center'},
						{header : '성적평가방식', name : 'lecaGrade', width : 100, align : 'center'},
						{header : '저장일시', name : 'lecaRoom', filter : 'select'},
						{header : '자세히 보기', name : 'btn', width : 120, align : 'center'}
					],
					columnOptions: {
				        resizable: true
				    }
				});
			}
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
		
		//신규강의계획서 작성 버튼 클릭 이벤트
		$('#newLecApplyBtn').on('click', function() {
			window.open("/lecApply/preListPdf", "lecApplyForm", "width=1000, height=800, left=100, top=50");
		});
		
	}
</script>
<body>
<div id="lecApplyPreListRound">
	<div>
    	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 강의개설관리 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">강의계획서 신청</span>
  	</div>
  	
  	<br>
  	
  	<table id="stuInfoTable">
  		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
		<tr>
			<th>교번</th>
			<td>
				<input class="infoText" type="text" name="proCd" id="proCd" readonly="readonly" style="width:68.5%;">
				<button type="button" class="btn btn-secondary photoBtn" id="photoBtn">
				<p class="photoP">사진</p>
				</button>
			</td>
			<th>성명</th>
			<td>
				<input class="infoText" type="text" name="memName" id="memName" readonly="readonly">
			</td>
			<th>연락처</th>
			<td>
				<input class="infoText" type="text" name="memTel" id="memTel" readonly="readonly">
			</td>
			<th colspan="3"></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 5px;"></td>
		</tr>
		<tr>
			<th>소속</th>
			<td>
				<input class="infoText" type="text" name="college" id="college" readonly="readonly">
			</td>
			<th>직책</th>
			<td>
				<input class="infoText" type="text" name="position" id="position" readonly="readonly">
			</td>
			<th>재직상태</th>
			<td>
				<input class="infoText" type="text" name="joinYN" id="joinYN" readonly="readonly">
			</td>
			<th>생년월일</th>
			<td>
				<input class="infoText" type="text" name="memReg1" id="memReg1" readonly="readonly">
			</td>
			<th></th>
		</tr>
		<tr>
			<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
		</tr>
  	</table>
  	
	<br><br>
	
	<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;임시저장된 강의계획서 조회
	<button type="button" class="btn btn-primary" id="newLecApplyBtn">신규강의계획서 작성</button>
	<p></p>
	
	<div id="grid"></div>
	
	<br>
</div>	
</body>
</html>