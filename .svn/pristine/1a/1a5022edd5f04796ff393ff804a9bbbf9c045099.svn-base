/**
 * 메일 js
 */

// 선택한 메일 삭제
function deleteAll(chkVal){
	$.ajax({
		url : "/mail/deleteAll",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(chkVal),
		type : 'post',
		success : function(result){
			document.location.href= document.location.href;
		},
		dataType : 'json'
	});
}

// 메일 읽음 여부 설정
function updateYN(data){
	$.ajax({
		url : "/mail/changeYN",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		type : 'post',
		success : function(result){
			
		},
		dataType : 'json'
	});
}
