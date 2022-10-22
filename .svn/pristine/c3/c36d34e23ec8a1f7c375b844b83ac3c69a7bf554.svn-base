<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="/resources/css/suwon.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style type="text/css">
/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.card {
		min-height: 530px;
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

.hrwid {
	width: 174%;
	clear: both;
}

.boardTitleWrap {
	border-top: 2px solid #112a63;
	width: 174%;
}

.boardWrapper {
	position: relative;
}

.boardTitle {
	border: none;
	font-weight: 700;
	padding: 30px 8px;
	float: left;
	display: inline-block;
	font-size: 1.2em;
}

.form-control {
	width: 57%;
	margin: 10px 0 8px 0;

}

.boardDetail {
	position: absolute;
	top : 50px;
	right : -465px;
	display : inline-block;
	float: right;
	line-height: 45px;
}

.underMargin {
	margin: 0 0 30px 8px;
	min-height: 300px;
}

.modiBtn {
	width: 175%;
}

#delete, #edit {
	float: right;
	margin-right: 5px;
}
</style>


<div class="row">
	<div class="col-12">
		<div class="card" style="padding-bottom: 30px;">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-7">
						<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">

							<h4 class="mb-2">공지</h4>
<%-- 							<form:form method="post" modelAttribute="lecNoticeVO" --%>
<%-- 								action="/professorLecture/lecNotUpdatePost"> --%>
								<form name="frm" id="frm" method="post" action="/professorLecture/lecNoticeList?lecCd=${data.lecCd }">
								<input type="hidden" name="lecCd" id="lecCd" value="${data.lecCd }" />

								<div class="mb-3 boardTitleWrap">
									<input type="text" name="lntcTtl" value="${data.lntcTtl}" id="lntcTtl"
										class="form-control boardTitle" maxlength="50" required
										data-toggle="maxlength" data-placement="top" />
								</div>

								<div class="boardDetail">
									<p>
										등록일&emsp;<fmt:formatDate value="${data.lntcReg }" pattern="yyyy-MM-dd HH:mm" />
									</p>
								</div>
								
								<hr class="hrwid">

								<div class="underMargin"  style="width:175%">
									<%-- 			<form:textarea path="lntcCon" id="lntcCon" readonly="readonly">${data.lntcCon}</form:textarea> --%>
									<div class="mt-4 notModifyMode">
										<p>${data.lntcConDisplay}</p>
									</div>
									<div class="mt-4 ModifyMode" style="display: none;">
										<textarea name="lntcCon" rows="20" cols="100" id="summernote"></textarea>
									</div>
								</div>

								<c:if test="${ memSession.professorVO.proCd != null }">
									<div class="notModifyMode modiBtn">
										<button type="button" id="delete" class="btn btn-primary btn-sm">삭제</button>
										<button type="button" id="edit" class="btn btn-primary btn-sm">수정</button>
										<a href="/professorLecture/lecNoticeList?lecCd=${data.lecCd }"
											class="btn btn-light btn-sm" style="float: left;">목록</a>
									</div>
								</c:if>
								<c:if test="${ memSession.studentVO.stuCd != null }">
									<a href="/professorLecture/lecNoticeList?lecCd=${data.lecCd }"
										class="btn btn-light btn-sm">목록</a>
								</c:if>
									<div class="ModifyMode modiBtn" style="display: none;">
										<button type="submit" id="edit" class="btn btn-primary btn-sm">등록</button>
										<a href="/professorLecture/lecNoticeDetail?lntcCd=${data.lntcCd }" class="btn btn-light btn-sm">취소</a>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" defer="defer">
//  	CKEDITOR.replace("lntcCon");
 	$('#summernote').summernote({
		  placeholder: '',
		  tabsize: 2,
		  height: 300,
		  toolbar: [
		    ['style', ['style']],
		  	['fontname', ['fontname']],
        ['fontsize', ['fontsize']],
		    ['font', ['bold', 'underline', 'clear']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['table', ['table']],
		    ['view', ['fullscreen', 'codeview', 'help']]
		  ],
		  fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	      fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
 	
	$(function() {
		$('#edit').on('click', function() {
			$(".notModifyMode").css("display", "none");
			$(".ModifyMode").css("display", "block");
			// 입력란 활성화
			$('.form-control').removeAttr('disabled');
			$('.form-control').removeClass('boardTitle');
// 			CKEDITOR.instances['lntcCon'].setReadOnly(false);
			$('#summernote').summernote('code', '${data.lntcConDisplay}');
			$("#frm").attr("action", "/professorLecture/lecNotUpdatePost?lntcCd=${data.lntcCd }");
		})
		
		
		$("#delete").on('click', function() {
			if(!confirm("공지사항을 삭제 하시겠습니까?")) {
				alert("삭제가 취소되었습니다.");
				return false;
			}
			
			$("#frm").attr("action","/professorLecture/lecNotDeletePost?lntcCd=${data.lntcCd }");
			
			$("#frm").submit();
			
		})
		
	})
</script>





