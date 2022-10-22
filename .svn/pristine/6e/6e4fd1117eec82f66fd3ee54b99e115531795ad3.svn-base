<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style>

/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.card {
		min-height: 780px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0 ;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		padding-bottom: 150px;
	}
	
	.card-body {
		width: 100%;
	}
	
/* 기본 틀 잡기 끝 */

	.topBorder {
		border-top: 2px solid #112a63;
	}
	
	.lecApplyName {
		margin-bottom: 20px;
		width: 300px;
		float: left;
	}

	#grid {
		width: 100%;
	}
	
	#grid td {
		background: #fff;
	}
	
	#grid th {
		background: #f4f7fd;
	}

	.scoreMiddleWrap {
		margin-top: 20px;
	}
	
	.scoreRightWrap {
		width: 49%;
		float: right;
		margin-top: 67px;
	}
	
	.scoreMiddleWrap td {
		padding: 4px;
		text-align: center;
		background: #f4f7fd;
	}
	
	.wkHr {
		text-align: center;
	}
	
	.informDetailTop table {
		border: 1px solid #e0e0e0;
		width: 100%;
		text-align: center;
	}
	
	.informDetailBot table {
		border: 1px solid #e0e0e0;
		width: 100%;
		text-align: center;
	}
	
	.W, .ww {
		background: #fff !important;
		padding: 4px;
	}
	
	.H {
		height: 30px;
	}
	
	.inputCustum {
		width: 30px;
	    border: none;
	    background: transparent;
	}
	
	.f9 {
		background: #f9f9f9 !important;
		border-radius: 0.1rem;
	}
	
	
	.fitTable {
		width : 100%;
		border-top: 1px solid #e0e0e0;
	}
	
	.fitTable table {
		width: 100%;
		border-top: none !important;
		border: 1px solid #e0e0e0;
	}
	
	.infoAttend {
		float: left;
	}
	
	.infoAttend:not(:last-child):after {
			content: "|";
			color: #bbb;
			margin: 0 10px;		
	}

	#tNoCome {
		text-align: right;
		color: red;
		font-weight: 700;
		padding-right: 15px;
    	font-size: 1.1em;
	}

	.frontInput {
		width: 43%;
		display: inline-block;
		text-align: center;
		font-weight: 700;
	}
	
	#atenCome{
		color: #0d47a1;
	}
	#atenLate{
		color : #f57f17;
	} 
	#atenAbsent{
		color : #b71c1c;
	} 
	#atenOfiAbsent{
		color : #1b5e20;
	}
	.totat {
		color: #333;
	}

	.scoreTopWrap {
		width: 50%;
		float: left;
	}

	#scoreTable {
		width: 100%;
		border-bottom: 1px solid #e0e0e0;
		text-align: center;
		height: 40px;
		color: #333;
		font-weight: 700;
	}
	
	#scoreTable th {
		background: #f4f7fd;
	}

	.totalGrade {
		color: #112a63;
	}
</style>
<script type="text/javascript" defer="defer">
	
	$(function(){

		var stuCd = $('#stuCd').val();
		var lecCd = $('#lecCd').val();
		
		$.ajax({
			url : "/professorLecture/lecStuScoreDetail",
			type : 'post',
			data : {
				"memCd" : stuCd,
				"lecCd" : lecCd
			},
			dataType : 'JSON',
			success : function(result) {
				$('#grid').empty();
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : result,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 550,
					bodyHeight : 550,
					columns : [
						{header : '구분', name :'div', fileter : 'select', width : 150, align : 'center'},
						{header : '평가 명', name : 'evelNm', fileter : 'select', width : 300, align : 'center'},
						{header : '점수/총점', name : 'score', fileter : 'select', align : 'right'}
					],
					columnOptions : {resizable : true}
				});
			}
		})
		
		$.ajax({
			url : "/professorLecture/lecAttendanceStuDetail",
			data : {
				"memCd" : stuCd,
				"lecCd" : lecCd
			},
			type : 'post',
			dataType : 'JSON',
			success : function(result) {
				var atc = result.attendenceVO.atenCome;
				var atl = result.attendenceVO.atenLate;
				var ata = result.attendenceVO.atenAbsent;
				var atoa = result.attendenceVO.atenOfiAbsent;
				var totat = atc + atl + ata + atoa;
				
				$('#atenCome').val(atc);
				$('#atenLate').val(atl);
				$('#atenAbsent').val(ata);
				$('#atenOfiAbsent').val(atoa);
				$('.totat').val(totat);
				
				// 총결석일
				lateCnt = $('#atenLate').val();
				AbsentCnt = $('#atenAbsent').val();
				absentCnt(lateCnt, AbsentCnt);
				
				$.each(result.attenDetail, function(i,v) {
					wk = v.atenWk;
					hr = v.atenHr;
					
					console.log("atendWk + hr : " + wk + " / " + hr);
	
					var ac = '';
					if(v.atenCate == 'A101') {
						ac += '○';
					}else if(v.atenCate == 'A102') {
						ac += '△';
					}else if(v.atenCate == 'A103') {
						ac += '⨉';
					}else if(v.atenCate == 'A104') {
						ac += '◎';
					}
					
					$('#hr_' + wk + '_' + hr).html(ac);
				})
				console.log("memCd? : " + result.memberVO.memCd);
				console.log("lecCd? : " + lecCd);
				stuScoreandMaxScore(parseInt(lecCd), result.memberVO.memCd);
			}
		})
	})
	
		// 결석 일수 세기
	function absentCnt(lateCnt, AbsentCnt) {
		
		cnt = parseInt(lateCnt/3) + parseInt(AbsentCnt);
		
		$('#tNoCome').html(cnt);
		
	}
	
	// 세부 점수 ajax 
	function stuScoreandMaxScore(lecCd, memCd) {
		$.ajax({
			url : "/professorLecture/stuScoreandMaxScore",
			data : {
				"lecCd" : lecCd,
				"memCd" : memCd,
			},
			type : 'post',
			dataType : 'JSON',
			success : function(result) {
				
				console.log("stuScore : " + result.stuCurScore);
				console.log("totalScore : " + result.lecScore);
				
				$('.stuScore').text(result.stuCurScore);
				$('.totalScore').text(result.lecScore);
			}
		})
	}
</script>

<div class="col-lg-12">
	
	<input type="hidden" value="${data.lecCd }" id="lecCd" />
	<input type="hidden" value="${sessionScope.memSession.memCd}" id="stuCd" />
	
	<div class="card">
		<!-- 성적 리스트 조회 -->
		<div class="card-body">
			<div id="bodyWrapper">
				<h4	class="lecApplyName">${data.lecaNm }&emsp;&#45;&emsp;성적 조회</h4>
				
				<div class="clear topBorder"></div>
				
				<div>		
					<div class="scoreTopWrap">				
						<p style="margin-top: 30px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;성적 상세 내역</p>
						<div id="grid"></div>
					</div>
					
					<div class="scoreRightWrap">
						<!-- 성적 부여 안내 -->
						<div class="alert alert-light bg-light border-0 sI" role="alert" style="font-size: 0.9em;line-height: 24px;">
	                        <p style="margin-bottom: 0;text-align: center;font-weight: 700;font-size: 1.1em;">성적조회 및 성적이의신청 안내</p>
	                        <hr>
							(1)&nbsp;전체 교과목은 <strong>절대평가</strong>를 원칙으로 하며 수업계획서에 입력한 성적 평가 기준에 따라 총점이 책정됩니다.<br>
							(2)&nbsp;수업평가 조사 미참여 학생은 성적이의신청을 할 수 없으므로 꼭 조사에 참여해주시기 바랍니다.<br>
							(3)&nbsp;성적 조회/이의신청 방법 : 종합정보시스템 >  성적 정보 > 성적 이의신청 메뉴 이용<br>
							&emsp;-&nbsp;성적 이의 신청 시 해당 과목의 신청 버튼을 선택 후 양식에 맞게 입력해야합니다.<br>
							&emsp;-&nbsp;부정청탁금지법에 따라 성적 부정청탁은 엄격히 금지되어 있으므로 유의사항을 필독하십시오.<br>
							<hr>
							<p style="text-align: center;font-weight: 700;font-size: 1em;">유의 사항</p>
							<div style="border: 1px solid #e8ecf6;padding: 10px;">
								※ 부정청탁금지법에 따른 성적 부정청탁 관련 안내<br>
								&emsp;-&nbsp;학생이 채점이나 성적입력 오류 등 합당한 사유에 의거한 성적정정이 아닌 기타 개인적인 사유<br>
								&emsp;&emsp;(장학금 수혜, 졸업, 취업, 재수강 등)로 성적 정정(조작)을 부탁할 경우 ‘부정청탁 금지법’의 부정
								&emsp;&emsp;청탁에 해당됩니다.<br>
								&emsp;-&nbsp;부정청탁을 2회 이상 받은 경우 담당교수는 본교 청탁방지 담당부서(감사팀, 110-4061)에 신고 
								&emsp;&emsp;의무가 있으며, 신고의무 위반 시 징계처분 대상이 됩니다.<br>
								&emsp;-&nbsp;부정청탁을 받고 성적정정을 한 경우 담당교수는 형사처벌 대상이 됩니다.<br>
								&emsp;-&nbsp;학생이 아닌 제 3자(학부모, 타교수, 지인 등)가 학생을 위해 부정청탁을 하거나 부정청탁에 따라 
								&emsp;&emsp;성적을 정정한 교수도 위법입니다.<br>
							</div>
	                    </div>
	                    <!-- 안내 끝 -->
	                    
	                    <!-- 최종 성적 -->
	                    <div>
	                    	<table id="scoreTable">
								<tr>
									<th style="width : 20%;">점수</th>
									<td style="width : 30%;">
										<span class="stuScore"></span>&emsp;/&emsp;
										<span class="totalScore"></span>
									</td>
									<th style="width : 20%;">최종 성적</th>
									<td class="totalGrade" style="width : 30%;">${grade.slScore }</td>
								</tr>
							</table>
	                    </div>
	                    
					</div>
				</div>
				
				<div style="clear: both;">
					<!-- 성적 리스트 조회 -->
				
					<div class="scoreMiddleWrap">				
	
						<p style="margin-top: 30px;display: inline-block;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;출결 현황</p>
	
						<p style="margin-top: 30px;display: inline-block;float: right;">
							<strong class="infoAttend">출석&nbsp;○</strong>
							<strong class="infoAttend">지각&nbsp;△</strong>
							<strong class="infoAttend">결석&nbsp;⨉</strong>
							<strong class="infoAttend">공결&nbsp;◎</strong>
						</p>
						<div class="informDetailTop">
							<table class="mb-2" border="1">
								<tr>
									<td colspan="8" style="text-align: center;height: 40px;font-weight: 700;font-size: 1.1em;">출결</td>
								</tr>
								<tr>
									<td>출석</td>
									<td class="ww">
										<input type="text" id="atenCome" class="form-control f9 frontInput" disabled placeholder="유효 출석일수" />
										&nbsp;/&nbsp;<input type="text" class="form-control f9 totat frontInput" disabled placeholder="총 출석 일수" />
									</td>
									<td>지각</td>
									<td class="ww">
										<input type="text" id="atenLate" class="form-control f9 frontInput" disabled placeholder="지각일수"/>
										&nbsp;/&nbsp;<input type="text" class="form-control f9 totat frontInput" disabled placeholder="총 출석 일수" />
									</td>
									<td>결석</td>
									<td class="ww">
										<input type="text" id="atenAbsent" class="form-control f9 frontInput" disabled placeholder="결석일수"/>
										&nbsp;/&nbsp;<input type="text" class="form-control f9 totat frontInput" disabled placeholder="총 출석 일수" />
									</td>
									<td>공결</td>
									<td class="ww">
										<input type="text" id="atenOfiAbsent" class="form-control f9 frontInput" disabled placeholder="공결일수"/>
										&nbsp;/&nbsp;<input type="text" class="form-control f9 totat frontInput" disabled placeholder="총 출석 일수" />
									</td>
								</tr>
								<tr>
									<td colspan="2" style="height: 40px;font-weight: 700;font-size: 1.1em;">총 결석일</td>
									<td colspan="6" id="tNoCome" class="ww"></td>
								</tr>
							</table>
						</div>
						<div class="fitTable">
							<c:forEach var="j" begin="1" end="9" step="8">
								<table class="mb-0" border="1">
									<!-- 1~16주까지 보여주는 곳 -->
									<tr>
										<c:forEach var="i" begin="${j }" end="${j+7}" step="1">
											<td class="wkHr" colspan="${data.lecaPer }">${i }</td>
										</c:forEach>
									</tr>
									<!-- 1~학점 만큼 차시를 보여주는 곳 -->
									<tr>
										<c:forEach begin="${j}" end="${j+7}" step="1">
											<c:forEach var="i" begin="1" end="${data.lecaPer }" step="1">
												<td class="" style="width:50px;">${i }</td>
											</c:forEach>
										</c:forEach>
									</tr>
									<!-- 1~8주차 출결 현황 작성하는 곳 -->
									<tr>
										<c:forEach begin="${j}" end="${j+7}" step="1" var="k">
											<c:forEach var="i" begin="1" end="${data.lecaPer }" step="1">
												<td class="W H" id="hr_${k}_${i}" data-wk="${k}" data-hr="${i}">
												</td>
											</c:forEach>
										</c:forEach>
									</tr>
								</table>
							</c:forEach>
						</div>
						
						
						
					</div>
					<!-- 리스트 조회 끝 -->
				</div>
			</div>
		</div>
	</div>
</div>
