package kr.ac.lms.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.ApprovalVO;
import kr.ac.lms.vo.BuildingVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.RoomVO;
import kr.ac.lms.vo.WeekplanVO;

public interface ApprovalMapper{
	
	//교수 결재 리스트 조회
	public List<LecApplyVO> proApprovalList(int memCd);
	
	//교수 결재 검색리스트 조회
	public List<LecApplyVO> proApprovalSearchList(Map<String, Object> map);
	
	//교수 결재 강의계획서 pdf
	public LecApplyVO proApprovalPdf(Map<String, Object> map);
	
	//교수 결재 반려 내역 조회
	public List<LecApplyVO> returnHistory(int memCd);
	
	// 수업 계획서
	public LecApplyVO getLecApply(Map<String, Object> lecApply);
	
	// 수업 계획서 > 주차별 강의 내용
	public List<WeekplanVO> getWeekPlan(int lecaCd);
	
	//학사관리자 전체 결재 목록 조회(강의계획서)
	public List<LecApplyVO> managerApprovalList(Map<String, String> map);
	
	//학사관리자 전체 결재 목록 조회(장학생신청)
	public List<LecApplyVO> managerApprovalListS(Map<String, String> map);
	
	//날짜 계산
	public Map<String, Object> dateCal();
	
	//학사관리자 강의계획서 결재 리스트
	public List<LecApplyVO> mgrLecApprovalList(Map<String, Object> map);
	
	//학사관리자 강의계획서 결재 중 반려사유 update
	public int lecApplyNoUpdate(Map<String, Object> map);
	
	//강의실 배정 중 단과대 건물명 리스트 출력 
	public List<BuildingVO> buildingList();
	
	//강의실 배정 중 단과대 별 호실 리스트 출력
	public List<RoomVO> roomList(String bldNm);
	
	//강의실 배정 중 LEC_CD를 통한 교수 및 강의 정보 출력
	public LecApplyVO lecInfoSelect(int lecaCd);
	
	//강의실 배정 중 해당 호실에 따른 수용인원 출력
	public RoomVO peopleCntSelect(Map<String, Object> map);
	
	//강의실 배정 중 강의실에 따른 시간표 출력
	public List<HashMap<String,Object>> roomTimeTable(Map<String, Object> map);
	
	//강의계획 신청 코드를 통한 신청정보 출력
	public Map<String, Object> applyInfo(int lecaCd);
	
	//강의실 배정 중 저장버튼 눌렀을 경우 강의계획신청 변경
	public int updateLecApply(Map<String, Object> map);
	
	//강의실 배정 중 저장버튼을 눌렀을 경우 시간표 테이블 insert
	public int insertTimetable(Map<String, Object> map);
	
	//강의실 배정 중 저장버튼 눌렀을 경우 강의계획신청 중 결재자, 결재일자, 승인여부 변경
	public int updateApproval(Map<String, Object> map);
	
	//포틀릿 교수 결재 내역
	public List<LecApplyVO> portletProApproval(int proCd);
	
	//포틀릿 학사관리자 결재 내역
	public List<LecApplyVO> portletMgrApproval();
	
	//장학생 결재 리스트 내역
	public List<LecApplyVO> schApprovalHistory();
	
	//장학생 결재 중 학생 기초정보
	public Map<String, Object> stuInfo(int sclhCd);
	
	//장학생 결재 중 장학금 지급내역 
	public List<Map<String, Object>> stuSchHistory(int stuCd);
	
	//장학생 결재 중 승인했을 경우 update
	public int schApprovalOk(Map<String, Object> map);
	
	/**
	 * 메인화면 교수의 결재 신청/완료 건수 
	 * @param proCd
	 * @return
	 */
	public ApprovalVO getProApprCnt(int proCd);
	
	/**
	 * 메인화면 관리자의 결재 신청/완료 건수 
	 * @return
	 */
	public ApprovalVO getMgrApprCnt();
	
	//관리자 강의계획서 결재 중 이미 승인이나 반려되었는지 확인 
	public int confirmYn(int lecaCd);
}
