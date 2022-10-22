<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>수강편람</title>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<script type="text/javascript" src="/resources/js/spinner.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<link rel="stylesheet" href="/resources/css/topTable.css" type="text/css">
</head>
<script type="text/javascript" defer="defer">

	var gridData;
	var grid;
	
	//강의계획서 버튼 클릭 이벤트
	function getSyllabus(lecaCd, proCd) {
		
		param = {"lecaCd" : lecaCd};
		
		$.ajax({
			url : '/approval/lecApplyPdf',
			type : 'post',
			data : JSON.stringify(param),
			dataType : 'JSON',
			contentType : 'application/json;charset=utf-8',
			success : function(result){
				console.log(result);
				window.open("/approval/lecApproPdfGet/" + lecaCd, "a", "width=1200, height=850, left=100, top=50"); 
			}
		});
	}

	window.onload = function() {
		
		//로딩중 화면 띄우기
		loadingWithMask();
		
		//전체 리스트 가져오기
		year = $('#year').val();
		semester = $('#semester').val();
		
		let dataObject = {
			year :  year,
			semester : semester
		};
		
		$.ajax({
			url : "/course/getList",
			type : 'POST',
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : 'JSON',
			success : function(res) {
				
				//강의계획서 버튼 만들기
				$.each(res, function(i,v){
					res[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;" onclick="getSyllabus(' + v.lecaCd + ',' + v.lecCd +')">강의계획서</button>';
				});

				//grid에 리스트 출력하기
				grid = new tui.Grid({
					el : document.getElementById('grid'),
					data : res,
					scrollX : true,
					scrollY : true,
					bodyHeight : 400,
					columns : [
						{header : '개설학과', name : 'lecaCon', filter : 'select', width : 150, align : 'center'},
						{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
						{header : '과목번호', name : 'subCd', filter : 'select', width : 100, align : 'center'},
						{header : '과목명', name : 'lecaNm', filter : 'select', width : 260},
						{header : '제한인원', name : 'lecaMax', width : 100, align : 'center'},
						{header : '수강인원', name : 'lecaUnit', width : 100, align : 'center'},
						{header : '개설이수구분', name : 'lecaCate', width :100, align : 'center'},
						{header : '학점', name : 'lecaCrd', width : 50, align : 'center'},
						{header : '강의시간/강의실', name : 'lecaTt', width : 310},
						{header : '담당교수', name : 'proNm', width : 80, align : 'center'},
						{header : '성적평가방식', name : 'lecaGrade', width : 100, align : 'center'},
						{header : '강의계획서', name : 'btn', align : 'center'}
					],
					columnOptions: {
				        resizable: true
				    }
				});
				
				//로딩중 화면 끄기
				closeLoadingWithMask();
				
				//폐강강좌 폰트 red 처리하기
				var dataSet = grid.getData();
				$.each(dataSet, function(i1, v1){
					if(v1.lecaUnit == 0){
						grid.addRowClassName(v1.rowKey, "addFontColorRed");
					}
// 					if(v1.lecaNm){
// 						grid.addColumnClassName('lecaNm', "addPadding");
// 					}
// 					if(v1.lecaTt){
// 						grid.addColumnClassName('lecaTt', "addPadding");
// 					}
				});
				
				//수강편람 건수
				var courseLength = res.length;
				courseLength = courseLength.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				$('#cntSpan').text(courseLength);
			}
		});
		
		//개설학과 불러오기
		$.ajax({
			url : "/course/department",
			type : "GET",
			dataType : "JSON",
			success : function(res) {
				str = '';
				
				$.each(res, function(i, v) {
					str += '<option value="' + v + '">' + v + '</option>';
				});
				
				$('#department').append(str);
			}
		});

		//과목번호 및 과목명 입력 후 엔터키를 눌러도 조회 버튼 클릭으로 연결됨
		var inputSubject = document.getElementById("subject");
		
		inputSubject.addEventListener("keyup", function(event) {
	      if(event.keyCode === 13) {
	        event.preventDefault();
	        document.getElementById("btn2GetList").click();
	      }
	    });
		
		//버튼 눌러서 검색 리스트 불러오기
		$('#btn2GetList').on('click', function() {
			
			//로딩중 화면 띄우기
			loadingWithMask();
			
			year = $('#year').val();
			semester = $('#semester').val();
			department = $('#department').val();
			category = $('#category').val();
			subject = $('#subject').val();
			
			let dataObject = {
				year :  year,
				semester : semester,
				department : department,
				category : category,
				subject : subject
			};
			
			if(year == ${thisYearMap.YEAR} && semester == ${thisYearMap.SEMESTER}) {
				alert("당학기의 경우 강의계획 조회에서 조회할 수 있습니다.");
				return;
			}
			
			$.ajax({
				url : "/course/getListAgain",
				type : "POST",
				data : JSON.stringify(dataObject),
				contentType : "application/json;charset=utf-8",
				dataType : 'JSON',
				success : function(res) {
					$('#grid').empty();
// 					$('#cntSpan').text(res.length);
					
					//btn btn-secondary btn-sm
					$.each(res, function(i,v){
						res[i]['btn'] = '<button class="btn btn-outline-secondary btn-sm" style="font-family:Nunito,sans-serif;" onclick="getSyllabus(' + v.lecaCd + ',' + v.lecCd + ')">강의계획서</button>';
					});
					
					grid = new tui.Grid({
						el : document.getElementById('grid'),
						data : res,
						scrollX : true,
						scrollY : true,
						bodyHeight : 400,
						columns : [
							{header : '개설학과', name : 'lecaCon', filter : 'select', width : 150, align : 'center'},
							{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
							{header : '과목번호', name : 'subCd', filter : 'select', width : 100, align : 'center'},
							{header : '과목명', name : 'lecaNm', filter : 'select', width : 260},
							{header : '제한인원', name : 'lecaMax', width : 100, align : 'center'},
							{header : '수강인원', name : 'lecaUnit', width : 100, align : 'center'},
							{header : '개설이수구분', name : 'lecaCate', width :100, align : 'center'},
							{header : '학점', name : 'lecaCrd', width : 50, align : 'center'},
							{header : '강의시간/강의실', name : 'lecaTt', width : 310},
							{header : '담당교수', name : 'proNm', width : 80, align : 'center'},
							{header : '성적평가방식', name : 'lecaGrade', width : 100, align : 'center'},
							{header : '강의계획서', name : 'btn', align : 'center'}
						],
						columnOptions: {
					        resizable: true
					    }
					});
					
					closeLoadingWithMask();
					
					var dataSet = grid.getData();
					$.each(dataSet, function(i1, v1){
						if(v1.lecaUnit == 0){
							grid.addRowClassName(v1.rowKey, "addFontColorRed");
						}
// 						if(v1.lecaNm){
// 							grid.addColumnClassName('lecaNm', "addPadding");
// 						}
// 						if(v1.lecaTt){
// 							grid.addColumnClassName('lecaTt', "addPadding");
// 						}
					});
					
					//수강편람 건수
					var courseLength = res.length;
					courseLength = courseLength.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
					$('#cntSpan').text(courseLength);
				}
			});
			
		});
	}
</script>
<body>
	<div id="courseInfoRound">
		<div>
			<i class="mdi mdi-home" style="font-size: 1.3em"></i>
			<i class="dripicons-chevron-right"></i> 강의정보 
			<i class="dripicons-chevron-right"></i> 
			<span style="font-weight: bold;">수강편람</span>
		</div>
		
		<br>
		
		<table id="stuInfoTable">
			<tr>
				<td colspan="7" style="background: #F3F8FF; height: 10px;"></td>
			</tr>
			<tr>
				<th>년도</th>
				<td>
					<select class="infoText" name="year" id="year">
						<c:forEach var="year" items="${yearList}">
							<option value="${year}"
								<c:if test="${preYearMap.YEAR == year}">selected</c:if>>${year}</option>
						</c:forEach>
					</select>
				</td>
				<th>학기</th>
				<td>
					<select class="infoText" name="semester" id="semester">
						<option value="1"
						<c:if test="${preYearMap.SEMESTER == 1}">selected</c:if>>1학기</option>
						<option value="2"
						<c:if test="${preYearMap.SEMESTER == 2}">selected</c:if>>2학기</option>
					</select>
				</td>
				<th>학과전공</th>
				<td>
					<select class="infoText" name="department" id="department">
						<option value="">전체</option>
					</select>
				</td>
				<th></th>
			</tr>
			<tr>
				<td colspan="7" style="background: #F3F8FF; height: 5px;"></td>
			</tr>
			<tr>
				<th>이수구분</th>
				<td>
					<select class="infoText" name="category" id="category">
						<option value="">전체</option>
						<option value="전필">전공필수(전필)</option>
						<option value="전선">전공선택(전선)</option>
						<option value="교필">교양필수(교필)</option>
						<option value="교선">교양선택(교선)</option>
					</select>
				</td>
				<th>과목번호/명</th>
				<td>
					<input class="infoText" type="text" name="subject" id="subject" placeholder="미입력시 전체조회">
				</td>
				<td colspan="2">
					<button type="button" class="btn btn-secondary" id="btn2GetList" style="height: 28px;margin-top:-2px;">
						<p style="margin-top: -4px;">조회</p>
					</button>
				</td>
				<th></th>
			</tr>
			<tr>
				<td colspan="7" style="background: #F3F8FF; height: 10px;"></td>
			</tr>
		</table>
	
		<br><br>
		
		<i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;수강편람 조회
		<p id="tellCnt">
			[총 <span id="cntSpan"></span>건]
		</p>
		
		<br><br>
		
		<div id="tgradeYellowBox">
			<span id="tgradeGreenText"><i class="mdi mdi-square-medium"></i>&emsp;폐강강좌&emsp;</span><span
				id="beRedSpan">&emsp;&emsp;</span>
		</div>

		<br>

		<div id="grid"></div>
		
		<br>
	</div>
</body>
</html>