<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table *{
text-align: center;
font-size: 1.1em;
}
tr{
height : 40px;
}
</style>

<script type="text/javascript" defer="defer">
//동적으로 테이블 행 합치기
$(function(){
	$('.table_id').each(function(){
		var rows = $(".table_id:contains('" + $(this).text()+"')");
		console.log(rows);
		if(rows.length > 1){
			rows.eq(0).attr("rowspan", rows.length);
			rows.not(":eq(0)").remove();
		}
	})
})
</script>
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i>등록 및 장학  <i class="dripicons-chevron-right"></i><span>등록금납부이력</span>
<i class="dripicons-chevron-right"></i><span style="font-weight: bold;">등록금 목록 조회</span>
</div>
<br><br>
<p id="stuPaymentListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;등록금 목록</p>
<div class="card" style="width : 100%;">
	<div class="card-body">
		<table border = '1' style="width : 100%;">
		<thead>
		<tr>
		<th>단과대학</th>
		<th>학과</th>
		<th>등록금(원)</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${collegeFeeList }">
		<tr>
		<td class="table_id">${item.COL_NM }</td>
		<td>${item.DEP_NM }</td>
		<td style="text-align: right"><fmt:formatNumber value="${item.COL_FEE }" pattern="#,###" /></td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
</div>
</body>
</html>