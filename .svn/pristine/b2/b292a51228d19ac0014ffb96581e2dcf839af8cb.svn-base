<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 조회 포틀릿</title>

<style type="text/css">
	#portletTgradeTable {
		text-align : center;
	}
</style>
</head>
<script type="text/javascript" defer="defer">
	function getTgradeList(yrNsem) {
		yrNsem = $(yrNsem).val();
		
		let dataObject = {
			yrNsem : yrNsem
		};
		
		$.ajax({
			url : "/tgrade/getTgradeList",
			type : "POST",
			data : JSON.stringify(dataObject),
			contentType : "application/json;charset=utf-8",
			dataType : "JSON",
			success : function(res) {
				$('#portletTgradeTable').empty();
				
				str = '';
				str += '<tr><th>교과목명</th><th>이수구분</th><th>학점</th><th>평가</th></tr>';
				
				$.each(res, function(i, v) {
					str += '<tr><td style="text-align:left;">'+ v.lecaNm +'</td>';
					str += '<td>'+ v.lecaCon + '</td>';
					str += '<td>'+ v.lecaCrd + '</td>';
					str += '<td>'+ v.lecaBook + '</td></tr>';
				});
				
				$('#portletTgradeTable').append(str);
			}
		});
	}
	function getTgradeCnt(yrNsem) {
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
				$("#tgradeCnt").text(res.total);
				$("#tgradeGetCnt").text(res.totalNotF);
			}
		});
	}
</script>
<body>
	<div>
		<select id="portletTgrade" onchange="javascript:getTgradeList(this);getTgradeCnt(this);">
			<c:forEach var="yrVal" items="${yrNSem}">
				<option value = '${yrVal.lecaYr}${yrVal.lecaSem}'>${yrVal.lecaYr}학년도 ${yrVal.lecaSem}학기</option>
			</c:forEach>
		</select>
		신청(평점평균반영) : <span id="tgradeCnt" style="color:blue;">${totalMap.total }</span>&nbsp;
		취득 : <span id="tgradeGetCnt" style="color:rgb(225, 39, 64);">${totalMap.totalNotF }</span>
		<table id="portletTgradeTable" border="1">
			<tr>
				<th>교과목명</th>
				<th>이수구분</th>
				<th>학점</th>
				<th>평가</th>
			</tr>
			<c:forEach var="gradeVal" items="${gradeList}">
				<tr>
					<td style="text-align:left;">${gradeVal.lecaNm}</td>
					<td>${gradeVal.lecaCon}</td>
					<td>${gradeVal.lecaCrd}</td>
					<td>${gradeVal.lecaBook}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>