<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.hrwid {
	/*    width: 174%; */
	clear: both;
}

.boardTitleWrap {
	border-top: 2px solid #112a63;
	/*    width: 174%; */
}

#cnslTtl {
	text-align: center;
	margin: 30px 0;
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
 	background : #2a5388;
 	border : #2a5388;
 	box-shadow : #2a5388;
 }
.btn-primary:hover{
 	background : #4671af;
 	border : #4671af;
 	box-shadow : #4671af;
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

</style>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script type="text/javascript" defer="defer">
function fn_preInsert(){
var str = "<p>네 당연히 가능합니다. 다음주에 제 학과실로 찾아와서 추천서를 받아가시기 바랍니다.</p>"; 
$('.note-editable').html(str);
}

$(function(){
	
	$('#updateDiv').hide();
	
	var cate = $('select[name=cnslCateUpdate]').attr('id');
	$('select[name=cnslCateUpdate]').val(cate);
	var cnslRpl = $('textarea[name=cnslRpl]').val();
	var reply = $('#reply').val();
	console.log(reply);
	

	
	$('#update').on('click', function() {
	      var result = confirm("내용 수정을 완료하시겠습니까?");
	      if (result) {
	    	  
	    	 var cnslCate = $('select[name=cnslCateUpdate]').val();
	         var cnslCon = $('textarea[name=cnslCon]').val();
	         var cnslTtl = $('input[name=cnslTtlUpdate]').val();
	         var cnslCd = $('textarea[name=cnslCon]').attr('id');
	         
	         console.log(cnslCate);
	         console.log(cnslCon);
	         console.log(cnslTtl);
	         console.log(cnslCd);
	         
	         if (cnslCon != "<p><br></p>" && cnslCon !="") {

	            $.ajax({
	               url : "/counsel/modify",
	               type : "POST",
	               data : {
	                  "cnslCd" : cnslCd,
	                  "cnslCon" : cnslCon,
	                  "cnslTtl" : cnslTtl,
	                  "cnslCate" : cnslCate
	               },
	               dataType : "text",
	               success : function(data) {
	                  alert("내용수정이 완료되었습니다.");
	                  location.reload();
	               }
	            })

	         } else {
	            alert("빈 항목이 존재합니다. 글을 기입해주세요.")
	         }
	         }
	      })
	      
	      $('#updateDisplay').on('click',function(){
	    	  $('.hideDiv').hide();
	    	  $('#updateDiv').show();
	      })

	
	
})

function deleteFunc(){
	var cnslCd = $('textarea[name=cnslCon]').attr('id');
	var result = confirm("정말로 삭제하시겠습니까?");
	if(result){
        $.ajax({
            url : "/counsel/delete",
            type : "POST",
            data : {
               "cnslCd" : cnslCd,
            },
            dataType : "json",
            success : function(data) {
            	console.log(data);
            	if(data>0){
               		alert("게시글이 성공적으로 삭제되었습니다.");
               		location.href='/counsel/stuCounsel';
            	}
            }
         })
	}
}

function rplSave(){
	var cnslRpl = $('textarea[name=cnslRpl]').val();
	if(cnslRpl == ""){
		alert("답변을 작성해주세요.")
	}else{
		 var result = confirm("답변작성을 완료하시겠습니까?");
	      if (result) {
	    	  
	    	  var cnslCd = $('textarea[name=cnslCon]').attr('id');
	    	  console.log(cnslCd, cnslRpl);
	    	  
	    	  var stuCd = $('#stuCd').val();
	    	  console.log("stuCd" + stuCd);

	            $.ajax({
	               url : "/counsel/reply",
	               type : "POST",
	               data : {
	            	  "stuCd" : stuCd,
	                  "cnslCd" : cnslCd,
	                  "cnslRpl" : cnslRpl
	               },
	               dataType : "text",
	               success : function(data) {
	                  alert("답변을 작성하였습니다.");
	                  location.reload();
	               }
	            })
	   }
	}
}
</script>
</head>
<body>
<input type="hidden" id="stuCd" value="${detail.stuCd}">
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 상담 <i class="dripicons-chevron-right"></i>
<span style="font-weight: bold;">상담신청및이력</span>
</div>
<br><br>
<div class="row hideDiv">
	<div class="col-12">
		<div class="card"
			style="padding-bottom: 30px; min-height: 600px; position: relative;">
			<div class="card-body">
				<div>
					<div>
						<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">
							<h3>상담</h3>
							<div class="mb-3 boardTitleWrap">
								<h5 id="cnslTtl" style="text-align:left; margin-left:20px;">${detail.cnslTtl}</h5>
								<input type="text" name="cnslTtl" style="display: none;"
									value="${detail.cnslTtl}" id="cnslTtl"
									class="form-control boardTitle" maxlength="50" required
									data-toggle="maxlength" data-placement="top" />
							</div>

							<hr class="hrwid">

							<div style="float : right;">
								<p class="afterEvent">작성자&emsp;${detail.memNm }</p>
								<p class="afterEvent">
									등록일&emsp;
									<fmt:formatDate value="${detail.cnslReg }"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</p>
								<p class="afterEvent">카테고리&emsp;${detail.comdNm }</p>
							</div>

							<hr class="hrwid">
							
							<div class="underMargin">
								<div  style="min-height: 300px;"  class="mt-4 notModifyMode">
								<p>${detail.cnslConDisplay }</p>
								</div>
							</div>

							<c:if test="${not empty detail.cnslRpl}">
							<div class="row hideDiv">
								<div class="col-12">
											<div>
													<div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">
														<h3>답변</h3>
														<div class="mb-3 boardTitleWrap">
														</div>
														
														<div style="float : right;">
															<p class="afterEvent">작성자&emsp;${detail.proNm }</p>
															<p class="afterEvent">
																등록일&emsp;
																<fmt:formatDate value="${detail.cnslDt }"
																	pattern="yyyy-MM-dd HH:mm:ss" />
															</p>
															<p class="afterEvent">카테고리&emsp;${detail.comdNm }</p>
														</div>
															
														<hr class="hrwid">
															
														
															<div style="min-height: 300px;" class="mt-4 notModifyMode">
															<p>${detail.cnslRplDisplay }</p>
															</div>
															
													</div>
												</div>
										</div>
							</div>
							
							<div class="hideDiv">
								<c:choose>
									<c:when test="${not empty stuCd}">
								<a href="/counsel/stuCounsel" class="btn btn-light btn-sm">목록</a>
									</c:when>
									<c:when test="${not empty proCd}">
								<a href="/counsel/proCounsel" class="btn btn-light  btn-sm">목록</a>
									</c:when>
								</c:choose>
							</div>
							</c:if>

						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</div>


<c:if test="${empty detail.cnslRpl && not empty stuCd}">
<div class="hideDiv" >
		<div style="float:left">
		<a href="/counsel/stuCounsel" class="btn btn-light btn-sm">목록</a>
		</div>
		<div style="float:right">
		<button type="button" class="btn btn-primary btn-sm" id="updateDisplay" >수정</button>
		<button type="button" id="delete" class="btn btn-primary btn-sm" onclick="deleteFunc()" >삭제</button>
		</div>
</div>
</c:if>



<div class="row" id="updateDiv">
   <div class="col-12">
      <div class="card" style="padding-bottom: 30px;">
         <div class="card-body">
            <div class="row">
               <div class="col-lg-12">
                  <div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">
	                  <h4 style="margin-bottom: 15px;">상담신청</h4>
	                     <table class="table mb-0">
	                        <tr>
	                           <th style="width: 15%;background: #f8f8f8;">제목</th>
	                           <td style="width: 85%;">
	                              <input type="text" name="cnslTtlUpdate" value="${detail.cnslTtl }"
	                              class="form-control" maxlength="50" data-toggle="maxlength"   data-placement="top"/>
	                           </td>
	                        </tr>
	                        <tr>
	                           <th style="width: 15%;background: #f8f8f8;">카테고리</th>
	                           <td style="width: 85%;">
	                           		  <select style="width: 15%;" class="custom-select ntcCateLeft" id="${detail.cnslCate }"name="cnslCateUpdate">
			                            	<c:forEach var="item" items="${cate}">
			                            		<option value="${item.comdCd}">${item.comdNm}</option>
			                            	</c:forEach>
			                            </select>
	                           </td>
	                        </tr>
	                        <tr style="border-bottom: 1px solid #eef2f7;">
	                           <th style="width: 15%;background: #f8f8f8;">내용</th>
	                           <td style="width: 85%;">
	                           		<textarea id="${detail.cnslCd}" class="summernote" name="cnslCon">${detail.cnslConDisplay }</textarea>
	                           </td>
	                        </tr>
	                     </table>
						 <br>
	                     <div>
		                     <div style="float:left">
								<a href="/counsel/stuCounsel" class="btn btn-light btn-sm">목록</a>
							 </div>
							 <div style="float:right">
								<button type="submit" id="update" class="btn btn-primary btn-sm">수정</button>
							 </div>
	                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<c:if test="${not empty proCd && empty detail.cnslRpl}">
<div class="row">
	<div class="col-md-12">
	        <textarea class="summernote" name="cnslRpl" id="cnslRpl"></textarea>
	</div>
</div>
<br>
<div>
	<div style="float:left">
	<a href="/counsel/proCounsel" class="btn btn-light btn-sm">목록</a>
	</div>
	<div style="float:right">
	<button type="button"  class="btn btn-secondary btn-sm" onclick="fn_preInsert()">데이터채우기</button>
	<button type="button"  class="btn btn-primary btn-sm" onclick="rplSave()">답변</button>
	</div>
</div>
</c:if>

<script type="text/javascript" defer="defer">
$('.summernote').summernote({
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
</body>
</html>