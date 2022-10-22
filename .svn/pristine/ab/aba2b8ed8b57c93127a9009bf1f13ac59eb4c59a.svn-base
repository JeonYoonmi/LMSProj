<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<style type="text/css">
.addFontColorRed {
	color: rgb(225, 39, 64);
}
.addFontColorBlue {
	color : blue;
}
.inText{
	background: white;
	border : 1px solid lightgray;
	width: 100%;
}
#stuInfoTable th{
	width : 150px;
	text-align: center;
	background: #f5faff;
}
#stuInfoTable{
	border : 1px solid lightgray;
	height: 140px;
	width: 99%;
}
#stuInfoTable td{
	padding: 3px;
}
#schHistoryTable{
	width : 100%;
	height: 140px;
	border : 1px solid lightgray;
}
#schHistoryTable th{
	height: 35px;
    text-align: center;
    background: #f5faff;
}
#schHistoryTable td{
	background: white;
}
#schHistoryTable td:hover {
/*    	color: #6c757d; */
   	background-color: #f1f3fa;
}
.schTd{
	text-align: center;
}
.approvalBut{
	width: 60px;
    height: 30px;
}
.trHeight{
	height: 26px;
}
#schHistoryTable td{
	padding-left: 7px;
}
.textRight{
	text-align: right;
	padding-right: 7px;
}
.textCenter{
	text-align: center;
}
</style>
<script type="text/javascript" defer="defer">
window.onload = function(){
	//체크박스에 체크한 장학생 신청 코드 넣을 배열
	var schCode = new Array();
	//체크박스에 체크한 장학생 신청자 코드 넣을 배열
	var proCd = new Array();
	//체크박스에 체크한 데이터 넣을 배열
	var checkData = [];
	var uncheckData = new Array();
	//체크박스에 체크한 교수 코드 데이터 넣을 배열
	var checkProData = [];
	
	//전체 리스트 가져오기
	$.ajax({
		url : "/approval/mgrSchApprovalList",
		type : 'POST',
		dataType : 'JSON',
		success : function(result) {
			console.log(result);
			$('#cntSpan').text(result.length);
			
			const gridData = [];
			(function(){
				for(let i=0; i<result.length; i += 1){
					gridData.push({
						lecaRsn: ((i + 3) % 7) * 60
					})
				}
			})();
			
			grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : result,
				scrollX : true,
				scrollY : true,
				minBodyHeight : 400,
				bodyHeight: 250,
				columns : [
					{header : '결재문서유형', filter : 'select', name : 'lecaGrade', width : 150, align : 'center'},
					{header : '기안자 소속', filter : 'select', name : 'lecaNote', width : 170, align : 'center'},
					{header : '기안자명', name : 'lecaNm', width : 100, align : 'center'},
					{header : '신청일자', filter : 'select', name : 'lecaDt', width : 180, align : 'center'},
					{header : '지급금액(원)', filter : 'select', name : 'lecaRsn', width : 150, align : 'center'},
					{header : '검토자 소속', filter : 'select', name : 'lecaBook', width : 170, align : 'center'},
					{header : '검토자명', name : 'lecaRoom', width : 100, align : 'center'},
					{header : '결재일자', filter : 'select', name : 'lecaAdt', width : 180, align : 'center'},
					{header : '승인여부', name : 'lecaCon', align : 'center'},
					{header : '장학생코드', name : 'lecaCd', hidden : 'true'},
					{header : '교수코드', name : 'proCd', hidden : 'true'}
					
				],
				rowHeaders: ['rowNum', 'checkbox'],
				columnOptions: {
			        resizable: true
				}
			});
			
			var ynCheck = grid.findRows({
				lecaCon : '승인'
			});
			
			ynCheck2 = grid.findRows({
				lecaCon : '반려'
			});
			
			$.each(ynCheck, function(i, v){
				grid.disableRowCheck(v.rowKey);
			})
			
			$.each(ynCheck2, function(i, v){
				grid.disableRowCheck(v.rowKey);
			})
			
			//승인 - 그대로, 승인완료 - 파랑, 반려 - 빨강
			var dataSet = grid.getData();
			$.each(dataSet, function(i1, v1) {
				if(v1.lecaCon == '승인') {
					grid.addCellClassName(v1.rowKey, 'lecaCon', "addFontColorBlue");
				}else if(v1.lecaCon == '반려') {
					grid.addCellClassName(v1.rowKey, 'lecaCon', "addFontColorRed");
				}
			});
			
			//해당 열 선택될 때마다
			grid.on('click', function(object){
				console.log("=========================")
				console.log(grid.getRow(object.rowKey));
				
				var code = grid.getRow(object.rowKey).lecaCd;
				var cdData = {"sclhCd" : code};
				var stuCd = 0;
				
				if(object.columnName == 'lecaGrade' || object.columnName == 'lecaNote' || object.columnName == 'lecaNm' ||
						object.columnName == 'lecaDt' || object.columnName == 'lecaRsn' || object.columnName == 'lecaBook' || object.columnName == 'lecaRoom' ||
						object.columnName == 'lecaAdt' ||object.columnName == 'lecaCon'){
					//학생기초정보 띄우기
					$.ajax({
						url : "/approval/stuInfo",
						data : JSON.stringify(cdData),
						type : 'POST',
						dataType : 'JSON',
						contentType : 'application/json;charset=utf-8',
						success : function(result) {
							console.log(result);
							$('#colNm').val("");
							$('#depNm').val("");
							$('#proNm').val("");
							$('#stuNm').val("");
							$('#stuRecord').val("");
							$('#stuSem').val("");
							$('#stuYr').val("");
							$('#stuCd').val("");
							
							
							$('#colNm').val(result.COL_NM);
							$('#depNm').val(result.DEP_NM);
							$('#proNm').val(result.PRO_NM);
							$('#stuNm').val(result.STU_NM);
							$('#stuRecord').val(result.STU_RECORD);
							$('#stuSem').val(result.STU_SEM + "학기");
							$('#stuYr').val(result.STU_YR + "학년");
							$('#stuCd').val(result.STU_CD);
							
							stuCd = $('#stuCd').val();
							var stuData = {"stuCd" : stuCd};
							
							//학생 장학내역 불러오기
							$('#stuSchHistory').empty();
							
							$.ajax({
								url : "/approval/stuSchHistory",
								data : JSON.stringify(stuData),
								type : 'POST',
								dataType : 'JSON',
								contentType : 'application/json;charset=utf-8',
								success : function(result) {
									console.log(result);
									$('#historyCnt').text(result.length);
									
									var str = '';
									str += '<table border="1" id="schHistoryTable">';
									str += '<tr>';
									str += '	<th>장학금 구분</th>';
									str += '	<th>년도</th>';
									str += '	<th>학기</th>';
									str += '	<th>장학 금액</th>';
									str += '</tr>';
									if(result.length == 0){
										str += '<tr class="schTd">';
										str += '	<td colspan="4">해당 학생의 장학내역이 존재하지 않습니다.</td>';
										str += '</tr>';
									}else if(result.length == 1){
										$.each(result, function(i, v){
											str += '<tr class="trHeight">';
											str += '	<td class="textCenter">' + v.SCL_NM + '</td>';
											str += '	<td class="textCenter">' + v.SCLH_DT + "년도" +'</td>';
											str += '	<td class="textCenter">' + v.SCLH_SEM + "학기" +'</td>';
											str += '	<td class="textRight">' + v.SCLH_AMT + "원" +'</td>';
											str += '</tr>';
										});
											str += '<tr class="trHeight"><td></td><td></td><td></td><td></td></tr>';
											str += '<tr class="trHeight"><td></td><td></td><td></td><td></td></tr>';
											str += '<tr class="trHeight"><td></td><td></td><td></td><td></td></tr>';
											
									}else if(result.length == 2){
										$.each(result, function(i, v){
											str += '<tr class="trHeight">';
											str += '	<td class="textCenter">' + v.SCL_NM + '</td>';
											str += '	<td class="textCenter">' + v.SCLH_DT + "년도" +'</td>';
											str += '	<td class="textCenter">' + v.SCLH_SEM + "학기" +'</td>';
											str += '	<td class="textRight">' + v.SCLH_AMT + "원" +'</td>';
											str += '</tr>';
										});
											str += '<tr class="trHeight"><td></td><td></td><td></td><td></td></tr>';
											str += '<tr class="trHeight"><td></td><td></td><td></td><td></td></tr>';
	
									}else if(result.length == 3){
										$.each(result, function(i, v){
											str += '<tr class="trHeight">';
											str += '	<td class="textCenter">' + v.SCL_NM + '</td>';
											str += '	<td class="textCenter">' + v.SCLH_DT + "년도" +'</td>';
											str += '	<td class="textCenter">' + v.SCLH_SEM + "학기" +'</td>';
											str += '	<td class="textRight">' + v.SCLH_AMT + "원" +'</td>';
											str += '</tr>';
										});
											str += '<tr class="trHeight"><td></td><td></td><td></td><td></td></tr>';
										
									}
									$('#stuSchHistory').append(str);
									
								}
							})
						}
					})
				}

				
			})
	
			var dataSet = grid.getData();
			$.each(dataSet, function(i1, v1) {
				if(grid.getValue(v1.rowKey, "lecaAdt") == null) {
					grid.setValue(v1.rowKey, "lecaAdt", "-", false);
				}
			});


			grid.on('check', function(object){
				checkData = [];
				checkProData = [];
// 				console.log(JSON.stringify(grid.getCheckedRows(object)));
				for(var i=0; i<grid.getCheckedRows(object).length; i++){
					var data = {"lecaCd" : grid.getCheckedRows(object)[i].lecaCd, "lecaCon" : grid.getCheckedRows(object)[0].lecaCon};
					var proData = grid.getCheckedRows(object)[i].proCd;
					checkData.push(data);
					checkProData.push(proData)
				}
				console.log(JSON.stringify(checkData));
				
			})
			
			grid.on('uncheck', function(object){
				checkData = [];
// 				console.log(JSON.stringify(grid.getCheckedRows(object)));
				for(var i=0; i<grid.getCheckedRows(object).length; i++){
					var data = {"lecaCd" : grid.getCheckedRows(object)[i].lecaCd, "lecaCon" : grid.getCheckedRows(object)[0].lecaCon}
					checkData.push(data);
					
					var proData = grid.getCheckedRows(object)[i].proCd;
					checkData.push(data);
					checkProData.push(proData)
				}
				console.log(JSON.stringify(checkData));
			})

			//승인 버튼을 눌렀을 경우
			$('#okBtn').on('click', function(){
				for(var i=0; i<checkData.length; i++){
					if(checkData[i].lecaCon == "승인" || checkData[i].lecaCon == "반려"){
						alert("이미 처리된 결재입니다.");
						return false;
					}else if(checkData[i].lecaCon == "승인대기"){
						for(var i=0; i<checkData.length; i++){
							schCode[i] = checkData[i].lecaCd;
							proCd[i] = checkProData[i];
						}
						console.log(schCode);
						console.log(proCd);
						schData = {"sclhCd" : schCode,
									"proCd" : proCd};
		 				$.ajax({
		 					url : '/approval/schApprovalPost',
		 		 			type : 'post',
		 		 			data : JSON.stringify(schData),
		 		 			dataType : 'JSON',
		 		 			contentType : 'application/json;charset=utf-8',
		 		 			success : function(result){
		 		 				console.log(result);
				 				
		 		 				if(result > 0){
		 		 					alert("정상적으로 처리되었습니다.");
		 		 					document.location.href= document.location.href;
		 		 				}
		 		 			}
		 				})
					}
				}
				

			})
			
			//반려버튼을 눌렀을 경우
			$('#noBtn').on('click', function(){
				for(var i=0; i<checkData.length; i++){
					if(checkData[i].lecaCon == "승인" || checkData[i].lecaCon == "반려"){
						alert("이미 처리된 결재입니다.");
						return false;
					}
				}
			})
			
			}
			

	});
	
}
</script>
</head>
<body>
<div>
	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 결재 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">교수장학생 결재</span>
</div>
<br><br>
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;교수장학금 결재</p>
<button type="button" id="okBtn" class="btn btn-secondary approvalBut"><p style="margin-top: -3px;">승인</p></button>
<button type="button" id="noBtn" data-toggle="modal" data-target="#compose-modal" class="btn btn-secondary approvalBut"><p style="margin-top: -3px;">반려</p></button>
<p style="float: right; margin-right: 6px;">[총 <span style="color : #001353; font-weight: bold;" id="cntSpan"></span>건]</p>
<div id="grid"></div>
<br>
<div style="float: left; width: 49%;">
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;학생 기초정보</p>
<table border="1" id="stuInfoTable">
<tr>
	<th>단과대</th>
	<td><input class="inText" type="text" disabled id="colNm"></td>
	<th>학과</th>
	<td><input class="inText" type="text" disabled id="depNm"></td>
</tr>
<tr>
	<th>학번</th>
	<td><input class="inText" type="text" disabled id="stuCd"></td>
	<th>성명</th>
	<td><input class="inText" type="text" disabled id="stuNm"></td>
</tr>
<tr>
	<th>학년</th>
	<td><input class="inText" type="text" disabled id="stuYr"></td>
	<th>재학학기수</th>
	<td><input class="inText" type="text" disabled id="stuSem"></td>
</tr>
<tr>
	<th>학적</th>
	<td><input class="inText" type="text" disabled id="stuRecord"></td>
	<th>담당교수</th>
	<td><input class="inText" type="text" disabled id="proNm"></td>
</tr>
</table>
</div>
<div style="float: left; margin-left: 30px; width: 49%;" >
<p style="width: 50%; display: inline-block;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;학생 장학내역</p>
<p style="float: right; margin-right: 6px;">[총 <span style="color : #001353; font-weight: bold;" id="historyCnt">0</span>건]</p>
<div id="stuSchHistory">
<table border="1" id="schHistoryTable">
<tr>
	<th>장학금 구분</th>
	<th>년도</th>
	<th>학기</th>
	<th>장학 금액</th>
</tr>
<tr id="colspanTr">
	<td id="colspanTd0" class="schTd"></td>
	<td id="colspanTd1" class="schTd"></td>
	<td id="colspanTd2" class="schTd"></td>
	<td id="colspanTd3" class="schTd"></td>
</tr>
</table>
</div>

<!-- Compose Modal -->
<div id="compose-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="compose-header-modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header modal-colored-header bg-primary">
                <h4 class="modal-title" id="compose-header-modalLabel">반려사유</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body p-3">
                <form class="p-1">
                    <div class="form-group mb-2">
                        <label for="msgto">To</label>
                        <input type="text" id="msgto" class="form-control">
                    </div>
                    <div class="form-group mb-2">
                        <label for="mailsubject">Subject</label>
                        <input type="text" id="mailsubject" class="form-control" placeholder="your subject">
                    </div>
                    <div class="form-group write-mdg-box mb-3">
                        <label>Message</label>
                        <textarea id="simplemde1" rows="4" cols="53"></textarea>
                    </div>
                    <div hidden="hidden" id="mgrCdHidden"></div>
                    <div hidden="hidden" id="lecApplyHidden"></div>

                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="saveRsn"><i class="mdi mdi-send mr-1"></i>저장</button>
                    <button type="button" class="btn btn-light" data-dismiss="modal">Cancel</button>
                </form>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>


</body>
</html>