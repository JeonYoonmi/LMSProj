package kr.ac.lms.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.ScholarshipMapper;
import kr.ac.lms.service.ScholarshipService;
import kr.ac.lms.vo.SclHistoryVO;

@Service
public class ScholarshipServiceImpl implements ScholarshipService {

	@Autowired
	private ScholarshipMapper scholarshipMapper;

	@Override
	public List<HashMap<String, Object>> stuList(int depCd) {
		return scholarshipMapper.stuList(depCd);
	}

	@Override
	public int proApply(List<HashMap<String, Object>> list) {
		return scholarshipMapper.proApply(list);
	}

	@Override
	public List<SclHistoryVO> stuHistory(int stuCd) {
		return scholarshipMapper.stuHistory(stuCd);
	}

	@Override
	public List<SclHistoryVO> allHistory() {
		return scholarshipMapper.allHistory();
	}

	@Override
	public int countCheck(int memCd) {
		return scholarshipMapper.countCheck(memCd);
	}

	@Override
	public List<SclHistoryVO> proHistory(int proCd) {
		return scholarshipMapper.proHistory(proCd);
	}

	@Override
	public List<HashMap<String, Object>> gradeList() {
		return scholarshipMapper.gradeList();
	}

	@Override
	public int insertGradeScl(List<HashMap<String, Object>> list) {
		return scholarshipMapper.insertGradeScl(list);
	}

	@Override
	public int insertGradeCheck() {
		return scholarshipMapper.insertGradeCheck();
	}

	@Override
	public List<HashMap<String, Object>> getLectureGrade(int stuCd) {
		return scholarshipMapper.getLectureGrade(stuCd);
	}

	@Override
	public int deleteRecommend(int sclhCd) {
		return scholarshipMapper.deleteRecommend(sclhCd);
	}
}
