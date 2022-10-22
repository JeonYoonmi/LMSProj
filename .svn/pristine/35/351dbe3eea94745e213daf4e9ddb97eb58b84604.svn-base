<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학사일정</title>
<style>

#calendar{
width : 100%;
background-color: white;
}

.fc .fc-myCustomButton1-button,
.fc .fc-myCustomButton2-button,
.fc .fc-myCustomButton3-button,
.fc .fc-myCustomButton4-button,
.fc .fc-prev-button,
.fc .fc-next-button{
background-color: #eee !important;
border-color : #eee !important;
color : black !important;
}

.fc .fc-myCustomButton1-button:hover{
background-color: #ffcdd2 !important;
}
.fc .fc-myCustomButton2-button:hover{
background-color: #ffe0b2 !important;
}
.fc .fc-myCustomButton3-button:hover{
background-color: #b2dfdb !important;
}
.fc .fc-myCustomButton4-button:hover{
background-color: #d1c4e9 !important;
}


.fc-daygrid-block-event .fc-event-title{
color : black !important;
}


</style>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<script type="text/javascript" defer="defer">
$(function(){
   var asch = ''; //기본설정은 공통으로
   
   
   var request = $.ajax({
      url : "/aschedule/calendarList", // 값 불러오기
      method : "POST",
      dataType : "json"
      });
   
      request.done(function(data){
      
      
      var calendarEl = document.getElementById('calendar');
      calendar = new FullCalendar.Calendar(calendarEl,{
      height : '800px',
      customButtons: {
          myCustomButton1: {
            text: '공통',
            click: function() {
               asch = 'S104';
               
               
            $(this).attr('style', 'background-color: #ffcdd2 !important');
            $(this).next().css('background-color','');
            $(this).next().next().css('background-color','');
            $(this).next().next().next().css('background-color','');
            
            }
          },
          myCustomButton2: {
             
            text: '학생',
            click: function() {
               asch = 'S101';
            
            $(this).attr('style','background-color: #ffe0b2 !important'); 
            $(this).prev().css('background-color','');
            $(this).next().css('background-color','');
            $(this).next().next().css('background-color','');
            
            //$(this).css('background-color','red') 
            }
          },
          myCustomButton3: {
              
            text: '교수',
            click: function() {
               asch = 'S102';
            
            $(this).prev().prev().css('background-color','');
            $(this).prev().css('background-color','');
            $(this).next().css('background-color','');
            $(this).attr('style','background-color: #b2dfdb !important'); 
            //$(this).css('background-color','red') 
            }
          },
          myCustomButton4: {
              
            text: '관리자',
            click: function() {
               asch = 'S103';
            
            //$(this).removeClass('fc-button-primary');
            //$(this).toggleClass('fc-button-primary');
            $(this).prev().prev().prev().css('background-color','');
            $(this).prev().prev().css('background-color','');
            $(this).prev().css('background-color','');
            $(this).attr('style','background-color: #d1c4e9 !important'); 
            //$(this).css('background-color','red') 
            }
          }
          
      },
      
      // 헤더에 표시할 툴바
      headerToolbar :{
      left : 'myCustomButton1 myCustomButton2 myCustomButton3 myCustomButton4',
      center : 'title',
      //firstDay : 1,
      //right : ''
      right : 'today,prev,next'
      },
      initialView : 'dayGridMonth', // 초기 로드 될 때 보이는 캘린더 화면 (기본 설정 : 달)
      //navLinks : true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
      editable : true, // 수정 가능?
      selectable : true, // 달력 일자 드래그 설정 가능
      droppable : true, // 드래그 앤 드롭
      events : data,
      //locale : 'ko', // 한국어 설정
      
      //이벤트 생성
        select: function(arg){ // 캘린더에서 드래그로 이벤트를 생성할 수 있다
             
              //var color;
              console.log(asch);
              
//               var aschCate = $('#cate').val();
              if(asch=='S101'){
                 color = "#ffe0b2";
                 
              }else if(asch=='S102'){
                 color = "#b2dfdb";
              }else if(asch=='S103'){
                 color = "#d1c4e9";
              }else{
                 color = "#ffcdd2";
              }
              
              if(asch!=''){
              
              var title = prompt('일정을 입력해주세요.');
              
               if(title){
            	   
	           	   var max = 0;
	           	   
	           	   $.ajax({
	           		   url:"/aschedule/findMax",
	           			dataType:"json",
			  			type:"POST",
			  			success:function(res){
			  				max = res;
	
			               calendar.addEvent({
			            	   id : max,
				               title : title,
				               start : arg.start,
				               end : arg.end,
				               allDay : arg.allDay,
				               color : color
			               })
			  			}
	           	   })
            	   
               }else{
                  calendar.unselect();
               }
               
               var obj = new Object(); // Json을 담기 위해 Object 선언
               obj.aschCon = title;
               obj.aschSt = moment(arg.start).format('YYYY-MM-DD'); // 시작
               obj.aschEn = moment(arg.end).format('YYYY-MM-DD'); // 끝
               obj.aschCate = asch;
               
               
               $(function saveData(jsonData){
                  $.ajax({
                     url : "/aschedule/update",
                     method : "POST",
                     dataType : "json",
                     data : JSON.stringify(obj),
                     contentType : 'application/json',
                     })
               });
               
              }else{
                 alert("카테고리를 먼저 지정해주세요.")
              }
           },
           
           //이벤트 삭제
            eventClick : function(info){
            if(confirm("["+info.event.title+"]일정을 삭제하시겠습니까?")){
            
            info.event.remove();
            
            var aschCd = info.event.id;
            
            $(function deleteData(){
               $.ajax({
               url : "/aschedule/update",
               method : "DELETE",
               dataType : "json",
               data : JSON.stringify({"aschCd":aschCd}),
               contentType : 'application/json;charset=utf-8',
                    })
                 })
               }
            },
            
            //이벤트 수정   
            eventDrop : function(info){
            
               
               var obj = new Object();
               
               obj.start = moment(info.event.start).format('YYYY-MM-DD');
               obj.end = moment(info.event.end).format('YYYY-MM-DD');
               obj.id = info.event.id;
               
               
               
               $(function modifyData(){
               $.ajax({
               url : "/aschedule/update",
               method : "PATCH",
               dataType : "json",
               data : JSON.stringify(obj),
               contentType : 'application/json',
               })
               })
               },
               
                 eventResize: function(info){
                  var obj = new Object();
                 
                 obj.start = moment(info.event.start).format('YYYY-MM-DD');
                 obj.end = moment(info.event.end).format('YYYY-MM-DD');
                 obj.id = info.event.id;

               $(function modifyData(){
               $.ajax({
               url : "/aschedule/update",
               method : "PATCH",
               dataType : "json",
               data : JSON.stringify(obj),
               contentType : 'application/json',
               })
               })
               }
      })
      
      calendar.render();
      })
})
</script>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 행정 관리 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">학사 일정 관리</span> 
</div>
<br><br>
<p><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;학사 일정 캘린더</p>
<div id="calendar">
</div>

</body>
</html>