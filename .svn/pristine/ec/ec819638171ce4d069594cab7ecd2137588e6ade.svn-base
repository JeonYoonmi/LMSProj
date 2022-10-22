<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>강의계획서 결재</title>
<style type="text/css">
#timeTableChoice{
	width: 830px;
	margin-left: 30px;
	margin-top: 17px;
	
}
#timeTableChoice td {
	width : 50px;
	height : 30px;
	text-align : center;
	font-weight : bold;
}
#timeTableChoice th{
	text-align: center;
}
#rightWhole{
	width: 30%;
    height: 580px;
    float: right;
    margin-right: 60px;
}

#okdiv{
	height: 20%;
	margin-top: 6px;
}

#applyInfo{
	height: 72%;
}

#okdivCnt{
	border : 1px solid gray;
	width: 99%;
    height: 88%;
}
input:disabled {
    background: white;
}
.icon{
	font-size: 1.3em;
	float: left;
	color : green;
}
.icon2{
	font-size: 1.3em;
	float: left;
	color : red;
}
.but{
	width: 201px;
}
#applyInfoTable th{
	text-align: center;
}
</style>
<script type="text/javascript" defer="defer">
window.onload = function() {
	//랜덤 색상 배열
	var colorArr = ['lime', 'gray', 'lightblue', 'lightgray', 'pink', 'orange'];
	
	var lecaRoom = $('#buildingNm option:selected').attr('id');
	var lecaUnit = $('#roomNum option:selected').attr('id');
	$.ajax({
		url : '/approval/buildingList',
		type : 'post',
		dataType : 'JSON',
		success : function(result){
			console.log(result);
			str = '';
			
			$.each(result, function(i, v){
				str += '<option id="'+ v.bldCd +'">' + v.bldNm + '</option>';
			})
			
			$('#buildingNm').html(str);
			$('#buildingNm').trigger('change');
			
		}
	})
	
	//단과대 건물명이 바뀔때마다 이벤트
	$('#buildingNm').on('change', function(){
		buildNm = this.value;
		param = {"bldNm" : buildNm};
		
		$.ajax({
			url : '/approval/lecaRoomListPost',
			type : 'post',
			data : JSON.stringify(param),
			dataType : 'JSON',
			contentType : 'application/json;charset=utf-8',
			success : function(result){
				console.log(result);
				str = '';
				
				$.each(result, function(i, v){
					str += '<option id="' + v.roomCd + '">' + v.roomNo + '</option>';
				})
				
				$('#roomNum').html(str);
				$('#roomNum').trigger('change');
			}
		})
	});
	
	//호실이 바뀔때마다 이벤트
	$('#roomNum').on('change', function(){
		
		lecaRoom = $('#buildingNm option:selected').attr('id');
		lecaUnit = $('#roomNum option:selected').attr('id');
		lecaRoomNo = $('#roomNum option:selected').val();
		var roomNumData = {"lecaRoom" : lecaRoom
							,"lecaUnit" : lecaUnit};
		$('.highlight').attr('class', '');
		
		$('td').css({
			"background" : ""
		})
		
		var peopleData = {"bldCd" : lecaRoom,
							"roomNo" : lecaRoomNo} 
		
		//수용가능인원 띄우기
		$.ajax({
			url : '/approval/selectPeopleCnt',
			type : 'post',
			data : JSON.stringify(peopleData),
			dataType : 'JSON',
			contentType : 'application/json;charset=utf-8',
			success : function(result){
				console.log(result);
				
				$('#pepleCnt').val(result.roomMax);
				
				var str = '';
				str += '<tr><th style="width : 50px; height: 40px;"></th><th>월</th> <th>화</th> <th>수</th> <th>목</th><th>금</th></tr>';
	  			str += '<tr><th rowspan="2">1교시</th><td class="removeText" data-lec-cd="0" id="MON01"></td><td class="removeText" data-lec-cd="0" id="TUE01"></td><td class="removeText" data-lec-cd="0" id="WED01"></td><td class="removeText" data-lec-cd="0" id="THU01"></td><td class="removeText" data-lec-cd="0" id="FRI01"></td></tr>';
	  			str += '<tr><td class="removeText" data-lec-cd="0" id="MON02"></td><td class="removeText" data-lec-cd="0" id="TUE02"></td><td class="removeText" data-lec-cd="0" id="WED02"></td><td class="removeText" data-lec-cd="0" id="THU02"></td><td class="removeText" data-lec-cd="0" id="FRI02"></td></tr>';
	  			str += '<tr><th rowspan="2">2교시</th><td class="removeText" data-lec-cd="0" id="MON03"></td><td class="removeText" data-lec-cd="0" id="TUE03"></td><td class="removeText" data-lec-cd="0" id="WED03"></td><td class="removeText" data-lec-cd="0" id="THU03"></td><td class="removeText" data-lec-cd="0" id="FRI03"></td></tr>';
	  			str += '<tr><td class="removeText" data-lec-cd="0" id="MON04"></td><td class="removeText" data-lec-cd="0" id="TUE04"></td><td class="removeText" data-lec-cd="0" id="WED04"></td><td class="removeText" data-lec-cd="0" id="THU04"></td><td class="removeText" data-lec-cd="0" id="FRI04"></td></tr>';
				str += '<tr><th rowspan="2">3교시</th><td class="removeText" data-lec-cd="0" id="MON05"></td><td class="removeText" data-lec-cd="0" id="TUE05"></td><td class="removeText" data-lec-cd="0" id="WED05"></td><td class="removeText" data-lec-cd="0" id="THU05"></td><td class="removeText" data-lec-cd="0" id="FRI05"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON06"></td><td class="removeText" data-lec-cd="0" id="TUE06"></td><td class="removeText" data-lec-cd="0" id="WED06"></td><td class="removeText" data-lec-cd="0" id="THU06"></td><td class="removeText" data-lec-cd="0" id="FRI06"></td></tr>';
				str += '<tr><th rowspan="2">4교시</th><td class="removeText" data-lec-cd="0" id="MON07"></td><td class="removeText" data-lec-cd="0" id="TUE07"></td><td class="removeText" data-lec-cd="0" id="WED07"></td><td class="removeText" data-lec-cd="0" id="THU07"></td><td class="removeText" data-lec-cd="0" id="FRI07"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON08"></td><td class="removeText" data-lec-cd="0" id="TUE08"></td><td class="removeText" data-lec-cd="0" id="WED08"></td><td class="removeText" data-lec-cd="0" id="THU08"></td><td class="removeText" data-lec-cd="0" id="FRI08"></td></tr>';
				str += '<tr><th rowspan="2">5교시</th><td class="removeText" data-lec-cd="0" id="MON09"></td><td class="removeText" data-lec-cd="0" id="TUE09"></td><td class="removeText" data-lec-cd="0" id="WED09"></td><td class="removeText" data-lec-cd="0" id="THU09"></td><td class="removeText" data-lec-cd="0" id="FRI09"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON10"></td><td class="removeText" data-lec-cd="0" id="TUE10"></td><td class="removeText" data-lec-cd="0" id="WED10"></td><td class="removeText" data-lec-cd="0" id="THU10"></td><td class="removeText" data-lec-cd="0" id="FRI10"></td></tr>';
				str += '<tr><th rowspan="2">6교시</th><td class="removeText" data-lec-cd="0" id="MON11"></td><td class="removeText" data-lec-cd="0" id="TUE11"></td><td class="removeText" data-lec-cd="0" id="WED11"></td><td class="removeText" data-lec-cd="0" id="THU11"></td><td class="removeText" data-lec-cd="0" id="FRI11"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON12"></td><td class="removeText" data-lec-cd="0" id="TUE12"></td><td class="removeText" data-lec-cd="0" id="WED12"></td><td class="removeText" data-lec-cd="0" id="THU12"></td><td class="removeText" data-lec-cd="0" id="FRI12"></td></tr>';
				str += '<tr><th rowspan="2">7교시</th><td class="removeText" data-lec-cd="0" id="MON13"></td><td class="removeText" data-lec-cd="0" id="TUE13"></td><td class="removeText" data-lec-cd="0" id="WED13"></td><td class="removeText" data-lec-cd="0" id="THU13"></td><td class="removeText" data-lec-cd="0" id="FRI13"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON14"></td><td class="removeText" data-lec-cd="0" id="TUE14"></td><td class="removeText" data-lec-cd="0" id="WED14"></td><td class="removeText" data-lec-cd="0" id="THU14"></td><td class="removeText" data-lec-cd="0" id="FRI14"></td></tr>';
				str += '<tr><th rowspan="2">8교시</th><td class="removeText" data-lec-cd="0" id="MON15"></td><td class="removeText" data-lec-cd="0" id="TUE15"></td><td class="removeText" data-lec-cd="0" id="WED15"></td><td class="removeText" data-lec-cd="0" id="THU15"></td><td class="removeText" data-lec-cd="0" id="FRI15"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON16"></td><td class="removeText" data-lec-cd="0" id="TUE16"></td><td class="removeText" data-lec-cd="0" id="WED16"></td><td class="removeText" data-lec-cd="0" id="THU16"></td><td class="removeText" data-lec-cd="0" id="FRI16"></td></tr>';
				str += '<tr><th rowspan="2">9교시</th><td class="removeText" data-lec-cd="0" id="MON17"></td><td class="removeText" data-lec-cd="0" id="TUE17"></td><td class="removeText" data-lec-cd="0" id="WED17"></td><td class="removeText" data-lec-cd="0" id="THU17"></td><td class="removeText" data-lec-cd="0" id="FRI17"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON18"></td><td class="removeText" data-lec-cd="0" id="TUE18"></td><td class="removeText" data-lec-cd="0" id="WED18"></td><td class="removeText" data-lec-cd="0" id="THU18"></td><td class="removeText" data-lec-cd="0" id="FRI18"></td></tr>';
				$('#timeTableChoice').html(str);
				
//		 		//호실에 맞는 강의시간표 띄우기
		 		$.ajax({
		 			url : '/approval/roomListGet',
		 			type : 'post',
		 			data : JSON.stringify(roomNumData),
		 			dataType : 'JSON',
		 			contentType : 'application/json;charset=utf-8',
		 			success : function(result){
		 				console.log(result);

 						var random = [];
 						random = selectIndex(6, 6);
 						console.log(random);
						for(var i=0; i<6; i++){
							colorArr[i].push = random[i];
						}
							console.log("==================")
							console.log(colorArr);
 						
		 				if(result.length == 0){
		 					alert("아직 강의 시간표가 없습니다.")
		 				}else{
		 					for(var i=0; i<result.length; i++){
		 						var wholeTime = result[i].TM_CD;
		 						
		 						var str = '';
		 						
		 						str += result[i].LECA_NM;
		 						str += '<br>';
		 						str += result[i].PRO_NM + "교수";
		 						
		 						
								$('#' + wholeTime).html(str);
								document.querySelector('#' + wholeTime).dataset.lecCd = result[i].LECA_CD;
								
	
		 					}
							
	 						var cnt = 0;
	 						var idx = 0;
	 						var week = ['MON', 'TUE', 'WED', 'THU', 'FRI'];
	 						for(var l = 0; l < 5; l++){
			 					for(var i = 1; i <= 17; i++){
			 						console.log(week[l]);
			 						if(i < 10){
// 			 							console.log("i : " + i);
			 							var td = document.querySelector('#'+ week[l] +'0' + i);
			 							if(td != null){
				 							var lecCd = td.dataset.lecCd;
			 							}
			 						}else{
// 			 							console.log("i : " + i);
			 							var td = document.querySelector('#'+ week[l] + i);
			 							if(td != null){
				 							var lecCd = td.dataset.lecCd;
			 							}
			 						}
			 							
		 							for(var j = i; j <= 18; j++){
			 							idx = i; 
			 							
			 							if(j < 10){
			 								var td = document.querySelector('#'+ week[l] +'0' + j);
				 							if(td != null){
					 							var lecCd2 = td.dataset.lecCd;
				 							}
			 							}else{
			 								var td = document.querySelector('#'+ week[l] + j);
				 							if(td != null){
					 							var lecCd2 = td.dataset.lecCd;
				 							}
			 							}
		 								
		 								if((lecCd != 0 || lecCd2 != 0) && lecCd == lecCd2){
// 			 								console.log("i : " + i + "j : " + j + " / lecCd : " + lecCd + " / lecCd2 : " + lecCd2);
		 									cnt++;
		 								}
		 							}
			 						
// 			 						console.log("idx : " + idx + " / cnt : " + cnt);
			 						if(cnt > 0){
				 						if(idx < 10){
											$('#'+ week[l] + '0' + idx).attr("rowspan", cnt);
				 						}else{
											$('#'+ week[l] + idx).attr("rowspan", cnt);
				 						}
				 						
				 						for(var k = parseInt(idx) + 1; k < parseInt(idx) + parseInt(cnt); k++){
				 							if(k<10){
						 						$('#'+ week[l] + '0' + k).remove();
				 							}else{
						 						$('#'+ week[l] + k).remove();
				 							}
				 						}
			 						}
			 						
			 						cnt = 0;
			 					}
	 						}
	 						
	 						//색깔 랜덤 넣기 시작
	 						var colorTd = [];
	 						var lecCdData = [];
	 						var finalData = [];
							colorTd.push($('#timeTableChoice').find('td'));
	 						
	 						console.log(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
	 						console.log(colorTd);
	 						for(var i=0; i<colorTd[0].length; i++){
	 							lecCdData.push(colorTd[0][i].dataset);
	 							if(lecCdData[i].lecCd != 0){
			 						finalData.push(lecCdData[i].lecCd);
	 							}
	 						}
	 						console.log(finalData);
	 						
	 						var setArr = new Set(finalData);
	 						setArr = Array.from(setArr);
	 						console.log(setArr);
	 						
	 						for(var i=0; i<setArr.length; i++){
	 							console.log(i);
	 							console.log(setArr[i]);
	 							$('[data-lec-cd = "' + setArr[i] + '"]').css('background', colorArr[i]);
	 						}
	 						
		 				}
		 			}
		 		})
			}
		})
		
		

	})
	
	
	//selecting random index without same element
	function selectIndex(totalIndex, selectingNumber){
		  let randomIndexArray = []
		  for (i=0; i<selectingNumber; i++) {   //check if there is any duplicate index
		    randomNum = Math.floor(Math.random() * totalIndex)
		    if (randomIndexArray.indexOf(randomNum) === -1) {
		      randomIndexArray.push(randomNum)
		    } else { //if the randomNum is already in the array retry
		      i--
		    }
		  }
		  return randomIndexArray
	}
}


</script>

</head>

<body>
	<div id="whole" style="padding: 30px;">
		<div class="form-group">
			<div style="width: 250px; float: left;">
				<label for="example-select">단과대 건물명</label> <select
					class="form-control" id="buildingNm" style="width: 200px;">
				</select>
			</div>
			<div style="float: left; width: 250px">
				<label for="example-select">호실</label> <select class="form-control"
					id="roomNum" style="width: 200px;">
				</select>
			</div>
			<div style="float: left; width: 250px">
				<label for="example-select">수용가능 인원</label> 
				<input type="text" id="pepleCnt" class="form-control" style="width : 200px; background: white;" disabled>
			</div>
		</div>
	</div>
<br><br>
  	<div id="blockNum3TimeTable" style="float : left; width : 400px;">
  		<p style="margin-left: 28px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의실 시간표</p>
  		<table id="timeTableChoice" border="1">
  			<tr><th style="width : 50px; height: 40px;"></th><th>월</th> <th>화</th> <th>수</th> <th>목</th><th>금</th></tr>
  			<tr><th rowspan="2">1교시</th><td class="removeText" data-lec-cd="0" id="MON01"></td><td class="removeText" data-lec-cd="0" id="TUE01"></td><td class="removeText" data-lec-cd="0" id="WED01"></td><td class="removeText" data-lec-cd="0" id="THU01"></td><td class="removeText" data-lec-cd="0" id="FRI01"></td></tr>
  			<tr><td class="removeText" data-lec-cd="0" id="MON02"></td><td class="removeText" data-lec-cd="0" id="TUE02"></td><td class="removeText" data-lec-cd="0" id="WED02"></td><td class="removeText" data-lec-cd="0" id="THU02"></td><td class="removeText" data-lec-cd="0" id="FRI02"></td></tr>
  			<tr><th rowspan="2">2교시</th><td class="removeText" data-lec-cd="0" id="MON03"></td><td class="removeText" data-lec-cd="0" id="TUE03"></td><td class="removeText" data-lec-cd="0" id="WED03"></td><td class="removeText" data-lec-cd="0" id="THU03"></td><td class="removeText" data-lec-cd="0" id="FRI03"></td></tr>
  			<tr><td class="removeText" data-lec-cd="0" id="MON04"></td><td class="removeText" data-lec-cd="0" id="TUE04"></td><td class="removeText" data-lec-cd="0" id="WED04"></td><td class="removeText" data-lec-cd="0" id="THU04"></td><td class="removeText" data-lec-cd="0" id="FRI04"></td></tr>
			<tr><th rowspan="2">3교시</th><td class="removeText" data-lec-cd="0" id="MON05"></td><td class="removeText" data-lec-cd="0" id="TUE05"></td><td class="removeText" data-lec-cd="0" id="WED05"></td><td class="removeText" data-lec-cd="0" id="THU05"></td><td class="removeText" data-lec-cd="0" id="FRI05"></td></tr>
			<tr><td class="removeText" data-lec-cd="0" id="MON06"></td><td class="removeText" data-lec-cd="0" id="TUE06"></td><td class="removeText" data-lec-cd="0" id="WED06"></td><td class="removeText" data-lec-cd="0" id="THU06"></td><td class="removeText" data-lec-cd="0" id="FRI06"></td></tr>
			<tr><th rowspan="2">4교시</th><td class="removeText" data-lec-cd="0" id="MON07"></td><td class="removeText" data-lec-cd="0" id="TUE07"></td><td class="removeText" data-lec-cd="0" id="WED07"></td><td class="removeText" data-lec-cd="0" id="THU07"></td><td class="removeText" data-lec-cd="0" id="FRI07"></td></tr>
			<tr><td class="removeText" data-lec-cd="0" id="MON08"></td><td class="removeText" data-lec-cd="0" id="TUE08"></td><td class="removeText" data-lec-cd="0" id="WED08"></td><td class="removeText" data-lec-cd="0" id="THU08"></td><td class="removeText" data-lec-cd="0" id="FRI08"></td></tr>
			<tr><th rowspan="2">5교시</th><td class="removeText" data-lec-cd="0" id="MON09"></td><td class="removeText" data-lec-cd="0" id="TUE09"></td><td class="removeText" data-lec-cd="0" id="WED09"></td><td class="removeText" data-lec-cd="0" id="THU09"></td><td class="removeText" data-lec-cd="0" id="FRI09"></td></tr>
			<tr><td class="removeText" data-lec-cd="0" id="MON10"></td><td class="removeText" data-lec-cd="0" id="TUE10"></td><td class="removeText" data-lec-cd="0" id="WED10"></td><td class="removeText" data-lec-cd="0" id="THU10"></td><td class="removeText" data-lec-cd="0" id="FRI10"></td></tr>
			<tr><th rowspan="2">6교시</th><td class="removeText" data-lec-cd="0" id="MON11"></td><td class="removeText" data-lec-cd="0" id="TUE11"></td><td class="removeText" data-lec-cd="0" id="WED11"></td><td class="removeText" data-lec-cd="0" id="THU11"></td><td class="removeText" data-lec-cd="0" id="FRI11"></td></tr>
			<tr><td class="removeText" data-lec-cd="0" id="MON12"></td><td class="removeText" data-lec-cd="0" id="TUE12"></td><td class="removeText" data-lec-cd="0" id="WED12"></td><td class="removeText" data-lec-cd="0" id="THU12"></td><td class="removeText" data-lec-cd="0" id="FRI12"></td></tr>
			<tr><th rowspan="2">7교시</th><td class="removeText" data-lec-cd="0" id="MON13"></td><td class="removeText" data-lec-cd="0" id="TUE13"></td><td class="removeText" data-lec-cd="0" id="WED13"></td><td class="removeText" data-lec-cd="0" id="THU13"></td><td class="removeText" data-lec-cd="0" id="FRI13"></td></tr>
			<tr><td class="removeText" data-lec-cd="0" id="MON14"></td><td class="removeText" data-lec-cd="0" id="TUE14"></td><td class="removeText" data-lec-cd="0" id="WED14"></td><td class="removeText" data-lec-cd="0" id="THU14"></td><td class="removeText" data-lec-cd="0" id="FRI14"></td></tr>
			<tr><th rowspan="2">8교시</th><td class="removeText" data-lec-cd="0" id="MON15"></td><td class="removeText" data-lec-cd="0" id="TUE15"></td><td class="removeText" data-lec-cd="0" id="WED15"></td><td class="removeText" data-lec-cd="0" id="THU15"></td><td class="removeText" data-lec-cd="0" id="FRI15"></td></tr>
			<tr><td class="removeText" data-lec-cd="0" id="MON16"></td><td class="removeText" data-lec-cd="0" id="TUE16"></td><td class="removeText" data-lec-cd="0" id="WED16"></td><td class="removeText" data-lec-cd="0" id="THU16"></td><td class="removeText" data-lec-cd="0" id="FRI16"></td></tr>
			<tr><th rowspan="2">9교시</th><td class="removeText" data-lec-cd="0" id="MON17"></td><td class="removeText" data-lec-cd="0" id="TUE17"></td><td class="removeText" data-lec-cd="0" id="WED17"></td><td class="removeText" data-lec-cd="0" id="THU17"></td><td class="removeText" data-lec-cd="0" id="FRI17"></td></tr>
			<tr><td class="removeText" data-lec-cd="0" id="MON18"></td><td class="removeText" data-lec-cd="0" id="TUE18"></td><td class="removeText" data-lec-cd="0" id="WED18"></td><td class="removeText" data-lec-cd="0" id="THU18"></td><td class="removeText" data-lec-cd="0" id="FRI18"></td></tr>
  		</table>
  	</div>
  	<input type="hidden" id="lecaCd" value="${lecaCd}">
  	<input type="hidden" id="mgrCd" value="${mgrCd}">
  	<input type="hidden" id="proCd" value="${map.PRO_CD}">

</body>
</html>
