<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

<div class="quizWrapper">
	<div class="col-lg-12">
		<div class="card" style="min-height: 700px;">
			<div class="card-body">
				<h4>${data.lecaNm }&emsp;&#45;&emsp;과목 퀴즈</h4>
					<div class="alert alert-light" role="alert" style="font-size: 0.9em;padding: 35px;border: 1px solid #eee;">
						<p>
							<strong>&#8251; 퀴즈 응시자 안내 사항</strong>
							<br>
							퀴즈는 수업 담당 교수님이 직접 출제합니다.<br>
							수강생들은 퀴즈 <strong>시작시간</strong>과 <strong>종료시간</strong>을 엄수하여주시길 바랍니다.
							<br><br>
							(1) 퀴즈는 한 문항당 5점씩 채점되며, 제출을 완료하면 자동 채점됩니다. 총점은 백분율로 계산하여 보여집니다.<br>
							(2) 한 퀴즈당 문항은 최대 10개로 제한되어 있습니다.<br>
							(2) 풀지 않은 문항이 있을 경우 퀴즈 제출 할 수 없습니다.  응시자는 이를 확인하여 모든 답을 체크할 수 있도록 해야합니다.<br>
							(4) 응시 한 후 제출한 퀴즈의 답을 확인할 수 있습니다.<br>
							<br><br>
							<i class="emphasisR">&#8251;&#8251; 제출 마감시간이 되면 문제 풀이 유무와 상관 없이 제출되며, 풀지 않은 문항은 자동으로 0점 처리됩니다.</i>
						</p>
					</div>
					<p style="display: inline-block;margin-top:15px;margin-left: 30px;">총&nbsp;<span style="color: red;">${fn:length(list) }</span>건의 게시물이 있습니다.</p>
					<div class="tab-content">
						<div class="tab-pane show active" id="hoverable-rows-preview">
							<div class="table-responsive-sm">
							
							
								<table class="table mb-0" style="border-bottom: 1px solid #eef2f7">
									<thead>
										<tr style="border-top: 2px solid #112a63">
										<th style="width: 5%; text-align: center;">NO</th>
										<th style="width: 40%;text-align: center;">제목</th>
										<th style="width: 15%;text-align: center;">퀴즈 시작</th>
										<th style="width: 15%;text-align: center;">퀴즈 종료</th>
										<th style="width: 10%;text-align: center;">점수</th>
<!-- 										<th style="width: 15%;text-align: center;">제출일</th> -->
									</tr>
									</thead>
									<tbody>
									<c:if test="${empty list}">
									
									<tr>
										<td colspan="7" style="text-align: center;color: #888;">예정된 퀴즈가 없습니다.</td>
									</tr>
								
									</c:if>
									<c:if test="${not empty list}">
									
										<c:forEach var="list" items="${list }" varStatus="i">
										<fmt:formatDate var="testReg" value="${list.testReg }" pattern="yyyy.MM.dd"/>
											<tr>
												<td style="text-align: center;">${list.rnum }</td>
												<td>
													<c:forEach var="chk" items="${check }">
														<c:if test="${list.testCd == chk.stuTestVO.testCd}">
															<c:set var="flag" value="1" />
															
																<a href="/studentLecture/quizDetailComplete?testCd=${list.testCd }&&lecCd=${data.lecCd}" id="QuizGo" style="color:#6c757d;">	
																${list.testNm }
																</a>
								                        </c:if>
									                </c:forEach>
									                
									                <c:if test="${flag != 1}">
							                            <!-- 기본 주소 -->
														<a href="/studentLecture/quizDetail?testCd=${list.testCd }" style="color:#6c757d;">	
														${list.testNm }
														</a>
							                            <!-- 기본 주소 끝 -->
								                    </c:if>
								                    
													<c:if test="${ date <= testReg }">
						                              <span class="badge badge-outline-warning badge-pill" style="float:right;">NEW</span>
						                            </c:if>
								                            
												</td>
												<td style="text-align: center;color: #888;"> 
														<fmt:formatDate value="${list.testSt }" pattern="MM.dd HH:mm" />
												</td>
												<td style="text-align: center;color: #888;">
														<fmt:formatDate value="${list.testEt }" pattern="MM.dd HH:mm" />
												</td>
												<td style="text-align: center;">
												<c:forEach var="chk" items="${check }">
														<c:if test="${list.testCd == chk.stuTestVO.testCd}">
															<strong>
																${chk.stuTestVO.stScore }
															</strong>
														</c:if>
												</c:forEach>
												<c:if test="${flag != 1}" >
													<span>미제출</span>
												</c:if>
												</td>
<!-- 												<td style="text-align: center;color: #888;"> -->
<%-- 													<c:forEach var="chk" items="${check }"> --%>
<%-- 														<c:if test="${list.testCd == chk.stuTestVO.testCd}"> --%>
<%-- 																<fmt:formatDate value="${chk.stuTestVO.stDt }" pattern="MM/dd HH:mm" /> --%>
<%-- 														</c:if> --%>
<%-- 													</c:forEach> --%>
<%-- 													<c:if test="${flag != 1}" > --%>
<!-- 														<span>미제출</span> -->
<%-- 													</c:if> --%>
<!-- 												</td> -->
											</tr>
											<c:set var="flag" value="0" />
										</c:forEach>
										</c:if>
									</tbody>
								</table>
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
</div>
<script type="text/javascript" defer="defer">
	$(function() {
		
		var complete = $('#checkComplete').html();
// 		$('#QuizGo').on('click', function() {
// 			if(complete !== null) {
// 				alert("이미 제출 완료한 퀴즈입니다.");
// 				return false;
// 			}
// 		})

		


	})
</script>

