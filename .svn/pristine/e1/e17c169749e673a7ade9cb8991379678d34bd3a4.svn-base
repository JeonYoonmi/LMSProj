<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart.js를 이용한 Doughnut Chart</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

</head>
<body>
	<canvas id="myChart" style="width:200px; height:150px;"></canvas>
	
	<script type="text/javascript" defer="defer">
		const context = document.getElementById('myChart').getContext('2d');
		const data = {
				labels : ['전필', '전선', '교필', '교선', '잔여'],
				datasets : [{
					label : 'My First Dataset',
					data : [10, 15, 20, 25, 30],
					backgroundColor : [
						'#304D63',
						'#B2E7E8',
						'#8FB9AA',
						'#F2D096',
						'#ED8975'
					],
					hoverOffset : 4,
				}]
		};
		const myChart = new Chart(context, {
			type : 'doughnut',
			data : data, 
			options : {
				responsive : false,
				legend : {
					position : 'right',
					labels : {
						pointStyle : 'circle',
						usePointStyle : true,
						padding : 15
					}
				}
			}
		});
		Chart.pluginService.register({
			beforeDraw : function(chart) {
				var width = chart.chart.width,
					height = chart.chart.height,
					ctx = chart.chart.ctx;
		
				ctx.restore();
				
				var fontSize = (height / 150).toFixed(2);
				ctx.font = fontSize + "em sans-serif";
				ctx.textBaseline = "middle";
				
				var text = "150(0)",
					textX = Math.round((width - ctx.measureText(text).width) / 3.5),
					textY = height / 2;
				ctx.fillText(text, textX, textY);
				ctx.save();
			}
		});
	</script>
</body>
</html>