<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<style type="text/css">
#detailView{
    display: inline-block;
    width: 100%;
}
.inputDiv{
    width: 95%;
    height: 30px;
    border: 0.5px solid #aaa;
    margin: 2px;
    background: #f4f4f4;
}
.detailTh{
    width: 100px;
    text-align: right;
    padding: 8px;
    background: #f4f7fd;
}
#detailTable {
	border : 1px solid lightgray;
	width : 100%;
}
#etcContent{
	width : 100%;
}
.detailTd{
	background: white;
}

#etcContent{
	background: white;
	width: 100%;
	padding: 10px; 
	border : 1px solid lightgray;
}
#etcContent tr{
	height : 35px;
}

#etcContent th{
	background: #dcdcdc;
}
#etcContent tbody tr:hover {
   	color: #6c757d;
   	background-color: #f1f3fa;
   }
#cntP{
	width: 10%;
    float: right;
    text-align: right;
}
#yearOption, #semisterOption{
	display : inline-block;
	width : 300px;
}
#yearOption p, #semisterOption p{
	display : inline-block;
	float : left;
	text-align : center;
	height : 100%;
	width : 100px;
	margin-top : 10px;
}
#yearOption select, #semisterOption select{
	display : inline-block;
	float : right;
	width : 200px;
}
#searchBtn{
	position : relative;
	bottom : 25px;
	left : 15px;
}
#etcDiv{
	border: 0.5px solid #aaa;
    background: #f4f4f4;
    height : 350px;
}
#optionRound{
		border: 1px solid #001353;
		padding: 10px;
		background: #F3F8FF;
		width: 100%;
		min-width: 1200px;
		max-width: 1700px;
		margin: 0 auto;
		border-radius : 10px;
		height : 62px;
}
</style>
<script type="text/javascript" defer="defer">
$(function(){
	var proCd = $('#proCdDiv').text();
	var year = 0;
	var sem = 0;
	
	year = $('#year option:selected').val();
	sem = $('#sem option:selected').val();
	
	firstData = {"proCd" : proCd,
				"lecaYr" : year,
				"lecaSem" : sem};

	//처음 수강강의 보여주기
	$.ajax({
		url : "/lecEval/postProLecList",
		type : 'POST',
		data : JSON.stringify(firstData),
		contentType : 'application/json;charset=utf-8',
		dataType : 'JSON',
		success : function(result) {
			console.log(result);
			
			var cnt = result.length;
			
			$('#cntSpan').text(cnt);
			
			grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : result,
				scrollX : true,
				scrollY : true,
				minBodyHeight : 500,
				bodyHeight: 250,
				columns : [
					{header : '학수번호', name : 'subCd', filter : 'select', width : 110, align : 'center'},
					{header : '과목명', name : 'lecaNm', filter : 'select', width : 170, align : 'center'},
					{header : '담당교수', name : 'lecaCate', filter : 'select', width : 110, align : 'center'},
					{header : '평가점수', name : 'lecaRoom', align : 'center'}
				],
				rowHeaders: ['rowNum'],
				columnOptions: {
			        resizable: true
				}

			});
			//해당 grid row를 선택했을 경우
			grid.on('click', function(object){
				console.log(grid.getRow(object.rowKey));
				var lecCd = grid.getRow(object.rowKey).lecCd;
				var jsonLecCd = {"lecCd" : lecCd}
				
				if(grid.getRow(object.rowKey).lecaRoom == '-'){
					alert("아직 평가되지 않았습니다.");
					
					//기타의견 css 바꾸기
					var etcDiv = document.getElementById('etcDiv');
					etcDiv.style.backgroundColor = '#f4f4f4';
					
					//기타의견 없애기
					$('#etcDiv').empty();
					
					//상세정보 div 없애기
						$('#subCd').text("");
						$('#lecaCate').text("");
						$('#lecaNm').text("");
						$('#depNm').text("");
						$('#colNm').text("");
						$('#memNm').text("");
						$('#stuLecNum').text("");
						$('#stuEvalNum').text("");
				}else{
					$('#etcDiv').empty();
					$.ajax({
						url : "/lecEval/proLecEvalDetail",
						data : JSON.stringify(jsonLecCd),
						type : 'POST',
						contentType : 'application/json;charset=utf-8',
						dataType : 'JSON',
						success : function(result){
							console.log(result);
							//상세정보 div 채우기
	 						$('#subCd').text(result.SUBCD);
	 						$('#lecaCate').text(result.LECACATE);
	 						$('#lecaNm').text(result.LECANM);
	 						$('#depNm').text(result.DEPNM);
	 						$('#colNm').text(result.COLNM);
	 						$('#memNm').text(result.MEMNM);
	 						$('#stuLecNum').text(result.STULECNUM);
	 						$('#stuEvalNum').text(result.STUEVALNUM);
	 						
	 						var min = parseInt(result.STULECNUM);
	 						var max = parseInt(result.STUEVALNUM);
	 						var percent = (min / max) * 100;
	 						$('#percent').text(percent + " %");
	 						
	 						$.ajax({
	 							url : "/lecEval/selectEctList",
	 							data : JSON.stringify(jsonLecCd),
	 							type : 'POST',
	 							contentType : 'application/json;charset=utf-8',
	 							dataType : 'JSON',
	 							success : function(result){
	 								console.log(result);
	 								
	 								//기타의견 css 바꾸기
	 								var etcDiv = document.getElementById('etcDiv');
	 								etcDiv.style.backgroundColor = 'white';
	 								
	 								var str = '';
		 								str += '<table border = "1" id="etcContent">';
		 								str += '<tr>                                ';
		 								str += '<th style="width: 10%;">No</th> ';
		 								str += '<th>의견내용</th>                   ';
		 								str += '</tr>                               ';
	 								$.each(result, function(i, v){
		 								str += '<tr>                                ';
		 								str += '<td>'+v.evlScore+'</td>                           ';
		 								str += '<td>'+v.evlEtc+'</td>                           ';
		 								str += '</tr>                               ';
	 								})
		 								str += '</table>                            ';


	 								$('#etcDiv').append(str);
	 							}
	 						})
						}
					})
					

				}
			})
		}
	});
	
	
	$('#searchBtn').on('click', function(){
		$('#grid').empty();
		year = $('#year option:selected').val();
		sem = $('#sem option:selected').val();
		var data = {"lecaYr" : year,
					"lecaSem" : sem,
					"proCd" : proCd}
		//교수 수강강의 리스트 가져오기
		$.ajax({
			url : "/lecEval/postProLecList",
			data : JSON.stringify(data),
			type : 'POST',
			contentType : 'application/json;charset=utf-8',
			dataType : 'JSON',
			success : function(result) {
				console.log(result);
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : result,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 500,
					bodyHeight: 250,
					columns : [
						{header : '학수번호', name : 'subCd', filter : 'select', width : 110, align : 'center'},
						{header : '과목명', name : 'lecaNm', filter : 'select', width : 170, align : 'center'},
						{header : '담당교수', name : 'lecaCate', filter : 'select', width : 110, align : 'center'},
						{header : '평가점수', name : 'lecaRoom', align : 'center'}
					],
					rowHeaders: ['rowNum'],
					columnOptions: {
				        resizable: true
					}

				});
				
				//해당 grid row를 선택했을 경우
				grid.on('click', function(object){
					console.log(grid.getRow(object.rowKey));
					var lecCd = grid.getRow(object.rowKey).lecCd;
					var jsonLecCd = {"lecCd" : lecCd}
					
					if(grid.getRow(object.rowKey).lecaRoom == '-'){
						alert("아직 평가되지 않았습니다.");
						
						//기타의견 없애기
						$('#etcDiv').empty();
						
						//상세정보 div 없애기
 						$('#subCd').text("");
 						$('#lecaCate').text("");
 						$('#lecaNm').text("");
 						$('#depNm').text("");
 						$('#colNm').text("");
 						$('#memNm').text("");
 						$('#stuLecNum').text("");
 						$('#stuEvalNum').text("");
					}else{
						$('#etcDiv').empty();
						$.ajax({
							url : "/lecEval/proLecEvalDetail",
							data : JSON.stringify(jsonLecCd),
							type : 'POST',
							contentType : 'application/json;charset=utf-8',
							dataType : 'JSON',
							success : function(result){
								console.log(result);
								//상세정보 div 채우기
		 						$('#subCd').text(result.SUBCD);
		 						$('#lecaCate').text(result.LECACATE);
		 						$('#lecaNm').text(result.LECANM);
		 						$('#depNm').text(result.DEPNM);
		 						$('#colNm').text(result.COLNM);
		 						$('#memNm').text(result.MEMNM);
		 						$('#stuLecNum').text(result.STULECNUM);
		 						$('#stuEvalNum').text(result.STUEVALNUM);
		 						
		 						var min = parseInt(result.STULECNUM);
		 						var max = parseInt(result.STUEVALNUM);
		 						var percent = (min / max) * 100;
		 						$('#percent').text(percent + " %");
		 						
		 						$.ajax({
		 							url : "/lecEval/selectEctList",
		 							data : JSON.stringify(jsonLecCd),
		 							type : 'POST',
		 							contentType : 'application/json;charset=utf-8',
		 							dataType : 'JSON',
		 							success : function(result){
		 								console.log(result);
		 								
		 								//기타의견 css 바꾸기
		 								var etcDiv = document.getElementById('etcDiv');
		 								etcDiv.style.backgroundColor = 'white';
		 								
		 								var str = '';
			 								str += '<table border = "1" id="etcContent">';
			 								str += '<tr>                                ';
			 								str += '<th style="width: 10%;">No</th> ';
			 								str += '<th>의견내용</th>                   ';
			 								str += '</tr>                               ';
		 								$.each(result, function(i, v){
			 								str += '<tr>                                ';
			 								str += '<td>'+v.evlScore+'</td>                           ';
			 								str += '<td>'+v.evlEtc+'</td>                           ';
			 								str += '</tr>                               ';
		 								})
			 								str += '</table>                            ';


		 								$('#etcDiv').append(str);
		 							}
		 						})
							}
						})
						

					}
				})
			}
		})
	})
	

})
</script>
</head>
<body>
<div>
	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 평가 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">강의평가</span>
</div>
<br><br>
<div id="optionRound">
<div id="yearOption">
<p>년도</p>
<select class="form-control" name="year" id="year">
	<option value="2022" selected="selected">2022</option>
	<option value="2021">2021</option>
	<option value="2020">2020</option>
	<option value="2019">2019</option>
	<option value="2018">2018</option>
</select>
</div>
<div id="proCdDiv" style="display: none;">${proCd}</div>
<div id="semisterOption">
<p>학기</p>
<select class="form-control" name="sem" id="sem">
	<option value="1">1학기</option>
	<option value="2" selected="selected">2학기</option>
</select>
</div>
<button type="button" class="btn btn-secondary" id="searchBtn">조회</button>
</div>
<br><br>
<div  style="width : 39%; float: left;">
<p style="width : 28%; display: inline-block;"><i class="mdi mdi-record-circle" style="color: #001353; "></i>&ensp;수강강의</p>
<p id = "cntP">총 <span style="color : #00008C; font-weight: bold;" id="cntSpan"></span> 건</p>
<div id="grid"></div>
</div>
<div style=" width : 59%; display: inline-block; margin-left: 10px; ">
<p style="float: left; width: 130px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;상세조회</p>
<div style="clear: both;"></div>
<div id="detailView">
<table border="1" id="detailTable">
<tr>
	<th class="detailTh">대학</th>
	<td class="detailTd"><div class="inputDiv" id="colNm"></div></td>
	<th class="detailTh">학과</th>
	<td class="detailTd"><div class="inputDiv" id="depNm"></div></td>
	<th class="detailTh">담당교수명</th>
	<td class="detailTd"><div class="inputDiv" id="memNm"></div></td>
</tr>
<tr>
	<th class="detailTh">교과목명</th>
	<td class="detailTd"><div class="inputDiv" id="lecaNm"></div></td>
	<th class="detailTh">학수번호</th>
	<td class="detailTd"><div class="inputDiv" id="subCd"></div></td>
	<th class="detailTh">이수구분</th>
	<td class="detailTd"><div class="inputDiv" id="lecaCate"></div></td>
</tr>
<tr>
	<th class="detailTh">수강생수</th>
	<td class="detailTd"><div class="inputDiv" id="stuLecNum"></div></td>
	<th class="detailTh">응답자수</th>
	<td class="detailTd"><div class="inputDiv" id="stuEvalNum"></div></td>
	<th class="detailTh">응답비율</th>
	<td class="detailTd"><div class="inputDiv" id="percent"></div></td>
</tr>
</table>
</div>
<br><br>
<div>
<p style="float: left; width: 130px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;기타의견</p>
<br><br>
<div id="etcDiv">

</div>
</div>
</div>
</body>
</html>