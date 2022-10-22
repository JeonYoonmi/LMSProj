package kr.ac.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.ApprovalMapper;
import kr.ac.lms.service.ApprovalService;
import kr.ac.lms.vo.ApprovalVO;
import kr.ac.lms.vo.BuildingVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.RoomVO;
import kr.ac.lms.vo.WeekplanVO;

@Service
public class ApprovalServiceImpl implements ApprovalService{
	
	@Inject
	private ApprovalMapper approvalMapper;
	
	//교수 결재 리스트 조회
	@Override
	public List<LecApplyVO> proApprovalList(int memCd) {
		return this.approvalMapper.proApprovalList(memCd);
	}

	//교수 결재 검색리스트 조회
	@Override
	public List<LecApplyVO> proApprovalSearchList(Map<String, Object> map) {
		return this.approvalMapper.proApprovalSearchList(map);
	}
	
	//교수 결재 강의계획서 pdf
	@Override
	public LecApplyVO proApprovalPdf(Map<String, Object> map) {
		return this.approvalMapper.proApprovalPdf(map);
	}
	
	//교수 결재 반려 내역 조회
	@Override
	public List<LecApplyVO> returnHistory(int memCd) {
		return this.approvalMapper.returnHistory(memCd);
	}
	
	// 수업 계획서
	@Override
	public LecApplyVO getLecApply(Map<String, Object> lecApply) {
		return this.approvalMapper.getLecApply(lecApply);
	}
	
	// 수업 계획서 > 주차별 강의 내용
	@Override
	public List<WeekplanVO> getWeekPlan(int lecaCd){
		return this.approvalMapper.getWeekPlan(lecaCd);
	}
	
	//학사관리자 전체 결재 목록 조회(강의계획서)
	@Override
	public List<LecApplyVO> managerApprovalList(Map<String, String> map){
		return this.approvalMapper.managerApprovalList(map);
	}
	
	//학사관리자 전체 결재 목록 조회(장학생신청)
	public List<LecApplyVO> managerApprovalListS(Map<String, String> map){
		return this.approvalMapper.managerApprovalListS(map);
	}
	
	//날짜 계산
	@Override
	public Map<String, Object> dateCal(){
		return this.approvalMapper.dateCal();
	}
	
	//학사관리자 강의계획서 결재 리스트
	@Override
	public List<LecApplyVO> mgrLecApprovalList(Map<String, Object> map){
		return this.approvalMapper.mgrLecApprovalList(map);
	}

	//학사관리자 강의계획서 결재 중 반려사유 update
	@Override
	public int lecApplyNoUpdate(Map<String, Object> map) {
		return this.approvalMapper.lecApplyNoUpdate(map);
	}

	//강의실 배정 중 단과대 건물명 리스트 출력 
	@Override
	public List<BuildingVO> buildingList() {
		return this.approvalMapper.buildingList();
	}

	//강의실 배정 중 단과대 별 호실 리스트 출력
	@Override
	public List<RoomVO> roomList(String bldNm) {
		return this.approvalMapper.roomList(bldNm);
	}
	
	//강의실 배정 중 LEC_CD를 통한 교수 및 강의 정보 출력
	@Override
	public LecApplyVO lecInfoSelect(int lecaCd) {
		return this.approvalMapper.lecInfoSelect(lecaCd);
	}
	
	//강의실 배정 중 해당 호실에 따른 수용인원 출력
	@Override
	public RoomVO peopleCntSelect(Map<String, Object> map) {
		return this.approvalMapper.peopleCntSelect(map);
	}

	//강의실 배정 중 강의실에 따른 시간표 출력
	@Override
	public List<HashMap<String, Object>> roomTimeTable(Map<String, Object> map) {
		return this.approvalMapper.roomTimeTable(map);
	}

	//강의계획 신청 코드를 통한 신청정보 출력
	@Override
	public Map<String, Object> applyInfo(int lecaCd) {
		return this.approvalMapper.applyInfo(lecaCd);
	}

	//강의실 배정 중 저장버튼 눌렀을 경우 강의계획신청 변경
	@Override
	public int updateLecApply(Map<String, Object> map) {
		return this.approvalMapper.updateLecApply(map);
	}

	//강의실 배정 중 저장버튼을 눌렀을 경우 시간표 테이블 insert
	@Override
	public int insertTimetable(Map<String, Object> map) {
		return this.approvalMapper.insertTimetable(map);
	}

	//강의실 배정 중 저장버튼 눌렀을 경우 강의계획신청 중 결재자, 결재일자, 승인여부 변경
	@Override
	public int updateApproval(Map<String, Object> map) {
		return this.approvalMapper.updateApproval(map);
	}

	//포틀릿 교수 결재 내역
	@Override
	public List<LecApplyVO> portletProApproval(int proCd) {
		return this.approvalMapper.portletProApproval(proCd);
	}

	//포틀릿 학사관리자 결재 내역
	@Override
	public List<LecApplyVO> portletMgrApproval() {
		return this.approvalMapper.portletMgrApproval();
	}

	//장학생 결재 리스트 내역
	@Override
	public List<LecApplyVO> schApprovalHistory() {
		return this.approvalMapper.schApprovalHistory();
	}

	//장학생 결재 중 학생 기초정보
	@Override
	public Map<String, Object> stuInfo(int sclhCd) {
		return this.approvalMapper.stuInfo(sclhCd);
	}

	//장학생 결재 중 장학금 지급내역 
	@Override
	public List<Map<String, Object>> stuSchHistory(int stuCd) {
		return this.approvalMapper.stuSchHistory(stuCd);
	}

	//장학생 결재 중 승인했을 경우 update
	@Override
	public int schApprovalOk(Map<String, Object> map) {
		return this.approvalMapper.schApprovalOk(map);
	}

	/**
	 * 메인화면 교수의 결재 신청/완료 건수 
	 */
	@Override
	public ApprovalVO getProApprCnt(int proCd) {
		return this.approvalMapper.getProApprCnt(proCd);
	}

	/**
	 * 메인화면 관리자의 결재 신청/완료 건수
	 */
	@Override
	public ApprovalVO getMgrApprCnt() {
		return this.approvalMapper.getMgrApprCnt();
	}

	//관리자 강의계획서 결재 중 이미 승인이나 반려되었는지 확인 
	@Override
	public int confirmYn(int lecaCd) {
		return this.approvalMapper.confirmYn(lecaCd);
	}
	


	
}
