<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
.hrwid {
	/*    width: 174%; */
	clear: both;
}

.boardTitleWrap {
	border-top: 2px solid #112a63;
	/*    width: 174%; */
}

#ntcTtl {
	text-align: center;
	margin: 30px 0;
}
#ntcListBtn{
	display: inline-block;
	margin-bottom : 28px;
}

/* .boardTitle { */
/*    border: none; */
/*    font-weight: 700; */
/*    padding: 30px 8px; */
/*    float: left; */
/*    display: inline-block; */
/*    font-size: 1.2em; */
/* } */
.form-control {
	width: 57%;
	margin: 5px 0 8px 0;
}

.underMargin {
	margin: 0 0 30px 8px;
}

.modiBtn {
	position: absolute;
	bottom: 40px;
	right: 32px;
}

.modiBtnshow {
	position: absolute;
	bottom: 20px;
	right: 20px;
}

.afterEvent {
	display: inline-block;
	float: left;
}

.afterEvent:nth-child(1):after {
	content: "|";
	color: #bbb;
	margin: 0 10px;
}

.afterEvent:nth-child(2):after {
	content: "|";
	color: #bbb;
	margin: 0 10px;
}

.replyBtn {
	width: 155px;
	height: 102px;
	float: left;
	margin: 5px 0 50px 20px;
}

.ntcfNm {
	cursor: pointer;
	width: fit-content;
	block-size: fit-content;
	margin-left: 1%;
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
#ntcListBtn{
	position : relative;
	top : 13px;
}
#ntcIcon{
		display : inline-block;
		transform: rotate(15deg);
		position : relative;
		bottom : 4px;
	}
</style>
<div class="row">
	<div class="col-lg-13" style="width: 90%; margin-left : auto; margin-right : auto">
      <div class="card" style="width: 100%; min-width: 1200px; max-width: 1400px; margin: 0 auto;">
         <div class="card-body">
				<div style="min-height: 570px;">
					<div>
						<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">
							<h3>????????????</h3>
							<div class="mb-3 boardTitleWrap">
								<h2 id="ntcTtl">${noticeVO.ntcTtl}</h2>
								<input type="text" name="lqnaTtl" style="display: none;"
									value="${noticeVO.ntcTtl}" id="ntcTtl"
									class="form-control boardTitle" maxlength="50" required
									data-toggle="maxlength" data-placement="top" />
							</div>

							<hr class="hrwid">

							<div>
								<p class="afterEvent">?????????&emsp;${noticeVO.mgrNm }</p>
								<p class="afterEvent">
									?????????&emsp;
									<fmt:formatDate value="${noticeVO.ntcDt }"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
								<p class="afterEvent">?????????&emsp;${noticeVO.ntcHit }</p>
							</div>

							<hr class="hrwid">

							<c:if test="${ not empty noticeVO.ntcFileVOList }">
								<div class="ntcfNm">
									<c:forEach var="ntcFileVO" items="${ noticeVO.ntcFileVOList }">
										<p onclick="fn_download('${ ntcFileVO.attachVO.attachNm }')">
											<i class="dripicons-paperclip"></i>&nbsp;${ fn:substring(ntcFileVO.attachVO.attachNm, fn:indexOf(ntcFileVO.attachVO.attachNm, '_') + 1, fn:length(ntcFileVO.attachVO.attachNm)) }
										</p>
									</c:forEach>
								</div>

								<hr class="hrwid">
							</c:if>

							<div class="underMargin">
								<div class="mt-4 notModifyMode">
									<c:forEach var="ntcFileVO" items="${ noticeVO.ntcFileVOList }">
										<c:forTokens var="token" items="${ ntcFileVO.attachVO.attachNm }"
											delims="." varStatus="status">
											<c:if
												test="${token eq 'jpg' || token eq 'gif' || token eq 'png' || token eq 'bmp' || token eq 'jfif' }">
												<img src="/resources/attach/${ ntcFileVO.attachVO.attachNm }" style="width: 60%;">
											</c:if>
										</c:forTokens>
									</c:forEach>
									<p>${noticeVO.ntcConDisplay}</p>
								</div>
								<div class="mt-4 ModifyMode" style="display: none;">
									<textarea name="ntcCon" rows="20" cols="100" id="summernote">${noticeVO.ntcCon}</textarea>
								</div>
							</div>

						</div>
					</div>
				</div>
				<hr>
				<br>
				<div id="ntcListBtn"><a href="/notice/ntcList" class="btn btn-sm btn-light">??????</a></div>
				<div class="notModifyMode modiBtn">
					<c:if test="${ not empty sessionScope.memSession.managerVO }">
						<button type="button" id="edit" class="btn btn-primary btn-sm" onclick="location.href='/notice/ntcWirte?ntcCd=${ noticeVO.ntcCd }'">??????</button>
						<button type="button" id="delete" class="btn btn-primary btn-sm" onclick="location.href='/notice/deleteNtc?ntcCd=${ noticeVO.ntcCd }'">??????</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<iframe id="ifrm" name="ifrm" style="display: none;"></iframe>
<script type="text/javascript" defer="defer">
	function fn_download(fileName) {
		let vIfrm = document.getElementById("ifrm");

		vIfrm.src = "/mail/download?fileName=" + fileName;
	}

	$('#summernote').summernote(
			{
				placeholder : '',
				tabsize : 2,
				height : 300,
				toolbar : [ [ 'style', [ 'style' ] ],
						[ 'font', [ 'bold', 'underline', 'clear' ] ],
						[ 'color', [ 'color' ] ],
						[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
						[ 'table', [ 'table' ] ],
						[ 'insert', [ 'link', 'picture', 'video' ] ],
						[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
			});
	
	$(function(){
		
	});
</script>



