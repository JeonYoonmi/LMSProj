<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<script type="text/javascript" defer="defer">
$(document).ready(function(){
	var girdData;
	var grid;
	var test;
	
	var gridList = function(){ 
		$.ajax({
			url:"/scholarship/allHistoryGrid",
			dataType:'json',
			type: "POST",
			success:function(result){
					
				$.each(result, function(i,v){
					v.sclhAmt = v.sclhAmt.toLocaleString();
					v.sclhSem = v.sclhSem + "학기";
				})
			
				
				grid = new tui.Grid({
					el: document.getElementById('grid'), 
					minBodyHeight : 550,
					bodyHeight: 550,
					data : result,
	 				scrollX : true, //옆위로 스크롤기능 막음
	 				scrollY : true,
	 				
	 				rowHeaders: [{type: 'rowNum'}],
					columns: [
						{
							header: '년도',
							filter : 'select',
							align : 'center',
							name: 'sclhDt',
						},
						{
							header: '단과대학',
							filter : 'select',
							align : 'center',
							name: 'sclhRsn'
						},
						{
							header: '학과',
							filter : 'select',
							align : 'center',
							name: 'sclhGubun'
						},
						{
							header: '학번',
							filter : 'select',
							align : 'center',
							name: 'stuCd'
						},
						{
							header: '이름',
							filter : 'select',
							align : 'center',
							name: 'memNm'
						},
						{
							header: '장학명',
							filter : 'select',
							align : 'center',
							name: 'sclNm'
						},
						{
							header: '금액(원)',
							filter : 'select',
							width : '150',
							align : 'right',
							name: 'sclhAmt'
						}
				
					],
				
				});
				
			
				}
			})
	}
	
	gridList();
	
})
			
</script>
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 등록 및 장학 <i class="dripicons-chevron-right"></i> <span>장학금</span> <i class="dripicons-chevron-right"></i>
<span style="font-weight: bold;">장학금조회</span>
</div>
<br><br>
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;전체 학생 장학금 내역 조회</p>
<div id="grid"></div>
</body>
</html>