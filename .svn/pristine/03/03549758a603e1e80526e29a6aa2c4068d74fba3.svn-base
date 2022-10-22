<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
.dragAndDropDiv {
	border: 2px dashed #92AAB0;
	width: 1500px;
	height: 100px;
	color: #92AAB0;
	text-align: center;
	vertical-align: middle;
	padding: 10px 0px 10px 10px;
	font-size: 130%;
	display: table-cell;
}

.progressBar {
	width: 200px;
	height: 22px;
	border: 1px solid #ddd;
	border-radius: 5px;
	overflow: hidden;
	display: inline-block;
	margin: 0px 10px 5px 5px;
	vertical-align: top;
}

.progressBar div {
	height: 100%;
	color: #fff;
	text-align: right;
	line-height: 22px;
	/* same as #progressBar height if we want text middle aligned */
	width: 0;
	background-color: #0ba1b5;
	border-radius: 3px;
}

.statusbar {
	min-height: 25px;
	width: 99%;
	padding: 10px 10px 0px 10px;
	vertical-align: top;
	border-bottom: 1px solid #A9CCD1;
}

.statusbar:nth-child(odd) {
	background: #EBEFF0;
}

.filename {
	display: inline-block;
	vertical-align: top;
	width: 500px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.filesize {
	display: inline-block;
	vertical-align: top;
	color: #30693D;
	width: 100px;
	margin-left: 10px;
	margin-right: 5px;
}

.abort {
	background-color: #A8352F;
	-moz-border-radius: 4px;
	-webkit-border-radius: 4px;
	border-radius: 4px;
	display: inline-block;
	color: #fff;
	font-family: arial;
	font-size: 13px;
	font-weight: normal;
	padding: 4px 15px;
	cursor: pointer;
	vertical-align: top
}

#fileList {
	overflow: auto;
	height: 150px;
	background: #eee;
}

.btnWrapper {
    margin : 15px 5px;
    background : red;
    float : right;
 }
#ntcListBtn{
	float : left;
	position : relative;
	top : 15px;
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
</style>
<script type="text/javascript" defer="defer">
	$(document).ready(function() {
// 		Drag&Drop Files Here or Browse Files 영역
		var objDragAndDrop = $(".dragAndDropDiv");
		// 그 영역에 들어간 파일객체들
		var files;
		
		var cnt = 0;
		
		<c:if test="${ not empty noticeVO.ntcFileVOList }">
			<c:forEach var="ntcFileVO" items="${ noticeVO.ntcFileVOList }">
				var status = new createStatusbar();
				status.filename.html('${ fn:substring(ntcFileVO.attachVO.attachNm, fn:indexOf(ntcFileVO.attachVO.attachNm, '_') + 1, fn:length(ntcFileVO.attachVO.attachNm)) }');
				status.setProgress(100);
			</c:forEach>
		</c:if>
		
		$(document).on("dragenter", ".dragAndDropDiv",
				function(e) {
					e.stopPropagation();
					e.preventDefault();
					$(this).css('border', '2px solid #0B85A1');
				});
		$(document).on("dragover", ".dragAndDropDiv",
				function(e) {
					e.stopPropagation();
					e.preventDefault();
				});
		$(document).on("drop", ".dragAndDropDiv", function(e) {

			$(this).css('border', '2px dotted #0B85A1');
			e.preventDefault();
			files = e.originalEvent.dataTransfer.files;

			handleFileUpload(files, objDragAndDrop);
		});

		$(document).on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		$(document).on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			objDragAndDrop.css('border', '2px dotted #0B85A1');
		});
		$(document).on('drop', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});
		//drag 영역 클릭시 파일 선택창
		objDragAndDrop.on('click', function(e) {
			$('input[type=file]').trigger('click');
		});

		$('input[type=file]').on('change', function(e) {
			var files = e.originalEvent.target.files;
			handleFileUpload(files, objDragAndDrop);
		});

		function handleFileUpload(files, obj) {
			for (var i = 0; i < files.length; i++) {
				var fd = new FormData();
				fd.append('file', files[i]);

				var status = new createStatusbar(obj); //Using this we can set progress.
				status.setFileNameSize(files[i].name, files[i].size);
				//ing
				//sendFiletoServer(파일객체1개, 프로그래스바)
				sendFileToServer(fd, status);

			}
		}
		
		var rowCount = 0;
		function createStatusbar(obj) {

			rowCount++;
			var row = "odd";
			if (rowCount % 2 == 0)
				row = "even";
			this.statusbar = $("<div class='statusbar "+row+"'></div>");
			this.filename = $("<div class='filename'></div>").appendTo(this.statusbar);
			this.size = $("<div class='filesize'></div>").appendTo(this.statusbar);
			this.progressBar = $("<div class='progressBar'><div></div></div>").appendTo(this.statusbar);
			this.abort = $("<div class='abort'>중지</div>").appendTo(this.statusbar);

			$('#fileList').append(this.statusbar);
			// obj.after(this.statusbar);

			this.setFileNameSize = function(name, size) {
				var sizeStr = "";
				var sizeKB = size / 1024;
				if (parseInt(sizeKB) > 1024) {
					var sizeMB = sizeKB / 1024;
					sizeStr = sizeMB.toFixed(2) + " MB";
				} else {
					sizeStr = sizeKB.toFixed(2) + " KB";
				}

				this.filename.html(name);
				this.size.html(sizeStr);
			}

			this.setProgress = function(progress) {
				var progressBarWidth = progress
						* this.progressBar.width() / 100;
				this.progressBar.find('div').animate({
					width : progressBarWidth
				}, 10).html(progress + "% ");
				if (parseInt(progress) >= 100) {
					this.abort.hide();
				}
			}

			this.setAbort = function(jqxhr) {
				var sb = this.statusbar;
				this.abort.click(function() {
					jqxhr.abort();
					sb.hide();
				});
			}
		}

		function sendFileToServer(formData, status) {
			var uploadURL = "/mail/sendFile"; //Upload URL
			var extraData = {}; //Extra Data.
			var jqXHR = $.ajax({
				xhr : function() {
					var xhrobj = $.ajaxSettings.xhr();
					if (xhrobj.upload) {
							xhrobj.upload.addEventListener('progress', function(event) {
							var percent = 0;
							var position = event.loaded || event.position;
							var total = event.total;
							if (event.lengthComputable) {
									percent = Math.ceil(position / total * 100);
							}
								//Set progress
								status.setProgress(percent);
							}, false);
					}
					return xhrobj;
				},
				url : uploadURL,
				type : "POST",
				contentType : false,
				processData : false,
				cache : false,
				data : formData,
				success : function(result) {
					status.setProgress(100);
					//$("#status1").append("File upload Done<br>");           
					
					//data : attachVO의 attachCd 값을 리턴
					var code = '<input type="hidden" name="ntcFileVOList[' + cnt + '].attachCd" value="' + result + '">';
					cnt++;
					console.log(result);
					$('.ntcForm').append(code);
				},
				 dataType : "json"
			});
			status.setAbort(jqXHR);
		}
		
	});
</script>
</head>
<body>
	<div class="row">
   <div class="col-12">
      <div class="card" style="padding-bottom: 30px;">
         <div class="card-body">
            <div class="row">
               <div class="col-lg-12">
                  <div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">
	
	                 <h3>공지사항</h3>
	                  <form action="/notice/ntcWriteInsert" class="ntcForm" method="post">
	                  	<c:if test="${ not empty noticeVO }">
		                  	<input type="hidden" name="ntcCd" value="${ noticeVO.ntcCd }">
	                  	</c:if>
	                     <table class="table mb-0">
	                        <tr>
	                           <th style="width: 15%;background: #f8f8f8;">제목</th>
	                           <td style="width: 85%;">
	                              <input type="text" name="ntcTtl" value="${ noticeVO.ntcTtl }"
	                              class="form-control" maxlength="50" data-toggle="maxlength" data-placement="top" placeholder="제목을 입력하세요"  minlength="5" maxlength="100" required />
	                           </td>
	                        </tr>
	                        <tr>
	                           <th style="width: 15%;background: #f8f8f8;">고정여부</th>
	                           <td style="width: 85%;">
	                           		<c:if test="${ empty noticeVO }">
		                           		<input id="hot" name="ntcHot" type="radio" value="1" />
		                           		<label for="hot">고정</label>&emsp;
		                           		<input id="nothot" name="ntcHot" type="radio" value="0" checked />
		                           		<label for="nothot">비고정</label>
	                           		</c:if>
	                           		<c:if test="${ not empty noticeVO }">
		                           		<input id="hot" name="ntcHot" type="radio" value="1" <c:if test="${ noticeVO.ntcHot == 1 }">checked</c:if> />
		                           		<label for="hot">고정</label>&emsp;
		                           		<input id="nothot" name="ntcHot" type="radio" value="0" <c:if test="${ noticeVO.ntcHot == 0 }">checked</c:if> />
		                           		<label for="nothot">비고정</label>
	                           		</c:if>
	                           </td>
	                        </tr>
	                        <tr>
	                           <th style="width: 15%;background: #f8f8f8;">카테고리</th>
	                           <td style="width: 85%;">
	                           		<c:if test="${ empty noticeVO }">
		                           		<input id="N101" name="ntcCate" type="radio" value="N101" checked />
		                           		<label for="N101">학사</label>&emsp;
		                           		<input id="N102" name="ntcCate" type="radio" value="N102" />
		                           		<label for="N102">장학</label>&emsp;
		                           		<input id="N103" name="ntcCate" type="radio" value="N103" />
		                           		<label for="N103">행사</label>
	                           		</c:if>
	                           		<c:if test="${ not empty noticeVO }">
		                           		<input id="N101" name="ntcCate" type="radio" value="N101" <c:if test="${ noticeVO.ntcCate == '학사' }">checked</c:if> />
		                           		<label for="N101">학사</label>&emsp;
		                           		<input id="N102" name="ntcCate" type="radio" value="N102" <c:if test="${ noticeVO.ntcCate == '장학' }">checked</c:if> />
		                           		<label for="N102">장학</label>&emsp;
		                           		<input id="N103" name="ntcCate" type="radio" value="N103" <c:if test="${ noticeVO.ntcCate == '행사' }">checked</c:if> />
		                           		<label for="N103">행사</label>
	                           		</c:if>
	                           </td>
	                        </tr>
	                        <tr style="border-bottom: 1px solid #eef2f7;">
	                           <th style="width: 15%;background: #f8f8f8;">첨부파일</th>
	                           <td style="width: 85%;">
		                           	<div id="fileUpload" class="dragAndDropDiv">
										<i class="mdi mdi-clipboard-file-outline"></i>&emsp;마우스로 파일을 끌어오세요.
									</div>
									<div id="fileList"></div>
									<input type="file" name="fileUpload" id="fileUpload"
										style="display: none;" multiple />
	                           </td>
	                        </tr>
	                        <tr style="border-bottom: 1px solid #eef2f7;">
	                           <th style="width: 15%;background: #f8f8f8;">내용</th>
	                           <td style="width: 85%;">
	                           		<textarea id="summernote" class="ntcCon" name="ntcCon"></textarea>
	                           </td>
	                        </tr>
	                     </table>
	                     
	                     <div id="ntcListBtn"><a href="/notice/ntcList" class="btn btn-light btn-sm">목록</a></div>
	                     <div class="btnWrapper">
	                     	<c:if test="${ empty noticeVO }">
	                        	<button type="submit" id="sendBtn" class="btn btn-primary btn-sm">등록</button>
	                        </c:if>
	                     	<c:if test="${ not empty noticeVO }">
	                        	<button type="button" id="editBtn" class="btn btn-primary btn-sm">수정</button>
	                        </c:if>
	                     </div>
	                  </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
	<!-- end .mt-4 -->
	<!-- end row-->
	<script type="text/javascript" defer="defer">
		$(function(){
			$('#editBtn').on('click', function(){
				$('.ntcForm').attr("action", "/notice/updateNtc");
				$('.ntcForm').submit();
			});
			
				console.log($('.ntcCon').val());
			
		});
	
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
		
		$('#summernote').summernote('code', '${ noticeVO.ntcConDisplay }');
		
    </script>
</body>
</html>