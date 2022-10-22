package kr.ac.lms.service;

import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.DepartmentVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.RecordVO;

public interface RecordApplyService {
	//학생기초정보 리스트출력
	public List<MemberVO> stuInfoList(MemberVO memberVO);
	
	//학사이력 리스트 출력
	public List<LecApplyVO> history(MemberVO memberVO);
	
	//학사이력 건수 출력
	public int countResult(MemberVO memberVO);

	//학사이력 상세이력 출력
	public List<RecordVO> detailHisoty(Map<String, Object> map);
	
	//학사이력 신청(추가)
	public int insertRecord(Map<String, Object> map);
	
	//상담이력 체크
	public int counselCnt(Map<String, Object> map);
	
	//학생 졸업신청 졸업사정조회
	public Map<String, Object> graduationSelect(int stuCd);
	
	//학생 졸업사정조회 중 배당 학점
	public DepartmentVO fixedGrade(int stuCd);
	
	//학생 졸업신청 중 전공별 이수내역
	public List<LecApplyVO> majorHistory(int stuCd);
	
	//학생 졸업신청 중 교양별 이수내역
	public List<LecApplyVO> culturalHistory(int stuCd);
	
	//성적일람표 중 전필 출력
	public List<LecApplyVO> jeonpil(int stuCd);
	
	//성적일람표 중 전선 출력
	public List<LecApplyVO> jeonseon(int stuCd);
	
	//졸업신청 INSERT
	public int graduationInsert(int stuCd);
	
	//성적일람표 중 신상정보 출력
	public Map<String, Object> stuMyInfo(int stuCd);
	
	//졸업신청 중 졸업신청한적있는지 count
	public int graduateHistory(int stuCd);
}
