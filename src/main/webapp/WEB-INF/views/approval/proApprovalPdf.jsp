<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" defer="defer">"https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<style>
	#lecApplyPdf {
		padding: 0 5%;
	}

	.lecApplyTop {
		width: 100%;
		height: 50px;
	}

	.lecApplyName {
		margin-bottom: 20px;
		width: 300px;
		float: left;
		color: #333;
	}

	.clear {
		clear: both;
	}
	
	.topBorder {
		border-top: 2px solid #112a63;
	}
	
	.pdfbtn {
		float: right;
		margin-right: 5%;
		
	}
	
	.inputTop{
		width : 100%;
		height: 30px;
	}
	
	table {
		width: 100%;
		border: 1px solid #e0e0e0;
	}
	
	.topTable td {
		padding: 4px;
	}
	
	.topTable label {
		margin-bottom: 0;
		font-weight: 500;
	}
	
	.frontBack {
		background: #f4f7fd;
	    text-align: right;
	    color: #444;
	}
	
	textarea {
		resize:none;
	}
	
	.courseWrapper td {
		padding: 4px;
	}
	
	.abbottom {
		border: 1px solid #e0e0e0;
		padding: 4px;
	    border-top: none;
	}
	
	.abbottom td {
		text-align: center;
	}
	
	.botTable {
		border: 1px solid #e0e0e0;
	}
	
	.botTable td {
		padding: 7px;
	}
	
	.divWhole{
		margin-top: 50px;
	}
	
	.form-control:disabled, .form-control[readonly] {
		background: #f5f5f5 !important;
	}
	
</style>

				<div class="bodyWrapper divWhole">
					<button type="button" class="btn btn-secondary pdfbtn btn-sm" value="save" onclick="pdfPrint()">PDF 출력</button>
					<div id="lecApplyPdf">
					<div class="lecApplyTop">
						<h4 class="lecApplyName">강의계획서</h4>
					</div>
				
					<div class="clear topBorder"></div>
					
					<p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;Ⅰ&ensp;교과목정보</p>
				
					<table class="mb-0 topTable" border="1">
						<tr>
							<td class="frontBack"><label for="example-disable" class="form-label">교과목명</label></td>
							<td>
								<input type="text" class="inputTop" disabled value="${data.lecaNm }">
							</td>
							<td class="frontBack"><label for="example-disable" class="form-label">개설학과</label></td>
							<td>
								<input type="text" class="inputTop" disabled value="${data.departmentVO.depNm }">
							</td>
						</tr>
						<tr>
							<td class="frontBack"><label for="example-disable" class="form-label">학수번호</label></td>
							<td>
								<input type="text" class="inputTop" disabled value="${data.lecCd }">
							</td>
							<td class="frontBack"><label for="example-disable" class="form-label">학점</label></td>
							<td>
								<input type="text" class="inputTop" disabled value="${data.lecaPer }학점">
							</td>
						</tr>
						<tr>
							<td class="frontBack"><label for="example-disable" class="form-label">설강학기</label></td>
							<td>
								<input type="text" class="inputTop" disabled value="${data.lecaSem }학기">
							</td>
							<td class="frontBack"><label for="example-disable" class="form-label">학점시수 및 평가</label></td>
							<td>
								<input type="text" class="inputTop" disabled value="${data.lecaPer }&nbsp;&#47;&nbsp;${data.commonDetailVO.comdNm }">
							</td>
						</tr>
						<tr>
							<td class="frontBack"><label for="example-disable" class="form-label">담당교수</label></td>
							<td>
								<input type="text" class="inputTop" disabled value="${data.memberVO.memNm }">
							</td>
							<td class="frontBack"><label for="example-disable" class="form-label">교수소속</label></td>
							<td>
								<input type="text" class="inputTop" disabled value="${data.collegeVO.colNm }&nbsp;${data.departmentVO.depNm}">
							</td>
						</tr>
						<tr>
							<td class="frontBack"><label for="example-disable" class="form-label">담당교수 e-mail</label></td>
							<td>
								<input type="text" class="inputTop" disabled value="${data.memberVO.memMl }">
							</td>
							<td class="frontBack"><label for="example-disable" class="form-label">학과전화</label></td>
							<td>
								<input type="text" class="inputTop" disabled value="${data.departmentVO.depTel }">
							</td>
						</tr>
					</table>
				
					<div class="clear"></div>
				
					<p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;Ⅱ&ensp;교과목 개요(Course Overview)</p>
					
					<div class="courseWrapper">
						<table border="1">
							<tr>
								<td style="background: #f4f7fd">1.&nbsp;수업개요</td>
							</tr>
							<tr>
								<td>
									<textarea class="form-control" rows="3" readonly>${data.lecaCon }</textarea>
								</td>
							</tr>
							<tr>
								<td style="background: #f4f7fd">2.&nbsp;평가방법(%)</td>
							</tr>
						</table>
						<div class="abbottom">
							<table border="1">
					                <tr style="background: #f5f5f5;text-align: center;">
					                    <td style="width:20%;">중간고사</td>
					                    <td style="width:20%;">기말고사</td>
					                    <td style="width:20%;">과제</td>
					                    <td style="width:20%;">퀴즈</td>
					                    <td style="width:20%;">출결</td>
					                </tr>
					                <tr>
					                    <td>${data.criteriaVO.crtrMp }</td>
					                    <td>${data.criteriaVO.crtrFp }</td>
					                    <td>${data.criteriaVO.crtrTp }</td>
					                    <td>${data.criteriaVO.crtrQp }</td>
					                    <td>${data.criteriaVO.crtrAp }</td>
					                </tr>
					        </table>
						</div>
					</div>
					
					<p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;Ⅲ&ensp;교재 및 참고문헌(Materials and References)</p>
					
					<div class="mb-3">
						<textarea class="form-control" rows="4" readonly>${data.lecaBook }</textarea>
					</div>

					<p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;Ⅳ&ensp;주차별 강의계획(Course Schedule)</p>
				
					<div class="mb-3">
						<div class="table-responsive-sm">
				        <table class="botTable" border="1">
				        	<tr style="background: #f4f7fd;">
				        		<td style="width: 10%;text-align: center;">주차</td>
				        		<td style="width: 30%;text-align: center;">구분</td>
				        		<td style="width: 60%;text-align: center;">내용</td>
				        	</tr>
				        <c:forEach var="weekPlanVO" items="${week}">
							<tr>
							    <td style="text-align: center;">${weekPlanVO.wpNo }</td>
							    <td style="text-align: center;">학습목표 및 주요학습 내용</td>
							    <td>${weekPlanVO.wpCon }</td>
							</tr>
						</c:forEach>
				        </table>
				    </div>
					</div>
				</div>
</div>

<script type="text/javascript" defer="defer">
// 현재 페이지의 html을 A4 크기에 맞춰 PDF로 변환하는 함수
function pdfPrint(){
    html2canvas(document.getElementById('lecApplyPdf'), {
        onrendered: function (canvas) {
            // 현재페이지 화면을 이미지로 변환
            var imgData = canvas.toDataURL('image/png');
         	// A4 기준 이미지 가로 길이(mm)
            var imgWidth = 210; 
         	// A4 기준 페이지 세로 길이 계산
            var pageHeight = imgWidth * 1.414;  
            var imgHeight = canvas.height * imgWidth / canvas.width;
            var heightLeft = imgHeight;
            var doc = new jsPDF('p', 'mm', 'a4');
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
            doc.save('${data.lecaNm} 강의계획서.pdf');
        }
    });
}
</script>