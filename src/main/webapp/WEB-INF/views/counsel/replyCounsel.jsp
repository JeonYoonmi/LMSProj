<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" defer="defer">
$(function(){
	
	
	var cnslRpl = $('textarea[name=cnslRpl]').val();

	if(cnslRpl ==""){
		
		$('textarea[name=cnslRpl]').attr('disabled',false);
	}else{
		$('textarea[name=cnslRpl]').attr('disabled',true);
		$('#save').hide();
	}
	
	
	$('#save').on('click', function() {
	      var result = confirm("답변작성을 완료하시겠습니까?");
	      if (result) {
	    	  
	    	  var cnslCd = $('textarea[name=cnslRpl]').attr('id');
	    	  console.log(cnslCd);

	         var cnslRpl = $('textarea[name=cnslRpl]').val();
	         if (cnslRpl != "") {

	            $.ajax({
	               url : "/counsel/reply",
	               type : "POST",
	               data : {
	                  "cnslCd" : cnslCd,
	                  "cnslRpl" : cnslRpl
	               },
	               dataType : "text",
	               success : function(data) {
	                  alert("답변을 작성하였습니다.");
	                  location.href='/counsel/proCounsel';
	               }
	            })

	         } else {
	            alert("답변을 작성하지 않았습니다.")
	         }
	         }
	      })

	
	
})
</script>
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 상담 <i class="dripicons-chevron-right"></i>
<span style="font-weight: bold;">상담요청현황 및 이력</span>
</div>
<br><br>


<!-- Billing Content-->
<div class="tab-pane show active" id="d1">
    <div class="row">
        <div class="col-lg-8">
            <form>
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="billing-first-name" class="form-label">카테고리</label>
                            <input class="form-control" type="text" value="${detail.cnslCate }" readonly="readonly">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="mb-3">
                            <label for="billing-last-name" class="form-label">이름</label>
                            <input class="form-control" type="text" value="${detail.memNm}" readonly="readonly">
                        </div>
                    </div>
                    <div class="col-md-12">
                            <label for="billing-last-name" class="form-label">제목</label>
                            <input class="form-control" type="text" value="${detail.cnslTtl }" readonly="readonly">
                    </div>
                    <div class="col-md-12">
                    		<label for="billing-last-name" class="form-label">내용</label>
                    	<textarea class="form-control" rows="5" readonly="readonly">${detail.cnslConDisplay }</textarea>
                    </div>
                    <div class="col-md-12">
                    		<label for="billing-last-name" class="form-label">답변</label>
                    	<textarea class="form-control" rows="5" name="cnslRpl" id="${detail.cnslCd }">${detail.cnslRplDisplay }</textarea>
                    </div>
                </div> <!-- end row -->
   			</form>
		</div>
	</div>
	<button type="button" class="btn btn-primary" onclick="location.href='/counsel/proCounsel'">목록</button>
	<button type="button" class="btn btn-primary" id='save'>작성</button>
</div>
</body>
</html>