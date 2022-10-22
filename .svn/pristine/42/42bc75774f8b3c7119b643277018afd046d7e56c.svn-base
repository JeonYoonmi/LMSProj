<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table *{
	text-align: center;
	font-size: 1.1em;
}
tr{
	height: 40px;
}
</style>
</head>
<body>
<div>
<i class="mdi mdi-home" style="font-size: 1.3em"></i> <i class="dripicons-chevron-right"></i>등록 및 장학  <i class="dripicons-chevron-right"></i><span>등록금납부이력</span>
<i class="dripicons-chevron-right"></i><span style="font-weight: bold;">장학금 목록 조회</span>
</div>
<br><br>
<p id="stuPaymentListSelect"><i class="mdi mdi-record-circle" style="color: #001353;"></i>&ensp;장학금 목록</p>
	<div class="card" style="width:100%;">
		<div class="card-body">
		<table border='1'>
			<tr>
				<th style="width:10%;">구분</th>
				<th style="width:10%;">명칭</th>
				<th style="width:25%;">장학금액</th>
				<th style="width:30%;">선발기준</th>
				<th style="width:10%;">직전학기<br> 평균평점</th>
				<th style="width:15%;">인원</th>
			</tr>
			
			<tr>
				<td rowspan="3">성적장학금</td>
				<td>성적우수</td>
				<td>등록금전액</td>
				<td>성적우수자</td>
				<td>3.25이상</td>
				<td>총장이 원하는 인원</td>
			</tr>
			<tr>
				<td>학업증진</td>
				<td>등록금 일부 A급</td>
				<td>〃</td>
				<td>2.75이상</td>
				<td>총장이 원하는 인원</td>
			</tr>
			<tr>
				<td>격려</td>
				<td>등록금 일부 C급</td>
				<td>〃</td>
				<td>2.25이상</td>
				<td>총장이 원하는 인원</td>
			</tr>
			<tr>
				<td rowspan="6">복지장학금</td>
				<td>백마</td>
				<td>등록금 일부</td>
				<td>국가장학금 1유형 기준 준용<br>
				※ 이연자(등록유효복학자), 수업연한 초과자 제외	</td>
				<td>좌동</td>
				<td>적격자</td>
			</tr>
			<tr>
				<td>CNU복지</td>
				<td>등록금 또는 생활비 일부</td>
				<td>경제적 사정이 곤란한 자</td>
				<td>1.75이상</td>
				<td>〃</td>
			</tr>
			<tr>
				<td>CNU복지</td>
				<td>등록금 또는 생활비 일부</td>
				<td>경제적 사정이 곤란한 자</td>
				<td>1.75이상</td>
				<td>〃</td>
			</tr>
			<tr>
				<td>영탑A</td>
				<td>등록금 전액</td>
				<td>장애의 정도가 심한 장애인</td>
				<td>2.75이상</td>
				<td>〃</td>
			</tr>
			<tr>
				<td>영탑B</td>
				<td>등록금 일부 A급</td>
				<td>장애의 정도가 심하지 않은 장애인</td>
				<td>2.75이상</td>
				<td>〃</td>
			</tr>
			<tr>
				<td>영탑B</td>
				<td>등록금 일부 A급</td>
				<td>장애의 정도가 심하지 않은 장애인</td>
				<td>2.75이상</td>
				<td>〃</td>
			</tr>
			<tr>
				<td rowspan="8">특별장학금</td>
				<td>체육특기자</td>
				<td>등록금 전액</td>
				<td>체육진흥원 추천자</td>
				<td>1.75이상</td>
				<td>적격자</td>
			</tr>
			<tr>
				<td>복수학위</td>
				<td>등록금 전액 (4개학기)	</td>
				<td>•국제교류본부장 추천자</td>
				<td>3.50이상 (전학기 평점)</td>
				<td>〃</td>
			</tr>
			<tr>
				<td>외국어성적우수</td>
				<td>등록금 일부 A급	</td>
				<td>TOEIC, TOEFL성적우수자 (ETS주관)<br>
				• TOEIC 900점 이상<br>
				• TOEFL PBT610, CBT253 iBT102 이상<br>
				※ 자격취득일부터 1년 이내 성적, 재학중 1회만 수혜 가능</td>
				<td>2.75이상	</td>
				<td>〃</td>
			</tr>
			<tr>
				<td>외국인(학부)</td>
				<td>등록금 일부 C급	</td>
				<td>외국인 유학생
				※ 국적이 대한민국인 경우 제외</td>
				<td>2.25이상</td>
				<td>〃</td>
			</tr>
			<tr>
				<td>외국인(복수학위)</td>
				<td>등록금 일부</td>
				<td>해외 교류대학 복수학위 참가자</td>
				<td>2.25이상</td>
				<td>총장이 정하는 인원</td>
			</tr>
			<tr>
				<td>보훈</td>
				<td>등록금 전액(정규학기)</td>
				<td>국가유공자 본인 및 자녀<br>
				※ 본인은 장학 기준 성적 및 지급학기 제한 없음</td>
				<td>1.75이상</td>
				<td>적격자</td>
			</tr>
			<tr>
				<td>새터민</td>
				<td>〃</td>
				<td>북한이탈주민</td>
				<td>1.75이상</td>
				<td>〃</td>
			</tr>
			<tr>
				<td>모범장학금	</td>
				<td>학업장려금</td>
				<td>학과별 모범이 될만한 자체기준을 정하여 선정된 학생</td>
				<td>1.75이상</td>
				<td>총장이 정하는 인원</td>
			</tr>
		</table>
		</div>
	</div>
</body>
</html>