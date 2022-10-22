<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style>
	.lecDeshBoardWrapper {
		width: 100%;
		padding: 0 10%;
		min-height: 50vh;
	}

	.deshboardcolor {
		height: 150px;
/* 		background: #e0e0e0; */
	}
	
	.dashBoardWrap {
		margin: 50px 0;
		width: 100%;
		min-height: 500px;
		
	}
	
	#left {
		float : left;
		margin: 1% 4%;
	}
	
	.card {
		width: 100%;
		min-width: 270px;
		box-shadow: 0px 4px 5px rgb(0 0 0 / 10%);
	}
	
	.cardTop {
		width: 100%;
		max-width: 1400px;
		min-width: 900px;
		margin: 0 auto;
	}
	
	.card-body {
		width: 100%;
		padding: 1.5em;
	}
	
	.getlecaYr, .lecaSemAjax {
		width: 100px !important;
	}
</style>

   <%
      Date date = new Date();
      SimpleDateFormat year = new SimpleDateFormat("yyyy");
      String getYear = year.format(date);
      
      SimpleDateFormat month = new SimpleDateFormat("MM");
      int getMonth = Integer.parseInt(month.format(date));
      
      int sem;
      
      if(getMonth >= 2 && getMonth <= 8) {
    	  sem = 1; 
      }else {
    	  sem = 2;
      }
      
   %>
   <c:set var="year" value="<%= getYear %>" />
   <c:set var="sem" value="<%= sem %>" />

<div class="lecDeshBoardWrapper">

	<div class="cardTop card">
		<div class="card-body">
			<div id="bodyWrapper">
				<form class="form-inline" action="/professorLecture/list" method="get">
				    <div class="form-group mx-sm-3">
				        <label for="status-select" class="mr-2">년도</label>
				        <select class="custom-select onChange getlecaYr" name="year">
				        	<option value="${year }" <c:if test="${(map.year == '') || year == map.year }">selected</c:if>>${year }</option>
				        </select>
				    </div>
				    <div class="form-group mx-sm-3">
				        <label for="status-select" class="mr-2">학기</label>
				        <select class="custom-select lecaSemAjax" name="sem">
				        		<option value="1" <c:if test="${(sem == 1 && map.sem == '') || map.sem == 1}"> selected </c:if> >1</option>
				        		<option value="2" <c:if test="${(sem == 2 && map.sem == '') || map.sem == 2}"> selected </c:if> >2</option>
				        </select>
				    </div>
				<button type="submit" class="btn btn-primary btn-sm">조회</button>
				</form> 
			</div>
		</div>
	</div>

<%-- 	<input type="hidden" value="${lecture[0].proCd }" class="getProCd"/> --%>

	<!-- 학기별 개설 강의 조회 끝-->
	<!-- 강의 대시보드 -->
	<div class="dashBoardWrap">
	<c:forEach var="lecApplyVO" items="${lecture}">
		<div class="col-sm-6 col-lg-3" id="left">
			<div class="card">
				<div class="deshboardcolor"></div>
				<div class="card-body">
					<h5 class="card-title">
						<a
							href="/professorLecture/lecApply?lecCd=${lecApplyVO.lecCd }"
							class="stretched-link">${lecApplyVO.lecaNm}</a>
					</h5>
					<p class="card-text">${lecApplyVO.lecaYr }년&nbsp;${lecApplyVO.lecaSem }학기</p>
				</div>
				<!-- end card-body -->
			</div>
			<!-- end card -->
		</div>
	</c:forEach>
	</div>
	<!-- 강의 대시보드 -->
</div>

<script type="text/javascript" defer="defer">

//랜덤 색상 생성	
var color = [ '#74779d', '#eb7a86', '#6ebbb5', '#739083', '#d5154e', '#b8c5bd', '#c03a52', '#61a59d', '#fe8567', '#9f859a', '#a46a65', '#91b40a', '#cfbac8', '#8fabbc',
           '#e85226', '#534280', '#c39adb', '#462c72', '#8c4f8f', '#4d4140', '#de4d53', '#e5bff2', '#b080a3', '#98034f', '#869ad5' ,'#509120' ,'#219fae' ,'#2385b0',
           '#e8d478', '#70a0cb', '#ffb84e', '#2b7bc4', '#537614', '#81bb61', '#cbb65c', '#76a3d1', '#2a7260', '#a1a980', '#9d9669', '#fd6856', '#701f1c', '#e2558f',
           '#f67039', '#bc551a', '#b7414b', '#bb928a', '#d57570', '#1f7ea2', '#2a62c7', '#a7c37e' , '#aca297'];


	$(function() {
		
		$('.deshboardcolor').each(function() {
			 var ran = Math.floor(Math.random() * (49 + 1));
			 
			$(this).css("background", color[ran] );	}) 
		

		$.ajax({
				url : "/professorLecture/getLecaYr",
				type : 'post',
				dataType : 'json',
				error : function(xhr) {
					alert("상태 : " + xhr.status);
				},
				success : function(data) {
					code="";
			         $.each(data, function(i, v){

			        	 console.log("--- " + v.lecaYr)
			        	 
			        	 if(${year} != v.lecaYr) {
			        		 if('${map.year}' == ''){
			        			 code += '<option value="'+ v.lecaYr +'">'+ v.lecaYr +'</option>';
			        		 }else{
				        		if(v.lecaYr == '${map.year}') {
					            	code += '<option value="'+ v.lecaYr +'" selected>'+ v.lecaYr +'</option>';
				        		}else {
					            	code += '<option value="'+ v.lecaYr +'">'+ v.lecaYr +'</option>';
				        		}
			        		 }
			        	 }
			        	 
			         }) 
			         
			         $('.getlecaYr option:gt(0)').remove();
			         
			         $('.getlecaYr').append(code);
// 			         $('.getlecaYr').trigger('change');
				}
			})
// 		});
		
		
		
		
// 		$('.onChange').change(function() {
			
// 			let lecaYr = $('.onChange').val();
// 			console.log("lecaYr : " + lecaYr);
// 			let proCd = $('.getProCd').val();
// 			console.log("proCd : " + proCd);
			
			
// 			let data = {
// 							"lecaYr" : lecaYr,
// 							"proCd" : proCd
// 						};
			
// 			$.ajax({
// 				url : "/professorLecture/getLecaSem",
// 				contentType : "application/json;charset=utf-8;",
// 				data : JSON.stringify(data),
// 				type : "post",
// 				success : function(data) {
// 					console.log("data : " + JSON.stringify(data));
					
// 					var	str = "";
					
// 					$.each(data, function(i2, v2) {
// 						if(${sem} != v2.lecaSem) {
// 				            str += '<option value="'+ v2.lecaSem +'" class="select">'+ v2.lecaSem +'</option>';
// 						}
// 					})
					
// 					$('.lecaSemAjax option:gt(0)').remove();
// 					$('.lecaSemAjax').append(str);
					
					
					
// 				},
// 				error : function(xhr) {
// 					alert("상태" + xhr.status);
// 				},
// 				dataType : "json"
// 			})
			
// 		})
	})
</script>