/**
 * 개인정보 가져오기
 */
function getInfo() {
	$.ajax({
		url : "/pregister/getInfo",
		type : "POST",
		dataType : "JSON",
		success : function(res) {
			//console.log(res);
			
			$('#college').val(res.depNm);
			$('#credit').val(res.stuMrc);
			$('#myCredit').val(res.stuMoc);
			$('#yrNsem').val(res.stuYr + "학년 (" + res.stuSem + "학기)");
		}
	});
}
/**
 * 개설학과 불러오기
 */
function getDepartment() {
	$.ajax({
		url : "/course/department",
		type : "GET",
		dataType : "JSON",
		success : function(res) {
			str = '';
			
			$.each(res, function(i, v) {
				str += '<option value="' + v + '">' + v + '</option>';
			});
			
			$('#department').append(str);
		}
	});
}
/**
 * 개설강좌 불러오기
 */
function getList() {
	$.ajax({
		url : "/register/getList",
		type : 'GET',
		dataType : 'JSON',
		success : function(res) {

			//장바구니 있는 강의 lecaYn = 1, 없는 강의 lecaYn = 2
			$.each(res, function(i, v) {
				if(v.lecaYn == 1) {
					res[i]['btn'] = '<button class="delBtn2" onclick="putStuLec('+ v.lecaCd +','+ v.lecaCrd + ')">확정</button>';
				}else {
					res[i]['btn'] = '<button class="addBtn" onclick="putStuLec('+ v.lecaCd +','+ v.lecaCrd + ')">신청</button>';
				}
				res[i]['btnPdf'] = '<button class="btn btn-outline-secondary btn-sm" onclick="getSyllabus(' + v.lecaCd + ',' + v.lecCd + ')">강의계획서</button>';
			});
			
			grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : res,
				scrollX : true,
				scrollY : true,
				bodyHeight: 250,
				columns : [
					{header : '수강신청', name : 'btn', width : 100, align : 'center'},
					{header : '개설학과', name : 'lecaCon', filter : 'select', width : 200, align : 'center'},
					{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
					{header : '과목번호', name : 'subCd', filter : 'select', width : 120, align : 'center'},
					{header : '과목명', name : 'lecaNm', width : 200, filter : 'select'},
					{header : '제한인원', name : 'lecaMax', width : 70, align : 'center'},
					{header : '수강인원', name : 'lecaUnit', width : 70, align : 'center', filter : 'select'},
					{header : '개설이수구분', name : 'lecaCate', width :100, align : 'center'},
					{header : '학점', name : 'lecaCrd', width : 50, align : 'center'},
					{header : '강의시간/강의실', name : 'lecaTt', width : 230},
					{header : '담당교수', name : 'proNm', width : 100, align : 'center', filter : 'select'},
					{header : '성적평가방식', name : 'lecaGrade', width : 100, align : 'center'},
					{header : '강의계획서', name : 'btnPdf', align : 'center'}
				],
				columnOptions: {
			        resizable: true
			    }
			});
			
			closeLoadingWithMask();
		}
	});
}
/**
 * 수강신청 완료 리스트 불러오기
 */
function getRegList() {
	$.ajax({
		url : "/register/getRegList",
		type : 'GET',
		dataType : 'JSON',
		success : function(res) {
			
			//console.log(res);
	
			$.each(res, function(i, v) {
				res[i]['btn'] = '<button class="delBtn" onclick="deleteReg(' + v.lecaCd + ')">삭제</button>';
				res[i]['btnPdf'] = '<button class="btn btn-outline-secondary btn-sm" onclick="getSyllabus(' + v.lecaCd + ',' + v.proCd + ')">강의계획서</button>';
			});
			
			grid1 = new tui.Grid({
				el : document.getElementById('grid1'),
				data : res,
				scrollX : true,
				scrollY : true,
				bodyHeight: 250,
				columns : [
					{header : '수강신청', name : 'btn', width : 100, align : 'center'},
					{header : '개설학과', name : 'lecaCon', filter : 'select', width : 200, align : 'center'},
					{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
					{header : '과목번호', name : 'subCd', filter : 'select', width : 120, align : 'center'},
					{header : '과목명', name : 'lecaNm', width : 200, filter : 'select'},
					{header : '제한인원', name : 'lecaMax', width : 70, align : 'center'},
					{header : '수강인원', name : 'lecaUnit', width : 70, align : 'center'},
					{header : '개설이수구분', name : 'lecaCate', width :100, align : 'center'},
					{header : '학점', name : 'lecaCrd', width : 50, align : 'center'},
					{header : '강의시간/강의실', name : 'lecaTt', width : 230},
					{header : '담당교수', name : 'proNm', width : 100, align : 'center', filter : 'select'},
					{header : '성적평가방식', name : 'lecaGrade', width : 100, align : 'center'},
					{header : '강의계획서', name : 'btnPdf', align : 'center'}
				],
				columnOptions: {
			        resizable: true
			    }
			});
		}
	});
}
/**
 * 수강신청하기
 */
function putStuLec(lecaCd, lecaCrd) {

	//alert("lecaCd : " + lecaCd + ", lecaCrd : " + lecaCrd);

	var stuLecFlag = true;
	let dataObject = {
		lecaCd : lecaCd
	};
	
	//신청가능학점과 비교해보기
	standardCrd = parseInt($('#myCredit').val());
	nowCrd = parseInt($('#registerCrd').text());
	
	if(nowCrd + lecaCrd > standardCrd) {
		alert("신청가능학점이 초과되었습니다.");
		stuLecFlag = false;
	}
	
	//시간표가 중복되는지 확인하기
	$.ajax({
		url : "/register/checkTime",
		type : "POST",
		data : JSON.stringify(dataObject),
		contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		success : function(res) {
			if(res == 2) {
				stuLecFlag = false;
				alert("시간표가 중복됩니다.");
			}
			
			//중복되지 않는 경우 수강신청하기
			if(stuLecFlag) {
				$.ajax({
					url : "/register/putStuLec",
					type : "POST",
					data : JSON.stringify(dataObject),
					contentType : "application/json;charset=utf-8",
					dataType : "JSON",
					success : function(res) {
						if(res == 2 || res == 3) {
							alert("수강신청이 완료되었습니다.");
							
							getRegListAgain();
							getCnt();
							let dataObject = {
								year :  yearVal,
								semester : semVal,
								department : depVal,
								category : cateVal,
								subject : subVal
							};
							getListAgain(dataObject);
							updateTimeTable(lecaCd);
							getCnt();
							
							//수강신청 버튼을 클릭하면 socket에 msg를 추가함
							var msg = "1,reg";
							socket.send(msg);
						}else if(res == 4) {
							alert("인원이 초과되었습니다.");
						}else {
							alert("다시 시도해주세요.");
						}
						
					}
				});
			}
		}
	});
}
/**
 * 검색 후 개설강좌 리스트 불러오기
 */
function getListAgain(dataObject) {
	$.ajax({
		url : "/register/getListAgain",
		type : "POST",
		data : JSON.stringify(dataObject),
		contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		success : function(res) {
			$('#grid').empty();
			
			//장바구니 있는 강의 lecaYn = 1, 없는 강의 lecaYn = 2
			$.each(res, function(i, v) {
				if(v.lecaYn == 1) {
					res[i]['btn'] = '<button class="delBtn2" onclick="putStuLec('+ v.lecaCd +','+ v.lecaCrd + ')">확정</button>';
				}else {
					res[i]['btn'] = '<button class="addBtn" onclick="putStuLec('+ v.lecaCd +','+ v.lecaCrd + ')">신청</button>';
				}
				res[i]['btnPdf'] = '<button class="btn btn-outline-secondary btn-sm" onclick="getSyllabus(' + v.lecaCd + ',' + v.lecCd + ')">강의계획서</button>';
			});
			
			grid = new tui.Grid({
				el : document.getElementById('grid'),
				data : res,
				scrollX : true,
				scrollY : true,
				bodyHeight: 250,
				columns : [
					{header : '수강신청', name : 'btn', width : 100, align : 'center'},
					{header : '개설학과', name : 'lecaCon', filter : 'select', width : 200, align : 'center'},
					{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
					{header : '과목번호', name : 'subCd', filter : 'select', width : 120, align : 'center'},
					{header : '과목명', name : 'lecaNm', width : 200, filter : 'select'},
					{header : '제한인원', name : 'lecaMax', width : 70, align : 'center'},
					{header : '수강인원', name : 'lecaUnit', width : 70, align : 'center'},
					{header : '개설이수구분', name : 'lecaCate', width :100, align : 'center'},
					{header : '학점', name : 'lecaCrd', width : 50, align : 'center'},
					{header : '강의시간/강의실', name : 'lecaTt', width : 230},
					{header : '담당교수', name : 'proNm', width : 100, align : 'center', filter : 'select'},
					{header : '성적평가방식', name : 'lecaGrade', width : 100, align : 'center'},
					{header : '강의계획서', name : 'btnPdf', align : 'center'}
				],
				columnOptions: {
			        resizable: true
			    }
			});
			
		}
	});
}
/**
 * 수강신청 학점 및 과목수 불러오기
 */
function getCnt() {
	$.ajax({
		url : "/register/getCnt",
		type : "POST",
		dataType : "JSON",
		success : function(res) {
			registerCrd = res.SUM + ".0";
			registerSub = res.CNT + "개";
			
			$('#registerCrd').text(registerCrd);
			$('#registerSub').text(registerSub);
		}
	});
}
/**
 * 강의계획서 PDF Viewer
 */
function getSyllabus(lecaCd, proCd) {
	param = {"lecaCd" : lecaCd};
	
	$.ajax({
		url : '/approval/lecApplyPdf',
		type : 'post',
		data : JSON.stringify(param),
		dataType : 'JSON',
		contentType : 'application/json;charset=utf-8',
		success : function(result){
			console.log(result);
			window.open("/approval/lecApproPdfGet/" + lecaCd, "a", "width=1200, height=850, left=100, top=50"); 
		}
	});
}
/**
 * 수강신청 완료 리스트 불러오기
 */
function getRegListAgain() {
	$.ajax({
		url : "/register/getRegList",
		type : 'GET',
		dataType : 'JSON',
		success : function(res) {
			$('#grid1').empty();
	
			$.each(res, function(i, v) {
				res[i]['btn'] = '<button class="delBtn" onclick="deleteReg(' + v.lecaCd + ')">삭제</button>';
				res[i]['btnPdf'] = '<button class="btn btn-outline-secondary btn-sm" onclick="getSyllabus(' + v.lecaCd + ',' + v.proCd + ')">강의계획서</button>';
			});
			
			grid1 = new tui.Grid({
				el : document.getElementById('grid1'),
				data : res,
				scrollX : true,
				scrollY : true,
				bodyHeight: 250,
				columns : [
					{header : '수강신청', name : 'btn', width : 100, align : 'center'},
					{header : '개설학과', name : 'lecaCon', filter : 'select', width : 200, align : 'center'},
					{header : '학년', name : 'lecaTrg', filter : 'select', width : 70, align : 'center'},
					{header : '과목번호', name : 'subCd', filter : 'select', width : 120, align : 'center'},
					{header : '과목명', name : 'lecaNm', width : 200, filter : 'select'},
					{header : '제한인원', name : 'lecaMax', width : 70, align : 'center'},
					{header : '수강인원', name : 'lecaUnit', width : 70, align : 'center'},
					{header : '개설이수구분', name : 'lecaCate', width :100, align : 'center'},
					{header : '학점', name : 'lecaCrd', width : 50, align : 'center'},
					{header : '강의시간/강의실', name : 'lecaTt', width : 230},
					{header : '담당교수', name : 'proNm', width : 100, align : 'center', filter : 'select'},
					{header : '성적평가방식', name : 'lecaGrade', width : 100, align : 'center'},
					{header : '강의계획서', name : 'btnPdf', align : 'center'}
				],
				columnOptions: {
			        resizable: true
			    }
			});
		}
	});
}
/**
 * 수강신청 완료 리스트에서 삭제하기
 */
function deleteReg(lecaCd) {

	//수강신청 내역에서 삭제할 경우 socket에 msg를 추가함
	var msg = "1,reg";
	socket.send(msg);

	let dataObject = {
		lecaCd : lecaCd,
		year :  yearVal,
		semester : semVal,
		department : depVal,
		category : cateVal,
		subject : subVal
	};
	
	$.ajax({
		url : "/register/deleteStuLec",
		type : "POST",
		data : JSON.stringify(dataObject),
		contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		success : function(res) {
			if(res == 2) {
				alert("삭제되었습니다.");
			}else {
				alert("다시 시도해주세요.");
			}
			
			getRegListAgain();
			getCnt();
			deleteTimeTable(lecaCd);
			getListAgain(dataObject);
		}
	});
}
/**
 * 수강신청 시간표 가져오기
 */
function getTime() {

	$.ajax({
		url : "/register/getTime",
		type : "POST",
		dataType : "JSON",
		success : function(res) {
			//console.log(res);
			
			subject = '';
			
			$.each(res, function(i, v) {
				if(subject != v.SUB_CD) {
					subject = v.SUB_CD;
					colorNum ++;
					
					if(colorNum > 10) {
						colorNum = 1;
					}
				}
				$('#showTimeTable').find("tr").eq(v.GYOSI).find("td").eq(v.YOIL - 1).text(v.SUB_CD);
				$('#showTimeTable').find("tr").eq(v.GYOSI).find("td").eq(v.YOIL - 1).css("background-color", colorArr[colorNum - 1]);
			});
		}
	});
}
/**
 * 소켓에 메시지가 있을 때 lec_hcnt 리스트 불러오기
 */
function updateCntList(dataObject) {
	
	//alert("lec_hcnt 시작");

	$.ajax({
		url : "/register/updateCntList",
		type : "POST",
		data : JSON.stringify(dataObject),
		contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		success : function(res) {
			//alert("lec_hcnt 도착");
			//console.log(res);
			
			var dataSet = grid.getData();
			$.each(dataSet, function(i, v) {
				grid.setValue(v.rowKey, "lecaUnit", res[i], false);
			});
		}
	});
}
/**
 * 수강신청 시 시간표에 해당 부분 표시
 */
function updateTimeTable(lecaCd) {
	let dataObject = {
		lecaCd : lecaCd
	};
	
	$.ajax({
		url : "/register/updateTimeTable",
		type : "POST",
		data : JSON.stringify(dataObject),
		contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		success : function(res) {
			
			//console.log("추가하려는 강의 시간표 : " + res);
		
			//색을 칠해주기
			subject = '';
			
			$.each(res, function(i, v) {
				if(subject != v.SUB_CD) {
					subject = v.SUB_CD;
					colorNum ++;
					
					if(colorNum > 10) {
						colorNum = 1;
					}
				}
				$('#showTimeTable').find("tr").eq(v.GYOSI).find("td").eq(v.YOIL - 1).text(v.SUB_CD);
				$('#showTimeTable').find("tr").eq(v.GYOSI).find("td").eq(v.YOIL - 1).css("background-color", colorArr[colorNum - 1]);
			});
		}
	});
}
/**
 * 수강신청 삭제 시 시간표에 해당 부분 삭제
 */
function deleteTimeTable(lecaCd) {
	let dataObject = {
		lecaCd : lecaCd
	};
	
	$.ajax({
		url : "/register/updateTimeTable",
		type : "POST",
		data : JSON.stringify(dataObject),
		contentType : "application/json;charset=utf-8",
		dataType : "JSON",
		success : function(res) {
		
			//console.log("삭제하려는 강의 시간표 : " + res);
			
			//색을 빼주기
			$.each(res, function(i, v) {
				$('#showTimeTable').find("tr").eq(v.GYOSI).find("td").eq(v.YOIL - 1).text("");
				$('#showTimeTable').find("tr").eq(v.GYOSI).find("td").eq(v.YOIL - 1).css("background-color", "");
			});
		}
	});
}
/**
 * 소켓에 메시지가 있을 때 lec_hcnt 위시리스트 불러오기
 */
function updateCntWishList() {

	$.ajax({
		url : "/register/updateCntWishList",
		type : "POST",
		dataType : "JSON",
		success : function(res) {
			
			var dataSet = grid1.getData();
			$.each(dataSet, function(i, v) {
				grid1.setValue(v.rowKey, "lecaUnit", res[i], false);
			});
		}
	});
}