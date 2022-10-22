<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보</title>

<style type="text/css">
	#weatherTable {
		text-align : center;
	}
	#weatherTable td{
		width : 100px;
		height : 50px;
	}
	#weatherImg {
		width : 100px;
		padding : 5px;
	}
	#weatherTable tr td:nth-child(2) {
		text-align : right;
	}
</style>
</head>
<script type="text/javascript" defer="defer">

	//오늘의 대기/날씨
	//지금 시간 불러오기
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var hours = today.getHours();
	var minutes = today.getMinutes();
	
	//날씨 정보에 들어갈 값 가공하기
	if(30 <= minutes && minutes <= 59) {
		hours += 1;
	}
	
	var wtDt = year + '' + month + '' + day;
	var wtTm = ('00' + hours).slice(-2);
	var weatherInfoStr = year + '.' + month + '.' + day + ' ' + wtTm + ":00";
	
	wtTm += "00";

	
	function weatherInfo(res, num) {
		
		var weatherImgName = '';

		if(num == 1) {
			//weatherVO가 도착한 경우
			$('#weatherInfo').text(weatherInfoStr);
			$('#weatherTemp').text(res.wtTmp + "°C"); //1시간 기온
			//현재 날씨
			if(res.wtSky == 1) {
				$('#currentWeather').text("맑음");
				if(6 <= hours || hours < 18) {
					weatherImgName = 'sunny_day.png';
				}else {
					weatherImgName = 'sunny_night.png';
				}
			}else if(res.wtSky == 3) {
				$('#currentWeather').text("구름많음");
				if(6 <= hours || hours < 18) {
					weatherImgName = 'littleCloudy_day.png';
				}else {
					weatherImgName = 'littleCloudy_night.png';
				}
			}else if(res.wtSky == 4) {
				$('#currentWeather').text("흐림");
				weatherImgName = 'cloudy.png';
			}
			if(res.wtPty == 1 || res.wtPty == 4) {
				weatherImgName = 'cloudyRainy.png';
			}else if(res.wtPty == 2) {
				weatherImgName = 'rainySnowy.png';
			}else if(res.wtPty == 3) {
				weatherImgName = 'cloudySnowy.png';
			}
			$('#weatherImg').attr("src", "/resources/weatherImg/" + weatherImgName); //날씨 이미지
			$('#precipitation').text(res.wtPop + "%"); //강수확률
			$('#windSpeed').text(res.wtWsd + "m/s"); //풍속
			$('#humidity').text(res.wtReh + "%"); //습도
			
			var windDirection = Math.floor((res.wtVec + 22.5 * 0.5) / 22.5);
			if(windDirection == 0) {
				$('#windDirection').text("북향");
			}else if(windDirection == 1) {
				$('#windDirection').text("북북동향");
			}else if(windDirection == 2) {
				$('#windDirection').text("북동향");
			}else if(windDirection == 3) {
				$('#windDirection').text("동북동향");
			}else if(windDirection == 4) {
				$('#windDirection').text("동향");
			}else if(windDirection == 5) {
				$('#windDirection').text("동남동향");
			}else if(windDirection == 6) {
				$('#windDirection').text("남동향");
			}else if(windDirection == 7) {
				$('#windDirection').text("남남동향");
			}else if(windDirection == 8) {
				$('#windDirection').text("남향");
			}else if(windDirection == 9) {
				$('#windDirection').text("남남서향");
			}else if(windDirection == 10) {
				$('#windDirection').text("남서향");
			}else if(windDirection == 11) {
				$('#windDirection').text("서남서향");
			}else if(windDirection == 12) {
				$('#windDirection').text("서향");
			}else if(windDirection == 13) {
				$('#windDirection').text("서남서향");
			}else if(windDirection == 14) {
				$('#windDirection').text("북서향");
			}else if(windDirection == 15) {
				$('#windDirection').text("북북서향");
			}else {
				$('#windDirection').text("북향");
			}
			
		}else if(num == 2) {
			//기상청 오류
			$('#weatherInfo').text("※ 기상청 서비스 일시 중단");
			$('#weatherImg').attr("src", "/resources/weatherImg/weatherError.png");
		}
	}
	
	window.onload = function() {
		
		//오늘의 대기/날씨
		let wtData = {
				"wtDt" : wtDt,
				"wtTm" : wtTm
		};
		
		$.ajax({
			url : "/weather/getWeather",
			type : "POST",
			data : JSON.stringify(wtData),
			dataType : "JSON",
			contentType : "application/json;charset=utf-8",
			success : function(res) {
				
				if(res.wtCd == 1 && res.wtDt == 99999999) {
					//날씨 정보가 없는 경우
					//오늘 날씨 정보를 DB에 저장
					$.ajax({
						url : "/weather/updateWeather",
						type : "GET",
						dataType : "JSON",
						contentType : "application/json;charset=utf-8",
						success : function(res) {
							if(res.wtCd == 1 && res.wtDt == 99999999) {
								weatherInfo(res, 2);
							}else {
								weatherInfo(res, 1);
							}
						}
					});
				}else {
					//날씨 정보가 있는 경우
					weatherInfo(res, 1);
				}
			},
			error : function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);       
			}     
		});
		
	}
</script>
<body>
	<div>
		대전광역시 중구 오류동<br>
		<span id="weatherInfo"></span>
		<table id="weatherTable" border="1">
			<tr>
				<td rowspan="5" id="totalInfo">
					<img id="weatherImg" />
					<span id="weatherTemp"></span>
				</td>
				<th>현재날씨</th>
				<td id="currentWeather" style="text-align : right;"></td>
			</tr>
			<tr>
				<th>강수확률</th>
				<td id="precipitation"></td>
			</tr>
			<tr>
				<th>풍향</th>
				<td id="windDirection"></td>
			</tr>
			<tr>
				<th>풍속</th>
				<td id="windSpeed"></td>
			</tr>
			<tr>
				<th>습도</th>
				<td id="humidity"></td>
			</tr>
		</table>
	</div>
</body>
</html>