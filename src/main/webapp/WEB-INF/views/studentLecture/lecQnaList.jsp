<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/suwon.css">
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
	}
	
	.card-body {
		width: 100%;
	}
	
/* 기본 틀 잡기 끝 */

	.table {
		border-bottom: 1px solid #eef2f7;
	}
	
	.table-responsive {
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

	<!-- 질문 게시판 -->
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<h4	style="margin-bottom: 20px;">${data.lecaNm }&emsp;&#45;&emsp;Q&#38;A</h4>
				<p style="display: inline-block;margin-top:15px;margin-left: 30px;">총&nbsp;<span style="color:red;">${fn:length(list) }</span>건의 게시물이 있습니다</p>
				
				<c:if test="${ memSession.studentVO.stuCd != null }">
					<a href="/studentLecture/lecQnaInsert?lecCd=${data.lecCd }" class="btn btn-primary btn-sm" style="float:right;margin-bottom: 30px;">등록</a>
				</c:if>
				
				<div class="table-responsive">
					<table class="table mb-0">
						<thead class="table-light">
							<tr style="border-top: 2px solid #112a63">
								<th style="width: 10%;text-align: center;">NO</th>
								<th style="width: 60%;text-align: center;">제목</th>
								<th style="width: 10%;text-align: center;">작성자</th>
								<th style="width: 10%;text-align: center;">등록일</th>
								<th style="width: 10%;text-align: center;">조회수</th>
							</tr>
						</thead>
						<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="5" style="text-align: center;color: #888;">등록된 질문이 존재하지 않습니다.</td>
						</tr>
					</c:if>
				
					<c:if test="${not empty list}">
						<c:forEach var="list" items="${list}">
							<fmt:formatDate var="lqnaDt" value="${list.lqnaDt }" pattern="yyyy.MM.dd"/>
							<tr>
								<td style="text-align: center;">${list.rnum }</td>
								<td><a href="/studentLecture/lecQnaDetail?lqnaCd=${list.lqnaCd }" style="color:#6c757d;">${list.lqnaTtl }&nbsp;
									<c:if test="${list.cntLqnar != 0}"><span style="color: #9aa4ac;">&#40;${list.cntLqnar }&#41;</span></c:if>
								</a>
									<c:if test="${ date <= lqnaDt }">
		                              <span class="badge badge-outline-warning badge-pill" style="float: right;">NEW</span>
		                           </c:if>
								</td>
								<td style="text-align: center;">${list.memNm }</td>
								<td style="text-align: center;">${lqnaDt }</td>
								<td style="text-align: center;">${list.lqnaHit }</td>
							</tr>
						</c:forEach>
					</c:if>
					</tbody>
					</table>
				</div>
				<!-- end table-responsive -->
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
	<!-- 질문 게시판 -->