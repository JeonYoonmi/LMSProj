<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>강의계획서 결재</title>
<link rel="stylesheet" href="/resources/css/suwon.css">
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
}
#timeTableChoice td:hover {
     background-color : #FFDCDC;
}
#timeTableChoice td.highlight {
     background-color : #FF9696;
}
#timeTableChoice th{
	text-align: center;
	background: #f0f0f0;
}
#rightWhole{
	width: 30%;
    height: 580px;
    float: right;
    margin-right: 60px;
}

#okdiv{
	height: 20%;
	margin-top: 16px;
}

#applyInfo{
	height: 72%;
}

#okdivCnt{
	border : 1px solid gray;
	width: 99%;
    height: 88%;
/*     background: white; */
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
    width: 75px;
    padding-left: 5px; 
    background: #f0f0f0; 
}
#applyInfoTable td{
	padding-left: 5px;
/* 	background: white; */
}

.infoTextarea{
 	background: #fafbfe;
    border: none;
    resize: none;
}

.thHeight{
	height: 60px;
}
</style>
<script type="text/javascript" defer="defer">
window.onload = function() {
	//랜덤 색상 배열
	var colorArr = ['#ffebee', '#f3e5f5', '#e8eaf6', '#e3f2fd', '#e0f7fa', '#e8f5e9', '#fffde7', '#fff3e0', '#fbe9e7', '#efebe9', '#e1f5fe', '#e0f2f1', '#fff8e1', '#fce4ec'];
	
	var lecaRoom = $('#buildingNm option:selected').attr('id');
	var lecaUnit = $('#roomNum option:selected').attr('id');
	
	//단과대 건물명마다 호실 출력하기
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
	  			str += '<tr><th rowspan="2" class="thHeight">1교시</th><td class="removeText" data-lec-cd="0" id="MON01"></td><td class="removeText" data-lec-cd="0" id="TUE01"></td><td class="removeText" data-lec-cd="0" id="WED01"></td><td class="removeText" data-lec-cd="0" id="THU01"></td><td class="removeText" data-lec-cd="0" id="FRI01"></td></tr>';
	  			str += '<tr><td class="removeText" data-lec-cd="0" id="MON02"></td><td class="removeText" data-lec-cd="0" id="TUE02"></td><td class="removeText" data-lec-cd="0" id="WED02"></td><td class="removeText" data-lec-cd="0" id="THU02"></td><td class="removeText" data-lec-cd="0" id="FRI02"></td></tr>';
	  			str += '<tr><th rowspan="2" class="thHeight">2교시</th><td class="removeText" data-lec-cd="0" id="MON03"></td><td class="removeText" data-lec-cd="0" id="TUE03"></td><td class="removeText" data-lec-cd="0" id="WED03"></td><td class="removeText" data-lec-cd="0" id="THU03"></td><td class="removeText" data-lec-cd="0" id="FRI03"></td></tr>';
	  			str += '<tr><td class="removeText" data-lec-cd="0" id="MON04"></td><td class="removeText" data-lec-cd="0" id="TUE04"></td><td class="removeText" data-lec-cd="0" id="WED04"></td><td class="removeText" data-lec-cd="0" id="THU04"></td><td class="removeText" data-lec-cd="0" id="FRI04"></td></tr>';
				str += '<tr><th rowspan="2" class="thHeight">3교시</th><td class="removeText" data-lec-cd="0" id="MON05"></td><td class="removeText" data-lec-cd="0" id="TUE05"></td><td class="removeText" data-lec-cd="0" id="WED05"></td><td class="removeText" data-lec-cd="0" id="THU05"></td><td class="removeText" data-lec-cd="0" id="FRI05"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON06"></td><td class="removeText" data-lec-cd="0" id="TUE06"></td><td class="removeText" data-lec-cd="0" id="WED06"></td><td class="removeText" data-lec-cd="0" id="THU06"></td><td class="removeText" data-lec-cd="0" id="FRI06"></td></tr>';
				str += '<tr><th rowspan="2" class="thHeight">4교시</th><td class="removeText" data-lec-cd="0" id="MON07"></td><td class="removeText" data-lec-cd="0" id="TUE07"></td><td class="removeText" data-lec-cd="0" id="WED07"></td><td class="removeText" data-lec-cd="0" id="THU07"></td><td class="removeText" data-lec-cd="0" id="FRI07"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON08"></td><td class="removeText" data-lec-cd="0" id="TUE08"></td><td class="removeText" data-lec-cd="0" id="WED08"></td><td class="removeText" data-lec-cd="0" id="THU08"></td><td class="removeText" data-lec-cd="0" id="FRI08"></td></tr>';
				str += '<tr><th rowspan="2" class="thHeight">5교시</th><td class="removeText" data-lec-cd="0" id="MON09"></td><td class="removeText" data-lec-cd="0" id="TUE09"></td><td class="removeText" data-lec-cd="0" id="WED09"></td><td class="removeText" data-lec-cd="0" id="THU09"></td><td class="removeText" data-lec-cd="0" id="FRI09"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON10"></td><td class="removeText" data-lec-cd="0" id="TUE10"></td><td class="removeText" data-lec-cd="0" id="WED10"></td><td class="removeText" data-lec-cd="0" id="THU10"></td><td class="removeText" data-lec-cd="0" id="FRI10"></td></tr>';
				str += '<tr><th rowspan="2" class="thHeight">6교시</th><td class="removeText" data-lec-cd="0" id="MON11"></td><td class="removeText" data-lec-cd="0" id="TUE11"></td><td class="removeText" data-lec-cd="0" id="WED11"></td><td class="removeText" data-lec-cd="0" id="THU11"></td><td class="removeText" data-lec-cd="0" id="FRI11"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON12"></td><td class="removeText" data-lec-cd="0" id="TUE12"></td><td class="removeText" data-lec-cd="0" id="WED12"></td><td class="removeText" data-lec-cd="0" id="THU12"></td><td class="removeText" data-lec-cd="0" id="FRI12"></td></tr>';
				str += '<tr><th rowspan="2" class="thHeight">7교시</th><td class="removeText" data-lec-cd="0" id="MON13"></td><td class="removeText" data-lec-cd="0" id="TUE13"></td><td class="removeText" data-lec-cd="0" id="WED13"></td><td class="removeText" data-lec-cd="0" id="THU13"></td><td class="removeText" data-lec-cd="0" id="FRI13"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON14"></td><td class="removeText" data-lec-cd="0" id="TUE14"></td><td class="removeText" data-lec-cd="0" id="WED14"></td><td class="removeText" data-lec-cd="0" id="THU14"></td><td class="removeText" data-lec-cd="0" id="FRI14"></td></tr>';
				str += '<tr><th rowspan="2" class="thHeight">8교시</th><td class="removeText" data-lec-cd="0" id="MON15"></td><td class="removeText" data-lec-cd="0" id="TUE15"></td><td class="removeText" data-lec-cd="0" id="WED15"></td><td class="removeText" data-lec-cd="0" id="THU15"></td><td class="removeText" data-lec-cd="0" id="FRI15"></td></tr>';
				str += '<tr><td class="removeText" data-lec-cd="0" id="MON16"></td><td class="removeText" data-lec-cd="0" id="TUE16"></td><td class="removeText" data-lec-cd="0" id="WED16"></td><td class="removeText" data-lec-cd="0" id="THU16"></td><td class="removeText" data-lec-cd="0" id="FRI16"></td></tr>';
				str += '<tr><th rowspan="2" class="thHeight">9교시</th><td class="removeText" data-lec-cd="0" id="MON17"></td><td class="removeText" data-lec-cd="0" id="TUE17"></td><td class="removeText" data-lec-cd="0" id="WED17"></td><td class="removeText" data-lec-cd="0" id="THU17"></td><td class="removeText" data-lec-cd="0" id="FRI17"></td></tr>';
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
 						random = selectIndex(14, 14);
 						console.log(random);
						var randomColor = [];
						for(var i=0; i<14; i++){
							randomColor[i] = colorArr[random[i]];
						}
							console.log("==================")
							console.log(randomColor);
 						
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
	 							$('[data-lec-cd = "' + setArr[i] + '"]').css('background', randomColor[i]);
	 						}
	 						
		 				}
		 			}//success 끝
		 		})
			}
		})
		
		

	})
	
	//시간표 드래그 이벤트/////////////////////////////////////////////////////////////////////////////
	var isMouseDown = false, isHighlighted;
	
	$(document)
	.on('mousedown', '#timeTableChoice td', function() {
		isMouseDown = true;
		$(this).toggleClass("highlight");
		
		isHighlighted = $(this).hasClass("highlight")
		
		return false;
	})
	.on('mouseover', '#timeTableChoice td', function() {
		if(isMouseDown) {
			$(this).toggleClass("highlight", isHighlighted);
			
		}
	})
	.bind("selectstart", function() {
		return false;
	});
	
	$(document)
	.mouseup(function() {
		isMouseDown = false;
	});
	

	//확인버튼을 눌렀을 경우
	$('#checkBtn').on('click', function(){
		//충족여부에 값 초기화
		$('#cntP').text("");
		$('#hourP').text("");
		
		//수용가능인원
		var maxCnt = parseInt($('#pepleCnt').val());	
		//신청정보 - 희망정원
		var applyCnt = parseInt(${map.LECA_MAX});	
		//신청정보 - 강의시수
		var grade = parseInt($('#gradeScore').text().substr(0,1));	
		//배정한 시간
		var getHour = parseInt($('.highlight').length) / 2;	
		
		//충족여부에 값 입력시키기
		$('#cntP').text(applyCnt + "명 / " + maxCnt + "명");
		$('#hourP').text(getHour + "시간 / " + grade + "시간");
		
		//값 비교하기
		//1)수용가능인원
		if(maxCnt < applyCnt){
			$('#noneP1').text("N");
			$('#p').attr("class", "mdi mdi-alert-circle-outline icon2");
		}else{
			$('#noneP1').text("Y");
			$('#p').attr("class", "mdi mdi-check-circle-outline icon");
		}
		//2)강의시수
		if(getHour == grade){
			$('#noneP2').text("Y");
			$('#h').attr("class", "mdi mdi-check-circle-outline icon");
		}else{
			$('#noneP2').text("N");
			$('#h').attr("class", "mdi mdi-alert-circle-outline icon2");
		}
		
	});
	
	//저장버튼을 눌렀을 경우
	$('#saveBtn').on('click', function(){
		if(($('#noneP1').text() == "") && ($('#noneP2').text() == "")){
			alert("확인버튼을 누르신 후 저장이 가능합니다.")
		}else if($('#noneP1').text() == "N"){
			alert("수용가능 인원이 충족되지 않습니다.")
		}else if($('#noneP2').text() == "N"){
			alert("강의시수 시간이 충족되지 않습니다.")
		}else{
			//저장해야함
			saveArr = [];
			$.each($('.highlight'), function(i, v){
				saveArr.push(v.id);
			})
			
			var lecaCd = $('#lecaCd').val();
			console.log(lecaCd);
			
			saveData = {"lecaCd" : lecaCd,
						"tmCd" : saveArr,
						"lecaRoom" : lecaRoom,
						"lecaUnit" : lecaUnit};
			$.ajax({
				url : '/approval/allocationSave',
	 			type : 'post',
	 			data : JSON.stringify(saveData),
	 			dataType : 'JSON',
	 			contentType : 'application/json;charset=utf-8',
	 			success : function(result){
	 				console.log(result);
	 				var mgrCd = $('#mgrCd').val();
	 				var proCd = $('#proCd').val();
	 				
	 				finalData = {"mgrCd" : mgrCd,
	 							"lecaCd" : lecaCd,
	 							"proCd" : proCd};
	 				
	 				if(result > 0){
	 					$.ajax({
	 						url : '/approval/updateApproval',
	 			 			type : 'post',
	 			 			data : JSON.stringify(finalData),
	 			 			dataType : 'JSON',
	 			 			contentType : 'application/json;charset=utf-8',
	 			 			success : function(result){
	 			 				console.log(result);
	 			 				if(result > 0){
	 			 					alert("성공적으로 강의실 배정이 완료되었습니다.");
	 			 					close();
	 			 				}
	 			 			}
	 					})
	 				}
	 			}
			})
		}
	})

	

};

//랜덤 발생시키는 함수
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


</script>

</head>

<body>
<div id="RoomAssignDiv">
	<div id="whole" style="padding: 30px;">
		<div class="form-group">
			<h1>강의실 배정</h1><br>
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
  	<div id="rightWhole">
  	<div id="applyInfo">
  	<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;신청 정보</p>
<!--   	<div id="applyInfoCnt"> -->
	  	<table border="1" id="applyInfoTable" style="width: 100%; height: 87%;">
	  		<tr>
	  			<th>담당교수</th>
	  			<td id="proNm">${map.PRO_NM}</td>
	  			<th>교수소속</th>
	  			<td id="proDepart">${map.PRO_COL}</td>
	  		</tr>
	  		<tr>
	  			<th>강의명</th>
	  			<td id="lecNm">${map.LECA_NM}</td>
	  			<th>이수구분</th>
	  			<td id="lecGubun">${map.LECA_CATE}</td>
	  		</tr>
	  		<tr>
	  			<th>희망정원</th>
	  			<td id="applyCnt">${map.LECA_MAX}명</td>
	  			<th>개설학년</th>
	  			<td id="gradeYear">${map.LECA_TRG}학년</td>
	  		</tr>
	  		<tr>
	  			<th>강의시수</th>
	  			<td id="lecHour">${map.LECA_PER}시간</td>
	  			<th>학점</th>
	  			<td id="gradeScore">${map.LECA_CRD}학점</td>
	  		</tr>
	  		<tr>
	  			<th>희망시간</th>
	  			<td colspan="3"><textarea class="infoTextarea" rows="4" cols="40" id="applyHour" disabled="disabled">${map.LECA_TT }</textarea></td>
	  		</tr>
	  		<tr>
	  			<th>비고</th>
	  			<td colspan="3"><textarea class="infoTextarea" rows="4" cols="40" id="noteText" disabled="disabled">${map.LECA_NOTE }</textarea></td>
	  		</tr>
	  	</table>
<!--   	</div> -->
  	</div>
  	<div id="okdiv">
  	<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;충족 여부</p>
	  	<div id="okdivCnt">
	  		<div style="padding-left: 15px; margin-top: 15px; margin-left: 20px;">
			  	<i id="p" class="mdi mdi-alert-circle-outline icon2"></i>
			  	<div style="margin: 10px 20px;padding-left: 8px; padding-top: 3px;"><label>수용가능 인원</label><p style="margin-left: 80px; display: inline-block;" id="cntP"></p><p style="display: none;" id="noneP1" ></p></div>
		  	</div>
		  	<div style="padding-left:15px; margin-left: 20px; margin-top: -5px;">
			  	<i id="h" class="mdi mdi-alert-circle-outline icon2"></i>
			  	<div style="margin: 10px 20px; padding-left: 8px; padding-top: 3px;"><label>강의시수</label><p style="margin-left: 113px; display: inline-block;" id="hourP"></p><p style="display: none;" id="noneP2"></p></div>
		  	</div>
	  	</div>
  	</div>
  	<br><br>
  	<button type="button" id="checkBtn" class="btn btn-primary but">확인</button>
    <button type="button" id="saveBtn" class="btn btn-primary but">저장</button>
  	</div>
  	<div id="blockNum3TimeTable" style="float : left; width : 400px;">
  		<p style="margin-left: 28px;"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;강의실 시간표</p>
  		<table id="timeTableChoice" border="1">
  			<tr><th style="width : 50px; height: 40px;"></th><th>월</th> <th>화</th> <th>수</th> <th>목</th><th>금</th></tr>
  			<tr><th rowspan="2" class="thHeight">1교시</th><td id="MON01"></td><td id="TUE01"></td><td id="WED01"></td><td id="THU01"></td><td id="FRI01"></td></tr>
  			<tr><td id="MON02"></td><td id="TUE02"></td><td id="WED02"></td><td id="THU02"></td><td id="FRI02"></td></tr>
  			<tr><th rowspan="2" class="thHeight">2교시</th><td id="MON03"></td><td id="TUE03"></td><td id="WED03"></td><td id="THU03"></td><td id="FRI03"></td></tr>
  			<tr><td id="MON04"></td><td id="TUE04"></td><td id="WED04"></td><td id="THU04"></td><td id="FRI04"></td></tr>
			<tr><th rowspan="2" class="thHeight">3교시</th><td id="MON05"></td><td id="TUE05"></td><td id="WED05"></td><td id="THU05"></td><td id="FRI05"></td></tr>
			<tr><td id="MON06"></td><td id="TUE06"></td><td id="WED06"></td><td id="THU06"></td><td id="FRI06"></td></tr>
			<tr><th rowspan="2" class="thHeight">4교시</th><td id="MON07"></td><td id="TUE07"></td><td id="WED07"></td><td id="THU07"></td><td id="FRI07"></td></tr>
			<tr><td id="MON08"></td><td id="TUE08"></td><td id="WED08"></td><td id="THU08"></td><td id="FRI08"></td></tr>
			<tr><th rowspan="2" class="thHeight">5교시</th><td id="MON09"></td><td id="TUE09"></td><td id="WED09"></td><td id="THU09"></td><td id="FRI09"></td></tr>
			<tr><td id="MON10"></td><td id="TUE10"></td><td id="WED10"></td><td id="THU10"></td><td id="FRI10"></td></tr>
			<tr><th rowspan="2" class="thHeight">6교시</th><td id="MON11"></td><td id="TUE11"></td><td id="WED11"></td><td id="THU11"></td><td id="FRI11"></td></tr>
			<tr><td id="MON12"></td><td id="TUE12"></td><td id="WED12"></td><td id="THU12"></td><td id="FRI12"></td></tr>
			<tr><th rowspan="2" class="thHeight">7교시</th><td id="MON13"></td><td id="TUE13"></td><td id="WED13"></td><td id="THU13"></td><td id="FRI13"></td></tr>
			<tr><td id="MON14"></td><td id="TUE14"></td><td id="WED14"></td><td id="THU14"></td><td id="FRI14"></td></tr>
			<tr><th rowspan="2" class="thHeight">8교시</th><td id="MON15"></td><td id="TUE15"></td><td id="WED15"></td><td id="THU15"></td><td id="FRI15"></td></tr>
			<tr><td id="MON16"></td><td id="TUE16"></td><td id="WED16"></td><td id="THU16"></td><td id="FRI16"></td></tr>
			<tr><th rowspan="2" class="thHeight">9교시</th><td id="MON17"></td><td id="TUE17"></td><td id="WED17"></td><td id="THU17"></td><td id="FRI17"></td></tr>
			<tr><td id="MON18"></td><td id="TUE18"></td><td id="WED18"></td><td id="THU18"></td><td id="FRI18"></td></tr>
  		</table>
  	</div>
</div>
  	<input type="hidden" id="lecaCd" value="${lecaCd}">
  	<input type="hidden" id="mgrCd" value="${mgrCd}">
  	<input type="hidden" id="proCd" value="${map.PRO_CD}">

</body>
</html>
