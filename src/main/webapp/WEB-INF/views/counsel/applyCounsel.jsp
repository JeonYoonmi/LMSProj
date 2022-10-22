<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script type="text/javascript" defer="defer">
function fn_preInsert(){
	var str = "<p>안녕하세요 교수님. 현재 3학년 재학중인 김신형입니다. 제가 휴학하는 동안 개발에 더욱 깊은 흥미가 생겨 대학원 진학을 하고자 마음먹게 되었습니다.<br>"; 
	str += " 저희 인재대학교는 대학원이 없어서 서울로 대학원을 가고자 하는데 혹시 교수님께서 추천서를 써 주실 수 있을지 문의드립니다.<br>"; 
	str += " 바쁘신 와중에도 시간 내주셔서 감사합니다. 요즘 일교차가 큽니다.감기 조심하세요.</p>"; 
	var cnslCate = $('select[name=cnslCate]').val('C104');
	$('.note-editable').html(str);
    var cnslTtl = $('input[name=cnslTtl]').val('대학원 진학 고민 상담 요청입니다.');
}
$(function() {
	$('#insert').on('click', function() {
		
   	 var cnslCate = $('select[name=cnslCate]').val();
     var cnslCon = $('.note-editable').html();
     var cnslTtl = $('input[name=cnslTtl]').val();
     
     console.log(cnslCon);
		
		if(cnslTtl==""){
			alert("제목을 입력하세요")
		}else if(cnslCon==""){
			alert("내용을 입력하세요")
		}else{
			
		
		var params = {
			'cnslTtl' : cnslTtl,
			'cnslCon' : cnslCon,
			'cnslCate' : cnslCate
		}

		$.ajax({
			url : "/counsel/stuCounselPost",
			type : "POST",
			data : params,
			dataType : "json",
			success : function(data) {
				if(data == 1)
				alert("상담 신청이 완료되었습니다.");
				location.href='/counsel/stuCounsel';
				}
			})
		}
	})
})
</script>
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 상담 <i class="dripicons-chevron-right"></i>
<span style="font-weight: bold;">상담신청및이력</span>
</div>
<br><br>
<div class="row">
   <div class="col-12">
      <div class="card" style="padding-bottom: 30px;">
         <div class="card-body">
            <div class="row">
               <div class="col-lg-12">
                  <div class="col-lg-12 mt-3 mt-lg-0 boardWrapper">
	                  <h4 style="margin-bottom: 15px; ">상담신청 </h4>
	                  
	                  <form name="insertForm" >
	                     <table class="table mb-0">
	                        <tr>
	                           <th style="width: 15%;background: #f8f8f8;">제목</th>
	                           <td style="width: 85%;">
	                              <input type="text" name="cnslTtl"
	                              class="form-control" maxlength="50" data-toggle="maxlength"   data-placement="top" placeholder="제목을 입력하세요" />
	                           </td>
	                        </tr>
	                        <tr>
	                           <th style="width: 15%;background: #f8f8f8;">카테고리</th>
	                           <td style="width: 85%;">
	                           		  <select style="width: 15%;" class="custom-select ntcCateLeft" name="cnslCate">
			                            	<c:forEach var="item" items="${cate }">
			                            		<option value="${item.comdCd}">${item.comdNm}</option>
			                            	</c:forEach>
			                            </select>
	                           </td>
	                        </tr>
	                        <tr style="border-bottom: 1px solid #eef2f7;">
	                           <th style="width: 15%;background: #f8f8f8;">내용</th>
	                           <td style="width: 85%;">
	                           		<textarea class="summernote" name="cnslCon"></textarea>
	                           </td>
	                        </tr>
	                     </table>
	                  </form>
	                  <br>
	                     <div class="btnWrapper">
	                     	<div  style="float: left">
	                        	<a href="/counsel/stuCounsel" class="btn btn-light btn-sm">목록</a>
	                        </div>
	                        <div  style="float: right">
		                        <button onclick="fn_preInsert()" class="btn btn-secondary btn-sm">데이터 채우기</button>
		                        <button type="submit" id="insert" class="btn btn-primary btn-sm">등록</button>
	                    	</div>
	                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

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