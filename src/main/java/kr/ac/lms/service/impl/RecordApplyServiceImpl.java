package kr.ac.lms.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.RecordApplyMapper;
import kr.ac.lms.service.RecordApplyService;
import kr.ac.lms.vo.DepartmentVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.RecordVO;

@Service
public class RecordApplyServiceImpl implements RecordApplyService{
	
	@Inject
	private RecordApplyMapper recordApplyMapper;
	
	@Override
	public List<MemberVO> stuInfoList(MemberVO memberVO){
		return this.recordApplyMapper.stuInfoList(memberVO);
	}
	
	//학사이력 리스트 출력
	@Override
	public List<LecApplyVO> history(MemberVO memberVO){
		return this.recordApplyMapper.history(memberVO);
	}

	@Override
	public int countResult(MemberVO memberVO) {
		return this.recordApplyMapper.countResult(memberVO);
	}
	
	//학사이력 상세이력 출력
	@Override
	public List<RecordVO> detailHisoty(Map<String, Object> map){
		return this.recordApplyMapper.detailHisoty(map);
	}
	
	//학사이력 신청(추가)
	@Override
	public int insertRecord(Map<String, Object> map) {
		return this.recordApplyMapper.insertRecord(map);
	}

	//상담이력 체크
	@Override
	public int counselCnt(Map<String, Object> map) {
		return this.recordApplyMapper.counselCnt(map);
	}

	//학생 졸업신청 졸업사정조회
	@Override
	public Map<String, Object> graduationSelect(int stuCd) {
		return this.recordApplyMapper.graduationSelect(stuCd);
	}

	//학생 졸업사정조회 중 배당 학점
	@Override
	public DepartmentVO fixedGrade(int stuCd) {
		return this.recordApplyMapper.fixedGrade(stuCd);
	}

	//학생 졸업신청 중 전공별 이수내역
	@Override
	public List<LecApplyVO> majorHistory(int stuCd) {
		return this.recordApplyMapper.majorHistory(stuCd);
	}

	//학생 졸업신청 중 교양별 이수내역
	@Override
	public List<LecApplyVO> culturalHistory(int stuCd) {
		return this.recordApplyMapper.culturalHistory(stuCd);
	}

	//성적일람표 중 전필 출력
	@Override
	public List<LecApplyVO> jeonpil(int stuCd) {
		return this.recordApplyMapper.jeonpil(stuCd);
	}

	//성적일람표 중 전선 출력
	@Override
	public List<LecApplyVO> jeonseon(int stuCd) {
		return this.recordApplyMapper.jeonpil(stuCd);
	}

	//졸업신청 INSERT
	@Override
	public int graduationInsert(int stuCd) {
		return this.recordApplyMapper.graduationInsert(stuCd);
	}

	//성적일람표 중 신상정보 출력
	@Override
	public Map<String, Object> stuMyInfo(int stuCd) {
		return this.recordApplyMapper.stuMyInfo(stuCd);
	}

	//졸업신청 중 졸업신청한적있는지 count
	@Override
	public int graduateHistory(int stuCd) {
		return this.recordApplyMapper.graduateHistory(stuCd);
	}
	
}
