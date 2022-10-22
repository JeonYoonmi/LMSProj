<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">
#recordApplyRound{
	width : 100%;
}

#personalGradeInfo{
	border : 1px solid lightgray;
	margin : 10px;
	padding : 10px;
	background: #f4f7fd;
	width : 100%;
	min-width : 1200px;
	max-width : 1400px;
	margin : 0 auto;
}
#personalGradeInfo .round{
	display : inline-block;
}
#personalGradeInfo div:nth-child(2){
	margin-left : 274px;
}
#personalGradeInfo label{
	text-align : right;
	width : 130px;
}
#personalGradeInfo input{
	width : 200px;
 	height: 33px;
 	background: #F2F2F2;
 	border: 1px solid gray;
 	border-radius : 5px;
	padding-left : 5px;
}
.popup {display: none;
        position: fixed;
        left: 50%;
        top: 50%;
        width:20%;
        margin-left:-10%;
        height: 300px;
        margin-top: -200px;
        z-index: 1000;
        background: white;
        border: 1px solid #d1d8dd;
        box-shadow: 0 0 6px 1px rgb(0 0 0 / 30%);
 }
 #applyApprovalSelect, #stuInfo, #recordApplyDetailSelect{
 	display:inline-block;
	margin-left : 2%;
 }
.btn-primary{
 	background : #2a5388;
 	border : #2a5388;
 	box-shadow : #2a5388;
 }
.btn-primary:hover{
 	background : #4671af;
 	border : #4671af;
 	box-shadow : #4671af;
 }
 .btn-primary:disabled{
 	background : #2a5388;
 	border : #2a5388;
 	box-shadow : #2a5388;
 }
 #detailInfo{
 	width : 100%;
 	margin-top : 30px;
 }
  #detailInfo table{
  	width : 100%;
  }
  #detailInfo table td{
  	border:1px solid #C0C0C0;
  }
  #detailInfo td:nth-child(2n-1){
  	width : 25%;
 	padding-left : 10px;
 }
#div2 tbody,
#div2 tbody tr
{
  	display : block;
}
#div2 tbody tr td:first-child{
	display : inline-block;
	width : 24%;
	border : none;
}
#div2 tbody tr td:last-child{
	display : inline-block;
	width : 75%;
}
 #save{
 	margin-right : 15px;
 }
 
/* #personalGradeInfo { */
/*       border : 1px solid lightgray; */
/*       margin : 10px; */
/*       padding : 10px; */
/*    } */
.popup {display: none;
        position: fixed;
        left: 50%;
        top: 50%;
        width:20%;
        margin-left:-10%;
        height: 300px;
        margin-top: -200px;
        z-index: 1000;
        background: white;
        border: 1px solid #d1d8dd;
        box-shadow: 0 0 6px 1px rgb(0 0 0 / 30%);
 }
 .labelClass{
    width: 70px;
    text-align: right;
    
 }
 .inText{
    width : 220px;
    margin-left: 15px;
    height: 33px;
 }
</style>

<script type="text/javascript" src="/resources/js/tui-grid.js"></script>
<link rel="stylesheet" href="/resources/css/tui-grid.css" type="text/css">
<script type="text/javascript" defer="defer">
$(function(){
   var memCd = $('#stuCd').val();
   var firstData = {"memCd" : memCd
               ,"rnum": 1};
   //처음 상세이력
   $.ajax({
      url : "/record/firstData",
      contentType : "application/json;charset=utf-8",
      data : JSON.stringify(firstData),
      type : "post",
      success : function(result){
         
         $('#applyGubun').val(result.comdNm + "신청");
         $('#applyGubun').prop('readonly', true);
         $('#changeReason1').val(result.recRsn);
         $('#changeReason1').prop('readonly', true);
         if((result.recPer) == 0){
            $('#term').val("");
            $('#term').prop('readonly', true);
         }else{
            $('#term').val(result.recPer + "학기");
            $('#term').prop('readonly', true);
         }
//          $('#applyYear').val(result.recDt + " (" + result.recYr +"년도 / " + result.recSem+"학기)");
         $('#applyYear').prop('readonly', true);
         $('#endYear').val(result.endExpect);
         $('#endYear').prop('readonly', true);
         $('#counselYn').prop('checked', true);
      },
      dataType : 'JSON'
   });
   
   //전체 리스트 가져오기
   $.ajax({
      url : "/record/ajaxhubeokApply",
      type : 'POST',
      dataType : 'JSON',
      success : function(result) {
         console.log(result);
         grid = new tui.Grid({
            el : document.getElementById('grid'),
            data : result,
            scrollX : true,
            scrollY : true,
            minBodyHeight : 500,
            bodyHeight: 250,
            columns : [
               {header : '신청구분', name : 'lecaBook', filter : 'select', width : 110, align : 'center'},
               {header : '년도/학기', name : 'lecaCate', filter : 'select', width : 170, align : 'center'},
               {header : '신청학기', name : 'lecaNm', filter : 'select', width : 110, align : 'center'},
               {header : '신청일자', name : 'lecaCon', width : 170, align : 'center'},
               {header : '승인구분', name : 'lecaRoom', filter : 'select',  align : 'center'}
            ],
            rowHeaders: ['rowNum'],
            columnOptions: {
                 resizable: true
            }

         });
         
         grid.on('click', function(object){
             var div1 = document.querySelector('#div1');
//              var div2 = document.querySelector('#div2');
             
             div1.style.display = 'block';
//              div2.style.display = "none";
            
             console.log(grid.getRow(object.rowKey));
             $('#applyGubun').val(grid.getRow(object.rowKey).lecaBook + "신청");
             $('#changeReason').val(grid.getRow(object.rowKey).lecaNote);
             $('#term').val(grid.getRow(object.rowKey).lecaNm);
             $('#applyYear').val(grid.getRow(object.rowKey).lecaCon);
             $('#endYear').val(grid.getRow(object.rowKey).lecaTt);
             $('#counselYn').prop("checked", true);
             
             $('#applyGubun').prop("readonly", true);
             $('#changeReason').prop("readonly", true);
             $('#term').prop("readonly", true);
             $('#applyYear').prop("readonly", true);
             $('#endYear').prop("readonly", true);
         })
         
         }
   });
   
//    //신청/승인이력에서 tr을 누르면 오른쪽에 상세이력 정보 확인가능
//     $('#historyTable tbody').on('click', 'tr td:not(:first-child)', function () {
       
//        var myRow = $(this).closest("tr").index() + 1;
//        console.log(myRow);
//        var stuNum = $('#stuNum').val();
//        console.log(stuNum);
       
//        let data = {"memCd" : stuNum
//                 ,"rnum" : myRow};
       
//       //변동사유를 셀렉트 박스로 바꾸기
//       var changeReason1 = document.querySelector('#changeReason1');      
//       var changeReason2 = document.querySelector('#changeReason2');      
      
//       changeReason1.style.display = 'block';
//       changeReason2.style.display = 'none';

//        //상세이력
//        $.ajax({
//           url : "/record/detailHistory",
//           contentType : "application/json;charset=utf-8",
//           data : JSON.stringify(data),
//           type : "post",
//           success : function(result){
//               $('#save').prop('disabled', true);
//              console.log(result);
             
//              $('#applyGubun').val(result.comdNm + "신청");
//             $('#applyGubun').prop('readonly', true);
//             $('#changeReason1').val(result.recRsn);
//             $('#changeReason1').prop('readonly', true);
//             if((result.recPer) == 0){
//                $('#term').val("");
//                $('#term').prop('readonly', true);
//             }else{
//                $('#term').val(result.recPer + "학기");
//                $('#term').prop('readonly', true);
//             }
// //             $('#applyYear').val(result.recDt + " (" + result.recYr +"년도 / " + result.recSem+"학기)");
//             $('#applyYear').prop('readonly', true);
//             $('#endYear').val(result.endExpect);
//             $('#endYear').prop('readonly', true);
//             $('#counselYn').prop('checked', true);
//           },
//           dataType : 'JSON'
//        });
       
//     });
   
   //신규(신청)버튼을 눌렀을 경우
   $('#newApply').on('click', function(){
      $('#applyGubun').val("자퇴신청");
      $('#changeReason1').val("");
      $('#term').val("");
      $('#applyYear').val("");
      $('#endYear').val("");
      $('#counselYn').prop('checked', false);
      $('#save').prop('disabled', false);
      
      //변동사유를 셀렉트 박스로 바꾸기
      var changeReason1 = document.querySelector('#changeReason1');      
      var changeReason2 = document.querySelector('#changeReason2');      
      
      changeReason1.style.display = 'none';
      changeReason2.style.display = 'block';
      
      var stuNum = $('#stuCd').val();
      var param = {"stuCd" : stuNum,
                "cnslCate" : 'C103'}
      
      //상담여부 체크
       $.ajax({
             url : "/record/counselCnt",
             contentType : "application/json;charset=utf-8",
             data : JSON.stringify(param),
             type : "post",
             success : function(result){
                console.log(result);
                if(result >= 1){
                   $('#counselYn').prop('checked', true);
                }
             },
             dataType : 'JSON'
          });
      
   })
   
   //저장 버튼을 눌렀을 경우
   $('#save').on('click', function(){
         if($('#counselYn').is(':checked') == false){
            alert("자퇴신청은 상담이 필수입니다");
            return false;
         }
         
         var stuNum = $('#stuCd').val();            //stuCd
         var changeReason = $('#changeReason2').val();   //recRsn
         

         let data = {"stuCd" : stuNum,
                  "recCate" : 'R003',
                  "recPer" : 0,
                  "recRsn" : changeReason};

         
          $.ajax({
             url : "/record/saveRecord",
             contentType : "application/json;charset=utf-8",
             data : JSON.stringify(data),
             type : "post",
             dataType : 'JSON',
             success : function(result){
                console.log(result);
                alert("성공적으로 저장되었습니다");
                document.location.href= document.location.href;
             }
             
          });
      })
      
      $('#counselYn').on('click', function(){
         alert("자퇴신청은 상담이 필수입니다.\n사용자가 변경할 수 없습니다.");
      })
});

</script>
</head>
<body>
   <div>
      <i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i> 학적관리 <i class="dripicons-chevron-right"></i> <span style="font-weight: bold;">자퇴신청</span>
   </div>
   <br><br>
	<c:forEach var="data" items="${data}">
		<div id = "personalGradeInfo">
			<div class="round">
				<label class="labelClass">학번</label>
				<input type="text" class="inText" name="stuCd" id="stuCd" readonly="readonly" value="${data.memCd }">
	        	<button type="button" class="btn btn-secondary" id="photoBtn" style="height: 34px;">사진</button>
	        </div>
	        <div class="round">
	        	<label class="labelClass">성명</label>
	        	<input type="text" class="inText" name="memName" id="memName" readonly="readonly" value="${data.memNm }">
	        </div>
	        <br>
	        <div class="round">
	        	<label class="labelClass">입학정보</label>
	        	<input type="text" class="inText" name="admission" id="admission" readonly="readonly" value="${data.memAddr1 }">
	        </div>
	        <div class="round">
	        	<label class="labelClass">연락처</label>
	        	<input type="text" class="inText" name="memTel" id="memTel" readonly="readonly" value="${data.memTel }" >
	        </div>
	   		<div class="round">
	   			<label class="labelClass">소속</label>
	   			<input type="text" class="inText" name="college" id="college" readonly="readonly" value="${data.memNme }">
	   		</div>
	   		<br>
	   		<div class="round">
	   			<label class="labelClass" >학년</label>
	   			<input type="text" class="inText" name="yrNsem" id="yrNsem" readonly="readonly" value="${data.memMl }">
	   		</div>
	   		<div class="round">
	   			<label class="labelClass" >변동</label>
	   			<input type="text" class="inText"  name="admChange" id="admChange" readonly="readonly" value="${data.memAddr2 }">
	   		</div>
	   		<div class="round">
	   		<label class="labelClass" >생년월일</label>
	   		<input type="text" class="inText" name="memReg1" id="memReg1" readonly="readonly" value="${data.memReg1 }">
	   		</div>
	   </div>
	</c:forEach>
	<br><br>
   <div style="width: 730px; float: left;" id="divTable">
      <p style="float: left"><i class="mdi mdi-record-circle"></i>&ensp;신청/승인이력</p>
      <p style="float: right;">총 <span style="font-weight: bold;">${cnt}</span>건</p>
      <br style="clear: both;">
      <div style="height: 800px;">
         <div id="grid"></div>
      </div>
   </div>
   
   <div style="width: 600px; float: left; margin-left: 50px;" id = "divId">
      <p><i class="mdi mdi-record-circle"></i>&ensp;상세정보</p>
      <button id="newApply" type="button">신규(신청)</button>
      <button id="save" type="button" disabled="disabled">저장</button>
      <br>
      
      <div id = "div1">
      <div class="mb-3 delete">
          <label for="simpleinput" class="form-label">신청구분</label>
          <input type="text" id="applyGubun" class="form-control" />
      </div>
      <div class="mb-3 delete">
          <label for="simpleinput" class="form-label">변동사유</label>
          <input type="text" id="changeReason1" class="form-control" readonly="readonly"/>
          
         <select class="form-control" id="changeReason2" style="display: none">                
                    <option>개인사정</option>                                     
                    <option>질병</option>                                     
                    <option>타대학</option>                                   
                    <option>가사</option>                              
                    <option>취업</option>                                     
                    <option>유학</option>                                     
          </select>  
      </div>
      <div class="mb-3 delete">
          <label for="simpleinput" class="form-label">기간</label>
          <input type="text" id="term" class="form-control" />
      </div>
      </div>
      
      <div class="mb-3">
          <label for="simpleinput" class="form-label">신청년도/학기</label>
          <input type="text" id="applyYear" class="form-control">
      </div>
      <div class="mb-3">
          <label for="simpleinput" class="form-label">종료년도/학기</label>
          <input type="text" id="endYear" class="form-control">
      </div>
      
      <div class="mb-3">
         <label for="example-month" class="form-label">상담확인</label>
         <div class="form-check">
            <input type="checkbox" class="form-check-input" id="counselYn" onclick="return false;">
            <label class="form-check-label" for="customCheck1">상담 여부</label>
         </div>
      </div>

<!--       <div class="mb-3 delete"> -->
<!--           <label for="simpleinput" class="form-label">신청구분</label> -->
<!--           <input type="text" id="applyGubun" class="form-control"/> -->
<!--       </div> -->
      
<!--       <div id = "div1"> -->
<!--       <div class="mb-3 delete"> -->
<!--           <label for="simpleinput" class="form-label">변동사유</label> -->
<!--           <input type="text" id="changeReason1" class="form-control" /> -->
<!--       </div> -->
<!--       <select class="form-select" id="changeReason2" style="display: none">                 -->
<!--                  <option>개인사정</option>                                      -->
<!--                  <option>질병</option>                                      -->
<!--                  <option>타대학</option>                                    -->
<!--                  <option>가사</option>                               -->
<!--                  <option>취업</option>                                      -->
<!--                  <option>유학</option>                                      -->
<!--        </select>   -->
<!--       </div> -->
      
<!--       <div class="mb-3"> -->
<!--           <label for="simpleinput" class="form-label">신청년도/학기</label> -->
<!--           <input type="text" id="applyYear" class="form-control"> -->
<!--       </div> -->
<!--       <div class="mb-3"> -->
<!--          <label for="example-month" class="form-label">상담확인</label> -->
<!--          <div class="form-check"> -->
<!--             <input type="checkbox" class="form-check-input" id="counselYn" onclick="return false;"> -->
<!--             <label class="form-check-label" for="customCheck1">상담 여부</label> -->
<!--          </div> -->
<!--       </div> -->
   </div>

</body>

</html>