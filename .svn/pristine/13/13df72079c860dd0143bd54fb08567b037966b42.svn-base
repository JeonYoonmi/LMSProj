<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.card-body{
	min-height : 786px;
}
table *{
text-align: center;
}
.btn-primary{
    background : #2a5388;
    border : #2a5388;
    box-shadow : #2a5388;
}
.btn-primary:hover{
    background : #4671af;
    border : #4671af;
    box-shadow : #4671af;
}
#pageBarBtn{
	position: absolute;
    bottom: 25px;
    left: 45%;
}
.stuConcelRound{
	min-width : 88%;
	margin-left : 10%;
	margin-right : auto;
}
#counsetInsertBtn{
	float : right;
	margin-right : 10px;
	margin-bottom : 15px;
	padding : 10px;
}	
</style>
</head>
<body>
<div id="stuConcelRound">
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 상담 <i class="dripicons-chevron-right"></i>
<span style="font-weight: bold;">상담신청및이력</span>
</div>
<br><br>

  <div class="col-lg-13">
      <div class="card">
         <div class="card-body">
            <h3>상담</h3>
            <br>
            <p style="display: inline-block;margin-top:15px;margin-left: 30px;">총&nbsp;<span style="color:red;">${history.total }</span>건의 게시물이 있습니다</p>
            <a href="/counsel/applyCounsel" id="counsetInsertBtn" class="btn btn-primary btn-sm">+ 등록하기</a>
            <div class="table-responsive">
            <c:if test="${empty history.content}">
            
               <p>상담 내역이 없습니다.</p>
            
            </c:if>
            <c:if test="${not empty history.content}">
            
               <table class="table mb-0">
                  <thead class="table-light">
                     <tr style="border-top: 2px solid #112a63">
                        <th style="width: 10%;text-align: center;">NO</th>
                        <th style="width: 50%;text-align: center;">제목</th>
                        <th style="width: 20%;text-align: center;">등록일</th>
                        <th style="width: 20%;text-align: center;">답변여부</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="item" items="${history.content}">
                  	<fmt:formatDate var="cnslReg" value="${ item.cnslReg }" pattern="yyyy.MM.dd"/>
                     <tr>
                        <td style="text-align: center;">${ item.rnum }</td>
                        <td style="text-align: left;">
                        	<a href = "/counsel/stuCounselDetail?cnslCd=${item.cnslCd }" style="color:#6c757d;">[${ item.cnslCate }]&nbsp;${ item.cnslTtl }</a>
                       	</td>
                        <td style="text-align: center;">${ cnslReg }</td>
                        <td style="text-align: center;">
	                        <c:if test="${item.cnslYn eq '상담전'}">
								<span style="color:#777;">${item.cnslYn}</span>
							</c:if>
	                        <c:if test="${item.cnslYn eq '상담완료'}">
								<span style="color:#001353;font-weight:bold;" >${item.cnslYn}</span>
							</c:if>
                        </td>
                     </tr>
                  </c:forEach>
                  </tbody>
               </table>
           </c:if>

				<div id="pageBarBtn" >
					<button type="button" class="btn btn-light"
						<c:if test='${ history.startPage lt 6 }'>disabled</c:if>
						onclick="location.href='/counsel/stuCounsel?currentPage=${ history.startPage - 5 }'">
						<i class="uil-angle-double-left"></i>
					</button>
					<button type="button" class="btn btn-light"
						<c:if test='${ history.startPage == history.currentPage }'>disabled</c:if>
						onclick="location.href='/counsel/stuCounsel?currentPage=${ history.currentPage - 1 }'">
						<i class="uil uil-angle-left"></i>
					</button>
					<c:forEach var="pNo" begin="${ history.startPage }"
						end="${ history.endPage }">
						<c:if test="${ pNo == 0 }">
							<c:set var="pNo" value="1"></c:set>
						</c:if>
						<button type="button"
							class="btn btn-<c:if test="${ history.currentPage != pNo }">light</c:if><c:if test="${ history.currentPage == pNo }">primary</c:if>"
							onclick="location.href='/counsel/stuCounsel?currentPage=${ pNo }'">
							${ pNo }</button>
					</c:forEach>
					<button type="button" class="btn btn-light"
						<c:if test='${history.endPage == history.currentPage }'>disabled</c:if>
						onclick="location.href='/counsel/stuCounsel?currentPage=${ history.currentPage + 1 }'">
						<i class="uil uil-angle-right"></i>
					</button>
					<button type="button" class="btn btn-light"
						<c:if test="${history.endPage ge history.totalPages }">disabled</c:if>
						onclick="location.href='/counsel/stuCounsel?currentPage=${ history.startPage + 5 }'">
						<i class="uil-angle-double-right"></i>
					</button>
				</div>
			</div>
         <!-- end table-responsive -->
      </div>
   </div>
</div>
</div>
</body>
</html>