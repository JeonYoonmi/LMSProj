<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/css/suwon.css">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<style>
	/* 기본 틀 잡기 (사이버캠퍼스 / 변동 가능 / suwon.css 파일에 넣었다가 주석 처리함) */
	.card {
		min-height: 780px;
		width: 100%;
		padding: 2%;
		border-top: 5px solid #112a63;
		border-radius: 10px 10px 0 0;
		max-width: 1400px;
		min-width: 1090px;
		margin: 0 auto;
		margin-bottom: 150px;
	}
	
	.card-body {
		width: 100%;
	}
	
	/* 기본 틀 잡기 끝 */
	
	.quizInputWrap {
		height: 300px;
		background: #f5f5f5;
		padding: 2%;
		border-radius: 5px;
		border: 1px solid #e0e0e0;
		margin-bottom: 30px;
	}
	
	.table thead th {
		border-bottom: 1px solid #eef2f7;
		border-top: 1px solid #e0e0e0; 
	}
	
	.plusBtn {
		margin: 2% auto;
	    width: 25%;
	    font-size: 1.2em;
	    text-shadow: 2px 2px rgb(0 0 0 / 40%);
	    font-weight: 700;
	    height: 45px;
	    display: block;
	}
	
	.minusbtn, #delbtncntsix {
		float: right;
	    text-shadow: 2px 2px rgb(0 0 0 / 10%);
	    font-weight: 700;
	    width: 4%;
	}
</style>

<div class="col-lg-12">
	<div class="card" style="min-height: 700px;">
		<div class="card-body">
			<div class="quizWrapper">
				<form id="frm" method="post" action="/professorLecture/quizInsertPost?testCd=${data.testCd}">
				<div class="quizInputWrap">
					<input type="hidden" class="form-control" name="lecCd" value="${ data.lecCd }">
					<div class="mb-3"  style="width:40%;float:left;">
						<label for="simpleinput" class="form-label">퀴즈 제목</label>
						<input type="text" minlength="3" maxlength="30" class="form-control quizName" name="testNm" placeholder="퀴즈명을 입력하세요." required/>
					</div>
					
					<div class="mb-3"  style="width:20%;float:left;margin:0 3%">
						<label for="simpleinput" class="form-label">퀴즈 시작일</label>
						<input type="datetime-local" id="quizStartDate" name="testSt" class="form-control" required/>
					</div>
				
					<div class="mb-3"  style="width:20%;float:left;">
						<label for="simpleinput" class="form-label">퀴즈 종료일</label>
						<input type="datetime-local" id="quizEndDate" name="testEt" class="form-control" required/>
					</div>
				
					<div class="mb-3"  style="width:11%;float:right;">
						<label for="simpleinput" class="form-label" style="width: 100px;height: 14px;"></label>
						<button type="button" class="btn btn-secondary fillQuiz">자동 채우기</button>
					</div>
				
					<div class="clear"></div>
			
					<div class="mb-3" style="width:100%;float:left;">
						<label for="example-disable" class="form-label">내용</label>
						<textarea class="form-control testCon" minlength="5" id="textBox" name="testCon" rows="4" style="resize:none;" maxlength="200" placeholder="퀴즈 내용을 입력하세요." required></textarea>
						<div style="float:right;margin-top:10px;">
							<span style="color:#999;" class="textCount">0자</span>
							<span style="color:#999;" class="textTotal">&nbsp;/&nbsp;100자</span>
						</div>
					</div>
				</div>
			
				<div class="clear"></div>
				
			             <div class="table-responsive-sm" id="plusArea" style="border-bottom: 1px solid #e0e0e0">
			<%--              	<c:set var="i" value="${i+1 }" /> --%>
			                 <table class="table table-centered mb-0">
			                     <thead>
			                         <tr>
			                             <th>
			                             	<label style="margin:10px;float:left;" class="cnt">1.&nbsp;</label>
											<span>
												<input type="text" minlength="1" class="form-control question" name="testQVOList[0].teqNo" placeholder="문제를 입력하세요." style="width:90%;display: inline-block;" required/>
												<button type="button" id="delbtn" class="minusbtn btn btn-light">-</button>
											</span>
			                             </th>
			                         </tr>
			                     </thead>
			                     <tbody>
			                         <tr>
			                             <td>
											<input type="hidden" class="form-control" name="testQVOList[0].testCd" value="${data.testCd }">
											<input type="text" minlength="1" name="testQVOList[0].teqOp1" class="form-control firchoice" placeholder="첫 번째 보기 답안을 입력하세요." style="width:97%;margin:10px 10px 10px 35px;" required/>
											<input type="text" minlength="1" name="testQVOList[0].teqOp2" class="form-control secchoice" placeholder="두 번째 보기 답안을 입력하세요." style="width:97%;margin:10px 10px 10px 35px;" required/>
											<input type="text" minlength="1" name="testQVOList[0].teqOp3" class="form-control thichoice" placeholder="세 번째 보기 답안을 입력하세요." style="width:97%;margin:10px 10px 10px 35px;" required/>
											<input type="text" minlength="1" name="testQVOList[0].teqOp4" class="form-control forchoice" placeholder="네 번째 보기 답안을 입력하세요." style="width:97%;margin:10px 10px 10px 35px;" required/>
											<input type="number" minlength="1" name="testQVOList[0].teqAnswer" min="1" max="4" step="1" class="form-control questionAnswer" placeholder="정답을 숫자로 입력하세요.(예시: 3)" style="width:97%;margin:10px 10px 10px 35px;" required/>
			                             </td>
			                         </tr>
			                     </tbody>
			                 </table>
			             </div>
			     <!-- tab-content end -->
			     <div style="width: 100%;">
					<button type="button" class="plusBtn btn btn-secondary">+</button>
			     </div>
				<div style="clear: both;"></div>
				<button type="submit" class="btn btn-primary" style="float: right;">제출</button>
				</form>
				<form method="post" action="/professorLecture/quizDelete" style="display: inline-block;" >
					<input type="hidden" class="form-control" name="lecCd" value="${ data.lecCd }">
					<input type="hidden" class="form-control" name="testCd" value="${ data.testCd }">
					<button type="submit" id="cancelInsert" class="btn btn-light">취소</button>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- quizWrapper end -->

<script type="text/javascript" defer="defer">

	let cnt = 1;

	function fillQuiz() {
			// 2번
			var str = '<table class="table table-centered mb-0">';
			str += '<thead><tr><th>';
			str += '<label style="margin:10px;float:left;" class="cnt">' + 2 + '.&nbsp;</label>';
			str += '<span><input type="text" minlength="1" maxlength="30" class="form-control" name="testQVOList[1].teqNo" value="UML 다이어그램 중 순차 다이어그램에 대한 설명으로 틀린 것은?" style="width:90%;display: inline-block;"/><button type="button" class="minusbtn btn btn-light">-</button></span>';
			str += '</th></tr></thead>';
			str += '<tbody><tr><td>';
			str += '<input type="hidden" class="form-control" name="testQVOList[1].testCd" value="${data.testCd }">';
			str += '<input type="text" name="testQVOList[1].teqOp1" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="객체 간의 동적 상호작용을 시간 개념을 중점으로 모델링 하는 것이다." />';
			str += '<input type="text" name="testQVOList[1].teqOp2" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="주로 시스템의 정적 측면을 모델링하기 위해 사용한다." />';
			str += '<input type="text" name="testQVOList[1].teqOp3" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="일반적으로 다이어그램의 수직 방향이 시간의 흐름을 나타낸다." />';
			str += '<input type="text" name="testQVOList[1].teqOp4" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="회귀 메시지(Self-Message), 제어블록(Statement block) 등으로 구성된다." />';
			str += '<input type="number" name="testQVOList[1].teqAnswer" min="1" max="4" step="1" value="2" class="form-control onlyNumber" style="width:97%;margin:10px 10px 10px 35px;"/>';
			str += '</td></tr></tbody></table>';
			// 3번
			str += '<table class="table table-centered mb-0">';
			str += '<thead><tr><th>';
			str += '<label style="margin:10px;float:left;" class="cnt">' + 3 + '.&nbsp;</label>';
			str += '<span><input type="text" minlength="1" maxlength="30" class="form-control" name="testQVOList[2].teqNo" value="라우팅 프로토콜에 대한 설명으로 틀린 것은?" style="width:90%;display: inline-block;"/><button type="button" class="minusbtn btn btn-light">-</button></span>';
			str += '</th></tr></thead>';
			str += '<tbody><tr><td>';
			str += '<input type="hidden" class="form-control" name="testQVOList[2].testCd" value="${data.testCd }">';
			str += '<input type="text" name="testQVOList[2].teqOp1" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="경로 선택 메트릭은 홉 카운트(hop count)이다." />';
			str += '<input type="text" name="testQVOList[2].teqOp2" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="각 라우터는 이웃 라우터들로부터 수신한 정보를 이용하여 라우팅 표를 갱신한다." />';
			str += '<input type="text" name="testQVOList[2].teqOp3" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="최단 경로 탐색에 Bellman-Ford 알고리즘을 사용한다." />';
			str += '<input type="text" name="testQVOList[2].teqOp4" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="라우팅 프로토콜을 IGP와 EGP로 분류했을 때 EGP에 해당한다." />';
			str += '<input type="number" name="testQVOList[2].teqAnswer" min="1" max="4" step="1" value="4" class="form-control onlyNumber" style="width:97%;margin:10px 10px 10px 35px;"/>';
			str += '</td></tr></tbody></table>';
			// 4번
			str += '<table class="table table-centered mb-0">';
			str += '<thead><tr><th>';
			str += '<label style="margin:10px;float:left;" class="cnt">' + 4 + '.&nbsp;</label>';
			str += '<span><input type="text" minlength="1" maxlength="30" class="form-control" name="testQVOList[3].teqNo" value="대칭 암호 알고리즘과 비대칭 암호 알고리즘에 대한 설명으로 틀린 것은?" style="width:90%;display: inline-block;"/><button type="button" class="minusbtn btn btn-light">-</button></span>';
			str += '</th></tr></thead>';
			str += '<tbody><tr><td>';
			str += '<input type="hidden" class="form-control" name="testQVOList[3].testCd" value="${data.testCd }">';
			str += '<input type="text" name="testQVOList[3].teqOp1" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="대칭 암호 알고리즘은 비교적 실행 속도가 빠르기 때문에 다양한 암호의 핵심 함수로 사용될 수 있다." />';
			str += '<input type="text" name="testQVOList[3].teqOp2" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="비대칭 암호 알고리즘은 자신만이 보관하는 비밀키를 이용하여 인증, 전자서명 등에 적용이 가능하다." />';
			str += '<input type="text" name="testQVOList[3].teqOp3" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="대칭 암호 알고리즘은 비밀키 전달을 위한 키 교환이 필요하지 않아 암호화 및 복호화의 속도가 빠르다." />';
			str += '<input type="text" name="testQVOList[3].teqOp4" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="대표적인 대칭키 암호 알고리즘으로는 AES, IDEA 등이 있다." />';
			str += '<input type="number" name="testQVOList[3].teqAnswer" min="1" max="4" step="1" value="3" class="form-control onlyNumber" style="width:97%;margin:10px 10px 10px 35px;"/>';
			str += '</td></tr></tbody></table>';
			// 5번
			str += '<table class="table table-centered mb-0">';
			str += '<thead><tr><th>';
			str += '<label style="margin:10px;float:left;" class="cnt">' + 5 + '.&nbsp;</label>';
			str += '<span><input type="text" minlength="1" maxlength="30" class="form-control" name="testQVOList[4].teqNo" value="프로젝트 일정 관리시 사용하는 PERT 차트에 대한 설명에 해당하는 것은?" style="width:90%;display: inline-block;"/><button type="button" class="minusbtn btn btn-light">-</button></span>';
			str += '</th></tr></thead>';
			str += '<tbody><tr><td>';
			str += '<input type="hidden" class="form-control" name="testQVOList[4].testCd" value="${data.testCd }">';
			str += '<input type="text" name="testQVOList[4].teqOp1" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="각 작업들이 언제 시작하고 언제 종료되는지에 대한 일정을 막대 도표를 이용하여 표시한다." />';
			str += '<input type="text" name="testQVOList[4].teqOp2" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="시간선(Time-line)차트라고도 한다." />';
			str += '<input type="text" name="testQVOList[4].teqOp3" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="수평 막대의 길이는 각 작업의 기간을 나타낸다." />';
			str += '<input type="text" name="testQVOList[4].teqOp4" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="작업들 간의 상호 관련성, 결정경로, 경계시간, 자원할당 등을 제시한다." />';
			str += '<input type="number" name="testQVOList[4].teqAnswer" min="1" max="4" step="1" value="4" class="form-control onlyNumber" style="width:97%;margin:10px 10px 10px 35px;"/>';
			str += '</td></tr></tbody></table>';
			// 6번
			str += '<table class="table table-centered mb-0">';
			str += '<thead><tr><th>';
			str += '<label style="margin:10px;float:left;" class="cnt">' + 6 + '.&nbsp;</label>';
			str += '<span><input type="text" minlength="1" maxlength="30" class="form-control" name="testQVOList[5].teqNo" value="접근 통제 방법 중 조직 내에서 직무, 직책 등 개인의 역할에 따라 결정하여 부여하는 접근 정책은?" style="width:90%;display: inline-block;"/><button type="button" id="delbtncntsix" class="btn btn-light">-</button></span>';
			str += '</th></tr></thead>';
			str += '<tbody><tr><td>';
			str += '<input type="hidden" class="form-control" name="testQVOList[5].testCd" value="${data.testCd }">';
			str += '<input type="text" name="testQVOList[5].teqOp1" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="RBAC" />';
			str += '<input type="text" name="testQVOList[5].teqOp2" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="DAC" />';
			str += '<input type="text" name="testQVOList[5].teqOp3" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="MAC" />';
			str += '<input type="text" name="testQVOList[5].teqOp4" class="form-control" style="width:97%;margin:10px 10px 10px 35px;" value="QAC" />';
			str += '<input type="number" name="testQVOList[5].teqAnswer" min="1" max="4" step="1" value="1" class="form-control onlyNumber" style="width:97%;margin:10px 10px 10px 35px;"/>';
			str += '</td></tr></tbody></table>';
			
			
			if(cnt == 10) {
				alert("퀴즈를 생성할 수 있는 최대 문항 수는 10개 입니다.");
				return false;
			}
			
			$('#plusArea').append(str);
			
			cnt = 6;
			
			$('.plusBtn').attr('disabled', true);
	}

	$(function() {
		// 글자 수 제한
		$('#textBox').keyup(function (e) {
			let content = $(this).val();
			
			// 글자 수 세기
			if(content.length == 0 || content == '') {
				$('.textCount').text('0자');
			}else {
				$('.textCount').text(content.length + '자');
			}
			
			// 글자 수 제한
			if(content.length > 100) {
				$(this).val($(this).val().substring(0,100));
				alert("퀴즈 내용은 100자까지 입력 가능합니다.");
			}
			
		})
		
		
		// 문제 생성
		$('.plusBtn').on('click', function() {
			var str = '<table class="table table-centered mb-0">';
			str += '<thead><tr><th>';
			str += '<label style="margin:10px;float:left;" class="cnt">' + (parseInt(cnt) + 1) + '.&nbsp;</label>';
			str += '<span><input type="text" minlength="1" class="form-control" name="testQVOList['+cnt +'].teqNo" placeholder="문제를 입력하세요." value="" style="width:90%;display: inline-block;"/><button type="button" class="minusbtn btn btn-light">-</button></span>';
			str += '</th></tr></thead>';
			str += '<tbody><tr><td>';
			str += '<input type="hidden" class="form-control" name="testQVOList['+ cnt +'].testCd" value="${data.testCd }">';
			str += '<input type="text" minlength="1" name="testQVOList['+cnt +'].teqOp1" class="form-control" placeholder="첫 번째 보기 답안을 입력하세요." style="width:97%;margin:10px 10px 10px 35px;"/>';
			str += '<input type="text" minlength="1" name="testQVOList['+cnt +'].teqOp2" class="form-control" placeholder="두 번째 보기 답안을 입력하세요." style="width:97%;margin:10px 10px 10px 35px;"/>';
			str += '<input type="text" minlength="1" name="testQVOList['+cnt +'].teqOp3" class="form-control" placeholder="세 번째 보기 답안을 입력하세요." style="width:97%;margin:10px 10px 10px 35px;"/>';
			str += '<input type="text" minlength="1" name="testQVOList['+cnt +'].teqOp4" class="form-control" placeholder="네 번째 보기 답안을 입력하세요." style="width:97%;margin:10px 10px 10px 35px;"/>';
			str += '<input type="number" minlength="1" name="testQVOList['+cnt +'].teqAnswer" min="1" max="4" step="1" class="form-control onlyNumber" placeholder="정답을 숫자로 입력하세요.(예시:&nbsp;3)" style="width:97%;margin:10px 10px 10px 35px;"/>';
			str += '</td></tr></tbody></table>';
			
				if(cnt == 10) {
					alert("퀴즈를 생성할 수 있는 최대 문항 수는 10개 입니다.");
					return false;
				}
				
			$('#plusArea').append(str);
			
			cnt += 1;
		})
		
		$(document).on('click', '#delbtncntsix', function() {
			var tb = $(this).closest("table");
			console.log(tb);
			
			tb.remove();
		})
		
		$(document).on('click','.minusbtn', function() {
			var tb = $(this).closest("table");
			console.log(tb);
			
			if(cnt == 1) {
				alert("최소 한 문제 이상은 있어야 합니다.");
				return false;
			}
			
			tb.remove();
			
			cnt--;
			
			$('.cnt').each(function(i, v){
				$(this).text(i+1 + ".");
			});
			
			
		})
		
		// 현재 시간과 비교하여 이전 날짜 선택 불가
		let dateStart = document.getElementById('quizStartDate');
		let dateEnd = document.getElementById('quizEndDate');
		let date = new Date(new Date().getTime() - new Date().getTimezoneOffset()*60000).toISOString().slice(0,-8);
		dateStart.value = date;
		dateStart.setAttribute("min",date);
		dateEnd.value = dateStart.value;
		dateEnd.setAttribute("min",dateStart.value);
		

		$('#quizStartDate').change(function() {
            if(dateStart.value < date) {
                alert('현재 시간보다 이전의 시간은 설정할 수 없습니다.');
                dateStart.value = date;
            }
			dateEnd.value = dateStart.value;
			dateEnd.setAttribute("min",dateStart.value);
		})
		
		$('#quizEndDate').change(function() {
			if(dateEnd.value < dateStart.value) {
				alert('퀴즈 시작 일자보다 이전의 시간은 설정할 수 없습니다.')
				dateEnd.value = dateStart.value;
			}
		})		
		
		// 문제 일괄 채우기
		$('.fillQuiz').on('click', function() {
			$('.quizName').val("정보처리기사 기출 문제 풀이");
			$('#quizStartDate').val("2022-10-18T12:30");
			$('#quizEndDate').val("2022-10-20T14:00");
			$('.testCon').val("정보처리기사 기출문제입니다. 실기 준비하는 친구들은 수월하게 풀 수 있겠죠?");
			$('.question').val("무결성 제약조건 중 개체 무결성 제약조건에 대한 설명으로 옳은 것은?");
			$('.firchoice').val("릴레이션 내의 튜플들이 각 속성의 도메인이 정해진 값만을 가져야 한다.");
			$('.secchoice').val("기본키는 NULL 값을 가져서는 안되며 릴레이션 내에 오직 하나의 값만 존재해야 한다.");
			$('.thichoice').val("자식 릴레이션의 외래키는 부모 릴레이션의 기본키와 도메인이 동일해야 한다.");
			$('.forchoice').val("자식 릴레이션의 값이 변경될 때 부모 릴레이션의 제약을 받는다.");
			$('.questionAnswer').val("2");
			fillQuiz();
		})
	})
</script>