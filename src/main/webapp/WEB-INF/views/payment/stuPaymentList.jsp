<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.center{
text-align: center;
}
.right{
text-align: right;
}
#detailTab{
font-size : 20px;
margin-top : 10px;
width: 90%;
height: 350px;
margin: auto;
}
#footer{
font-size : 30px;
font-weight: bold;
height : 100px;
}
#header{
padding-top : 10px;
padding-bottom: 10px; 
font-size : 25px;
text-align: center;
font-weight: bold;
}

#detail{
width : 900px;
height : 400px;
}

#btnDiv{
width : 900px;
}
.noticeBill{
	margin-left : 30px;
}

#small{
text-align: left;
}
#stuPaymentListSelect{
	display : inline-block;
}
/* .btn-primary{ */
/* 	background : #001353; */
/* 	border : #001353; */
/* 	box-shadow : #001353; */
/* } */
/* .btn-primary:hover{ */
/* 	background : #2a5388; */
/* 	border : #2a5388; */
/* 	box-shadow : #2a5388; */
/* } */
#noticeBill{
	margin-left : 15px;
	margin-top : -7px;
}
/* .confirmBill{ */
/* 	padding : 5px; */
/* } */
/* .confirmBill:hover{ */
/* 	background : white; */
/* } */

.comfirmBill{
	font-family:Nunito,sans-serif;
}

</style>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<link rel="stylesheet" href="/resources/css/suwon.css" />
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<script type="text/javascript" defer="defer">
var gridData;
var grid;
var payYnCheck;

function checkBillCnt(){
	$.ajax({
		url : '/payment/billCount',
		type : 'POST',
		dataType : 'json',
		success : function(res) {
				console.log(res);
				if (res == 1) {
					var str = "";
					str +=" &nbsp;<span id='noticeSpan' style='color:red;'>*납부해야할 등록금이 있습니다.</span><button onclick='getBill()' class='btn btn-primary' id='noticeBill' style='float:right;'>등록금고지서</button>"
					$('#stuPaymentListSelect').append(str);
				}
			}
		})
}

function loadGrid(){
	$.ajax({
		url : "/payment/stuPaymentListGrid",
		type : "POST",
		dataType : 'JSON',
		success : function(res){
			
			$('#grid').empty();
			
			$('#cntSpan').text(res.length);
			
			$.each(res, function(i,v){
				res[i]['btn'] = '<button class="confirmBill btn btn-outline-secondary btn-sm" onclick="getDetail('+v.payCd+',' + v.payYn + ')">납부확인서</button>';
			});
			
			$.each(res,function(i, v){
				v.stuCd = v.stuCd.toLocaleString();
				v.paySem = v.paySem.toLocaleString();
				v.payAmt = v.payAmt.toLocaleString();
				if(v.payYn == 0){
					v.payYn ='-';
				}else{
					v.payYn ='완납';
				}
			});
			
			
			grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : res,
				bodyHeight : 550,
	            minbodyHeight : 550,
				scrollX : true,
				scrollY : true,
				columns : [
					{header : '확인서출력', name : 'btn', width : 120, align : 'center'},
					{header : '년도', name : 'payDt', filter : 'select', align : 'center'},
					{header : '책정액(원)', name : 'paySem', filter : 'select', align : 'right'},
					{header : '감면액(원)', name : 'stuCd', filter : 'select', align : 'right'},
					{header : '실납부액(원)', name : 'payAmt', filter : 'select', align : 'right'},
					{header : '납부여부', name : 'payYn', filter : 'select', align : 'center'}
					
				],
				columnOptions: {
			        resizable: true
			    }
			});
			
		}
	});
}

function getDetail(payCd,payYn){
	
	if(payYn == 1){
		var pwidth = 1400;
		var pheight = 800;
		
		var pleft = (window.screen.width/2) - (pwidth/2);
		var ptop = (window.screen.height/2) - (pheight/2);
		
		window.open("/payment/certificate/"+payCd,'a','width='+ pwidth +',height='+ pheight +',top='+ ptop +',left='+ pleft);

	}else{
		alert("현재 등록금 미납 상태 이므로 수납서를 확인할 수 없습니다.");
	}
	
}

function getBill(){
	var result;
	var pwidth = 1400;
	var pheight = 800;
	
	
	var pleft = (window.screen.width/2) - (pwidth/2);
	var ptop = (window.screen.height/2) - (pheight/2);
	
	result = window.open("/payment/bill",'b','width='+ pwidth +',height='+ pheight +',top='+ ptop +',left='+ pleft); 
	
	console.log("result", result);
	if(result!=null){
		result.addEventListener('unload', function(){
			//window.location.reload()	
		});
	}
}





$(function(){

	checkBillCnt();
	loadGrid();
	
})

</script>
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i>장학/등록  <i class="dripicons-chevron-right"></i><span style="font-weight: bold;">등록금납부이력</span>
</div>
<br><br>
<p id="stuPaymentListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;등록금납부이력</p>
<p style="float: right; margin-right: 6px;">[총 <span style="color : #001353; font-weight: bold;" id="cntSpan"></span>건]</p>	
	<div id="grid">
	</div>
</body>
</html>