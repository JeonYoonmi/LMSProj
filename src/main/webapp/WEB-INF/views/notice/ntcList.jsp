<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/resources/css/suwon.css">
<style>
	.table-responsive {
		border-bottom: 1px solid #eef2f7;
	}
	
	.searchNtc {
		height: 100px;
		padding: 30px;
		background: #f8f8f8;
	}
	#ntcSearchBtn	{
		width : 90px;
	}
	.formPosition {
		width: 100%;
		height: 40px;
		display : flex;
		justify-content: center;
	}
	
	.ntcCateLeft {
		width: 120px;
		margin-right : 10px;
	}
	
	.ntcCateRight {
		width: 120px;
		margin-right : 10px;
	}
	
	.searchBoxPosition {
		width: 563px;
	}
	#ntcSearchBtn{
		margin-left : 10px;
	}
	.app-search .form-control {
		background-color: white;
		border: 1px solid #dee2e6;
	}
	
	#pageBarBtn{
		text-align : center;
	}
	.btn-primary{
		background-color: #2a5388;
		border: #2a5388;
		box-shadow : #2a5388;
	}
	.btn-primary:hover{
		background-color: #4671af;
		border: #4671af;
		box-shadow : #4671af;
	}
	#ntcIcon{
		display : inline-block;
		transform: rotate(15deg);
		position : relative;
		bottom : 4px;
	}
	#ntcInsertBtn{
		float : right;
	}
</style>
<%
	Date date = new Date();
	date.setDate(date.getDate() - 6);
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy.MM.dd");
	String simDate = simpleDate.format(date);
%>
<c:set var="date" value="<%= simDate %>" />
<!--    공지사항 게시판 -->
   <div class="col-lg-13" style="width: 90%; margin-left : auto; margin-right : auto">
      <div class="card" style="width: 100%; min-width: 1200px; max-width: 1400px; margin: 0 auto;">
         <div class="card-body">
            <h3>공지사항</h3>
            <br>
            <div class="searchNtc">
	         	<div class="app-search dropdown d-none d-lg-block searchNtcCon">
	                <form class="formPosition" method="get" action="/notice/ntcList">
                		<select class="custom-select ntcCateLeft" id="status-select" name="ntcCate">
                            <option value="" <c:if test="${ map.ntcCate == '' }">selected</c:if>>공통</option>
                            <option value="N101" <c:if test="${ map.ntcCate == '학사' }">selected</c:if>>학사</option>
                            <option value="N102" <c:if test="${ map.ntcCate == '장학' }">selected</c:if>>장학</option>
                            <option value="N103" <c:if test="${ map.ntcCate == '행사' }">selected</c:if>>행사</option>
                        </select>
                		<select class="custom-select ntcCateRight" id="status-select" name="cond">
                            <option value="title" <c:if test="${ map.cond == 'title' }">selected</c:if>>제목</option>
                            <option value="content" <c:if test="${ map.cond == 'content' }">selected</c:if>>내용</option>
                            <option value="ttlNcon" <c:if test="${ map.cond == 'ttlNcon' }">selected</c:if>>재목&amp;내용</option>
                            <option value="writer" <c:if test="${ map.cond == 'writer' }">selected</c:if>>작성자</option>
                        </select>
	                    <div class="input-group searchBoxPosition">
	                        <input type="text" class="form-control dropdown-toggle" name="keyword" placeholder="검색어를 입력하세요" id="top-search" value="${ map.keyword }">
	                        <span class="mdi mdi-magnify search-icon"></span>
	                        <div class="input-group-append">
	                            <button id="ntcSearchBtn" class="btn btn-secondary" type="submit">검색</button>
	                        </div>
	                    </div>
	                </form>
	            </div>
            </div>
            <br>
            <p style="display: inline-block;margin-top:15px;margin-left: 30px;">총&nbsp;<span style="color: red;"><fmt:formatNumber maxFractionDigits="3" value="${ ntcList.total + fn:length(ntcHotList) }"></fmt:formatNumber></span>건의 게시물이 있습니다.</p>
            <c:if test="${ not empty sessionScope.memSession.managerVO }">
            	<a href="/notice/ntcWirte" id="ntcInsertBtn" class="btn btn-primary">등록하기</a>
            </c:if>
            <div class="table-responsive">
            <c:if test="${empty ntcList.content and empty ntcHotList}">
            
               <p>등록된 공지사항이 없습니다.</p>
            
            </c:if>
            <c:if test="${not empty ntcList.content or not empty ntcHotList}">
            
               <table class="table mb-0">
                  <thead class="table-light">
                     <tr style="border-top: 2px solid #112a63">
                        <th style="width: 10%;text-align: center;">NO</th>
                        <th style="width: 50%;text-align: center;">제목</th>
                        <th style="width: 10%;text-align: center;">첨부파일</th>
                        <th style="width: 10%;text-align: center;">작성자</th>
                        <th style="width: 10%;text-align: center;">등록일</th>
                        <th style="width: 10%;text-align: center;">조회수</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="noticeVO" items="${ ntcHotList }">
                  	<fmt:formatDate var="ntcDt" value="${ noticeVO.ntcDt }" pattern="yyyy.MM.dd"/>
                     <tr style="background : #fcfdff;" >
                        <td style="text-align: center;"><i class="dripicons-pin"></i></td>
                        <td>
                        	<a href="/notice/ntcDetail?ntcCd=${ noticeVO.ntcCd }" style="color:#6c757d;">[${ noticeVO.ntcCate }]&nbsp;<span style="font-weight: 900;">${ noticeVO.ntcTtl }</span></a>
                        	<c:if test="${ date <= ntcDt }">
	                        	<span class="badge badge-outline-warning badge-pill" style="float: right;">NEW</span>
                        	</c:if>
                       	</td>
                        <td style="text-align: center;">
                        	<c:if test="${ not empty noticeVO.ntcFileVOList }"><i class="dripicons-paperclip"></i></c:if>
                       	</td>
                        <td style="text-align: center;">${ noticeVO.mgrNm }</td>
                        <td style="text-align: center;">${ ntcDt }</td>
                        <td style="text-align: center;">${ noticeVO.ntcHit }</td>
                     </tr>
                  </c:forEach>
                  <c:forEach var="noticeVO" items="${ ntcList.content }">
                  	<fmt:formatDate var="ntcDt" value="${ noticeVO.ntcDt }" pattern="yyyy.MM.dd"/>
                     <tr>
                        <td style="text-align: center;">${ noticeVO.rnum }</td>
                        <td>
                        	<a href="/notice/ntcDetail?ntcCd=${ noticeVO.ntcCd }" style="color:#6c757d;">[${ noticeVO.ntcCate }]&nbsp;${ noticeVO.ntcTtl }</a>
                        	<c:if test="${ date <= ntcDt }">
	                        	<span class="badge badge-outline-warning badge-pill" style="float: right;">NEW</span>
                        	</c:if>
                       	</td>
                        <td style="text-align: center;">
                        	<c:if test="${ not empty noticeVO.ntcFileVOList }"><i class="dripicons-paperclip"></i></c:if>
                       	</td>
                        <td style="text-align: center;">${ noticeVO.mgrNm }</td>
                        <td style="text-align: center;">${ ntcDt }</td>
                        <td style="text-align: center;">${ noticeVO.ntcHit }</td>
                     </tr>
                  </c:forEach>
                  </tbody>
               </table>
            </c:if>
            <div id="pageBarBtn">
			    <button type="button" class="btn btn-light" <c:if test='${ ntcList.startPage lt 6 }'>disabled</c:if> onclick="location.href='/notice/ntcList?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ ntcList.startPage - 5 }'"><i class="uil-angle-double-left"></i></button>
			    <button type="button" class="btn btn-light" <c:if test='${ ntcList.startPage == ntcList.currentPage }'>disabled</c:if> onclick="location.href='/notice/ntcList?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ ntcList.currentPage - 1 }'"><i class="uil uil-angle-left"></i></button>
            	<c:forEach var="pNo" begin="${ ntcList.startPage }" end="${ ntcList.endPage }">
            		<c:if test="${ pNo == 0 }"><c:set var="pNo" value="1"></c:set></c:if>
				    <button type="button" class="btn btn-<c:if test="${ ntcList.currentPage != pNo }">light</c:if><c:if test="${ ntcList.currentPage == pNo }">primary</c:if>"
			    		 onclick="location.href='/notice/ntcList?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ pNo }'">
				    	${ pNo }
			    	</button>
				</c:forEach>
			    <button type="button" class="btn btn-light" <c:if test='${ ntcList.endPage == ntcList.currentPage }'>disabled</c:if> onclick="location.href='/notice/ntcList?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ ntcList.currentPage + 1 }'"><i class="uil uil-angle-right"></i></button>
			    <button type="button" class="btn btn-light" <c:if test="${ ntcList.endPage ge ntcList.totalPages }">disabled</c:if> onclick="location.href='/notice/ntcList?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ ntcList.startPage + 5 }'"><i class="uil-angle-double-right"></i></button>
			</div>
         </div>
         <!-- end table-responsive -->
      </div>
   </div>
</div>
<!-- 공지사항 게시판 -->