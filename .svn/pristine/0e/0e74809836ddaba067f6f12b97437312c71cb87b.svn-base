<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/suwon.css">
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
	
/* 기본 틀 잡기 끝 */
</style>

<div class="col-lg-12">
	<div class="card" style="min-height: 700px;">
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
							value="<fmt:formatDate value="${data.testEt }" pattern="yyyy-MM-dd HH:mm" />">
					</div>
					
					<div class="clear"></div>
				
					<div class="mb-3" style="width:100%;float:left;">
						<label for="example-disable" class="form-label">내용</label>
						<textarea class="form-control" id="example-disable" style="resize:none;" maxlength="200" rows="4" readonly>${data.testCon }</textarea>
					</div>
				</div>
				
				<div class="clear"></div>
				
				<div class="tab-content">
			         <div class="tab-pane show active" id="basic-example-preview">
			            <div class="table-responsive-sm">
			             
			            <!-- testList =>  TestQVO-->
			             	<c:forEach var="TestQVO" items="${data.testQVOList}" varStatus="stat">
			             	<br><br>
			             	<!-- 보기 시작 -->
			                 <table class="table table-centered mb-0">
			                     <thead>
			                         <tr>
			                             <th>
			                             	<label>${stat.count}.&nbsp;</label>
											<span style="line-height : 25px;" >${TestQVO.teqNo} / 답 : ${TestQVO.teqAnswer}번</span>
			                             </th>
			                         </tr>
			                     </thead>
			                     <tbody>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp1_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${TestQVO.teqAnswer == 1 }">checked</c:if> onclick="return false;">&emsp;
													<label class="custom-control-label" for="teqOp1_${stat.count}">${TestQVO.teqOp1 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp2_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${TestQVO.teqAnswer == 2 }">checked</c:if> onclick="return false;">&emsp;
													<label class="custom-control-label" for="teqOp2_${stat.count}">${TestQVO.teqOp2 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp3_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${TestQVO.teqAnswer == 3 }">checked</c:if> onclick="return false;" >&emsp;
													<label class="custom-control-label" for="teqOp3_${stat.count}">${TestQVO.teqOp3 }</label>
												</div>
											</div>
			                             </td>
			                         </tr>
			                         <tr>
			                             <td>
			                             	<div class="mt-3">
						          				<div class="custom-control custom-radio">
													<input type="radio" id="teqOp4_${stat.count}" name="${stat.count}" class="custom-control-input" 
													<c:if test="${TestQVO.teqAnswer == 4 }">checked</c:if> onclick="return false;" >&emsp;
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
				
						<a href="/professorLecture/quiz?lecCd=${data.lecCd }" class="btn btn-light btn-sm goList">목록</a>
				
			</div>
		</div>
	</div>
</div>
			