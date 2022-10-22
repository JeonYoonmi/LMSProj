<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<title>Insert title here</title>
<style>
#left{
height : 100%;
float: left;
width: 85%;
}
#d1{
height : 100%;
float: right;
height : 724px;
width: 14%;
}

table tr {
    height: 35px;
}

#test td{
	background-color: EEEEEE;
}
.fc-header-toolbar{
	padding : 25px;
	justify-content: space-around;
}
/* .fc-toolbar-chunk { */
/*   display: flex; // 일렬로 나란히 */
/*   align-items: center; // 수직 가운데 정렬 */
/* } */
.tui-grid-body-area{
	height : 724px;
}
#facility{
	display : inline-block;
	margin-bottom : 20px;
}
.fc-event-resizable{
	margin:0;
	padding:0;
	width : 100%;
}
</style>
<script type="text/javascript" defer="defer">
function history(){
	var opt = $('#facility').val();
	var grid;


		$.ajax({
			url : "/facility/historyAjax",
			method : "POST",
			dataType : "json",
			data : {
				facCd : opt
			},
			success : function(data) {
				$('#test').empty();
				grid = new tui.Grid({
					el : document.getElementById('test'),
					data : data,
					scrollX : true,
					scrollY : true,
					minBodyHeight : 200,
					bodyHeight: 620,
					 header: {
// 						    complexColumns: [
// 						      {
// 						        header: '',
// 						        name: 'parent1',
// 						        childNames: ['RSV_ST', 'RSV_EN']     
// 						      }
// 						      ]
						      },
					columns : [
						{ header : '일자' ,name : 'RSV_ST', align : 'center'},
 						{ header : '시간',name : 'RSV_EN', align : 'center'}
					],
					columnOptions: { resizable: true }
				})
			}
		})
	}
$(function(){
	
		history();
		var opt = $('#facility').val();
		var request = $.ajax({
			url : "/facility/allcalendar",
			method : "POST",
			dataType : "json",
			data : {
				facCd : 1
			},
			success: function(data){
				//console.log(data);
			}
		});

		request.done(function(data) {
					//캘린더 생성
					var calendarEl = document.getElementById('calendar');
					calendar = new FullCalendar.Calendar(calendarEl,{
					height : 724,
					//hiddenDays: [ 6, 0],
					firstDay : 1,
					slotMinTime : '10:00',
					slotMaxTime : '18:00',
					// 헤더에 표시할 툴바
					headerToolbar : {
						left : 'prev,next',
						center : 'title',
						right : 'today'

					},
					initialView : 'timeGridWeek', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
					navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
					editable : true, // 수정 가능?
					selectable : true, // 달력 일자 드래그 설정 가능
					droppable : true, // 드래그 앤 드롭
					eventOverlap : false,
					locale : 'ko',
					events : data,
					displayEventTime : false,
					allDaySlot : false,

					//이벤트 생성
					
					select : function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다
						//학번 나중에 sessionscope로 가져옴
						var eventDate = arg.start;
						var now = new Date();
						if (eventDate >= now) {

							var code = $('#d1').data('code');
							var name = $('#d1').data('name');
							var codeName = "["+code+"] "+name;
							var title = code;

							if (title) {
								calendar.addEvent({
									title : codeName,
									start : arg.start,
									end : arg.end,
									color : '#001353',
									id : code
								})
							} else {
								calendar.unselect();
							}

							var obj = new Object(); // Json을 담기 위해 Object 선언

							obj.facCd = $('#facility').val();
							obj.start = moment(arg.start).format('YYYY-MM-DD HH:mm'); // 시작
							obj.end = moment(arg.end).format('YYYY-MM-DD HH:mm'); // 끝

							$(function saveData() {
								$.ajax({
									url : "/facility/update",
									method : "POST",
									dataType : "json",
									data : JSON.stringify(obj),
									contentType : 'application/json',
									success : function(data){
										history();
									}
								})
							});
							alert("예약이 추가되었습니다.")
						}
						else {
							alert("지난 시간에는 예약을 추가할 수 없습니다.")
						}
					}

					,

					//이벤트 삭제
					eventClick : function(info) {
						if (confirm("예약을 취소하시겠습니까?")) {
							var code = $('#d1').data('code');
							var memCd = info.event.id;
							console.log(info);
							console.log(info.event);
							console.log(code);
							console.log(memCd);

							var eventDate = info.event.start;
							var now = new Date();

							if (now < eventDate) {
								if (code == memCd) {
									// 확인 클릭 시
									info.event.remove();

									var rsvSt = moment(info.event.start).format('YYYY-MM-DD HH:mm');
									var obj = new Object();
									obj.memCd = memCd;
									obj.rsvSt = rsvSt;
									
									$(function deleteData() {
										$.ajax({
												url : "/facility/update",
												method : "DELETE",
												dataType : "json",
												data : JSON.stringify(obj),
												contentType : 'application/json;charset=utf-8',
												success: function(data){
													history();
												}
											})
										})

								} else {
									alert("다른 이용자의 예약입니다.");
								}

							} else {
								alert("예약시간이 지난 예약은 취소할 수 없습니다.")
							}

						} else {
							return false;
						}
					},

					//이벤트 수정

					eventDrop : function(info) {

						var code = $('#d1').data('code');
						var memCd = info.event.id;

						var eventDate = info.event.start;
						var now = new Date();

						if (now < eventDate) {

							if (code == memCd) {

								var obj = new Object();

								obj.newSt = moment(info.event.start)
										.format('YYYY-MM-DD HH:mm');
								obj.newEn = moment(info.event.end)
										.format('YYYY-MM-DD HH:mm');
								obj.memCd = info.event.id;
								obj.oldSt = moment(
										info.oldEvent.start)
										.format('YYYY-MM-DD HH:mm');

								$(function modifyData() {
									$.ajax({
												url : "/facility/update",
												method : "PATCH",
												dataType : "json",
												data : JSON.stringify(obj),
												contentType : 'application/json',
												success : function(data){
													history();
												}
											})
								})
								alert("예약이 수정되었습니다.")

							} else {
								alert("다른 이용자의 예약입니다.")
							}

						} else {
							alert("예약기간이 지난 예약은 수정할 수 없습니다.")
							info.revert();
						}
					},

					eventResize : function(info) {

						var code = $('#d1').data('code');
						var memCd = info.event.id;

						var eventDate = info.event.start;
						var now = new Date();

						if (now < eventDate) {

							if (code == memCd) {

								var obj = new Object();

								obj.newSt = moment(info.event.start).format('YYYY-MM-DD HH:mm');
								obj.newEn = moment(info.event.end).format('YYYY-MM-DD HH:mm');
								obj.memCd = info.event.id;
								obj.oldSt = moment(info.oldEvent.start).format('YYYY-MM-DD HH:mm');

								$(function modifyData() {
									$.ajax({
												url : "/facility/update",
												method : "PATCH",
												dataType : "json",
												data : JSON
														.stringify(obj),
												contentType : 'application/json',
												success : function(data){
													history();
												}
											})
								})
								alert("예약이 수정되었습니다.")
							} else {
								alert("다른 이용자의 예약입니다.");
							}

						} else {
							alert("예약기간이 지난 예약은 수정할 수 없습니다.")
							info.revert();
						}
					}

				});
		calendar.render();
	})

		//버튼 클릭 이벤트
		$('#facility').on('change',function() {
				var opt = $('#facility').val();
				
				history();

				var request = $.ajax({
					url : "/facility/allcalendar",
					method : "POST",
					dataType : "json",
					data : {
						facCd : opt
					}

				});

				request.done(function(data) {
							//캘린더 생성
							var calendarEl = document.getElementById('calendar');
							calendar = new FullCalendar.Calendar(
									calendarEl,
									{
										height : 680,
										slotMinTime : '10:00',
										slotMaxTime : '18:00',
										// 헤더에 표시할 툴바
										headerToolbar : {
											left : 'prev,next',
											center : 'title',
											right : 'today'

										},
										initialView : 'timeGridWeek', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
										navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
										editable : true, // 수정 가능?
										selectable : true, // 달력 일자 드래그 설정 가능
										droppable : true, // 드래그 앤 드롭
										eventOverlap : false,
										locale : 'ko',
										events : data,
										displayEventTime : false,
										allDaySlot : false,

										//이벤트 생성
										select : function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다

										var eventDate = arg.start;
										var now = new Date();
										if (eventDate >= now) {

											var code = $('#d1')
													.data(
															'code');
											var title = code;

											if (title) {
												calendar.addEvent({
															title : code,
															start : arg.start,
															end : arg.end,
															color : '#001353',
															id : code

														})
											} else {
												calendar.unselect();
											}

											var obj = new Object(); // Json을 담기 위해 Object 선언

											obj.facCd = $('#facility').val();
											obj.start = moment(arg.start).format('YYYY-MM-DD HH:mm'); // 시작
											obj.end = moment(arg.end).format('YYYY-MM-DD HH:mm'); // 끝


											$(function saveData() {
												$.ajax({
															url : "/facility/update",
															method : "POST",
															dataType : "json",
															data : JSON.stringify(obj),
															contentType : 'application/json',
															success : function(data){
																history();
															}
														})

											});

											alert("예약이 추가되었습니다.")
										}

										else {
											alert("지난 시간에는 예약을 추가할 수 없습니다.")
										}
									},

										//이벤트 삭제
										eventClick : function(info) {
											if (confirm("예약을 취소하시겠습니까?")) {
												var code = $('#d1').data('code');
												var memCd = info.event.id;

												var eventDate = info.event.start;
												var now = new Date();

												if (now < eventDate) {

													if (code == memCd) {

														// 확인 클릭 시
														info.event.remove();

														var rsvSt = moment(info.event.start).format('YYYY-MM-DD HH:mm');
														var obj = new Object();
														obj.memCd = memCd;
														obj.rsvSt = rsvSt;


														$(function deleteData() {
															$.ajax({
																	url : "/facility/update",
																	method : "DELETE",
																	dataType : "json",
																	data : JSON
																			.stringify(obj),
																	contentType : 'application/json;charset=utf-8',
																	success : function(data){
																		history();
																	}
																})
														})

													} else {
														alert("다른 이용자의 예약입니다.");
													}

												} else {
													alert("예약시간이 지난 예약은 취소할 수 없습니다.")
												}

											} else {
												return false;
											}
										},

										//이벤트 수정   
										eventDrop : function(info) {

											var code = $('#d1').data('code');
											var memCd = info.event.id;

											var eventDate = info.event.start;
											var now = new Date();

											if (now < eventDate) {

												if (code == memCd) {

													var obj = new Object();

													obj.newSt = moment(info.event.start).format('YYYY-MM-DD HH:mm');
													obj.newEn = moment(info.event.end).format('YYYY-MM-DD HH:mm');
													obj.memCd = info.event.id;
													obj.oldSt = moment(info.oldEvent.start).format('YYYY-MM-DD HH:mm');

													$(function modifyData() {
														$.ajax({
																url : "/facility/update",
																method : "PATCH",
																dataType : "json",
																data : JSON
																		.stringify(obj),
																contentType : 'application/json',
																success : function(data){
																	history();
																}
															})
													})
													alert("예약이 수정되었습니다.")

												} else {

													alert("다른 이용자의 예약입니다.")
												}

											} else {
												alert("예약기간이 지난 예약은 수정할 수 없습니다.")
												info.revert();
											}
										},

										eventResize : function(info) {
											var code = $('#d1')
													.data('code');
											var memCd = info.event.id;

											var eventDate = info.event.start;
											var now = new Date();

											if (now < eventDate) {

												if (code == memCd) {

													var obj = new Object();

													obj.newSt = moment(info.event.start).format('YYYY-MM-DD HH:mm');
													obj.newEn = moment(info.event.end).format('YYYY-MM-DD HH:mm');
													obj.memCd = info.event.id;
													obj.oldSt = moment(info.oldEvent.start).format('YYYY-MM-DD HH:mm');

													$(function modifyData() {
														$.ajax({
																url : "/facility/update",
																method : "PATCH",
																dataType : "json",
																data : JSON
																		.stringify(obj),
																contentType : 'application/json',
																success : function(data){
																	history();
																}
															})
													})
													alert("예약이 수정되었습니다.")
												} else {
													alert("다른 이용자의 예약입니다.");
												}

											} else {
												alert("예약기간이 지난 예약은 수정할 수 없습니다.")
												info.revert();
											}
										}

									});
							calendar.render();
						})
				})
	});
</script>
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 시설 <i class="dripicons-chevron-right"></i>
<span style="font-weight: bold;">시설신청및 이력</span>
</div>
<br><br>

<div id="left"> 
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;예약신청</p>
<div id="calendar" class="card">
</div> 
</div>

<div id='d1' data-code="${code}" data-name="${name}" > 
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;예약내역</p>
	<select class="custom-select ntcCateLeft"  id="facility">
	      <c:forEach var="item" items="${facility }">
	         <option value="${item.facCd}">${item.facNm}</option>
	      </c:forEach>
	</select>
	<div id="test" ></div>
</div>
</body>
</html>