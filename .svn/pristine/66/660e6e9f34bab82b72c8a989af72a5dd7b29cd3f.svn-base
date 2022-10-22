<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/suwon.css">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.card {
		min-height: 530px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		padding-bottom: 150px;
	}
	
	.card-body {
		width: 100%;
	}
	
	/* 기본 틀 잡기 끝 */

	.underMargin {
		margin-bottom: 10px;
	}
</style>

<div class="col-12">
	<div class="card" style="padding-bottom: 30px;">
		<div class="card-body">
			<h4 class="header-title mb-3">공지</h4>
			<form method="post" action="/professorLecture/lecNotWritePost">
				<input type="hidden" name="lecCd" value="${data.lecCd }"/>
			
				<div class="mb-3">
					<input type="text" name="lntcTtl" 
					class="form-control" minlength="1" maxlength="50" data-toggle="maxlength" required data-placement="top" placeholder="제목을 입력하세요" />
				</div>
			
				<div class="underMargin">
					<textarea id="summernote" name="lntcCon"></textarea>
				</div>
				
				<button type="submit" class="btn btn-primary btn-sm" style="float: right;">등록</button>
				<a href="/professorLecture/lecNoticeList?lecCd=${data.lecCd }" class="btn btn-light btn-sm">목록</a>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript" defer="defer">
// 	CKEDITOR.replace("lntcCon");
	
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
	
</script>