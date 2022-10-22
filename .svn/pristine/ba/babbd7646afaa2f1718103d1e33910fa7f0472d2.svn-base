<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style type="text/css">
.hrwid {
/* 	width: 174%; */
	clear: both;
}

.boardTitleWrap {
	border-top: 2px solid #112a63;
}

	.card {
		min-height: 530px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		margin-bottom: 20px;
	}
	
	.card-body {
		width: 100%;
	}

.boardTitle {
	border: none;
	font-weight: 700;
	padding: 30px 8px;
	float: left;
	display: inline-block;
	font-size: 1.2em;
}

.boardTitleH {
	border: none;
	font-weight: 700;
	padding: 16px 8px;
	float: left;
	display: inline-block;
	font-size: 1.2em;
}

.form-control {
	width: 57%;
	margin: 5px 0 8px 0;

}

.boardDetail {
 	position: absolute; 
 	top : 47px; 
 	right : 25px; 
	display : inline-block;
	float: right;
	line-height: 45px;
}

.underMargin {
	margin: 0 0 30px 8px;
}

.modiBtn {
	width: 100%;
}

.modiBtnshow {
	width: 100%;
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
	width: 10%;
	height: 102px;
	float: left;
	margin: 5px 0 30px 20px;
}

.lecQnarName{
	width: 6%;
	height: 50px;
	text-align: center;
	text-decoration: underline;
		
}

.applyBtnWrap {
	float: rigth;
}

.floatR {
	float: right;
}

.floatL {
	float: left;
}

.qnarTop {
	width: 100%;
}
</style>


<form name="frm" id="frm" method="post" action="/studentLecture/lecQnaList?lecCd=${data.lecCd }">
	<div class="col-12">
		<div class="card" style="min-height: 473px;position: relative;">
			<div class="card-body">
				<div style="min-height: 350px;">
					<div>
						<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">
							<h4>Q&#38;A</h4>
								<input type="hidden" name="lqnaCd" id="lqnaCd" value="${data.lqnaCd }" />
								<input type="hidden" name="lecCd" id="lecCd" value="${data.lecCd }" />

								<div class="mb-3 boardTitleWrap boardT">
									<h5 class="boardTitleH">${data.lqnaTtl}</h5>
								</div>
								<div class="mb-3 boardTitleWrap boardTInput" style="display: none;">
									<input type="text" name="lqnaTtl" value="${data.lqnaTtl}" id="lqnaTtl"
										class="form-control boardTitle" maxlength="50" required minlength="1"
										data-toggle="maxlength" data-placement="top"/>
								</div>

								<div class="boardDetail">
									<p class="afterEvent">
										작성자&emsp;${data.memNm }
									</p>
									<p class="afterEvent">
										등록일&emsp;<fmt:formatDate value="${data.lqnaDt }" pattern="yyyy-MM-dd HH:mm" />
									</p>
									<p class="afterEvent">
										조회수&emsp;${data.lqnaHit }
									</p>
								</div>
								
								<hr class="hrwid">

								<div class="underMargin">
									<div class="mt-4 notModifyMode">
										<p>${data.lqnaConDisplay}</p>
									</div>
									<div class="mt-4 ModifyMode" style="display: none;">
										<textarea name="lqnaCon" rows="20" cols="100" id="summernote" minlength="1">${data.lqnaConDisplay}</textarea>
									</div>
								</div>

						</div>
					</div>
				</div>
				<hr>
				<div class="notModifyMode modiBtn">
				<c:if test="${ sessionScope.memSession.memNm == data.memNm }">
					<div class="floatR">
						<c:if test="${empty qnarList }">
							<button type="button" id="edit" class="btn btn-secondary btn-sm">수정</button>
						</c:if>
						<c:if test="${not empty qnarList }">
							<button type="button" id="notEdit" class="btn btn-secondary btn-sm">수정</button>
						</c:if>
						<button type="button" id="delete" class="btn btn-secondary btn-sm">삭제</button>
					</div>
				</c:if>
					<a href="/studentLecture/lecQnaList?lecCd=${data.lecCd }"
						class="btn btn-light btn-sm floatL">목록</a>
				</div>
				<div class="ModifyMode modiBtnshow" style="display: none;">
					<div class="floatR">
						<button type="submit" class="btn btn-secondary btn-sm">등록</button>
						<a href="/studentLecture/lecQnaDetail?lqnaCd=${data.lqnaCd }" class="btn btn-secondary btn-sm">취소</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="row">
	<div class="col-12">
		<div class="card" style="padding-bottom: 30px;">
			<div class="card-body">

				<form action="/studentLecture/lecQnarInsert" method="post">
				
					<input type="hidden" name="lqnaCd" value="${data.lqnaCd }"  />

					<!-- 작성자 세션 처리 완-->
					<c:set var="session" value="${sessionScope.memSession.memCd}" />
					<c:choose>
						<c:when test="${empty session }">
							<input type="hidden" name="memCd" value="200231111" />
						</c:when>
						<c:when test="${not empty session }">
							<input type="hidden" name="memCd" value="${session }" />
						</c:when>
					</c:choose>
				
					<h5 style="margin-left: 10px;">답글</h5>
					<div class="qnarTop">
						<textarea class="form-control" name="lqnarCon" style="width: 88%;float:left;resize:none;" name="lqnarCon" rows="4" cols="130" maxlength="100" minlength="1" required></textarea>
						<button type="submit" class="btn btn-light replyBtn"><i class="uil uil-enter" style="font-size: 1.7em;"></i></button>
					</div>
				</form>
					<!-- 답글 내용 -->
					<c:if test="${empty qnarList}">
						
					</c:if>
					<c:if test="${not empty qnarList}">
						<table class="qnar" style="clear: both;width: 100%;background: #eef2f7;">
						<c:forEach var="lecQnarVO" items="${qnarList }" varStatus="stat">
						<form id="aplFrm" action="/studentLecture/lecQnarUpdate" method="post">
							<input type="hidden" name="lqnarCd" value="${lecQnarVO.lqnarCd }" />
							<input type="hidden" name="lqnaCd" value="${lecQnarVO.lqnaCd }" />
<%-- 							<input type="hidden" name="lqnarDt" value="${lecQnarVO.lqnarDt }" /> --%>
							<input type="hidden" name="memNm" value="${lecQnarVO.memNm }" />
							<input type="hidden" name="memCd" value="${lecQnarVO.memCd }" />
								<tr>
									<td class="lecQnarName"><strong>${lecQnarVO.memNm }</strong></td>
									<td style="color:#999;font-size: 0.8em;width:85%;"><fmt:formatDate value="${lecQnarVO.lqnarDt }" pattern="yyyy-MM-dd HH:mm" /></td>
									<c:if test="${ sessionScope.memSession.memNm == lecQnarVO.memNm }">
										<td style="width: 15%;">
											<button type="button" class="btn btn-sm applyEdit" title="수정" data-idx="${ stat.index }" style="width: 40px;text-align: center;"><i class="uil uil-pen"></i></button>
											<button type="submit" class="btn btn-sm applyDel" title="삭제" style="width: 40px;text-align: center;"><i class="mdi mdi-delete-variant font-16"></i></button>
										</td>
									</c:if>
								</tr>
								
								<tr style="border-bottom: 4px solid #fff;" class="applyCon apply_${stat.index}">
									<td colspan="3" style="padding: 5px 20px;">
										<p>${lecQnarVO.lqnarCon }<p>
									</td>
								</tr>
								
								<tr style="border-bottom: 4px solid #fff;display: none;" class="applyModifyMode applyModify_${stat.index}">
									<td colspan="3" style="padding: 5px 20px;">
										<textarea name="lqnarCon" class="form-control uptextfoc" rows="4" cols="190" style="resize:none;width: 100%;" minlength="1" required>${lecQnarVO.lqnarCon}</textarea>
										<button type="submit" class="btn btn-light btn-sm applyUpBtn" style="float:right;">수정</button>
									</td>
								</tr>
						</form>
						</c:forEach>
						</table>
				</c:if>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" defer="defer">
//  	CKEDITOR.replace("lqnaCon");

	$('#summernote').summernote({
	        placeholder: '',
	        tabsize: 2,
	        height: 300,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture', 'video']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	        ]
	      });
// 		$('#summernote').summernote('code', '하이');
 	
	$(function() {
		$('#edit').on('click', function() {
			$(".notModifyMode").css("display", "none");
			$(".ModifyMode").css("display", "block");
			// 입력란 활성화
			$('.form-control').removeAttr('disabled');
			$('.form-control').removeClass('boardTitle');
			$(".boardTInput").css("display", "block");
			$(".boardT").css("display", "none");
// 			CKEDITOR.instances['lqnaCon'].setReadOnly(false);
			
			$("#frm").attr("action", "/studentLecture/lecQnaUpdate");
		})
		
		$("#delete").on('click', function() {
			if(!confirm("질문을 삭제 하시겠습니까?")) {
				alert("삭제가 취소되었습니다.");
				return false;
			}
			$("#frm").attr("action","/studentLecture/lecQnaDelete");
			
			$("#frm").submit();
			
		})
		
		$('.applyEdit').on('click', function() {
			if($('.apply_' + $(this).data("idx")).css('display')=='none') {
				$('.apply_' + $(this).data("idx")).css('display', 'contents');
				$('.applyModify_' + $(this).data("idx")).css('display', 'none');
			}else {
				$('.applyModify_' + $(this).data("idx")).css('display', 'contents');
				$('.apply_' + $(this).data("idx")).css('display', 'none');
				$('.uptextfoc').select();
			}
			
		})
		
		$('.applyDel').on('click', function() {
			if(!confirm("답글을 삭제 하시겠습니까?")) {
				alert("삭제가 취소되었습니다.");
				return false;
			}
			$('#aplFrm').attr("action","/studentLecture/lecqnarDelete");
		})
		
		$('#notEdit').on('click', function() {
			alert("답글이 있는 게시글은 수정할 수 없습니다.");
			return false;
		})
	})
</script>




