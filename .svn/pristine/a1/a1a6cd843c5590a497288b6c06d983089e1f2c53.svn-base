<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.calendar-widget{
width : 30%;
}
</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script type="text/javascript" defer="defer">
$(function(){
	
	$.ajax({
		url:"/schedule/proHistoryAjax",
		dataType:"json",
		type:"POST",
		success:function(res){
			$.each(res,function(i,v){
						
			    $('#datepicker td').each(function(){
			      	console.log(moment($(this).data("date")).format('YYYY-MM-DD'));
			      	console.log(v.schSt);
			        if(moment($(this).data("date")).format('YYYY-MM-DD') == v.schSt){
			     	   $(this).addClass('active');
			        }
			    
			    
			    })
			
			})

			
			
			
		}
	})
	
	
	
	
    $('#datepicker').datepicker({
          
      }).on("changeDate", function(e) {
         //alert("ok");
         console.log(e.date);
         var clickDate = e.date;
         console.log(moment(clickDate).format('YYYY-MM-DD'));
      });
    

    
  
    
    
 })
</script>
</head>
<body>
<div data-provide="datepicker-inline" data-date-today-highlight="true" class="calendar-widget" id="datepicker"></div>
</body>
</html>