<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/suwon.css">
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<style type="text/css">
.graduateGetSelect{
	display:inline-block;
}
#tgradeYellowBox {
	background : lightyellow;
	border: 1px solid lightgray;
    margin: 10px;
    padding: 10px;
}
#tgradeGreenText {
	color : green;
}
#graduationView{
	background: white;
	width: 98.7%;
	padding: 10px; 
	margin: 10px;
	text-align: center;
	border : 1px solid lightgray;
}
#graduationView tr{
	height : 35px;
}

th{
	background: #dcdcdc;
}
#graduationView tbody tr:hover {
   	color: #6c757d;
   	background-color: #f1f3fa;
   
}
.btnRight{ 
	float: right; 
}
.labelClass{
 	width: 70px;
    text-align: right;
    
}
.inText{
 	width : 220px;
 	margin-left: 15px;
 	height: 33px;
}
.btn-primary{
 	background : #2a5388;
 	border : #2a5388;
 	box-shadow : #2a5388;
}
.btn-primary:hover{
 	background : #4671af;
 	border : #4671af;
 	box-shadow : #4671af;
}
.addPadding{
	padding-left : 5px;
}
  /*학생기초정보 테이블 css 시작*/
 #stuInfoTable{
 	width : 100%;
 	border-left: 1px solid #001353;
    border-right: 1px solid #001353;
    border-top: 1px solid #001353;
    border-bottom: 1px solid #001353;
 }
 #stuInfoTable th{
 	width : 9%;
 	text-align: right;
 	padding-right: 10px;
 	background: #F3F8FF;
 	color : #001353;
 }
 #stuInfoTable td{
 	width: 45px;
 	background: #F3F8FF;
 }
 .infoText{
    margin: 1px;
    width: 98%;
    height: 28px;
    padding-left : 5px;
    font-size : 0.9em;
    background : white;
    border : 1px solid lightgray;
    border-radius : 0.15em;
 }
  /*학생기초정보 테이블 css 끝*/
</style>
<script type="text/javascript" defer="defer">
var gridData;
var grid;

window.onload = function() {
	
	stuCd = $('#stuCd').val();
	data = {"stuCd" : stuCd};
	
	//사진 띄우기
	$('#photoBtn').on('click', function() {
		var memFnm = $('#memFnm').val();
		console.log(memFnm);
		
		//memFnm : 이미지 이름.확장자
		if(memFnm == null) {
			alert("등록된 사진이 없습니다.");
		}else {
			
			const img = new Image();
			img.src = "/resources/profileImg/" + memFnm;
			console.log("width : " + img.width + ", height : " + img.height);
			
			window.open(
					"/tgrade/getPhoto?memFnm=" + memFnm,
					"photo",
					"width = 200, height = 230, left = " + (window.screen.width / 2) - 200 +", top = 10000, history = no, resizable = no, status = no, scrollbars = no, menubar = no"
			);
		}
	});
	
	//졸업신청 버튼을 눌렀을 경우
	$('#applyBut').on('click', function(){
		var gsyn = $('#gsyn').text();
		var jsyn = $('#jsyn').text();
		var gpyn = $('#gpyn').text();
		var jpyn = $('#jpyn').text();
		var yrNsem = $('#yrNsem').val().substring(0,1);
		
		$.ajax({
			url : '/record/graduateHistory',
			type : 'post',
			contentType : 'application/json;charset=utf-8',
			dataType : 'JSON',
			success : function(result) {
				console.log(result);
				if(result > 0){
					//이미 신청기록이 있음. 신청불가능
					alert("이미 신청기록이 있으므로 신청할 수 없습니다.");
					return false;
				}else{
					//신청가능
					if((jpyn == 'Y') && (gsyn == 'Y') && (gpyn == 'Y') && (jpyn == 'Y') && (yrNsem == '4')){
						$.ajax({
							url : '/record/postApply',
							type : 'post',
							data : JSON.stringify(data),
							contentType : 'application/json;charset=utf-8',
							dataType : 'JSON',
							success : function(result) {
								console.log(result);
								if(result > 0){
									alert("성공적으로 신청되었습니다.")
								}else{
									alert("졸업신청에 실패하였습니다.")
								}
							}
						})
					}else{
						if(yrNsem != '4'){
							alert("학년이 충족되지 않았습니다.");
							return false;
						}else{
							alert("이수학점이 충족되지 않았습니다.")
							return false;
						}
					}
				}
			}
		})
		
		
		
	})
	
	//졸업사정 성적일람표 버튼을 눌렀을 경우
	$('#gradeTable').on('click', function(){
		var jpyn = $('#jpyn').text();
		var jsyn = $('#jsyn').text();
		var gpyn = $('#gpyn').text();
		var gsyn = $('#gsyn').text();
		
		var yn = jpyn + jsyn + gpyn + gsyn;
// 		param = {"stuCd" : stuCd,
// 				 "yn" : yn}
		
		window.open("/record/getGradeTable/" + stuCd + "/" + yn, "a", "width=1600, height=1000, left=50, top=50"); 
	})
	
	//전체 리스트 가져오기
	$.ajax({
		url : "/record/majorHistory",
		type : 'POST',
		data : JSON.stringify(data),
		dataType : 'JSON',
		contentType : 'application/json;charset=utf-8',
		success : function(result) {
			console.log(result);
			$('#cntSpanJ').text(result.length);
			grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : result,
				scrollX : true,
				scrollY : true,
				minBodyHeight : 300,
				bodyHeight: 250,
				columns : [
					{header : '연도', name : 'lecaYr', filter : 'select', width : 90, align : 'center'},
					{header : '학기', name : 'lecaBook', filter : 'select', width : 90, align : 'center'},
					{header : '이수구분', name : 'lecaCate', filter : 'select', width : 100, align : 'center'},
					{header : '학수번호', name : 'subCd', width : 100, align : 'center'},
					{header : '과목명', name : 'lecaNm', width : 150},
					{header : '성적', name : 'lecaRoom', align : 'center'},
					{header : '이수여부', filter : 'select', name : 'lecaCon', align : 'center'}
				],
				rowHeaders: ['rowNum'],
				columnOptions: {
			        resizable: true
				}

			});
			

			
			var dataSet = grid.getData();
			$.each(dataSet, function(i1, v1){
				if(v1.lecaNm){
					grid.addColumnClassName('lecaNm', "addPadding");
				}
			})
			
		
			$.ajax({
				url : "/record/culturalHistory",
				type : 'POST',
				data : JSON.stringify(data),
				dataType : 'JSON',
				contentType : 'application/json;charset=utf-8',
				success : function(result) {
					$('#cntSpanG').text(result.length);
					console.log(result);
					grid2 = new tui.Grid({
						el : document.getElementById('grid2'),
						data : result,
						scrollX : true,
						scrollY : true,
						minBodyHeight : 300,
						bodyHeight: 250,
						columns : [
							{header : '연도', name : 'lecaYr', filter : 'select', width : 90, align : 'center'},
							{header : '학기', name : 'lecaBook', filter : 'select', width : 90, align : 'center'},
							{header : '이수구분', name : 'lecaCate', filter : 'select', width : 100, align : 'center'},
							{header : '학수번호', name : 'subCd', width : 100, align : 'center'},
							{header : '과목명', name : 'lecaNm', width : 150},
							{header : '성적', name : 'lecaRoom', align : 'center'},
							{header : '이수여부', filter : 'select', name : 'lecaRsn', align : 'center'}
						],
						rowHeaders: ['rowNum'],
						columnOptions: {
					        resizable: true
						}

					});
					
					var dataSet = grid.getData();
					$.each(dataSet, function(i1, v1){
						if(v1.lecaNm){
							grid2.addColumnClassName('lecaNm', "addPadding");
						}
					})
				}
				
			});
			
		
		}//success 끝
			
	

	});
}
</script>
<div style="padding: 50px; margin-top: 15px;">
	<table id = "stuInfoTable">
		<c:forEach var="data" items="${data}">
			<tr>
				<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
				<td style="display: none;"><input id="memFnm" type="hidden" value="${data.memFnm }"></td>
			</tr>
			<tr>
				<th>학번</th>
				<td><input type="text" id="stuCd" class="infoText" style="width: 68.5%;" value="${data.memCd }" disabled >
				<button type="button" class="btn btn-secondary" id="photoBtn" style="height: 28px;margin-top:-2px;"><p style="margin-top: -4px;">사진</p></button>
				</td>
				<th>성명</th>
				<td><input type="text" class="infoText" disabled value="${data.memNm }"></td>
				<th>입학정보</th>
				<td><input type="text" class="infoText" disabled value="${data.memAddr1 }"></td>
				<th>연락처</th>
				<td><input type="text" class="infoText" disabled value="${data.memTel }"></td>
				<th></th>
			</tr>
			<tr>
				<td colspan="9" style="background: #F3F8FF; height: 5px;"></td>
			</tr>
			<tr>
				<th>소속</th>
				<td><input type="text" class="infoText" disabled value="${data.memNme }"></td>
				<th>학년</th>
				<td><input type="text" class="infoText" disabled value="${data.memMl }" id="yrNsem"></td>
				<th>변동</th>
				<td><input type="text" class="infoText" disabled value="${data.memAddr2 }"></td>
				<th>생년월일</th>
				<td><input type="text" class="infoText" disabled value="${data.memReg1 }"></td>
				<th></th>
			</tr>
			<tr>
				<td colspan="9" style="background: #F3F8FF; height: 10px;"></td>
			</tr>
		</c:forEach>
	</table>
		<br>
		<p style="display: inline-block; width: 200px;" class="graduateGetSelect"><span class="boldSpan"><i class="mdi mdi-record-circle" style="color:#001353;"></i>&ensp;졸업사정조회</span></p>
		
		<div id="tgradeYellowBox">
			<span id="tgradeGreenText" style="font-weight: bold;">전필 및 교필학점을 초과할 시 전선 및 교선학점으로 인정됩니다.</span>
		</div>
		<table id="graduationView" border="1">
		    <thead>
		        <tr>
		            <th>이수명</th>
		            <th>배당</th>
		            <th>취득</th>
		            <th>잔여</th>
		            <th>집계</th>
		            <th>이수</th>
		            <th>평균학점</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>전필학점</td><!-- 이수명 -->
		            <td>${fix.depMrc}</td><!-- 배당 -->
		            <td>${grade.JP}</td><!-- 취득 -->
		            <c:if test="${fix.depMrc ge grade.JP}">
		          	  <td>${fix.depMrc - grade.JP}</td><!-- 잔여 -->
		            </c:if>
		            <c:if test="${fix.depMrc lt grade.JP}">
		          	  <td>0</td><!-- 잔여 -->
		          	  <c:set var="left" value="${grade.JP - fix.depMrc}"></c:set>
		            </c:if>
		            <c:if test="${fix.depMrc ge grade.JP}">
			            <td>${grade.JP}</td> <!-- 집계 -->
			            <c:set var="jphap" value="${fix.depMrc eq grade.JP}"></c:set>
		            </c:if>
		            <c:if test="${fix.depMrc lt grade.JP}">
			            <td>${fix.depMrc}</td> <!-- 집계 -->
			            <c:set var="jphap" value="${fix.depMrc eq fix.depMrc}"></c:set>
		            </c:if>
					<c:if test="${jphap eq true}">
						<td id="jpyn">Y</td>
					</c:if>
					<c:if test="${jphap ne true}">
						<td id="jpyn">N</td>
					</c:if>
		            <td>${grade.JPDIV}</td>
		        </tr>
		        <tr>
		            <td>교필학점</td><!-- 이수명 -->
		            <td>${fix.depMoc}</td><!-- 배당 -->
		            <td>${grade.GP}</td><!-- 취득 -->
		             <c:if test="${fix.depMoc ge grade.GP}">
		          	  <td>${fix.depMoc - grade.GP}</td><!-- 잔여 -->
		           	 </c:if>
		            <c:if test="${fix.depMoc lt grade.GP}">
		          	  <td>0</td><!-- 잔여 -->
		          	  <c:set var="leftgp" value="${grade.GP - fix.depMoc}"></c:set>
		            </c:if>
		            <c:if test="${fix.depMoc ge grade.GP}">
			            <td>${grade.GP}</td><!-- 집계 -->
			            <c:set var="gphap" value="${fix.depMoc eq grade.GP}"></c:set>
		            </c:if>
		            <c:if test="${fix.depMoc lt grade.GP}">
			            <td>${fix.depMoc}</td><!-- 집계 -->
			             <c:set var="gphap" value="${fix.depMoc eq fix.depMoc}"></c:set>
		            </c:if>
		            <c:if test="${gphap eq true}">
						<td id="gpyn">Y</td>
					</c:if>
					<c:if test="${gphap ne true}">
						<td id="gpyn">N</td>
					</c:if>
		            <td>${grade.GPDIV}</td>
		        </tr>
		        <tr>
		            <td>전선학점</td><!-- 이수명 -->
		            <td>${fix.depCrc}</td><!-- 배당 -->
		            <td>${grade.JS}</td><!-- 취득 -->
		             <c:if test="${fix.depCrc ge grade.JS}">
		          	  <td>${fix.depCrc - grade.JS}</td><!-- 잔여 -->
		            </c:if>
		            <c:if test="${fix.depCrc lt grade.JS}">
		          	  <td>0</td><!-- 잔여 -->
		            </c:if>
		            <c:if test="${fix.depCrc ge grade.JS}">
			            <td><c:out value="${left+grade.JS}"/></td><!-- 집계 -->
			            <c:set var="jshap" value="${left+grade.JS}"></c:set>
		            </c:if>
		            <c:if test="${fix.depCrc lt grade.JS}">
			            <td>${fix.depCrc}</td><!-- 집계 -->
			            <c:set var="jshap" value="${fix.depCrc}"></c:set>
		            </c:if>
		            <c:if test="${fix.depCrc le jshap}">
						<td id="jsyn">Y</td>
					</c:if>
					<c:if test="${fix.depCrc gt jshap}">
						<td id="jsyn">N</td>
					</c:if>
		            <td>${grade.JSDIV}</td>
		        </tr>
		        <tr>
		            <td>교선학점</td><!-- 이수명 -->
		            <td>${fix.depCoc}</td><!-- 배당 -->
		            <td>${grade.GS}</td><!-- 취득 -->
		             <c:if test="${fix.depCoc ge grade.GS}">
		          	  <td>${fix.depCoc - grade.GS}</td><!-- 잔여 -->
		            </c:if>
		            <c:if test="${fix.depCoc lt grade.GS}">
		          	  <td>0</td><!-- 잔여 -->
		            </c:if>
		            <c:if test="${fix.depCoc ge grade.GS}">
			            <td><c:out value="${leftgs+grade.GS}"/></td><!-- 집계 -->
			            <c:set var="gshap" value="${leftgs+grade.GS}"></c:set>
		            </c:if>
		            <c:if test="${fix.depCoc lt grade.GS}">
			            <td>${fix.depCoc}</td><!-- 집계 -->
			            <c:set var="gshap" value="${fix.depCoc}"></c:set>
		            </c:if>
		            <c:if test="${fix.depCoc le gshap}">
						<td id="gsyn">Y</td>
					</c:if>
					<c:if test="${fix.depCoc gt gshap}">
						<td id="gsyn">N</td>
					</c:if>
		            <td>${grade.GSDIV}</td>
		        </tr>
		    </tbody>
		</table>
		<br>
		<div style="display: inline-block; width: 49%; float: left;">
			<p  class="graduateGetSelect"><span class="boldSpan"><i class="mdi mdi-record-circle" style="color:#001353;"></i>&ensp;전공별 이수내역</span></p>
			<p style="float: right; margin-right: 6px;">[총 <span style="color : #001353; font-weight: bold;" id="cntSpanJ"></span>건]</p>
			<div id="grid"></div>
		</div>
		<div style="display: inline-block; width: 49%; float: right;">
		<p  class="graduateGetSelect"><span class="boldSpan"><i class="mdi mdi-record-circle" style="color:#001353;"></i>&ensp;교양영역별 이수내역</span></p>
		<p style="float: right; margin-right: 6px;">[총 <span style="color : #001353; font-weight: bold;" id="cntSpanG"></span>건]</p>
		<div id="grid2"></div>
		</div>
	</div>
	</div>
</div>