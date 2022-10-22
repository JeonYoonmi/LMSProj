<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#grid{
/* 	width :96%; */
}
#check{
	padding : 10px;
	margin-bottom : 20px;
/* 	width : 96%; */
	background-color: lightyellow;
	border : 1px solid lightgrey;
	color : green;
}
#stuHistoryRound{
	width : 100%;
	margin-left : auto;
	margin-right : auto;
}
#stuHistoryContent{
	width: 100%;
    min-width: 1200px;
    max-width: 1700px;
    margin: 0 auto;
}
#stuHistorySelect{
	display:inline-block;
}
</style>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<script type="text/javascript" defer="defer">
$(document).ready(function(){
	var girdData;
	var grid;
	var test;
	
	var gridList = function(){ 
		$.ajax({
			url:"/scholarship/stuHistoryGrid",
			dataType:'json',
			type: "POST",
			success:function(result){
				
				$('#cntSpan').text(result.length);
				
				$.each(result,function(i, v){
					v.sclhAmt = v.sclhAmt.toLocaleString();
					v.sclhSem = v.sclhSem+"학기";
				});
					
				girdData = JSON.stringify(result);
				grid = new tui.Grid({
					el: document.getElementById('grid'), 
					data : result,
	 				scrollX : true, //옆위로 스크롤기능 막음
	 				scrollY : true,
	 				bodyHeight : 450,
	 	            minbodyHeight : 400,
	 				rowHeaders: [{type: 'rowNum'}],
					columns: [
						{
							header: '년도',
							name: 'sclhDt',
							align : 'center'
						},
						{
							header: '학기',
							name: 'sclhSem',
							align : 'center'
						},
						{
							header: '장학명',
							name: 'sclNm',
							align : 'center'
						},
						{
							header: '금액(원)',
							name: 'sclhAmt',
							align : 'right'
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
<div id="stuHistoryRound">
<div id="stuHistoryContent">
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i>장학/등록  <i class="dripicons-chevron-right"></i><span style="font-weight: bold;">장학금수혜이력</span>
</div>
<br><br>
<div id="check">
<span>-수석장학금 : 각 학과별 내 학년별 석차 1등에게 수여하는 장학금. 등록금의 100%를 지급한다.</span><br>
<span>-우수장학금 : 각 학과별 내 학년별 석차 2등에게 수여하는 장학금. 등록금의 50%를 지급한다.</span><br>
<span>-격려장학금 : 각 학과별 내 학년별 석차 3등에게 수여하는 장학금. 등록금의 30%를 지급한다.</span><br>
<span>-교수추천장학금 : 동 학과의 교수님에게 추천을 받은 사람에게 수여하는 장학금. 30만원을 지급한다.</span>
</div>

<p id="stuHistorySelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;장학금수혜이력</p>
<p style="float: right; margin-right: 6px;">[총 <span style="color : #001353; font-weight: bold;" id="cntSpan"></span>건]</p>
<div id="grid"></div>
</div>
</div>
</body>
</html>