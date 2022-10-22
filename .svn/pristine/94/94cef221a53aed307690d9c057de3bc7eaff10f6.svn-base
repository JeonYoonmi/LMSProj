package kr.ac.lms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.LectureApplyMapper;
import kr.ac.lms.service.LectureApplyService;
import kr.ac.lms.vo.CriteriaVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.SubjectVO;
import kr.ac.lms.vo.WeekplanVO;

@Service
public class LectureApplyServiceImpl implements LectureApplyService {

	@Autowired
	LectureApplyMapper lectureApplyMapper;

	//교수 개인정보 가져오기
	@Override
	public MemberVO getInfo(int memCd) {
		return this.lectureApplyMapper.getInfo(memCd);
	}

	//제출된 강의계획서 리스트
	@Override
	public List<LecApplyVO> list(Map<String, Object> map) {
		return this.lectureApplyMapper.list(map);
	}

	//교수 강의계획서의 년도 및 학기 불러오기
	@Override
	public List<LecApplyVO> getYrNSem(int memCd) {
		return this.lectureApplyMapper.getYrNSem(memCd);
	}

	//강의 개수 불러오기
	@Override
	public int getCnt(Map<String, Object> map) {
		return this.lectureApplyMapper.getCnt(map);
	}

	//강의계획서 신청 시 불러오는 교수 개인정보
	@Override
	public MemberVO lecApplyInfo(int memCd) {
		return this.lectureApplyMapper.lecApplyInfo(memCd);
	}

	//과목 리스트 불러오기
	@Override
	public List<SubjectVO> subList() {
		return this.lectureApplyMapper.subList();
	}

	//다음 lecaCd 알아내기 
	@Override
	public int getMaxLecaCd() {
		return this.lectureApplyMapper.getMaxLecaCd();
	}

	//임시저장 - lec_apply 테이블에 insert
	@Override
	public int tempSubmit(Map<String, Object> map) {
		return this.lectureApplyMapper.tempSubmit(map);
	}

	//임시저장 - criteria 테이블에 insert
	@Override
	public int criteriaSubmit(Map<String, Object> map) {
		return this.lectureApplyMapper.criteriaSubmit(map);
	}

	//임시저장 - weekPlan 테이블에 insert
	@Override
	public int weekPlanSubmit(Map<String, Object> map) {
		return this.lectureApplyMapper.weekPlanSubmit(map);
	}

	//weekPlan 테이블에 잘 들어갔는지 확인
	@Override
	public int weekPlanCount(int lecaCd) {
		return this.lectureApplyMapper.weekPlanCount(lecaCd);
	}

	//임시저장한 강의계획서 리스트
	@Override
	public List<LecApplyVO> tempList(int memCd) {
		return this.lectureApplyMapper.tempList(memCd);
	}

	//임시저장한 강의계획서 불러오기
	@Override
	public LecApplyVO getTempLecApplyVO(int lecaCd) {
		return this.lectureApplyMapper.getTempLecApplyVO(lecaCd);
	}

	@Override
	public CriteriaVO getTempCriteriaVO(int lecaCd) {
		return this.lectureApplyMapper.getTempCriteriaVO(lecaCd);
	}

	@Override
	public List<WeekplanVO> getTempWeekPlanVO(int lecaCd) {
		return this.lectureApplyMapper.getTempWeekPlanVO(lecaCd);
	}

	//임시저장한 강의계획서 수정하기
	@Override
	public int tempUpdate(Map<String, Object> map) {
		return this.lectureApplyMapper.tempUpdate(map);
	}

	//임시저장한 강의계획서 criteria 수정하기
	@Override
	public int criteriaUpdate(Map<String, Object> map) {
		return this.lectureApplyMapper.criteriaUpdate(map);
	}

	//임시저장한 강의계획서 weekplan 수정하기
	@Override
	public int weekPlanUpdate(Map<String, Object> map) {
		return this.lectureApplyMapper.weekPlanUpdate(map);
	}

	//임시저장한 강의계획서 삭제하기
	@Override
	public int deleteLecApply(int lecaCd) {
		int result = 0;
		result += this.lectureApplyMapper.criteriaDelete(lecaCd);
		result += this.lectureApplyMapper.weekPlanDelete(lecaCd);
		result += this.lectureApplyMapper.tempDelete(lecaCd);
		
		return result;
	}

	//강의계획서 제출하기
	@Override
	public int lecApplySubmit(Map<String, Object> map) {
		return this.lectureApplyMapper.lecApplySubmit(map);
	}

	//임시저장된 강의계획서 제출하기
	@Override
	public int tempUpdateSubmit(Map<String, Object> map) {
		return this.lectureApplyMapper.tempUpdateSubmit(map);
	}

	//포틀릿용 - 교수시간표 yrNsem
	@Override
	public List<LecApplyVO> ptlProTimeTable(int memCd) {
		return this.lectureApplyMapper.ptlProTimeTable(memCd);
	}

	//포틀릿용 - 교수시간표 timetable
	@Override
	public List<LecApplyVO> ptlProTimeTableColor(Map<String, Object> map) {
		return this.lectureApplyMapper.ptlProTimeTableColor(map);
	}
	
}
