<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 내역 포틀릿</title>

<style type="text/css">
	#portletRegHistoryTable {
		text-align : center;
	}
</style>
</head>
<script type="text/javascript" defer="defer">
	function getRegHistoryList(yrNsem) {
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/register/getRegHistoryList",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				$('#portletRegHistoryTable').empty();
				
				str = '';
				str += '<tr><th>교과목명</th><th>학점/시수</th><th>이수구분</th><th>담당교수</th></tr>';
				
				$.each(res, function(i, v) {
					str += '<tr><td style="text-align:left;">'+ v.lecaNm +'</td>';
					str += '<td>'+ v.lecaCrd + '</td>';
					str += '<td>'+ v.lecaCon + '</td>';
					str += '<td>'+ v.lecaBook + '</td></tr>';
				});
				
				$('#portletRegHistoryTable').append(str);
			}
		});
	}
	function getRegHistoryCnt(yrNsem) {
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/tgrade/getTgradeCnt",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				$("#regHistoryCnt").text(res.total); //같이 넣어줄것
			}
		});
	}
</script>
<body>
	<div>
		<select id="portletRegHistory" onchange="javascript:getRegHistoryList(this);getRegHistoryCnt(this);">
			<c:forEach var="yrVal" items="${yrNSem}">
				<option value = '${yrVal.lecaYr}${yrVal.lecaSem}'>${yrVal.lecaYr}학년도 ${yrVal.lecaSem}학기</option>
			</c:forEach>
		</select>
		신청학점 : <span id="regHistoryCnt" style="color:rgb(225, 39, 64);">${totalMap.total}</span>
		<table id="portletRegHistoryTable" border="1">
			<tr>
				<th>교과목명</th>
				<th>학점/시수</th>
				<th>이수구분</th>
				<th>담당교수</th>
			</tr>
			<c:forEach var="regHistory" items="${regHistoryList}">
				<tr>
					<td style="text-align:left;">${regHistory.lecaNm}</td>
					<td>${regHistory.lecaCrd}</td>
					<td>${regHistory.lecaCon}</td>
					<td>${regHistory.lecaBook}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>