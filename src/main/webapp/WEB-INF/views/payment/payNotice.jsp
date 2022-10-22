<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#grid *{
text-align: center;
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
var girdData;
var grid;
var test;
var cnt;
var gridList = function(){ 
	
	//$('#grid').empty();
	
	$.ajax({
		url:"/payment/payNoticeGrid",
		dataType:'json',
		type: "POST",
		success:function(result){
			
            var cnt = 0;
            $.each(result,function(i,v){
               if(v.NOTICE =='-'){
                  cnt++;
               }
            })

            $('#cntSpan').text(cnt);
			
			
				
			girdData = JSON.stringify(result);
			
			grid = new tui.Grid({
				el: document.getElementById('grid'), 
				minbodyHeight: 350,
				bodyHeight : 600,
				data : result,
 				scrollX : true,
 				scrollY : true,
 				rowHeaders: [{type: 'rowNum'},{type: 'checkbox'}],
				columns: [
					{
						header: '대학',
						filter : 'select',
						name: 'COL_NM'
					},
					{
						header : '학과',
						filter : 'select',
						name: 'DEP_NM'
					},
					{
						header: '학번',
						name: 'STU_CD'
						
					},
					{
						header: '학년',
						filter : 'select',
						name: 'STU_YR'
					},
					{
						header: '학기',
						filter : 'select',
						name: 'STU_SEM'
					},
					{
						header: '이름',
						name: 'MEM_NM'
					},
					{
						header : '고지현황',
						filter : 'select',
						name: 'NOTICE',
						
					},
					{
						header: '학과코드',
						name: 'DEP_CD',
						hidden : 1
					},
				]
			});
			
		var noticeCheck =grid.findRows({
			NOTICE : '고지'
		});
		
		$.each(noticeCheck, function(i,v){
			grid.disableRowCheck(v.rowKey);
		});
			
		grid.on('check', function(object){
		test = grid.getCheckedRows(object);
			})
	
		grid.on('uncheck',function(object){
		test = grid.getCheckedRows(object);
				})
		
		grid.on('checkAll',function(object){
		test = grid.getCheckedRows(object);
				})
			}
		})
		
	}
	
function submit(){
	var dataSet =[];
	$.each(test,function(i,v){
		var tmp = {};
		var stuCd = v.STU_CD;
		var depCd = v.DEP_CD;
		tmp.stuCd = stuCd;
		tmp.depCd = depCd;
		dataSet.push(tmp);
	})
	 $.ajax({
	        url : "/payment/insert",
	        type : "POST",
	        data : JSON.stringify(dataSet),
	        contentType: 'application/json',
	        success : function(res){
	        	alert("등록금 요청이 완료되었습니다.")
	        	$('#grid').empty();
	        	gridList();
	        }
	    });
}
$(function(){
	
	$.ajax({
 		url : "/scholarship/insertGradeCheck",
 		method : "POST",
 		dataType : "json",
 		success : function(result){
			if(result==0){
 			$('#btn1').remove();
 			var str ="<span style='color:red;'>&ensp;&ensp;*성적장학금을 수여하지 않은 상태이므로 등록금을 고지할 수 없습니다.</span>";
 			$('#noticeCheck').append(str);
			}
 		}
 	})	
	
	gridList();
	
	$('#btn1').on('click',function(){
		submit();
	})
});
</script>
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i>등록 및 장학 <i class="dripicons-chevron-right"></i><span>등록금</span> <i class="dripicons-chevron-right"></i>
<span style="font-weight: bold;">등록금고지관리</span>
</div>
<br><br>
<div id="check">
<span>등록금은 현재 재학중인 학생에게만 부여된다. 등록금은 장학금이 자동적으로 차감된 금액이 부과되며, 만약 장학금액이 등록금액을 초과할 경우 등록금은 0원으로 처리된다.</span><br>
</div>
<p id="noticeCheck" style="float:left;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;등록금 납부 고지대상</p>
<br><br>
<div>
<input type="button" id="btn1" class="btn btn-secondary btn-sm" value="등록금 고지" style="float:left">
<p style="float: right; margin-right: 6px;">[미고지 <span style="color : #001353; font-weight: bold;" id="cntSpan"></span>건]</p>
</div>
<br>
<div id="grid">
</div>
<br>
</body>
</html>