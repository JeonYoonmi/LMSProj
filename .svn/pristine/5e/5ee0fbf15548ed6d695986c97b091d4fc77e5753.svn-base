package kr.ac.lms.mapper;

import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.LecApplyVO;

public interface CourseHandbookMapper {
	
	//수강편람 리스트 출력
	public List<LecApplyVO> list(Map<String , Object> map);
	
	//개설학과 리스트 출력
	public List<String> department();
	
	//수강편람 년도 출력
	public List<Integer> getYr();
	
	//지난 학기의 년도 및 학기
	public Map<String, Integer> getPreYr();
	
	//당학기의 년도 및 학기
	public Map<String, Integer> getThisYr();
}
