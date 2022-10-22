<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Serialization demo</title>

  <link rel="stylesheet" href="/resources/css/demo.css"/>
  <link rel="stylesheet" href="/resources/css/gridstack.min.css">
  <script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
  <script src="https://gridstackjs.com/node_modules/gridstack/dist/gridstack-all.js"></script>
  <style type="text/css">
  .ptitle{
  	font-size : 1.3em;
  	float : left;
  }
  .removeBut{
  	float: right;
  }
  #ptable{
  	float: left;
  	border-collapse: collapse;
  }
  </style>
</head>
<script type="text/javascript" defer="defer">

</script>
<body>
	<button type="button" id="beachSave">화면배치저장</button>
  <div class="container-fluid">
    <a onClick="saveGrid()" class="btn btn-primary" href="#">Save</a>
    <br/><br/>
    <div id="gridCont"><div class="grid-stack"></div></div>
    <hr/>
<!--     <div style="display:none"> -->
    <textarea id="saved-data" cols="100" rows="20" readonly="readonly"></textarea>
<!--     </div> -->
  </div>

  <script type="text/javascript" defer="defer">
  
  
    let grid = GridStack.init({
      minRow: 1, // don't let it collapse when empty
      cellHeight: '7rem'
    });
    
    grid.on('added removed change', function(e, items) {
      let str = '';
      items.forEach(function(item) {
    	  str += ' (x,y)=' + item.x + ',' + item.y  + '(w,h)=' + item.w +  ',' + item.h;
	      
      }

      );
      console.log(e.type + ' ' + items.length + ' items:' + str );
    });
    
    
	
    var registerHistory = "";
	    registerHistory += "<button class='removeBut' onClick = 'grid.removeWidget(this.parentNode.parentNode)'>X</button><br>";
	    registerHistory += "<p class='ptitle'>학적변동조회</p><br><br><br>";
// 	    registerHistory += "<table border='1' id='ptable'>";
// 	    registerHistory += "<thead>";
// 	    registerHistory += "<tr><th>년도/학기</th>";
// 	    registerHistory += "<th>변동구분</th>";
// 	    registerHistory += "<th>변동일자</th>";
// 	    registerHistory += "<th>진행상태</th></tr>";
// 	    registerHistory += "</thead>";
// 	    registerHistory += "<tbody>";
// 		registerHistory += "<c:forEach var='history' items='${history}'>";
// 		registerHistory += "<tr><td>${history.recYr}/${history.recSem}</td>";
// 		registerHistory += "<td>${history.recRsn}</td>";
// 		registerHistory += "<td><fmt:formatDate value='${history.recDt}' pattern='yyyy.MM.dd' /></td>";
// 		registerHistory += "<c:if test='${history.recYn == 0}'>";
// 		registerHistory += "<td>승인대기</td></tr></c:if>";
// 		registerHistory += "<c:if test='${history.recYn == 1}'>";
// 		registerHistory += "<td>승인</td></tr></c:if>";
// 		registerHistory += "<c:if test='${history.recYn == 2}'>";
// 		registerHistory += "<td>반려</td></tr></c:if>";
// 		registerHistory += "</c:forEach>";
// 		registerHistory += "</tbody>";
// 	    registerHistory += "</table>";
	
	var registerSchedule = ""
		registerSchedule += "<button class='removeBut' onClick = 'grid.removeWidget(this.parentNode.parentNode)'>X</button><br>"
		registerSchedule += "<p class='ptitle'>학사일정</p><br><br><br>"
		
	var lectureApply = ""
		lectureApply += "<button class='removeBut' onClick = 'grid.removeWidget(this.parentNode.parentNode)'>X</button><br>"
			lectureApply += "<p class='ptitle'>수강신청 내역</p><br><br><br>"
	
	var newsView = ""
		newsView += "<button class='removeBut' onClick = 'grid.removeWidget(this.parentNode.parentNode)'>X</button><br>"
			newsView += "<p class='ptitle'>뉴스</p><br><br><br>"
	
	var todayWheather = ""
		todayWheather += "<button class='removeBut' onClick = 'grid.removeWidget(this.parentNode.parentNode)'>X</button><br>"
		todayWheather += "<p class='ptitle'>오늘의 대기/날씨</p><br><br><br>"
	
    var noticeBored = ""
    	noticeBored += "<button class='removeBut' onClick = 'grid.removeWidget(this.parentNode.parentNode)'>X</button><br>"
    	noticeBored += "<p class='ptitle'>공지사항</p><br><br><br>"
	    
    let serializedData = [
      {x: 0, y: 0, w: 4, h: 4, id: 'newsView', content: newsView},
      {x: 4, y: 0, w: 4, h: 4, id: 'todayWheather', content: todayWheather},
      {x: 8, y: 0, w: 4, h: 4, id: 'noticeBored', content: noticeBored},
      {x: 0, y: 2, w: 4, h: 4, id: 'registerSchedule', content: registerSchedule},
      {x: 4, y: 2, w: 4, h: 4, id: 'registerHistory', content: registerHistory},
      {x: 8, y: 2, w: 4, h: 4, id: 'lectureApply', content: lectureApply}
    ];
    
  	/* serializedData.forEach((n, i) =>
   	n.content = `<button onClick="grid.removeWidget(this.parentNode.parentN ode)">X</button><br> ${i}<br> ${n.content ? n.content : ''}`);*/
  	
	$.each(serializedData, function(n, i){
  		n.content = `<button onClick="grid.removeWidget(this.parentNode.parentNode)">X</button><br> ${i}<br> ${n.content ? n.content : ''}`;
  	}) 
  	let serializedFull;

    // 2.x method - just saving list of widgets with content (default)
    loadGrid = function() {
      grid.load(serializedData, true); // update things
    }

    // 2.x method
    //Save 버튼 눌렀을때 onclick 이벤트
    saveGrid = function() {
      delete serializedFull;
      serializedData = grid.save();
      document.querySelector('#saved-data').value = JSON.stringify(serializedData, null, '  ');
      var first = serializedData[0];
		var second = serializedData[1];
		var third = serializedData[2];
		var four = serializedData[3];
		var five = serializedData[4];
		var six = serializedData[5];
		
		console.log(first.id);
		console.log(second.id);
		console.log(third.id);
		console.log(four.id);
		console.log(five.id);
		console.log(six.id);
    }

    // 3.1 full method saving the grid options + children (which is recursive for nested grids)
    saveFullGrid = function() {
      serializedFull = grid.save(true, true);
      serializedData = serializedFull.children;
      document.querySelector('#saved-data').value = JSON.stringify(serializedFull, null, '  ');
    }

    // 3.1 full method to reload from scratch - delete the grid and add it back from JSON
    loadFullGrid = function() {
      if (!serializedFull) return;
      grid.destroy(true); // nuke everything
      grid = GridStack.addGrid(document.querySelector('#gridCont'), serializedFull)
    }

    clearGrid = function() {
      grid.removeAll();
    }

    loadGrid();
    
//     grid.on('resize change', function(e, items){
//     	let str = '';
//     	items.forEach(function(item) {
//     		str += ' (w,h)=' + item.w +  ',' + item.h;
//     		if(item.w < 4 || item.h < 4){
//    	    	  alert("4보다 작아졌어요!");
//   	      }
//     	}
//     	);
//     	console.log(str);
//     });
    
	$('#beachSave').on('click', function(){
		
		
		
	});
    
  </script>
</body>
</html>
