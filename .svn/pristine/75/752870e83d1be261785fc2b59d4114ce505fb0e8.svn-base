<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<style>
#allPayCnt td:first-child{
	text-align : left;
	padding :7px;
	padding-right : 50px;
	background : #EFF5FB;
}
#allPayCnt td:last-child{
	text-align : right;
	padding :7px;
	padding-left: 70px;
}
.addFontColorRed {
	color: rgb(225, 39, 64);
}

.addFontColorBlue {
	color : blue;
}
</style>
<script type="text/javascript" defer="defer">
$(document).ready(function(){
	
	var girdData;
	var grid;
	var test;
	
	var gridList = function(){ 
	
	$.ajax({
		url:"/payment/adminPaymentgrid",
		dataType:'json',
		type: "POST",
		success:function(result){

		        $('#cntSpan').text(result.length);
			
			//hashmap으로 인한 밀리세컨드 moment라이브러리를 통해 시간 변환함
			for(var i = 0; i<result.length; i++){
				
				if(result[i].PAY_DT!=null){
				let time = moment(result[i].PAY_DT).format('YYYY-MM-DD'); 
				result[i].PAY_DT = time;
				}else{
				result[i].PAY_DT = "-";
				}
			}			
			
			girdData = JSON.stringify(result);
			
			grid = new tui.Grid({
				el: document.getElementById('grid'), 
				minBodyHeight : 500,
				bodyHeight: 500,
				data : result,
 				scrollX : true, //옆위로 스크롤기능 막음
 				scrollY : true,
 				rowHeaders: [{type: 'rowNum'}],
				columns: [
					{
						header: '납부년도',
						filter : 'select',
						align : 'center',
						name: 'PAY_DT2'
					},
					{
						header: '납부학기',
						filter : 'select',
						align : 'center',
						name: 'PAY_SEM'
					},
					{
						header: '단과대학',
						filter : 'select',
						align : 'center',
						name: 'COL_NM'
					},
					{
						header: '학번',
						filter : 'select',
						align : 'center',
						name: 'STU_CD'
					},
					{
						header: '이름',
						filter : 'select',
						align : 'center',
						name: 'MEM_NM'
					},
					{
						header: '등록금(원)',
						filter : 'select',
						align : 'right',
						name: 'COL_FEE'
					},
					{
						header: '장학금(원)',
						filter : 'select',
						align : 'right',
						name: 'SCHL_AMT'
					},
					{
						header: '납부총액(원)',
						filter : 'select',
						align : 'right',
						name: 'PAY_AMT'
					},
				
					{
						header: '납부일',
						filter : 'select',
						align : 'center',
						name: 'PAY_DT'
					},
					{
						header: '납부상태',
						filter : 'select',
						align : 'center',
						name: 'PAY_YN'
					}
			
				]
			
			});
			
			
			var dataSet = grid.getData();
			console.log("테스트");
			console.log(dataSet);
			$.each(dataSet, function(i1, v1){
				if(v1.PAY_YN == "완납"){
					grid.addCellClassName(v1.rowKey, 'PAY_YN', "addFontColorBlue");
				}else if(v1.PAY_YN == "미납"){
					grid.addCellClassName(v1.rowKey, 'PAY_YN', "addFontColorRed");
				}
			});
			
			
			
			
			}
		})
	}
	
	gridList();
	
});
</script>
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 등록 및 장학 <i class="dripicons-chevron-right"></i> <span>등록금</span> <i class="dripicons-chevron-right"></i>
<span style="font-weight: bold;">등록금납부관리</span>
</div>
<br><br>
<p style="float: left;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;전체 학생 등록금 납부 조회</p>
<p style="float: right; margin-right: 6px;">[총 <span style="color : #001353; font-weight: bold;" id="cntSpan"></span>건]</p>
<div id="grid">
</div>
<table id='allPayCnt' border="1">
	<tr>
		<td>올해 납부되는 등록금 총액</td>
		<td><fmt:formatNumber value="${paymentVO.payCd }" pattern="#,###" /> (원)</td>
	</tr>
	<tr>
		<td>현재 납부된 등록금 총액</td>
		<td><fmt:formatNumber value="${paymentVO.payAmt }" pattern="#,###" /> (원)</td>
	</tr>
</table>
</body>
</html>