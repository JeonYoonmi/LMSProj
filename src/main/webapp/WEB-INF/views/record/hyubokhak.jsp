<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/suwon.css">
<style>
	#grid{
		display: inline-block;
		float: left;
	}
	
/* 	#hyubokhakRound{ */
/* 		width : 97%; */
/* 		margin-left : auto; */
/* 		margin-right : auto; */
/* 	} */
/* 	#hyubokhakCon{ */
/* 		width : 100%; */
/* 		min-width : 1200px; */
/* 		max-width : 1400px; */
/* 		margin : 0 auto; */
/* 		margin-bottom :100px; */
/* 	} */
	.hyubokhakDetail{
		background-color: #f4f7fd;
		border: 1px solid #999;
	}
	
	tr{
		min-width:100%;
		height: 49px;
	}
	
	th{
		min-width: 150px;
		text-align: right;
		padding: 3px;
		background:#f4f7fd;
	}
	
	td{
		min-width: 160px;
		padding: 3px;
		background: white;
	}
	
	.btns{
 		float: right;
 		width: 123px;
 		padding: 10px 0;
	}
	
/* 	.detailDiv{ */
/* 		float: right; */
/* 		box-sizing: border-box; */
/* 	} */
	
	input[type="text"]{
		width: 100%;
		border: 1px solid #dedede;
	    height: 100%;
		
	}
	
	textarea{
		border: 1px solid #dedede;
	}
	
	#recNrsn{
		resize: none;
	}
		
/* 	#headL, #headD{ */
/* 		display : inline-block; */
/* 		margin-left : 2%; */
/* 	} */
/* 	#headL{ */
/* 		width: 620px; */
/* 	} */
	
/* 	#headD{ */
/* 		margin-left: 90px; */
/* 	} */
	
	.addFontColorRed {
		color: rgb(225, 39, 64);
	}
	
	.addFontColorBlue {
		color : blue;
	}
	
	#leftDiv{
		width: 49%;
		display: inline-block;
	}
	
	#rightDiv{
		width : 49%;
		float: right;
	}
</style>
<script type="text/javascript" defer="defer">
	function start(){
		$.ajax({
			url : "/recordApproval/getHyubokhakRecord",
			type : 'post',
			dataType : 'JSON',
			success : function(result) {
				console.log(result);
				$('#spancnt').text(parseInt(result.length).toLocaleString('ko-KR'));

				var data = [];
				
				$.each(result, function(i, v){
					var temp = {};
					$.each(Object.keys(v), function(i1, v1){
						if(v1 != 'memberVO'){
							temp[v1] = v[v1];
						}
					});
					$.each(v.memberVO, function(i1, v1){
						temp[i1] = v.memberVO[i1];
					});
					$.each(v.memberVO.studentVO, function(i1, v1){
						temp[i1] = v.memberVO.studentVO[i1];
					});
					
					data.push(temp);
				});
				
				$('#grid').empty();
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : data,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 600,
					bodyHeight: 250,
					columns : [
						{header : '학적 신청 코드', name : 'recCd', align : 'center' , hidden : "true"},
						{header : '신청 년도/학기', name : 'recYrnsem', filter : 'select', width : 150, align : 'center'},
						{header : '신청일자', name : 'recDt', filter : 'select', width : 150, align : 'center'},
						{header : '학번', name : 'stuCd', filter : 'select', width : 90, align : 'center'},
						{header : '성명', name : 'memNm', filter : 'select', width : 90, align : 'center'},
						{header : '신청구분', name : 'comdNm', filter : 'select', width : 90, align : 'center'},
						{header : '승인구분', name : 'trecTn', filter : 'select', align : 'center'},
					],
					rowHeaders: ['rowNum'],
					columnOptions: { resizable: true }
				});
				
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1){
					if(v1.trecTn == "승인"){
						grid.addCellClassName(v1.rowKey, 'trecTn', "addFontColorBlue");
					}else if(v1.trecTn == "반려"){
						grid.addCellClassName(v1.rowKey, 'trecTn', "addFontColorRed");
					}
				});
				
				 grid.on('click', function(object){
					 $('#recNrsn').val("");
					 $('#recNrsn').attr('readonly', false);
					 
//                   console.log(grid.getRow(object.rowKey)[object.columnName]);
	                 var recCd = grid.getRow(object.rowKey).recCd;
	                 console.log(recCd);
	                 
					$.ajax({
						url : "/recordApproval/recordDetail",
						data : { "recCd" : recCd },
						type : 'post',
						success : function(result) {
							console.log(JSON.stringify(result));
							$('#no').val(grid.getRow(object.rowKey)._attributes.rowNum);
							$('#recCd').val(recCd);
							$('#comdNm').val(result.comdNm);
							$('#recRsn').val(result.recRsn);
							$('#trecTn').val(result.trecTn);
							if(result.trecTn == "승인"){
								$('#recNrsn').attr('readonly', true);
							}
							$('#recYrnsem').val(result.recYrnsem);
							$('#endExpect').val(result.endExpect);
							$('#recDts').val(result.recDts);
							$('#depNm').val(result.memberVO.studentVO.departmentVO.depNm);
							$('#stuYr').val(result.memberVO.studentVO.stuYr);
							$('#first').val(result.memberVO.first);
							$('#stuSem').val(result.memberVO.studentVO.stuSem + "학기");
							$('#memCd').val(result.memberVO.memCd);
							$('#memNm').val(result.memberVO.memNm);
							$('#birth').val(result.memberVO.birth);
							$('#memTel').val(result.memberVO.memTel);
							if(result.recNrsn){
								$('#recNrsn').val(result.recNrsn);
								$('#recNrsn').attr('readonly', true);
							}
							$('#Y').attr('disabled', false);
							$('#N').attr('disabled', false);
						},
						dataType : 'json'
					});
           		});
				
			}
		});
	}
	
	$(function(){
		//로딩중 화면 띄우기
		loadingWithMask();
		
		start();
		
		closeLoadingWithMask();
		
		$('#Y').on('click', function(){
			if($('#trecTn').val() != "승인대기"){
				alert("이미 승인 또는 반려를 하신 내역입니다.");
				return false;
			}
			if($('#recNrsn').val()){
				alert("승인 시에는 반려사유를 기입할 수 없습니다.");
			}else{
				$.ajax({
					url : "/recordApproval/updateY",
					data : { 
								"recCd" : $('#recCd').val(), 
								"stuCd" : $('#memCd').val() 
							},
					type : 'post',
					success : function(result) {
						console.log(JSON.stringify(result));
						$('#trecTn').val("승인");
						$('#recNrsn').attr('readonly', true);
						start();
					},
					dataType : 'json'
				});
			}
		});
		
		$('#N').on('click', function(){
			if(!($('#recNrsn').val())){
				alert("반려사유를 기입해야 반려하실 수 있습니다.");
			}else{
				$.ajax({
					url : "/recordApproval/updateN",
					data : { 
								"recCd" : $('#recCd').val(), 
								"recNrsn" : $('#recNrsn').val(), 
								"stuCd" : $('#memCd').val() 
							},
					type : 'post',
					success : function(result) {
						console.log(JSON.stringify(result));
						$('#trecTn').val("승인");
						$('#recNrsn').attr('readonly', true);
						start();
					},
					dataType : 'json'
				});
			}
		});
		
	});
</script>
<div id="hyubokhakRound">
	<div id="hyubokhakCon">
		<div>
		   <i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 학생관리 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">휴복학관리</span>
		</div>
		<br><br>
		<div id="leftDiv">
		<p id="headL"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;휴/복학 신청목록<span style="float: right;">[총 <span id="spancnt" style="color: #001353; font-weight: bold;"></span>건]</span></p>
		<div id="grid" style="width: 100%;"></div>
		</div>
		<div id="rightDiv">
		<p id="headD"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;휴/복학신청 상세정보</p>
		<div class="detailDiv">
			<input type="hidden" id="recCd">
			<table class="hyubokhakDetail" style="width: 100%; height: 600px;">
				<tr>
					<th>NO</th>
					<td><input type="text" id="no" readonly></td>
					<th>승인구분</th>
					<td><input type="text" id="trecTn" readonly></td>
				</tr>
				<tr>
					<th>신청구분</th>
					<td><input type="text" id="comdNm" readonly></td>
					<th>사유</th>
					<td><input type="text" id="recRsn" readonly></td>
				</tr>
				<tr>
					<th>휴·복학 신청 년도/학기</th>
					<td><input type="text" id="recYrnsem" readonly></td>
					<th>휴·복학 종료 년도/학기</th>
					<td><input type="text" id="endExpect" readonly></td>
				</tr>
				<tr>
					<th>신청 일시</th>
					<td><input type="text" id="recDts" readonly></td>
					<th></th>
					<td></td>
				</tr>
				<tr>
					<th>소속</th>
					<td><input type="text" id="depNm" readonly></td>
					<th>학년</th>
					<td><input type="text" id="stuYr" readonly></td>
				</tr>
				<tr>
					<th>입학정보(입학날짜)</th>
					<td><input type="text" id="first" readonly></td>
					<th>재학학기수</th>
					<td><input type="text" id="stuSem" readonly></td>
				</tr>
				<tr>
					<th>학번</th>
					<td><input type="text" id="memCd" readonly></td>
					<th>성명</th>
					<td><input type="text" id="memNm" readonly></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" id="birth" readonly></td>
					<th>연락처</th>
					<td><input type="text" id="memTel" readonly></td>
				</tr>
				<tr>
					<th>반려 사유</th>
					<td colspan="3"><textarea rows="5" cols="70" id="recNrsn" maxlength="100" style="width: 100%; height: 100%;"></textarea></td>
				</tr>
			</table>
			</div>
			<div class="btns">
				<button type="button" class="btn btn-primary" id="Y" disabled>승인</button>
				<button type="button" class="btn btn-secondary" id="N" disabled>반려</button>
			</div>
		</div>
	</div>
</div>