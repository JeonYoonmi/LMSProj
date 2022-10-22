<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style>

/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.card {
		min-height: 780px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		margin-bottom: 150px;
	}
	
	.card-body {
		width: 100%;
	}
	
/* 기본 틀 잡기 끝 */

	.checking {
		border: none;
		background: transparent;
		color: blue;
		font-weight: 700;
	}
	
	.checking:focus-visible {
		outline: none;
	}

.form-control:disabled, .form-control[readonly] {
	background: #f5f5f5 !important;
} 

.quizWrapper {
	padding: 0 3%;
}

.table td {
	border-top: none;
}

.table thead th {
	padding: 15px !important;
	line-height: 7px !important;
	border-bottom: 1px solid #eef2f7 !important;
}

</style>

<%
      Date Today = new Date();
      SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd HH:mm");
      String simDate = simpleDate.format(Today);
%>
<c:set var="Today" value="<%= simDate %>" />
<fmt:formatDate var="testEt" value="${data.testEt }" pattern="yyyy.MM.dd HH:mm"/>

<div class="col-lg-12">
	<div class="card">
		<div class="card-body">
			<div class="quizWrapper">
				<h1 class="header-title mb-3"></h1>
				
				<div>
					<div class="mb-3" style="width:40%;float:left;">
						<label for="example-disable" class="form-label">퀴즈 제목</label> <input
							type="text" class="form-control" id="example-disable" disabled
							value="${data.testNm }">
					</div>
					
			<!-- 		<div class="clear"></div> -->
				
					<div class="mb-3" style="width:20%;float:left;margin:0 10%;'">
						<label for="example-disable" class="form-label">퀴즈 시작일</label> <input
							type="text" class="form-control" id="example-disable" disabled
							value="<fmt:formatDate value="${data.testSt }" pattern="yyyy-MM-dd HH:mm" />">
					</div>
			
			<!-- 		<div class="clear"></div> -->
				
					<div class="mb-3" style="width:20%;float:left;">
						<label for="example-disable" class="form-label">퀴즈 종료일</label> <input
							type="text" class="form-control" id="example-disable" disabled
							value="${testEt }">
					</div>
					
					<div class="clear"></div>
				
					<div class="mb-3" style="width:100%;float:left;">
						<label for="example-disable" class="form-label">내용</label>
						<textarea class="form-control" id="example-disable" style="resize:none;" maxlength="200" rows="4" readonly>${data.testCon }</textarea>
					</div>
				</div>
					<div class="clear"></div>
				
				<form method="post" id="frm" action="/studentLecture/stuQuizInsertPost" >
				
				<div class="tab-content">
			         <div class="tab-pane show active" id="basic-example-preview">
			            <div class="table-responsive-sm">
			             
			             <!-- insert 용 -->
			             <input type="hidden" name="stScore" id="studentQuizScore"/>
			             
			            <!-- testList =>  TestQVO-->
			             	<c:forEach var="TestQVO" items="${data.testQVOList}" varStatus="stat">
			             	<br><br>
			             	<!-- 보기 시작 -->
			                 <table class="table table-centered mb-0">
			                     <thead>
			                         <tr>
			                             <th>
			                             	<label id="QNo">${stat.count}</label>
											<span>.&emsp;${TestQVO.teqNo}&emsp;/&emsp;<input id="${stat.count}" name="testDetailVOList[${stat.index}].tdAnswer" class="checking" type="text" readOnly /></span>
											<input type="hidden" class="quizAnswer_${stat.count}" value="${TestQVO.teqAnswer }"/>
											<!-- 점수 -->
											<input type="hidden" class="quizScore_${stat.count }" />
											<!-- teqCd -->
											<input type="hidden" name="testDetailVOList[${stat.index}].teqCd" value="${TestQVO.teqCd }">
											<!-- no session 학생 코드 -->
											<input type="hidden" name="stuCd" value="${sessionScope.memSession.memCd}" />
											<!-- 강의 코드 -->
											<input type="hidden" name="lecCd" value="${data.lecCd }" />
											<!-- testCd -->
											<input type="hidden" name="testCd" value="${data.testCd }" />
			                             </th>
			                         </tr>
			                     </thead>
			                     <tbody>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp1_${stat.count}" name="${stat.count}" value="1" class="custom-control-input">&emsp;
													<label class="custom-control-label" for="teqOp1_${stat.count}">${TestQVO.teqOp1 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp2_${stat.count}" name="${stat.count}" value="2" class="custom-control-input">&emsp;
													<label class="custom-control-label" for="teqOp2_${stat.count}">${TestQVO.teqOp2 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp3_${stat.count}" name="${stat.count}" value="3" class="custom-control-input">&emsp;
													<label class="custom-control-label" for="teqOp3_${stat.count}">${TestQVO.teqOp3 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp4_${stat.count}" name="${stat.count}" value="4" class="custom-control-input">&emsp;
													<label class="custom-control-label" for="teqOp4_${stat.count}">${TestQVO.teqOp4 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                     </tbody>
			                 </table>
			                 <!-- 보기 끝 -->
			                 <hr>
			                 </c:forEach>
			             </div> <!-- end table-responsive-->
			         </div> <!-- end preview-->
			     
			     </div>
			     <a href="/studentLecture/quiz?lecCd=${data.lecCd }" class="btn btn-light btn-sm" style="float: left;">목록</a>
				<c:if test="${Today > testEt }">
					<button type="button" class="btn btn-primary btn-sm noSubmit" style="float:right;">퀴즈 제출</button>
				</c:if>
				<c:if test="${Today <= testEt }">
					<button type="button" class="btn btn-primary btn-sm cel" style="float:right;" onClick="CheckAnswer()">퀴즈 제출</button>
				</c:if>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" defer="defer">
	$(function() {
		
		$('.noSubmit').on('click', function() {
			alert("제출 기한이 지나서 제출할 수 없습니다.")
			return false;
		})
		
		
		$('input[type=radio]').change(function() {
// 			var selected = $('input:radio[name="${'+stat.count+'}"]:checked').val();
			var selected = this.value;
			var teqNo = this.name;
			document.getElementById(teqNo).value = selected;
			
			// 채점
			var answer = $('.quizAnswer_' + teqNo).val();
			// 채점			
// 			console.log("진짜 정답 : " + answer);
			
// 			var score = $('.quizScore_' + teqNo).val();
			
			if(selected == answer) {
				console.log(selected + " " + answer);
				$('.quizScore_' + teqNo).val(5);
			}else if (selected != answer) {
// 				alert("틀림");
					$('.quizScore_' + teqNo).val(0);
				if ($('.quizScore_' + teqNo).val() == 5 ) {
						$('.quizScore_' + teqNo).val(0);
				}
				
			}
			
		})
		
// 		var cnt = 1;
// 		var total = 0;
// 		$('.cel').on('click', function() {
// 			for(var i = 1; i <= '<c:out value="${fn:length(data.testQVOList)}" />'; i++) {
// 				total += parseInt($('.quizScore_' + cnt++).val());
// 			}
			
// 			console.log("total : " + total);
// 			$('#studentQuizScore').val(total);
			
			
// 		})
		
		
		
	})

	function CheckAnswer() {
		
		var cnt = 1;
		var total = 0;
			for(var i = 1; i <= '<c:out value="${fn:length(data.testQVOList)}" />'; i++) {
				total += parseInt($('.quizScore_' + cnt++).val());
			}
			
			console.log("total : " + total);
			$('#studentQuizScore').val(total);
			
			
		
		var length = '<c:out value="${fn:length(data.testQVOList)}" />';
		
// 		alert("풀어야 하는 문제 수 : " + length);
		
		var checkedLength = $('input[type=radio]:checked').length;
		
// 		alert("제출자가 푼 문제 수 : " + checkedLength);
		
		

		if(length != checkedLength) {
// 			var checking = $('.checking').val();
			
// 			var number = $("#QNo").html();
// 			console.log("Qno : " + number + checking);
			
// 			if(checking == ""){
				alert("아직 풀지 않은 문제가 있습니다. 안 푼 문항 수 : " + (length - checkedLength));
// 			}
			
			
			return false;
		}
		
		
		
		
		document.getElementById('frm').submit();
		
	}
	

</script>






























