<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의시간표 포틀릿</title>
<style type="text/css">
	#portletTimeTable {
		text-align : center;
	}
	#portletTimeTable td{
		height : 15px;
		width : 30px;
		font-size : 0.5em;
	}
</style>
<script type="text/javascript">
	var colorArr = [
		"#fbf8cc", "#fde4cf", "#ffcfd2", "#f1c0e8", "#cfbaf0",
		"#a3c4f3", "#90dbf4", "#8eecf5", "#98f5e1", "#b9fbc0"
	];
	var colorNum = 0;
	
	function getTimeTable(yrNsem) {
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/tgrade/getTimeTable",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				$('#portletTimeTable td').text('');
				$('#portletTimeTable td').css('background-color', '');
				$('#timeTableSub').empty();
				
				subject = '';
				str = '';
				
				$.each(res, function(i, v) {
					if(subject != v.subCd) {
						subject = v.subCd;
						colorNum ++;
						
						str += '<span style="color:'+ colorArr[colorNum - 1] + '">●</span>&nbsp;';
						str += v.lecaNm + "<br>";
						
						if(colorNum > 10) {
							colorNum = 1;
						}
					}
					$('#portletTimeTable').find("tr").eq(v.lecCd).find("td").eq(v.lecaCd - 1)
					.css("background-color", colorArr[colorNum - 1]);
				});
				
				$('#timeTableSub').append(str);
			}
		});
	}
	
	window.onload = function() {
		let dataObject = {
			yrNsem : $('#portletTgrade option:selected').val()
		};
		
		$.ajax({
			url : "/tgrade/getTimeTable",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				console.log(res);
				
				subject = '';
				str = '';
				
				$.each(res, function(i, v) {
					if(subject != v.subCd) {
						subject = v.subCd;
						colorNum ++;
						
						str += '<span style="color:'+ colorArr[colorNum - 1] + '">●</span>&nbsp;';
						str += v.lecaNm + "<br>";
						
						if(colorNum > 10) {
							colorNum = 1;
						}
					}
					$('#portletTimeTable').find("tr").eq(v.lecCd).find("td").eq(v.lecaCd - 1)
					.css("background-color", colorArr[colorNum - 1]);
				});
				
				$('#timeTableSub').append(str);
			}
		});
	}
</script>
</head>
<body>
	<div>
		<select id="portletTgrade" onchange="javascript:getTimeTable(this);">
			<c:forEach var="yrVal" items="${yrNSem}">
				<option value = '${yrVal.lecaYr}${yrVal.lecaSem}'>${yrVal.lecaYr}학년도 ${yrVal.lecaSem}학기</option>
			</c:forEach>
		</select>
		<br>
		<table id="portletTimeTable" border="1" style="float:left;">
			<tr><th></th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th></tr>
  			<tr><th rowspan="2">1교시</th><td></td><td></td><td></td><td></td><td></td></tr>
  			<tr><td></td><td></td><td></td><td></td><td></td></tr>
  			<tr><th rowspan="2">2교시</th><td></td><td></td><td></td><td></td><td></td></tr>
  			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2">3교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2">4교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2">5교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2">6교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2">7교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2">8교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><th rowspan="2">9교시</th><td></td><td></td><td></td><td></td><td></td></tr>
			<tr><td></td><td></td><td></td><td></td><td></td></tr>
		</table>
		
		<div id="timeTableSub"></div>
	</div>
</body>
</html>