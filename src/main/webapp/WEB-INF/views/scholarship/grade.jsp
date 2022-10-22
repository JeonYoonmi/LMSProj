<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#leftDiv{
width : 69%;
float: left;
}
#tabDiv{
width : 30%;
margin-left: 1%;
/* margin-right : 4%; */
float: right;
}
.colortd {
background-color: #E0ECF8;
}
.colorwhite{
background-color: white;
}
#detailTab th{
text-align: center;
}
#detailTab tr{
height: 40px;
}
#btn1{
float: right;
margin-right: 10px;
}
#check{
padding : 10px;
margin-bottom : 20px;
/* width : 96%; */
background-color: lightyellow;
border : 1px solid lightgrey;
color : green;
}

</style>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>

<script type="text/javascript" defer="defer">
function insertCheck(){

 	$.ajax({
 		url : "/scholarship/insertGradeCheck",
 		method : "POST",
 		dataType : "json",
 		success : function(result){
			if(result>0){
 			$('#btn1').hide();
 			var str ="<span style='color:red;'>&ensp;&ensp;*이미 성적장학금을 수여하였습니다.</span>";
 			$('#checkP').append(str);
			}
 		}
 	})	
};

$(document).ready(function(){
	var girdData;
	var grid;
	var stuCd;
	var dataSet = [];
	
	//insertCheck();
	
	function test(){
		$('#grid').empty();
		grid1 = new tui.Grid({
					el: document.getElementById('tabDiv'), 
	 				scrollX : true, 
	 				scrollY : true, 
	 				bodyHegiht : 250,
	 				minBodyHeight : 250,
					columns: [
						{
							header: '학점',
							width : 50
						},
						{
							header: '구분',
							width : 50
						},
						{
							header: '강의명',
						},
						{
							header: '성적',
							width : 50
						}
					]
				});
		}
	
	test();
	
	

	
	var gridList = function(){ 
		$.ajax({
			url:"/scholarship/gradeListGrid",
			dataType:'json',
			type: "POST",
			success:function(result){
				console.log(result);
				
				insertCheck();
				
				$('#grid').empty();
				
				$.each(result,function(i,v){
					var tmp = {};
					var stuCd = v.STU_CD; //학번
					var sclCd;//장학금 코드
					var sclhAmt = v.SCHOLARSHIP;
					tmp.stuCd = stuCd;
					tmp.sclhAmt = sclhAmt;
					if(v.RANKING=='1'){ //등수에 따라 장학금 코드 부여
						sclCd = 1
					}else if(v.RANKING=='2'){
						sclCd = 2
					}else{
						sclCd = 4
					}
					tmp.sclCd = sclCd;
					
					dataSet.push(tmp);
				})
				
				console.log(dataSet);
					
				$.each(result,function(i, v){
					v.SCHOLARSHIP = v.SCHOLARSHIP.toLocaleString();
				});
				
				
				grid = new tui.Grid({
					el: document.getElementById('grid'), 
					data : result,
	 				scrollX : true, 
	 				scrollY : true,
	 				minbodyHeight: 600,
					bodyHeight : 600,
	 				rowHeaders: [{type: 'rowNum'}],
					columns: [
						{
							header: '학번',
							filter : 'select',
							align : 'center',
							name: 'STU_CD',
							width : 150
						},
						{
							header: '단과대학',
							filter : 'select',
							align : 'center',
							name: 'COL_NM',
							width : 150
						},
						{
							header: '학과',
							filter : 'select',
							align : 'center',
							name: 'DEP_NM',
							width : 150
						},
						{
							header: '학년',
							filter : 'select',
							align : 'center',
							name: 'STU_YR',
							width : 100
						},
						{
							header: '학기',
							filter : 'select',
							align : 'center',
							name: 'STU_SEM',
							hidden: 1,
							width : 100
						},
						{
							header: '이름',
							filter : 'select',
							align : 'center',
							name: 'MEM_NM',
							width : 100
						},
						{
							header: '성적',
							filter : 'select',
							align : 'center',
							name: 'TOTAL_AVG',
							width : 100
						},
						{
							header: '등수',
							filter : 'select',
							align : 'center',
							name: 'RANKING',
							//hidden: 1
							width : 90
						},
						{
							header: '장학금(원)',
							filter : 'select',
							align : 'right',
							name: 'SCHOLARSHIP'
						}
					],
					
					
				});
				
				grid.on('click', function(object){
					stuCd = grid.getRow(object.rowKey).STU_CD;
					console.log(stuCd);
					
					$.ajax({
						url : "/scholarship/getLectureGrade",
				 		method : "POST",
				 		dataType : "json",
				 		data : {stuCd : stuCd},
				 		success : function(result){
				 			
				 			
				 			var str = "";
				 			$('#tabDiv').empty();
				 			grid1 = new tui.Grid({
								el: document.getElementById('tabDiv'), 
								data : result,
				 				scrollX : true,
				 				scrollY : true,
				 				bodyHegiht : 250,
				 				minBodyHeight : 250,
								columns: [
									{
										header: '학점',
										align : 'center',
										width : 50,
										name: 'CREDIT',
									},
									{
										header: '구분',
										align : 'center',
										width : 50,
										name: 'CATE'
									},
									{
										header: '강의명',
										align : 'left',
										name: 'LECTURE'
									},
									{
										header: '성적',
										align : 'center',
										width : 50,
										name: 'GRADE'
									}
								]
								
								
							});
				 			
				 			
				 			
				 		}
					})
					
				})
				
				
				
			}
		})
	}
	
	
	
	
	gridList();
	
	
	$('#btn1').on('click',function(){
		var submitCheck = confirm("성적장학금을 수여하시겠습니까?");
		console.log(dataSet);
		if(submitCheck){
			$.ajax({
				url : "/scholarship/insertGradeScl",
				type : "POST",
				data : JSON.stringify(dataSet),
				dataType:'json',
				contentType: 'application/json',
				success : function(result){
	             	if(result>0){
	             	alert("성적장학금이 수여되었습니다.");
	             	insertCheck();
	             	}
	             }
			})
		}
	})
	
})
</script>
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 등록 및 장학 <i class="dripicons-chevron-right"></i> <span>장학금</span> <i class="dripicons-chevron-right"></i>
<span style="font-weight: bold;">장학금수여</span>
</div>
<br><br>
<div id="check">
<span>성적장학금은 각 학과별 내 학년별로 석차 상위 1,2,3등 순으로 수석장학금, 우수장학금, 격려장학금을 수여한다.</span><br>
<span>-수석장학금 : 등록금의 100%</span><br>
<span>-우수장학금 : 등록금의 50%</span><br>
<span>-격려장학금 : 등록금의 30%</span>
</div>
<div id="leftDiv">
<p id="checkP"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;성적장학금 대상 학생<button type="button" class="btn btn-secondary btn-sm" id="btn1">장학금 수여</button></p>
	<div id="grid">
	</div>

</div>
	<p><i class="mdi mdi-record-circle" style="color: #001353;display:inline-block;margin-left:13px;"></i>&ensp;학생 성적 상세</p>
	<div id="tabDiv">
	
	</div>

</body>
</html>