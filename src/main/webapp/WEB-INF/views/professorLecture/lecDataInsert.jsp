<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link rel="stylesheet" href="/resources/css/suwon.css">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
		padding-bottom: 150px;
	}
	
	.card-body {
		width: 100%;
	}
	
	/* 기본 틀 잡기 끝 */
	
	.btnWrapper {
		width : 100%;
		height: 34px;
		margin : 15px 0px;
	}
	.btnWrapper > button {
		float: right;
	}
	
	.btnWrapper > a {
		float: left;
	}
	
	.filebox {
		margin-top: 15px;
	}
	
	.filebox input[type="file"] {
		  position: absolute;
		  width: 1px;
		  height: 1px;
		  padding: 0;
		  margin: -1px;
		  overflow: hidden;
		  clip:rect(0,0,0,0);
		  border: 0;
	}
	
	.filebox label {
		  display: inline-block;
		  padding: .5em .75em;
		  color: #999;
		  font-size: inherit;
		  line-height: normal;
		  vertical-align: middle;
		  background-color: #fdfdfd;
		  cursor: pointer;
		  border: 1px solid #ebebeb;
		  border-bottom-color: #e2e2e2;
		  border-radius: .25em;
	}
	
	/* named upload */
	.filebox .upload-name {
		  display: inline-block;
		  padding: .5em .75em;  /* label의 패딩값과 일치 */
		  font-size: inherit;
		  font-family: inherit;
		  line-height: normal;
		  vertical-align: middle;
		  background-color: #f5f5f5;
		  border: 1px solid #ebebeb;
		  border-bottom-color: #e2e2e2;
		  border-radius: .25em;
		  -webkit-appearance: none; /* 네이티브 외형 감추기 */
		  -moz-appearance: none;
		  appearance: none;
		  margin-top: 2px;
	}
	
	.table {
		margin-bottom: 250px;
	}
	
	.titleData {
		width: 87% !important;
		display: inline-block;
	}
	
	.autoFill{
		margin-left: 25px;
	}
</style>

<div class="row">
	<div class="col-12">
		<div class="card" style="padding-bottom: 30px;">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">

						<h4 style="margin-bottom: 15px;">강의자료실</h4>
						<form method="post" action="/professorLecture/lecDataInsertPost" enctype="multipart/form-data">
							<div class="alert alert-light" role="alert" style="font-size: 0.9em;">
	                           	<strong>강좌와 관련한 파일</strong>을 업로드할 수 있습니다.<br>
								아래의 서식에 따라 제목과 파일을 선택해주십시오.<br>
								파일 업로드는 <strong>단일 파일</strong>만 가능합니다.<br>
								다중 파일을 첨부할 경우, 압축하여 첨부해주십시오.
	                        </div>
							<input type="hidden" name="lecCd" value="${data.lecCd }"/>
							
							<table class="table">
								<tr>
									<th style="width: 15%;background: #f8f8f8;">제목</th>
									<td style="width: 85%;">
										<input type="text" name="ldtTtl" 
										class="form-control titleData" minlength="1" maxlength="50" data-toggle="maxlength" required data-placement="top" placeholder="제목을 입력하세요" />
										<button type="button" class="btn btn-secondary autoFill">자동 채우기</button>
									</td>
								</tr>
								<tr style="border-bottom: 1px solid #eef2f7;">
									<th style="width: 15%;background: #f8f8f8;">첨부파일</th>
									<td style="width: 85%;">
										<div class="filebox">
											<input class="upload-name" placeholder="파일선택" disabled="disabled">
											
											<label for="ex_filename" style="cursor: pointer;margin: 2px 0 0 5px;color: #333;">파일첨부</label> 
											<input type="file" id="ex_filename" name="mpf" class="upload-hidden"> 
										</div>
										<p style="color: #999; font-size: 0.8em;margin-top: 15px;">&#8251;&nbsp;동영상 파일은 MP4,AVI등이 아닌 압축파일&#40;ZIP&#41;을 첨부해 주세요.</p>
									</td>
								</tr>
							</table>
						
							<div class="btnWrapper">
								<button type="submit" class="btn btn-primary btn-sm">등록</button>
								<a href="/professorLecture/lecDataList?lecCd=${data.lecCd }" class="btn btn-light btn-sm">목록</a>
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
	$(function () {
		
		$('.autoFill').on('click', function() {
			$('.titleData').val('[Java의 정석] 객체지향 개념(1)');
		})
		
		var fileTarget = $('.filebox .upload-hidden');
	
		  fileTarget.on('change', function(){  // 값이 변경되면
		    if(window.FileReader){  // modern browser
		      var filename = $(this)[0].files[0].name;
		    } 
		    else {  // old IE
		      var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		    }
		    
		    // 추출한 파일명 삽입
		    $(this).siblings('.upload-name').val(filename);
		  });
		  
		  
		  
		let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		let maxSize = 5242880; //5MB
			
		// 파일의 확장자, 크기 체킹
		function checkExtension(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈가 초과되었습니다..");
				// 함수 종료
				return false;
			}
			if(regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
		
		
		  
		 
	})
		  
		  
	
</script>