<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title></title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<style type="text/css">
.addFontColorRed {
	color: rgb(225, 39, 64);
}
.addFontColorBlue {
	color : blue;
}
#detailSearch{
	width : 100%;
	margin-top: 20px;
}
.intext{
	width : 40%;
}
.tableTh{
	text-align: right;
	padding: 20px;
}
.tableTd{
	padding: 10px;
	text-align: center;
}
</style>
</head>
<script type="text/javascript" defer="defer">
function doOpenCheck(chk){
    var obj = document.getElementsByName("aaa");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
$(function() {
	var gridData;
	var grid;
	var memCd = $('#memCdHidden').val();
	//로딩중 화면 띄우기
	
	document.getElementById('todayDate').value = new Date().toISOString().slice(0, 10);
	
	var value = 0;
	var firstData = 0;
	//지난 1개월로 처음 리스트 가져오기
	$.ajax({
			url : "/approval/dateCalFirst",
			type : "POST",
			contentType : "application/json;charset=utf-8",
			dataType : 'JSON',
			success : function(result){
				console.log(result);

				$('#inputDate').val(result.MONTH);
				
				lecaDt = $('#inputDate').val();
				lecaAdt = $('#todayDate').val();
				value= $('input:checkbox[name="aaa"]:checked').data("value");
				
				firstData = {"lecaDt" : lecaDt,
							"lecaAdt" : lecaAdt,
							"value" : value};
				console.log(firstData);
				
				$.ajax({
					url : '/approval/mgrApprovalListAgain',
					type : 'POST',
					data : JSON.stringify(firstData),
					contentType : "application/json;charset=utf-8",
					dataType : 'JSON',
					success : function(result){
						$('#grid').empty();
						$('#cntSpan').text(result.length);
						
						grid = new tui.Grid({
							el : document.getElementById('grid'),
							data : result,
							scrollX : true,
							scrollY : true,
							minBodyHeight : 500,
							bodyHeight: 250,
							columns : [
								{header : '결재문서유형', name : 'lecaBook', filter : 'select', width : 150, align : 'center'},
								{header : '기안자 소속', name : 'lecaTt', filter : 'select',width : 200, align : 'center'},
								{header : '기안자', name : 'lecaNote', filter : 'select',width : 150, align : 'center'},
								{header : '신청일자', name : 'lecaDt', filter : 'select',width : 180, align : 'center'},
								{header : '검토자 소속', name : 'lecaRoom', filter : 'select',width : 200, align : 'center'},
								{header : '검토자', name : 'lecaNm', filter : 'select',width : 150, align : 'center'},
								{header : '결재일자', name : 'lecaAdt', filter : 'select',width : 180, align : 'center'},
								{header : '승인여부', name : 'lecaCon', filter : 'select',align : 'center'}
							],
							rowHeaders: ['rowNum'],
							columnOptions: {
						        resizable: true
							}
						
						});
						
						//승인 - 그대로, 승인완료 - 파랑, 반려 - 빨강
						var dataSet = grid.getData();
						$.each(dataSet, function(i1, v1) {
							if(v1.lecaCon == '승인') {
								grid.addCellClassName(v1.rowKey, 'lecaCon', "addFontColorBlue");
							}else if(v1.lecaCon == '반려') {
								grid.addCellClassName(v1.rowKey, 'lecaCon', "addFontColorRed");
							}
						});
						
// 						var dataSet = grid.getData();
// 						$.each(dataSet, function(i1, v1) {
// 						   if(v1.lecaAdt == null) {
// 						      grid.setColumnValues('lecaAdt', '-', false);
// 						   }
// 						});
					}
				})
			}
	
	})
	
	$("#selectId").on("change", function(){
	value = $('#selectId option:selected').val();
     $.ajax({
        url : "/approval/dateCalFirst",
        type : "POST",
        contentType : "application/json;charset=utf-8",
        dataType : 'JSON',
        success : function(result){
           console.log(result);
           if(value == 'day'){
              $('#inputDate').val(result.DAY);
           }else if(value == 'week'){
              $('#inputDate').val(result.WEEK);
           }else if(value == 'month'){
              $('#inputDate').val(result.MONTH);
           }else if(value == 'year'){
              $('#inputDate').val(result.YEAR);
           }else if(value = 'whole'){
              $('#inputDate').val("");
           }
        }
        
     })
	});

	
	//버튼 눌렀을 경우 검색 리스트 불러오기
	$('#searchBut').on('click', function(){
		//로딩중 화면 띄우기
		loadingWithMask();
		
		$('#grid').empty();
		lecaNote = $('#lecaNote').val();
		lecaNm = $('#lecaNm').val();
		lecaDt = $('#inputDate').val();
		lecaAdt = $('#todayDate').val();
		value= $('input:checkbox[name="aaa"]:checked').data("value");
		console.log(value);
		
		
		var dataObject = {
			"LECA_NOTE" : lecaNote,
			"LECA_NM" : lecaNm,
			"value" : value,
			"lecaDt" : lecaDt,
			"lecaAdt" : lecaAdt
		};
		console.log(dataObject);
		
		//검색을 눌렀을 경우
		$.ajax({
			url : '/approval/mgrApprovalListAgain',
			type : 'POST',
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : 'JSON',
			success : function(result){
				console.log(result);
				$('#cntSpan').text(result.length);
				$('#grid').empty();
				
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : result,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 500,
					bodyHeight: 250,
					columns : [
						{header : '결재문서유형', name : 'lecaBook', filter : 'select', width : 150, align : 'center'},
						{header : '기안자 소속', name : 'lecaTt', filter : 'select',width : 200, align : 'center'},
						{header : '기안자', name : 'lecaNote', filter : 'select',width : 150, align : 'center'},
						{header : '신청일자', name : 'lecaDt', filter : 'select',width : 180, align : 'center'},
						{header : '검토자 소속', name : 'lecaRoom', filter : 'select',width : 200, align : 'center'},
						{header : '검토자', name : 'lecaNm', filter : 'select',width : 150, align : 'center'},
						{header : '결재일자', name : 'lecaAdt', filter : 'select',width : 180, align : 'center'},
						{header : '승인여부', name : 'lecaCon', filter : 'select',align : 'center'}
					],
					rowHeaders: ['rowNum'],
					columnOptions: {
				        resizable: true
					}
				
				});
				
				//승인 - 그대로, 승인완료 - 파랑, 반려 - 빨강
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1) {
					if(v1.lecaCon == '승인') {
						grid.addCellClassName(v1.rowKey, 'lecaCon', "addFontColorBlue");
					}else if(v1.lecaCon == '반려') {
						grid.addCellClassName(v1.rowKey, 'lecaCon', "addFontColorRed");
					}
				});
				
				$.each(dataSet, function(i1, v1) {
					if(grid.getValue(v1.rowKey, "lecaAdt") == null) {
						grid.setValue(v1.rowKey, "lecaAdt", "-", false);
					}
				});

				closeLoadingWithMask();
			}

		})
		
	})
})
</script>
<body>
<div>
	<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 결재 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">결재 조회</span>
</div>
<br><br>
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;상세 검색조건</p>
<table border="1" id="detailSearch">
	<tr>
		<th class="tableTh">기간</th>
		<td class="tableTd">
			<select name="selectId" id="selectId" style="width : 150px; height: 30px;">
				<option value="whole">전체</option>
				<option value="day">지난 1일</option>
				<option value="week">지난 1주</option>
				<option value="month" selected="selected">지난 1개월</option>
				<option value="year">지난 1년</option>
			</select>
			<input type="date" style="width : 150px; height: 30px;" id="inputDate" /> <b>~</b> 
			<input type="date" id="todayDate" style="width : 150px; height: 30px;"/> &nbsp;&nbsp;&nbsp;
			<label><input type="checkbox" checked data-value="LECA_DT" onclick="doOpenCheck(this);"  name="aaa"> 기안일기준</label>&nbsp;&nbsp;
			<label><input type="checkbox" data-value="LECA_ADT" onclick="doOpenCheck(this);" name="aaa"> 결재일기준</label>
		</td>
	</tr>
	<tr>
		<th class="tableTh">결재라인</th>
		<td class="tableTd">
			기안자 : <input type="text" class="intext" style="height: 30px;" id="lecaNote"><br>
			결재자 : <input type="text" class="intext" style="margin-top: 5px; height: 30px;" id="lecaNm">
		</td>
	</tr>
</table>
<button type="button" class="btn btn-secondary" id = "searchBut" style="float: right;">검색하기</button>
	
	<br><br>
	<input type="hidden" id="memCdHidden" value="${memCd}" />
	<br>
	<p style="width: 50%; float: left;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;전체 결재</p> 
	<p style="float: right; margin-right: 6px;">[총 <span style="color : #001353; font-weight: bold;" id="cntSpan"></span>건]</p>
	<div id="grid"></div>

</body>

</html>