package kr.ac.lms.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.lms.vo.SclHistoryVO;

public interface ScholarshipService {
	public List<HashMap<String,Object>> stuList(int depCd);
	public int proApply(List<HashMap<String,Object>> list);
	public List<SclHistoryVO> stuHistory(int stuCd);
	public List<SclHistoryVO> allHistory();
	public int countCheck(int memCd);
	public List<SclHistoryVO>proHistory(int proCd);
	public List<HashMap<String, Object>> gradeList();
	public int insertGradeScl(List<HashMap<String,Object>> list);
	public int insertGradeCheck();
	public List<HashMap<String,Object>>getLectureGrade(int stuCd);
	public int deleteRecommend(int sclhCd);
}
