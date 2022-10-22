package kr.ac.lms.service;

import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.CriteriaVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.SubjectVO;
import kr.ac.lms.vo.WeekplanVO;

public interface LectureApplyService {

	//교수 개인정보 가져오기
	public MemberVO getInfo(int memCd);
	
	//제출된 강의계획서 리스트
	public List<LecApplyVO> list(Map<String, Object> map);
	
	//교수 강의계획서의 년도 및 학기 불러오기
	public List<LecApplyVO> getYrNSem(int memCd);
	
	//강의 개수 불러오기
	public int getCnt(Map<String, Object> map);
	
	//강의계획서 신청 시 불러오는 교수 개인정보
	public MemberVO lecApplyInfo(int memCd);
	
	//과목 리스트 불러오기
	public List<SubjectVO> subList();
	
	//다음 lecaCd 알아내기
	public int getMaxLecaCd();
	
	//임시저장 - lec_apply 테이블에 insert
	public int tempSubmit(Map<String, Object> map);
	
	//임시저장 - criteria 테이블에 insert
	public int criteriaSubmit(Map<String, Object> map);
	
	//임시저장 - weekPlan 테이블에 insert
	public int weekPlanSubmit(Map<String, Object> map);
	
	//weekPlan 테이블에 잘 들어갔는지 확인
	public int weekPlanCount(int lecaCd);
	
	//임시저장한 강의계획서 리스트
	public List<LecApplyVO> tempList(int memCd);
	
	//임시저장한 강의계획서 불러오기
	public LecApplyVO getTempLecApplyVO(int lecaCd);
	public CriteriaVO getTempCriteriaVO(int lecaCd);
	public List<WeekplanVO> getTempWeekPlanVO(int lecaCd);
	
	//임시저장한 강의계획서 수정하기
	public int tempUpdate(Map<String, Object> map);
	public int criteriaUpdate(Map<String, Object> map);
	public int weekPlanUpdate(Map<String, Object> map);
	
	//임시저장한 강의계획서 삭제하기
	public int deleteLecApply(int lecaCd);
	
	//강의계획서 제출하기
	public int lecApplySubmit(Map<String, Object> map);
	
	//임시저장된 강의계획서 제출하기
	public int tempUpdateSubmit(Map<String, Object> map);
	
	//포틀릿용 - 교수시간표 yrNsem
	public List<LecApplyVO> ptlProTimeTable(int memCd);
	
	//포틀릿용 - 교수시간표 timetable
	public List<LecApplyVO> ptlProTimeTableColor(Map<String, Object> map);
}
