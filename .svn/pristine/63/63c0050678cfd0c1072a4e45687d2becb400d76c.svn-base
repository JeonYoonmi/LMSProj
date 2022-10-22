<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript" defer="defer">
</script>
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
	}
	
	.card-body {
		width: 100%;
	}
	
/* 기본 틀 잡기 끝 */	
	.emphasisR {
		color: red;
	}
	
	.table-responsive-sm {
		margin-bottom: 40px;
		min-height: 500px;		
	}
	
</style>

<%
      Date date = new Date();
   	  date.setDate(date.getDate()-6);
      SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
      String simDate = simpleDate.format(date);
%>
<c:set var="date" value="<%= simDate %>" />

<div class="col-lg-12">
	<div class="card" style="min-height: 700px;">
		<div class="card-body">
			<div class="quizWrapper">
				<h4	style="margin-bottom: 20px;">${data.lecaNm }&emsp;&#45;&emsp;과목 과제 제출 현황</h4>
				<div class="alert alert-light" role="alert" style="font-size: 0.9em;padding: 35px;border: 1px solid #eee;">
					<p>
						<strong>&#8251; 과제 채점 안내사항</strong>
						<br><br>
						(1) 학생 점수 부여는 <strong>5점에서 20점까지 등록 가능</strong>하며 총점을 <strong>초과</strong>할 수 없습니다.<br><br>
						(2) 제출을 한 경우 과제 게시글을 <strong>수정</strong>할 수 없습니다.
					</p>
				</div>
	
				<a href="/professorLecture/lecTaskList?lecCd=${data.lecCd }" class="btn btn-light btn-sm" style="float: right;">과제 목록</a>
				<div class="tab-content quizTab">
					<div class="tab-pane show active" id="hoverable-rows-preview">
						<div class="table-responsive-sm">
							<table class="table mb-0" style="border-bottom: 1px solid #eef2f7">
								<thead class="table-light">
									<tr style="border-top: 2px solid #112a63">
										<th style="width: 10%; text-align: center;">NO</th>
										<th style="width: 40%;text-align: center;">제목</th>
										<th style="width: 10%;text-align: center;">작성자</th>
										<th style="width: 15%;text-align: center;">제출일</th>
										<th style="width: 15%;text-align: center;">마감일</th>
										<th style="width: 10%;text-align: center;">점수</th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${empty list}">
								
								<tr style="border-bottom: 1px solid #eef2f7">
									<td colspan="6" style="text-align: center;color: #888;">제출한 과제가 없습니다.</td>
								</tr>
							
								</c:if>
								<c:if test="${not empty list}">
								
									<c:forEach var="taskSubmitVO" items="${list.taskSubmitVOList }">
									<fmt:formatDate var="tsubDt" value="${taskSubmitVO.tsubDt }" pattern="yyyy.MM.dd"/>
										<tr>
											<!-- no -->
											<td style="text-align: center;">${taskSubmitVO.rnum }</td>
											<!-- 제목 -->
											<td>
												<a href="/professorLecture/lecTaskStuDetail?tsubCd=${taskSubmitVO.tsubCd }&&taskCd=${list.taskCd}" style="color:#6c757d;">
													${list.taskNm }
												</a>
												<c:if test="${ date <= tsubDt }">
					                              <span class="badge badge-outline-warning badge-pill" style="float:right;">NEW</span>
					                           </c:if>
											</td>
											<!-- 작성자 -->
											<td style="text-align: center;">${taskSubmitVO.memNm }</td>
											<!-- 제출일 -->
											<td style="text-align: center;">${tsubDt}</td>
											<!-- 마감일 -->
											<td style="text-align: center;text-decoration: underline;">
												<fmt:formatDate value="${list.taskEt }" pattern="MM.dd HH:mm" />
											</td>
											<!-- 점수 -->
											<td style="text-align: center;">
												${taskSubmitVO.tsubScore }&nbsp;/&nbsp;${list.taskScore }
											</td>
										</tr>
									</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div id="pageBarBtn" style="text-align:center;">
			    <button type="button" class="btn btn-light" disabled="" onclick="#"><i class="uil-angle-double-left"></i></button>
			    <button type="button" class="btn btn-light" disabled="" onclick="#"><i class="uil uil-angle-left"></i></button>
			         	
			         		
				    <button type="button" class="btn btn-primary" onclick="#">
				    	1
			    	</button>
				
			    <button type="button" class="btn btn-light" onclick="#"><i class="uil uil-angle-right"></i></button>
			    <button type="button" class="btn btn-light" disabled="" onclick="#"><i class="uil-angle-double-right"></i></button>
			</div>
		</div>
	</div>
</div>


