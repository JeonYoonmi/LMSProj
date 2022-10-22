<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
<title>write</title>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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

.realbody {
	padding: 0 2%;
}

#imsiBtn, #sendBtn {
	float: right;
	margin-left: 1%;
	padding : 8px;
}

#sendDiv {
	height: 30px;
}
#autoMaker {
	width : 97%;
	height : 150px;
	position : absolute;
	z-index : 9999;
	background : white;
	overflow : scroll;
	display : none;
}
.subBlock {
	padding : 4px;
}
.subBlock:hover {
	background-color : lightyellow;
}
</style>
<script type="text/javascript" defer="defer">
	$(document).ready(function() {
// 		Drag&Drop Files Here or Browse Files 영역
		var objDragAndDrop = $(".dragAndDropDiv");
		// 그 영역에 들어간 파일객체들
		var files;

		var cnt = 0;
		
		<c:if test="${ not empty mailVO.mailFileVOList }">
			<c:forEach var="mailFileVO" items="${ mailVO.mailFileVOList }">
				var status = new createStatusbar();
				status.filename.html('${ fn:substring(mailFileVO.attachVO.attachNm, fn:indexOf(mailFileVO.attachVO.attachNm, '_') + 1, fn:length(mailFileVO.attachVO.attachNm)) }');
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
					var code = '<input type="hidden" name="mailFileVOList[' + cnt + '].attachCd" value="' + result + '">';
					cnt++;
					console.log(result);
					$('.mailForm').append(code);
				},
				 dataType : "json"
			});
			status.setAbort(jqXHR);
		}
		
		var names; //이름 리스트 (json)
		var isCompleted = false; //autoMaker 자식이 선택되었는지의 여부
		
		//이름 리스트 불러오기
		$.ajax({
			url : "/mail/getNames",
			type : "POST",
			dataType : "JSON",
			contentType : "application/json",
			success : function(res) {
				names = res;
			}
		});
		//mlRcpml(input), autoMaker(div)
		$('#fakeName').keyup(function() {
			
			var name = $(this).val();
			
			if(name != '') {
				$('#autoMaker').children().remove();
				
				names.forEach(function(arg) {
					if(arg.memNm.indexOf(name) > -1) {
						$('#autoMaker').append(
							$('<div class="subBlock">').text(arg.memNme).attr({'key':arg.memMl})
						);
					}
				});
				
				$('#autoMaker').children().each(function(){
		            $(this).click(function(){ //클릭해서 선택한 경우
		                $('#fakeName').val($(this).text());
		                $('#autoMaker').children().remove();	
		                $('#mlRcpml').val($(this).attr('key'));
		                isComplete = true;
		                
		                $('#autoMaker').css("display", "none"); //autoMaker를 사라지게 함
		            });
		        });
			}else {
				$('#autoMaker').children().remove();
			}
		});
		
		//과목 카테고리 입력이 시작되면
		$('#fakeName').keydown(function(event) {
			$('#autoMaker').css("display", "block"); //autoMaker를 보이게 함
			
			if(isComplete) {  //autoMaker 자식이 선택 되었으면 초기화
		        $('#insert_target').val('');
		    }
		});
		
		// 메일 작성하는 곳에서 커서가 벗어났을 때
		$('body').on('click', function(){
			$('#autoMaker').css("display", "none");
 		});
		
// 		$('#fakeName').blur(function(){
// 			$('#autoMaker').css("display", "none");
// 		});

	});

	function fn_imsi(){
		alert("메일 임시저장");
		
		$('#frm').attr("action", "/mail/drafts");
		$('#frm').submit();
	}
	
	function fn_imsiA(){
		alert("임시저장한 메일 다시 임시저장");
		
		$('#frm').attr("action", "/mail/imsiMailDrafts");
		$('#frm').submit();
	}
	
	function fn_imsiSend(){
		$('#frm').attr("action", "/mail/imsiSendMail");
		$('#frm').submit();
	}
</script>
</head>
<body>
<div style="width: 100%;background:#fff;padding:2%;border-top: 2px solid #001353;
    border-radius: 10px;">
	<div style="width: 100%; min-width: 1200px; max-width: 1575px; margin: 0 auto;background: #fff; padding: 2%;
    width: 100%;">
		<form action="/mail/sendMail" id="frm" method="post">
			<div class="mt-3 realbody">
				<div class="card-body mailForm">
					<div class="col-12">
						<img>
						<c:if test="${ not empty mailVO }">
							<input type="hidden" name="mlCd" value="${ mailVO.mlCd }">
						</c:if>
						<div id="sendDiv">
							<c:if test="${ empty mailVO }">
								<button type="submit" id="sendBtn" class="btn btn-secondary btn-sm">전송</button>
								<button type="button" id="imsiBtn" class="btn btn-secondary btn-sm" onclick="fn_imsi()">임시저장</button>
							</c:if>
							<c:if test="${ not empty mailVO }">
								<button type="button" id="sendBtn" class="btn btn-secondary btn-sm" onclick="fn_imsiSend()">전송</button>
								<button type="button" id="imsiBtn" class="btn btn-secondary btn-sm" onclick="fn_imsiA()">임시저장</button>
							</c:if>
						</div>
						<hr>
						<div class="form-group row mb-1">
							<label class="col-md-1 col-form-label" for="mlRcpml"> 받는사람
							</label>
							<div class="col-md-11">
								<input type="text" id="fakeName" class="form-control" placeholder="Name" value="${ memInfo.memNme }"  minlength="0" required>
								<input type="text" id="mlRcpml" name="mlRcpml" class="form-control" placeholder="Name"
									<c:if test="${ not empty memInfo }">
										value="${ memInfo.memMl }"
									</c:if>
									style="display:none;">
								<div id="autoMaker"></div>
							</div>
						</div>
						<div class="form-group row mb-1">
							<label class="col-md-1 col-form-label" for="title"> 제목 </label>
							<div class="col-md-11">
								<input type="text" id="title" name="mlTtl" class="form-control"
									placeholder="Title" value="${ mailVO.mlTtl }" minlength="5" maxlength="33" required>
							</div>
						</div>
					</div>
	
					<div id="fileUpload" class="dragAndDropDiv">
						<i class="mdi mdi-clipboard-file-outline"></i>&emsp;마우스로 파일을 끌어오세요.
					</div>
					<div id="fileList"></div>
					<input type="file" name="fileUpload" id="fileUpload"
						style="display: none;" multiple />
					<textarea id="summernote" name="mlCon"></textarea>
				</div>
			</div>
		</form>
	</div>
</div>
	<!-- end .mt-4 -->
	<!-- end row-->
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
	
		$('#summernote').summernote('code', '${ mailVO.mlCon }');
    </script>
</body>
</html>