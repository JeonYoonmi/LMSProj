<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* #td1, #td2 { */
/* 	width: 140px; */
/* } */
body{
	background : #ccc;
}
.body{
	margin-top : 150px;
}
.right{
text-align: right;
}
td{
text-align: center;
}
#header {
	height: 20%;
	font-size: 30px;
	text-align: center;
}
#footer {
height: 30%;
font-size: 20px;
}

#tab {
	
	border: 1px solid black;
	border-collapse: collapse;
	width : 50%;
	height: 100%;
	float: left;
}
#tab2 {
	border: 1px solid black;
	border-collapse: collapse;
	width : 50%;
	height: 100%;
	float: right;
	
}
.card{
	margin-top : 30px;
	margin-left : 15%;
	height: 500px;
	width : 1000px;
	
}
#tabdiv1{
	
	height: 500px;
	width : 1000px;
	margin:auto;
}
#btnDiv{
	position : relative;
	right : 185px;
	bottom : 60px;
}
#btnDiv #pay{
	padding : 8px;
}
#pdfSave{
	padding : 8px;
}
.headerDiv{
	font-size: 15px;
	text-align: center;
	margin-bottom: 0px;
}
#tab, #tab2{
	background-image: url("/resources/images/opacity_logo.png");
	background-size : 300px;
	background-repeat: no-repeat;
	background-position : center center;
	font-weight : bold;
	color : black;
}
#tab .markImg{
	position : absolute;
	width : 70px;
	left : 340px;
	bottom : 55px;
}
#tab2 .markImg{
	position : absolute;
	width : 70px;
	right : 110px;
	bottom : 55px;
}
</style>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"
	type="text/javascript"></script>
<script type="text/javascript" defer="defer">

	


	$(function() {
		
		var today = new Date();   
		var year = today.getFullYear() + "년 ";
		var month = today.getMonth();
		var sem = "";
		if(month>2 && month <8){
			sem = "1학기 ";
		}else{
			sem = "2학기 ";
		}
		console.log(year + sem);
		
		$('#header1').text(year + sem + "[은행용]");
		$('#header2').text(year + sem + "[학생용]");
		
		
		
// 		$.ajax({
// 			url : '/payment/billCount',
// 			type : 'POST',
// 			dataType : 'json',
// 			success : function(res) {
// 				console.log(res);
// 				if (res != 1) {
// 					$('#tabdiv1').hide();
// 					alert("등록금 납부기간이 아닙니다.")
// 				} else {
// 					console.log("cnt테스트");
// 				}
// 			}
// 		})

		var IMP = window.IMP;
		var code = "imp51127026"; //가맹점 식별코드
		IMP.init(code);

		var stuCd = $('#td0').text();
		var stuname = $('#td1').text();
		var payamt = $('#td2').text();
		var payCd = $('#pay').data('paycd');
		var memMl = $('#memMl').val();
		var memTel = $('#memTel').val();
		console.log(payCd , payamt);

		$('#pay').on('click', function() {
			IMP.request_pay({
				//name과 amout만있어도 결제 진행가능
				pg : "html5_inicis",
				pay_method : 'card',
				merchant_uid : ''+stuCd + payCd,
				amount : 100,
				name : '등록금결제', // 상품명
				buyer_name : stuname,
				buyer_email : memMl,
				
			//결제완료후 이동할 페이지 kko나 kkopay는 생략 가능
			//m_redirect_url : 'https://localhost:8080/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다';
					var result = {
						"imp_uid" : rsp.imp_uid,
						"merchant_uid" : rsp.merchant_uid,
						"pay_date" : new Date().getTime(),
						"amount" : rsp.paid_amount,
						"card_no" : rsp.apply_num,
						"refund" : 'payed'
					}
					//console.log("결제성공 " + msg);
					console.log(rsp.merchant_uid);

					$.ajax({
						url : '/payment/pay',
						type : 'POST',
						data : {
							"payCd" : payCd
						},
						dataType :'json',
						//contentType : 'application/json', //서버에서 보내줄 데이터 타입
						success : function(res) {
							if (res > 0)
							alert("결제에 성공하였습니다.")
							
							window.opener.location.reload();
							
							setTimeout(() => {
								window.close();
							}, 1000);
						},
						error : function() {
							console.log("Insert ajax 통신 실패!!!");
						}
					}) //ajax

				} else {//결제 실패시
					var msg = '결제에 실패했습니다';
					msg += '에러 : ' + rsp.error_msg
				}
				console.log(msg);
			})
		})

	})

	function savePDF() {
		//저장 영역 div id
		html2canvas($('#tabdiv1')[0], {
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
					doc.save('인재대학교_등록금_고지서.pdf');
				});
	}
</script>
</head>
<body>
<!-- <div> -->
<!-- <i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 장학/등록 <i class="dripicons-chevron-right"></i> -->
<!-- <span style="font-weight: bold;">등록금고지서</span> -->
<!-- </div> -->
<!-- <br><br> -->


<c:if test="${not empty map }">
	<div id="btnDiv">
	<div style="float:right;">
		<c:if test="${map.PAY_AMT != '0'}">
		<button class="btn btn-secondary btn-sm" id="pay" data-paycd="${map.PAY_CD}">고지서 납부</button>
		</c:if>
		<input type="button" class="btn btn-secondary btn-sm" value="pdf저장" id="pdfSave" onclick="savePDF()">
	</div>
	</div>
<div class="card">

<div id="tabdiv1" class="card-body">
	<input type="hidden" value="${map.MEM_ML}" id="memMl">
	<input type="hidden" value="${map.MEM_TEL}" id="memTel">
	<table id="tab" border='1'>
		<tr>
			<td colspan="4" id="header" style="color:inherit;">등록금 고지서
			<div class="headerDiv" id="header1"></div>
			</td>
		</tr>
		<tr>
			<td>학번</td>
			<td>${map.STU_CD}</td>
			<td>학년</td>
			<td>${map.STU_YR}</td>
		</tr>
		<tr>
			<td>성명</td>
			<td id="td1">${map.MEM_NM }</td>
			<td>학과</td>
			<td>${map.DEP_NM }</td>
		</tr>
		<tr>
			<td colspan="2">구분</td>
			<td>등록금(1)</td>
			<td>장학금(2)</td>
		</tr>
		<tr>
			<td colspan="2">입학금</td>
			<td class="right">0</td>
			<td class="right">0</td>
		</tr>
		<tr>
			<td colspan="2">수업료</td>
			<td class="right">${map.COL_FEE}</td>
			<td class="right">${map.SCLH_AMT}</td>
		</tr>
		<tr>
			<td colspan="2">납입금액(1)-(2)</td>
			<td colspan="2" id="td2" class="right">${map.PAY_AMT}</td>
		</tr>
		<tr>
			<td>납부계좌</td>
			<td colspan="3">우리 1002747911748</td>
		</tr>
		<tr>
			<td colspan="4" id="footer">
			<div class="footerDiv">인재대학교 수 입 징 수 관</div>
			<img class="markImg" alt="" src="/resources/images/mark.png">
			</td>
		</tr>
	</table>
	<table id="tab2" border='1'>
		<tr>
			<td colspan="4" id="header" style="color : inherit;">등록금 고지서
			<div class="headerDiv" id="header2"></div>
			</td>
		</tr>
		<tr>
			<td>학번</td>
			<td id="td0">${map.STU_CD}</td>
			<td>학년</td>
			<td>${map.STU_YR}</td>
		</tr>
		<tr>
			<td>성명</td>
			<td id="td1">${map.MEM_NM }</td>
			<td>학과</td>
			<td>${map.DEP_NM }</td>
		</tr>
		<tr>
			<td colspan="2">구분</td>
			<td>등록금(1)</td>
			<td>장학금(2)</td>
		</tr>
		<tr>
			<td colspan="2">입학금</td>
			<td class="right">0</td>
			<td class="right">0</td>
		</tr>
		<tr>
			<td colspan="2">수업료</td>
			<td class="right">${map.COL_FEE}</td>
			<td class="right">${map.SCLH_AMT}</td>
		</tr>
		<tr>
			<td colspan="2">납입금액(1)-(2)</td>
			<td colspan="2" id="td2" class="right">${map.PAY_AMT}</td>
		</tr>
		<tr>
			<td>납부계좌</td>
			<td colspan="3">우리 1002747911748</td>
		</tr>
		<tr>
			<td colspan="4" id="footer">
			<div class="footerDiv">인재대학교 수 입 징 수 관</div>
			<img class="markImg" alt="" src="/resources/images/mark.png">
			</td>
		</tr>
	</table>
	
	<br>
	</div>
	</div>
	<br>

	
	
	
</c:if>

</body>
</html>