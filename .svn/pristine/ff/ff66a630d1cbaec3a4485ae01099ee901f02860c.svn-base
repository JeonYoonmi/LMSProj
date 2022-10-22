package kr.ac.lms.mapper;

import java.util.HashMap;
import java.util.List;

import kr.ac.lms.vo.SclHistoryVO;

public interface ScholarshipMapper {
	//교수와 같은 학과 학생 리스트
	public List<HashMap<String,Object>> stuList(int depCd);
	//교수추천장학금 신청
	public int proApply(List<HashMap<String,Object>> list);
	//학생 본인의 장학금 수혜내역
	public List<SclHistoryVO> stuHistory(int stuCd);
	//관리자의 모든 학생 장학금 수혜내역 조회
	public List<SclHistoryVO> allHistory();
	//교수가 현재 년도, 현재 학기(현재 월)에 교수추천장학금을 몇명 주었는지 확인하기
	public int countCheck(int memCd);
	//교수가 장학금 추천한 학생 리스트 조회
	public List<SclHistoryVO>proHistory(int proCd);
	//학생들의 올해 성적 리스트
	public List<HashMap<String, Object>> gradeList();
	//석차(1,2,3등)에 따른 성적장학금 수여 
	public int insertGradeScl(List<HashMap<String,Object>> list);
	//올해 성적 장학금을 수여했는지 여부 확인 
	public int insertGradeCheck();
	//올해 학기 학생의 성적 상세정보 불러오기
	public List<HashMap<String,Object>>getLectureGrade(int stuCd);
	//교수추천장학금 취소(관리자가 승인전인 상태만)
	public int deleteRecommend(int sclhCd);
	
}
