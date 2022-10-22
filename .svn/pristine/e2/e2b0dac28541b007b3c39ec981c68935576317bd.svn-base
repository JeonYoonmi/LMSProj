<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>write</title>
<style>
body{
	background : #ccc;
}
.card{
	margin-top : 20px;
	margin-left : auto;
	margin-right : auto;
	height: 500px;
	width : 1000px;
}
.card-body{
	margin-left : auto;
	margin-right : auto;
	height: 500px;
	width : 1000px;
}
.center{
	text-align: center;
}
.right{
	text-align: right;
}
#detailTab{
	margin-left : auto;
	margin-right : auto;
	width : 99%;
	font-size : 20px;
	height: 350px;
}
#footer{
	padding-top : 10px;
	padding-bottom: 10px; 
	font-size : 30px;
	font-weight: bold;
	height : 100px;
}
#header{
	margin : auto;
	width : 90%;
	padding-top : 10px;
	padding-bottom: 10px; 
	font-size : 25px;
	text-align: center;
	font-weight: bold;
}
#detailTab{
	background-image: url("/resources/images/opacity_logo.png");
	background-size : 250px;
	background-repeat: no-repeat;
	background-position : top center;
	font-weight : bold;
	color : black;
}
.markImg{
	position : absolute;
	width : 70px;
	left : 640px;
	bottom : 80px;
}
</style>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" defer="defer">
function savePdf() {
	//저장 영역 div id
	html2canvas($('.card-body')[0], {
		//logging : true,		// 디버그 목적 로그
		//proxy: "html2canvasproxy.php",
		allowTaint : true, // cross-origin allow 
		useCORS : true, // CORS 사용한 서버로부터 이미지 로드할 것인지 여부
		scale : 2
	// 기본 96dpi에서 해상도를 두 배로 증가
	}).then(
			function(canvas) {
				// 캔버스를 이미지로 변환
				var imgData = canvas.toDataURL('image/png');
				var imgWidth = 190; // 이미지 가로 길이(mm) / A4 기준 210mm
				var pageHeight = imgWidth * 1.414; // 출력 페이지 세로 길이 계산 A4 기준
				var imgHeight = canvas.height * imgWidth / canvas.width;
				var heightLeft = imgHeight;
				var margin = 10; // 출력 페이지 여백설정
				var doc = new jsPDF('p', 'mm');
				var position = 50;
				// 첫 페이지 출력
				doc.addImage(imgData, 'PNG', margin, position, imgWidth,
						imgHeight);
				heightLeft -= pageHeight;
				// 파일 저장
				doc.save('인재대학교_등록금_납부확인서.pdf');
			});


	}
</script>
</head>
<body>
<br>
<br>
<button onclick="savePdf()" id="btn1" class="btn btn-secondary btn-sm" style="float:right;margin-right:190px;padding:8px;">pdf저장</button>
<br>
<br>
	<div class="card">
		<div class="card-body">
			<div id="header">등록금 납부 확인서</div>
			<table border ="1" id="detailTab"><tr><td colspan="4" class="center">${detail.PAY_DT2}등록금</td>
			<td class="center">구분</td><td class="center">등록금</td><td class="center">장학금액</td><td class="center">납입금액</td></tr>
			<tr><td class="center">대학</td><td colspan="3">${detail.COL_NM}</td><td class="center">입학금</td><td class="right">0</td><td class="right">0</td><td class="right">0</td></tr>
			<tr><td class="center">학과(전공)</td><td colspan="3">${detail.DEP_NM}</td><td class="center">수업료</td>
			<td class="right">${detail.COL_FEE}</td><td class="right">${detail.SCHL_AMT}</td><td class="right">${detail.PAY_AMT}</td></tr>
			<tr><td class="center">학번</td><td>${detail.STU_CD}</td><td class="center">학년</td><td class="center">${detail.PAY_SEM}</td>
			<td></td><td></td><td></td><td></td></tr>
			<tr><td class="center">성명</td><td colspan="3">${MEM_NM}</td><td class="center">계</td><td class="right">${detail.COL_FEE}</td><td class="right">${detail.SCLH_AMT}</td>
			<td class="right">${detail.PAY_AMT}</td></tr><tr><td class="center">납부일자</td><td colspan="7">${detail.PAY_DT}</td></tr>
			<tr id="footer">
				<td colspan="8">
					<div class="center">인 재 대 학 교 수 입 징 수 관 </div>
					<img class="markImg" alt="" src="/resources/images/mark.png">
				</td>
			</tr>
			</table>
		</div>
	</div>

</body>
</html>