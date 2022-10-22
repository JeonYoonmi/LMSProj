/**
 *	로딩창 띄우기!
 	1. <script type="text/javascript" src="/resources/js/spinner.js"></script> 추가하기
 	
 	2. window.onload = function() { 이나 $(function() { 안에 loadingWithMask(); 사용하여 로딩창 띄우기
 	
 	3-1. 필요한 리스트를 불러오는 ajax의 success 부분에서 closeLoadingWithMask(); 사용하여 로딩창 닫기 (/views/course/list 참고)
 	3-2. 리스트는 금방 불러와지는데 로딩창을 사용하고 싶은 경우 setTimeout(closeLoadingWithMask, 1000); 사용하여 로딩창 닫기  (/views/tgrade/list 참고)
 */
 
//로딩중 화면 만들기
function loadingWithMask() {
	//화면의 높이, 너비 구하기
	var maskHeight = $(document).height();
	var maskWidth = window.document.body.clientWidth;
	
	//화면에 출력할 마스크 설정하기
	var mask = "";
	mask += "<div id='loadingImg'>";
	mask += "<div id='mask' style='position:absolute; z-index:9000; background-color:rgba(255,255,255,0.4); display:none; left:0; top:0;'><div class='lmsWrapper'>";
	mask += "<img src='/resources/loading/Spinner-1s-200px.gif' alt='loading.gif' style='position:fixed; width:100px; display:block; top:50%; left:55%; transform:translate(-50%, -50%);'/></div>";
	mask += "</div>";
	mask += "</div>";
	
	//화면에 레이어 추가
	$('body').append(mask);
	
	//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채움
	$('#mask').css({
		'width' : maskWidth,
		'height' : maskHeight,
	});
	
	//마스크 표시
	$('#mask').show();
	//로딩중 이미지 표시
	$('#loadingImg').show();
}

//로딩중 화면 없애기
function closeLoadingWithMask() {
	$('#mask, #loadingImg').hide();
	$('#mask, #loadingImg').empty();
}