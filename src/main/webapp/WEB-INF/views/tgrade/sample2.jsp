<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<title>도넛차트 나와라 제발</title>
<script type="text/javascript" defer="defer">
	google.load("visualization", "1", {
		"packages" : ["coreChart"]
	});
	
	google.setOnLoadCallback(drawChart);
	
	function drawChart() {
		$.ajax({
			url : "/tgrade/getDoughnut",
			type : "POST",
			dataType : "JSON",
			success : function(res) {
				var data = google.visualization.arrayToDataTable([
					['이수구분', '학점취득현황'],
					['전필 ' + res.JP, res.JP],
					['전선 ' + res.JS, res.JS],
					['교필 ' + res.GP, res.GP],
					['교선 ' + res.GS, res.GS]
				]);
				
				var options = {
					title : "학점취득현황",
					width : 240,
		 			height : 110,
		 			pieHole : 0.75,
		 			pieSliceTextStyle: {
		 	            color: 'black',
		 	        },
				};
				
				var chart = new google.visualization.PieChart(document.getElementById("chart_doughnut"));
				chart.draw(data, options);
			}
		});
	}
</script>
</head>
<body>
	<div id="chart_doughnut"></div>
</body>
</html>