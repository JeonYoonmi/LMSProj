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
		min-height: 780px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		margin-bottom: 150px;
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
	
	#taskScore {
		width: 25%;
		display: inline-block;
		margin-right: 5px;
	}
</style>

<div class="row">
	<div class="col-12">
		<div class="card" style="padding-bottom: 30px;">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-12">
						<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">

						<h4 style="margin-bottom: 15px;">과목 과제</h4>
						<form method="post" action="/professorLecture/lecTaskInsertPost" enctype="multipart/form-data">
							<div class="alert alert-light" role="alert" style="font-size: 0.9em;border: 1px solid #eee;">
	                           	<strong>과제 관련 파일</strong>을 업로드할 수 있습니다.<br>
								아래의 서식에 따라 제목과 파일, 마감 시간을 선택해주십시오.<br>
								점수 부여는 <strong>5점부터 20점까지</strong> 가능합니다.<br>
								파일 업로드는 <strong>단일 파일</strong>만 가능합니다.<br>
								다중 파일을 첨부할 경우, 압축하여 첨부해주십시오.
	                        </div>
							<input type="hidden" name="lecCd" value="${data.lecCd }"/>
							
							<table class="table mb-0">
								<tr>
									<th style="width: 15%;background: #f8f8f8;">제목</th>
									<td style="width: 85%;">
										<input type="text" name="taskNm" 
										class="form-control" maxlength="50" data-toggle="maxlength" minlength="1" required	data-placement="top" placeholder="제목을 입력하세요" />
									</td>
								</tr>
								<tr>
									<th style="width: 15%;background: #f8f8f8;"><label for="simpleinput" class="form-label" >마감일</label></th>
									<td style="width: 85%;">
										<input type="datetime-local" name="taskEt" id="EndDate" class="form-control" style="width:50%;" required/>
									</td>
								</tr>
								<tr>
									<th style="width: 15%;background: #f8f8f8;"><label for="simpleinput" class="form-label" >과제 점수 부여</label></th>
									<td style="width: 85%;">
										<input type="number" name="taskScore" id="taskScore" class="form-control" min="5" max="20" step="5" placeholder="최소 할당 점수는 5점입니다." required/>점
									</td>
								</tr>
								<tr>
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
								<tr style="border-bottom: 1px solid #eef2f7;">
									<th style="width: 15%;background: #f8f8f8;">내용</th>
									<td style="width: 85%;">
										<textarea name="taskCon" id="summernote" minlength="1" required></textarea>
									</td>
								</tr>
							</table>
						
							<div class="btnWrapper">
								<button type="submit" class="btn btn-primary btn-sm">등록</button>
								<a href="/professorLecture/lecTaskList?lecCd=${data.lecCd }" class="btn btn-light btn-sm">목록</a>
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
	
	$(function () {

		// 현재 시간과 비교하여 이전 날짜 선택 불가
		let EndDate = document.getElementById('EndDate');
// 		let dateEnd = document.getElementById('quizEndDate');
		let date = new Date(new Date().getTime() - new Date().getTimezoneOffset()*60000).toISOString().slice(0,-8);
		EndDate.value = date;
		EndDate.setAttribute("min",date);
// 		dateEnd.value = dateStart.value;
// 		dateEnd.setAttribute("min",dateStart.value);
		

		$('#EndDate').change(function() {
            if(EndDate.value < date) {
                alert('현재 시간보다 이전의 시간은 설정할 수 없습니다.');
                EndDate.value = date;
            }
// 			dateEnd.value = dateStart.value;
// 			dateEnd.setAttribute("min",dateStart.value);
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