<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="/resources/css/suwon.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
	
	/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.card {
		min-height: 530px;
		width: 100%;
		padding: 2%;
		border-radius: 10px;
		max-width: 1400px;
		min-width: 1090px;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0;
		margin: 0 auto;
		padding-bottom: 150px;
	}
	
	.card-body {
		width: 100%;
	}
	
	/* 기본 틀 잡기 끝 */
	
	.btnWrapper {
		margin : 15px 5px;
	}
	
	.btnWrapper button {
		float: right;
	}
	
</style>

<div class="row">
	<div class="col-12">
		<div class="card" style="padding-bottom: 30px;">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">

						<h4 style="margin-bottom: 15px;">Q&#38;A</h4>
						<form method="post" action="/studentLecture/lecQnaWritePost">
						
							<input type="hidden" name="lecCd" value="${data.lecCd }"/>
					
							<!-- 작성자 세션 처리 완-->
							<c:set var="session" value="${sessionScope.memSession.memCd}" />
							<c:choose>
								<c:when test="${empty session }">
									<input type="hidden" name="stuCd" value="20182696" />
								</c:when>
								<c:when test="${not empty session }">
									<input type="hidden" name="stuCd" value="${session }" />
								</c:when>
							</c:choose>
							
							<table class="table mb-0">
								<tr style="border-top: 2px solid #112a63;">
									<th style="width: 15%;background: #f8f8f8;">제목</th>
									<td style="width: 85%;">
										<input type="text" name="lqnaTtl" 
										class="form-control" maxlength="50" minlength="1" required data-toggle="maxlength"	data-placement="top" placeholder="제목을 입력하세요" />
									</td>
								</tr>
								<tr style="border-bottom: 1px solid #eef2f7;">
									<th style="width: 15%;background: #f8f8f8;">내용</th>
									<td style="width: 85%;">
										<textarea name="lqnaCon" id="summernote" minlength="1" required></textarea>
									</td>
								</tr>
							</table>
						
							<div class="btnWrapper">
								<button type="submit" class="btn btn-primary btn-sm">등록</button>
								<a href="/studentLecture/lecQnaList?lecCd=${data.lecCd }" class="btn btn-light btn-sm">목록</a>
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
	
	
</script>