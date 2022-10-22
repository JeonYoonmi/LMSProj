<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<style>
.left-side-menu {
	padding-top: 6%;
}
</style>
<div class="left-side-menu">
	<div class="h-100" id="left-side-menu-container" data-simplebar>
		<!--- Sidemenu -->
		<ul class="metismenu side-nav">
			<li class="side-nav-item">
				<a href="javascript: void(0);" class="side-nav-link">
					<span>결재 </span><span class="menu-arrow"></span>
					</a>
				<ul class="side-nav-second-level" aria-expanded="false">
					<li><a href="/approval/managerApprovalListGet">결재 조회</a></li>
					<li><a href="/approval/mgrlecApproval">강의계획서 결재</a></li>
					<li><a href="/approval/schApprovalGet">장학금 결재</a></li>
				</ul>
			</li>
			<li class="side-nav-item">
				<a href="javascript: void(0);" class="side-nav-link">
					<span>마이 페이지 </span><span class="menu-arrow"></span>
					</a>
				<ul class="side-nav-second-level" aria-expanded="false">
					<li><a href="/myPage/stuMyPage">신상 정보</a></li>
					<li><a href="/schedule/calendar">개인 일정 관리</a></li>
				</ul>
			</li>
			
			<li class="side-nav-item">
				<a href="javascript: void(0);" class="side-nav-link">
					<span>행정 관리 </span><span class="menu-arrow"></span>
				</a>
				<ul class="side-nav-second-level" aria-expanded="false">
					<li><a href="/popup/list">팝업 관리</a></li>
					<li><a href="/aschedule/calendar">학사일정 관리</a></li>
				</ul>
			</li>
			
			<li class="side-nav-item">
				<a href="javascript: void(0);" class="side-nav-link">
					<span>학생 관리 </span><span class="menu-arrow"></span>
					</a>
				<ul class="side-nav-second-level" aria-expanded="false">
<!-- 					<li><a href="#">신입생등록</a></li> -->
					<li><a href="/management/stuList">학생목록 조회</a></li>
					<li><a href="/recordApproval/hyubokhak">휴복학 관리</a></li>
					<li><a href="/recordApproval/joleop">졸업 관리</a></li>
					<li><a href="/recordApproval/jatoe">자퇴 관리</a></li>
				</ul>
			</li>
			
			<li class="side-nav-item">
				<a href="javascript: void(0);" class="side-nav-link">
					<span>등록 및 장학 </span><span class="menu-arrow"></span>
				</a>
				<ul class="side-nav-second-level" aria-expanded="false">
					<li class="side-nav-item">
						<a href="javascript: void(0);" aria-expanded="false">장학금 <span class="menu-arrow"></span></a>
						<ul class="side-nav-third-level" aria-expanded="false">
							<li><a href="/scholarship/scholarshipList">장학금 목록 조회</a></li>
							<li><a href="/scholarship/grade">장학금 수여</a></li>
							<li><a href="/scholarship/allHistory">장학생 조회</a></li>
						</ul>
					</li>
					<li class="side-nav-item">
						<a href="javascript: void(0);" aria-expanded="false">등록금 <span class="menu-arrow"></span></a>
						<ul class="side-nav-third-level" aria-expanded="false">
							<li><a href="/payment/collegeFeeList">등록금 목록 조회</a></li>
							<li><a href="/payment/payNotice">등록금 고지 관리</a></li>
							<li><a href="/payment/adminPaymentList">등록금 납부 관리</a></li>
						</ul>
					</li>
				</ul>
			</li>
			
			<li class="side-nav-item">
				<a href="javascript: void(0);" class="side-nav-link">
					<span>교수 관리 </span><span class="menu-arrow"></span>
					</a>
				<ul class="side-nav-second-level" aria-expanded="false">
<!-- 					<li><a href="#">교수등록</a></li> -->
					<li><a href="/management/proList">교수목록 조회</a></li>
				</ul>
			</li>
			
			<li class="side-nav-item">
				<a href="javascript: void(0);" class="side-nav-link">
					<span>강의 관리 </span><span class="menu-arrow"></span>
					</a>
				<ul class="side-nav-second-level" aria-expanded="false">
					<li><a href="/course/list">수강편람</a></li>
					<li><a href="/course/preList">강의계획 조회</a></li>
				</ul>
			</li>
			
			
			<li class="side-nav-item">
				<a href="javascript: void(0);" class="side-nav-link">
					<span>평가 </span><span class="menu-arrow"></span>
					</a>
				<ul class="side-nav-second-level" aria-expanded="false">
					<li><a href="/lecEval/mgrLecEvalGet">강의평가 조회</a></li>
				</ul>
			</li>
			
			<li class="side-nav-item">
				<a href="javascript: void(0);" class="side-nav-link">
					<span>시설 </span><span class="menu-arrow"></span>
					</a>
				<ul class="side-nav-second-level" aria-expanded="false">
					<li><a href="/facility/calendar">시설신청 및 이력</a></li>
				</ul>
			</li>
		</ul>
		<!-- End Sidebar -->

		<div class="clearfix"></div>

	</div>
	<!-- Sidebar -left -->

</div>