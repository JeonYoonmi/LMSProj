<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Map"%>
<%-- <%=((Map) session.getAttribute("mem")).get("memCd")%> --%>
			<!-- Left sidebar -->
			
			<c:if test="${ memSession.managerVO.mgrCd != null }">
				<script type="text/javascript" defer="defer"> 
					var idleTime = 0; 
					$(function () { //1분마다 유휴 시간 카운터를 증가
					 	var idleInterval = setInterval(timerIncrement, 60000); //1분
					 	//일정시간 움직임이 있으면 초기화
					 	$(this).mousemove(function (e) { idleTime = 0; }); 
					 	$(this).keypress(function (e) { idleTime = 0; });
					});
					 function timerIncrement() { 
					  	idleTime = idleTime + 1;
					  	if (idleTime > 9) { // 10분일 경우
							alert("자동 로그아웃이 되었습니다.");
					   		location.href = "/main/logout";
						}
					}
				</script>
			</c:if>
			
			<div class="page-aside-left">

				<button type="button" class="btn btn-block" style="background: #112a63;color: #fff;border: 2px solid #112a63;"
					onclick="javascript:location.href='/mail/write'">
					메일쓰기
				</button>
				
				<div class="email-menu-list mt-3">
					<a href="/mail/mailAll">
						전체메일
					</a>
					<a href="/mail/inbox">
						받은메일함
					</a>
					<a href="/mail/sentmailbox">
						보낸메일함
					</a>
					<a href="/mail/imsiMailBox">
						임시보관함
					</a>
					<a href="javascript: void(0);">
						휴지통
					</a>
				</div>
			</div>