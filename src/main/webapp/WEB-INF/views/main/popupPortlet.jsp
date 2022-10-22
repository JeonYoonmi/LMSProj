<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title></title>
  <link rel="stylesheet" href="/resources/css/demo.css"/>
  <link rel="stylesheet" href="/resources/css/gridstack.min.css">
  <script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
  <script src="/resources/node_modules/gridstack/dist/gridstack-all.js"></script>
<style type="text/css">
#divTop{
	border : 1px solid #1872cf;
	background-color: #1872cf;
	height: 75px;
}
#pSide{
	width : 22%;
	height: 800px;
	background: white;
	float: left;
}
#spanP{
	font-weight: bold;
	font-size: 1.1em;
	
}
#divWhole{
	background: #fafbfe;
    width: 75.56%;
    height: 685px;
    float: left;
    margin-left: 22px;
    margin-top: 46px;
}
.dividiv{
	width: 90%;
	margin-left: 15px;
	float: left;
}
.plusBut{
	float: right;
	width: 37px;
    height: 37px;
}
.plusP{
	display: inline-block;
	font-weight: bold;
	margin-top: 13px;
	margin-left: 11px;
}
.deleteIcon{
	 font-size : 1.2em; 
	 float : right;
	 margin-right: 10px;
     margin-top: 5px;
}
.ptitle{
	display: inline-block;
    color : #2b85e2;
    margin-left: -3px;
}
.grid-stack-item-content{
	border : 1px solid #2b85e2;
}
.bottomBut{
	width : 100px;
}
.dripicons-plus{
	margin-left: -2px;
}
</style>

</head>

<body>

<div id="popup" style="height: 150px;">
	<div id = "divTop">
		&emsp;&emsp;&emsp;<i class="mdi mdi-layers-triple-outline" style="color: white; font-size: 2.5em; float: left; padding: 10px;"></i>
		<div><h3 style="color: white; margin: 0px;">포틀릿 설정</h3></div>
	</div>
	<div style="clear : both;"></div>
	<div id = "pSide">
	<br>
		<i class="dripicons-view-list" style="float: left; margin-left: 15px;"></i>
		<p id="spanP">&emsp;포틀릿 목록</p><br>
	<div id="findDiv" style="display: inline-block; width: 100%;">
	<c:forEach var="data" items="${portletData}">
	<div class="dividiv" id="${data.poGb }">
		<div style="height: 40px;">
		<p class="plusP" >${data.poCate}</p>
		<button id="${data.poGb}" type="button" class="btn btn-light plusBut"><i class="dripicons-plus"></i> </button>
		</div>
		<hr style="border: 0; height: 1px; background: #ccc;">
	</div>
	</c:forEach>
	</div>
	</div>
	<div id="divWhole" >
		<div id="gridCont"><div class="grid-stack"></div></div>
		 <div style="display: none;">
	   	 	<textarea id="saved-data" cols="100" rows="20" readonly="readonly"></textarea>
	  	 </div>
	</div>
	<input type="hidden" id="memCd" value="${memCd}">
	<button type="button" id="savePtl" class="btn btn-info bottomBut" onClick="saveGrid()" style="margin-left: 330px;">저장</button>
	<button type="button" id="cancelBut" class="btn btn-secondary bottomBut">취소</button>
	
</div>
</body>

  <script type="text/javascript">
  	var RC001 = "";
		RC001 += "<p id='RC001' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC001 += "<br><p class='ptitle'>학적변동조회</p>"
	
	var RC002 = "";
		RC002 += "<p id='RC002' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC002 += "<br><p class='ptitle'>성적 조회</p>"

	var RC003 = "";
		RC003 += "<p id='RC003' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC003 += "<br><p class='ptitle'>상담신청 현황</p>"
		
	var RC004 = "";
		RC004 += "<p id='RC004' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC004 += "<br><p class='ptitle'>수강신청 내역</p>"
		
	var RC005 = "";
		RC005 += "<p id='RC005' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC005 += "<br><p class='ptitle'>결재 내역</p>"
		
	var RC006 = "";
		RC006 += "<p id='RC006' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC006 += "<br><p class='ptitle'>당학기 강의조회</p>"
	
	var RC007 = ""
		RC007 += "<p id='RC007' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC007 += "<br><p class='ptitle'>학사일정</p>"
		
	var RC008 = ""
		RC008 += "<p id='RC008' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC008 += "<br><p class='ptitle'>오늘의 대기/날씨</p>"
	
	var RC009 = ""
		RC009 += "<p id='RC009' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC009 += "<br><p class='ptitle'>공지사항</p>"
		
	var RC010 = ""
		RC010 += "<p id='RC010' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC010 += "<br><p class='ptitle'>개인일정</p>"
		
	var RC011 = ""
		RC011 += "<p id='RC011' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC011 += "<br><p class='ptitle'>코로나 19 공지</p>"
	
	var RC012 = ""
		RC012 += "<p id='RC012' class='deleteP' onClick = 'grid.removeWidget(this.parentNode.parentNode)'><i class='mdi mdi-close deleteIcon'></i></p>";
		RC012 += "<br><p class='ptitle'>강의시간표</p>"
	
	  var yy = 4;

	var rcObj = {};
	rcObj['RC001'] = RC001;
	rcObj['RC002'] = RC002;
	rcObj['RC003'] = RC003;
	rcObj['RC004'] = RC004;
	rcObj['RC005'] = RC005;
	rcObj['RC006'] = RC006;
	rcObj['RC007'] = RC007;
	rcObj['RC008'] = RC008;
	rcObj['RC009'] = RC009;
	rcObj['RC010'] = RC010;
	rcObj['RC011'] = RC011;
	rcObj['RC012'] = RC012;
	
	window.onload = function() {
		//포틀릿 추가하는 이벤트
	  	$(document).on('click','.plusBut', function(){
	  		 serializedFull = grid.save(true, true);
	  		serializedData = serializedFull.children;
// 	  	     var serialArray = JSON.stringify(serializedData, null, '  ');
// 	  	     console.log(serialArray)
// 	  	     serializedData = [];
	  	     
// 	  	     for(var i=0; i<serialArray.length; i++){
// 	  	    	serializedData.push(serialArray[i]);
// 	  	     }
	 
	  		console.log("serializedData" +  serializedData);
	  	      
	  		if(!confirm("해당 포틀릿을 추가하시겠습니까?")){
	  			return false;
	  		}else{
	  			//예를 눌렀을 경우 이벤트
	  			var butId = this.id;
	  			$('#'+butId).remove();
	  			
	  			yy += 2;
	  			console.log(serializedData);
	  			serializedDataAdd = {x: 0, y: yy, w: 4, h: 1, id: butId, content: rcObj[butId]},
	  			console.log(serializedDataAdd);
	  			
	  			serializedData.push(serializedDataAdd);
	  			
	  		    loadGrid();
	  			
	  		}
	  		
	  	});
	  	
	  	//삭제됐을경우 포틀릿 목록에 추가해주기 
		$(document).on('click', '.deleteP', function(){
			var poCate = this.id;
			var data = {"poCate" : poCate};
			
			$.ajax({
				url : '/main/deletePortlet',
				contentType : "application/json;charset=utf-8",
				data : JSON.stringify(data),
				dataType : 'JSON',
				type : "post",
				success : function(result){
					console.log(result);
					var str = '';
					
					str += '<div class="dividiv" id="'+ poCate +'">';
					str += '	<div style="height: 40px;">';
					str += '		<p class="plusP" >'+ result.COMD_NM +'</p>';
					str += '		<button id="'+ poCate +'" type="button" class="btn btn-light plusBut"><i class="dripicons-plus"></i> </button>';
					str += '	</div>';
					str += '	<hr style="border: 0; height: 1px; background: #ccc;">';
					str += '</div>';
					
					console.log(str);
					
					$('#findDiv').append(str);
				}
			})
		})
		
		//취소버튼을 누를 경우 경고문자 출력
		$('#cancelBut').on('click', function(){
			if(!confirm("저장하지 않은 포틀릿은 반영되지 않습니다.\n그래도 계속하시겠습니까?")){
				return false;
			}else{
				close();
			}
		});
	  	

	};

  
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
    
    
   		serializedData = [
   			<c:forEach var='list' items='${list}'>
   				{x: ${list.poX}, y: ${list.poY}, w: ${list.poW}, h: ${list.poH}, id: '${list.poCate}', content: ${list.poCate}}, 	
   			</c:forEach>
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
    //저장버튼 눌렀을 경우 onclick 이벤트
    saveGrid = function() {
      delete serializedFull;
      serializedData = grid.save();
      document.querySelector('#saved-data').value = JSON.stringify(serializedData, null, '  ');
		var memCd = $('#memCd').val();
		console.log(memCd);
		
		for(var i=0; i< serializedData.length; i++){
			serializedData[i].memCd = memCd;
		}
		
		let data = {"serializedData" : serializedData};
		
		console.log("serializedData : " + JSON.stringify(serializedData));
		
		var arr = [];
		var poCates = $('#findDiv').children('div');
		for (var i = 0; i < poCates.length; i++) {
			arr.push(poCates[i].id);
		}
		console.log(arr);
		
		$.ajax({
			url : '/main/savePortlet',
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(serializedData),
			type : "post",
			success : function(result){
				console.log(result);
				console.log(arr);
				data = {"arr" : arr,
						"memCd" : memCd};
				$.ajax({
					url : '/main/portletListYn',
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					type : "post",
					dataType : 'JSON',
					success : function(result){
						console.log(result);

						alert("성공적으로 저장되었습니다.");
						opener.parent.location.reload();
						window.close();

					}
				})

			}
		});
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
    


  </script>

</html>