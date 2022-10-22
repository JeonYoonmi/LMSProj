<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" defer="defer">"https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>


<script type="text/javascript" defer="defer">
// 현재 페이지의 html을 A4 크기에 맞춰 PDF로 변환하는 함수
function pdfPrint(){
    html2canvas(document.getElementById('whole'), {
        onrendered: function (canvas) {
            // 현재페이지 화면을 이미지로 변환
            var imgData = canvas.toDataURL('image/png');
         	// A4 기준 이미지 가로 길이(mm)
            var pageHeight = 210; 
         	// A4 기준 페이지 세로 길이 계산
            var imgWidth = pageHeight * 1.414;  
            var imgHeight = canvas.height * imgWidth / canvas.width;
            var heightLeft = imgHeight;
            var doc = new jsPDF('l', 'mm', 'a4');
            var position = 0;
            // 첫 페이지 출력
            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
            heightLeft -= pageHeight;
            // 한 페이지 이상일 경우
            while (heightLeft >= 20) {
                position = heightLeft - imgHeight;
                doc.addPage();
                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;
            }
            // 파일 저장
            doc.save('${stuCd} 졸업사정용 성적 일람표.pdf');
        }
    });
}
</script>
<title>졸업사정 성적일람표</title>
<style type="text/css">
body{
	color : black;
}
#upTable{
	width : 95%;
	border-collapse: collapse;
	margin: auto;
}
h2{
	width : 330px;
	display: inline-block;
	margin-left: 30%;
}
#pToday{
 	width : 150px; 
 	margin-left: 5%; 
 	display: inline-block;
	left: 5%;
	bottom: 100%;
}
.downTable{
	width: 23.76%;
}
.first{
	margin-left: 2.5%;
}

th{
	text-align: center;
}

#footerP1, #footerP2{
	display: inline-block;
}
.footerP{
	margin-left: 2.5%;
}
#pRight{
	width : 150px;
 	display: inline-block;
	right: 5%;
	bottom: 100%;
	margin-left: 22%;
}
.pdfbtn {
	float: right;
	margin-right: 4%;
	margin-top: 1%;
}
</style>
<script type="text/javascript" defer="defer">
window.onload = function() {
	$('#butPdf').on('click', function(){
		alert("눌렀다!");
	})
	
	noRsnHidden = $('#noRsnHidden').val();
	
	jpRsn = noRsnHidden.substr(0,1);
	jsRsn = noRsnHidden.substr(1,1);
	gpRsn = noRsnHidden.substr(2,1);
	gsRsn = noRsnHidden.substr(3,1);
	
	var str = '';
	if(jpRsn == 'N'){
		str += '전필 미이수<br>';
	}
	if(jsRsn == 'N'){
		str += '전선 미이수<br>';
	}
	if(gpRsn == 'N'){
		str += '교필 미이수<br>';
	}
	if(gsRsn == 'N'){
		str += '교선 미이수';
	}
	
	if((jpRsn == 'Y') && (jsRsn == 'Y') && (gpRsn == 'Y') && (gsRsn == 'Y')){
		str += "-";
	}
	
	$('#ynRsn').html(str);
	
	var today = new Date();   

	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1;  // 월
	var date = today.getDate();  // 날짜
	var hours = ('0' + today.getHours()).slice(-2);	//시 
	var minutes = ('0' + today.getMinutes()).slice(-2);	//분
	var dayString = year + "/" + month + "/" + date + "&emsp;&emsp;" + hours + ':' + minutes;
	
	$('#pToday').html(dayString);

}
</script>
</head>
<body style="background: white;">
<button type="button" class="btn btn-secondary pdfbtn" value="save" onclick="pdfPrint()">PDF 출력</button>
<div style="clear: both;"></div>
<div id="whole">
<br style="border: none;"><br style="border: none;">
<div style="background: white;">
<p id="pToday"></p>
<h2>졸업 사정용 성적 일람표</h2>
<p id="pRight">${myInfo.HAK}</p>
<table border="1" id="upTable">
	<tr>
		<td rowspan="2" style="width : 15.35%; height: 120px; border-right: none;">
			&emsp;&emsp;단과대학 :&emsp;&emsp;${myInfo.COL_NM}<br>
			&emsp;&emsp;학&emsp;&emsp;번 :&emsp;&emsp;${myInfo.MEM_CD}<br>
			&emsp;&emsp;학&emsp;&emsp;년 :&emsp;&emsp;${myInfo.YEAR }<br>
			&emsp;&emsp;입학유형 :&emsp;&emsp;신입학

		</td>
		<td rowspan="2"  style="border-left:none; width: 15.35%;">
			학&emsp;&emsp;과 :&emsp;&emsp;${myInfo.DEP_NM}<br>
			성&emsp;&emsp;명 :&emsp;&emsp;${myInfo.MEM_NM}<br>
			재학학기 :&emsp;&emsp;${myInfo.SEM}<br>
			담당교수 :&emsp;&emsp;${myInfo.PRONM}
		</td>
		<td rowspan="2"  style="width : 11.84%; height: 120px; border-right: none;">
		&emsp;&emsp;전공필수 :&emsp;&emsp;${gradeInfo.JP} 학점
		<br>
		&emsp;&emsp;전공선택 :&emsp;&emsp;${gradeInfo.JS} 학점
		<br>
		&emsp;&emsp;교양필수 :&emsp;&emsp;${gradeInfo.GP} 학점
		<br>
		&emsp;&emsp;교양선택 :&emsp;&emsp;${gradeInfo.GS} 학점
		</td>
		<td rowspan="2"  style="border-left:none; width : 11.84%; height: 120px;">
		&emsp;&emsp;전필학점 :&emsp;&emsp;${gradeInfo.JPDIV}<br>
		&emsp;&emsp;전선학점 :&emsp;&emsp;${gradeInfo.JSDIV}<br>
		&emsp;&emsp;교필학점 :&emsp;&emsp;${gradeInfo.GPDIV}<br>
		&emsp;&emsp;교선학점 :&emsp;&emsp;${gradeInfo.GSDIV}<br>
		</td>
		<td rowspan="2"  style="width : 14.19%; height: 120px;">
			&emsp;&emsp;필수학점 :&emsp;&emsp;${myInfo.GRADESUM} 학점<br>
			&emsp;&emsp;취득학점 :&emsp;&emsp;${gradeInfo.JCNT} 학점<br>
			&emsp;&emsp;평점평균 :&emsp;&emsp;${gradeInfo.TOTALDIV}<br>
			&emsp;&emsp;학적상태 :&emsp;&emsp;${myInfo.STATUS}<br>
		</td>
		<td rowspan="2"  style="width : 3.14%; height: 120px;">&emsp;불<br>&emsp;가<br>&emsp;사<br>&emsp;유</td>
		<td rowspan="2"  style="width : 7.61%; height: 120px; text-align: center;" id="ynRsn">
		<input type="text" value="${yn}" hidden="hidden" id="noRsnHidden">
		</td>
		<td style="height: 30px; text-align: center; width: auto;">학생본인</td>
		<td style="height: 30px; text-align: center; width: auto;">학부과장</td>
	</tr>
	<tr>
		<td></td>
		<td></td>
	</tr>
</table>
<table border="1" class="downTable first" style="float: left;">
	<tr>
		<th>학기</th>
		<th>과목명</th>
		<th>학점</th>
		<th>성적</th>
	</tr>
	
	<c:forEach var="a" items="${ jplist }" begin="0" end="19">
	<tr>
			<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaYr}-${a.lecaSem }</td>
			<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;">${a.lecaNm}</td>
			<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaCrd}</td>
			<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaRoom}</td>
	</tr>
	</c:forEach>
	
	<c:if test="${ fn:length(jplist) le 19 }">
		<c:forEach begin="${ fn:length(jplist) }" end="19">
			<tr>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
					<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;"></td>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
			</tr>
		</c:forEach>
	</c:if>
</table>


<table border="1" class="downTable" style="float : left;">
	<tr>
		<th>학기</th>
		<th>과목명</th>
		<th>학점</th>
		<th>성적</th>
	</tr>
	<c:if test="${ fn:length(jplist) gt 20 }">
			<c:forEach var="a" items="${ jplist }" begin="20" end="39">
			<tr>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaYr}-${a.lecaSem }</td>
					<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;">${a.lecaNm}</td>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaCrd}</td>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaRoom}</td>
			</tr>
			</c:forEach>
			<c:if test="${ fn:length(jplist) le 39 }">
				<c:forEach begin="${ fn:length(jplist) }" end="39">
					<tr>
							<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none;"></td>
							<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;"></td>
							<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
							<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
					</tr>
				</c:forEach>
			</c:if>
	</c:if>
	
	<c:if test="${ fn:length(jplist) le 20 }">
		<c:forEach begin="20" end="39">
			<tr>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none;"></td>
					<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;"></td>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
			</tr>
		</c:forEach>
	</c:if>
</table>


<table border="1" class="downTable" style="float : left;">
	<tr>
		<th>학기</th>
		<th>과목명</th>
		<th>학점</th>
		<th>성적</th>
	</tr>
	<c:if test="${ fn:length(jplist) gt 40 }">
		<c:forEach var="a" items="${ jplist }" begin="40" end="59">
			<tr>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaYr}-${a.lecaSem }</td>
					<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;">${a.lecaNm}</td>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaCrd}</td>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaRoom}</td>
			</tr>
		</c:forEach>
			
		<c:if test="${ fn:length(jplist) le 59 }">
			<c:forEach begin="${ fn:length(jplist) }" end="59">
				<tr>
						<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none;"></td>
						<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;"></td>
						<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
						<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
				</tr>
			</c:forEach>
		</c:if>
	</c:if>
	
	<c:if test="${ fn:length(jplist) le 40 }">
		<c:forEach begin="40" end="59">
				<tr>
						<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none;"></td>
						<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;"></td>
						<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
						<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
				</tr>
			</c:forEach>
	</c:if>
</table>
	
<table border="1" class="downTable" style="float : left;">
	<tr>
		<th>학기</th>
		<th>과목명</th>
		<th>학점</th>
		<th>성적</th>
	</tr>
	<c:if test="${ fn:length(jplist) gt 60 }">
		<c:forEach var="a" items="${ jplist }" begin="60" end="79">
			<tr>
				<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaYr}-${a.lecaSem }</td>
				<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;">${a.lecaNm}</td>
				<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaCrd}</td>
				<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;">${a.lecaRoom}</td>
			</tr>
		</c:forEach>
		<c:if test="${fn:length(jplist) le 79}">
			<c:forEach begin="${ fn:length(jplist) }" end="79">
						<tr>
								<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none;"></td>
								<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;"></td>
								<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
								<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
						</tr>
			</c:forEach>
		</c:if>
	</c:if>
	
	<c:if test="${fn:length(jplist) le 60}">
		<c:forEach begin="60" end="79">
			<tr>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none;"></td>
					<td style="height: 27px; width : 12%; border-bottom: none; border-right: none; border-top: none;"></td>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
					<td style="height: 27px; width : 2%; border-bottom: none; border-right: none; border-top: none; text-align: center;"></td>
			</tr>
		</c:forEach>
	</c:if>
</table>

</div>
<br><br>
<p id="footerP1" class="footerP" style="margin-top: 5px;">* 이수구분 변경 등으로 예비판정이 졸업 또는 졸업불가라도 변경될 수 있습니다.</p><br>
<p id="footerP2" class="footerP">* 최종 사정 일시 : 2022.03.16. 16:53</p>
<p style="margin: 0% 50%;">-1-</p>
</div>
</body>
</html>