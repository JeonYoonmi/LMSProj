package kr.ac.lms.mapper;

import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.EvaluationQVO;
import kr.ac.lms.vo.EvaluationVO;
import kr.ac.lms.vo.LecApplyVO;

public interface LecEvaluationMapper {
	
	//학생 강의평가 중 현재학기 강의 조회
	public List<LecApplyVO> stuLecList(int stuCd);

	//학생 강의 평가 항목 불러오기
	public List<EvaluationQVO> selectEvalItem();
	
	//학생 강의평가 저장
	public int insertStuEval(Map<String, Object> map);
	
	//교수 수강강의 리스트 출력
	public List<LecApplyVO> selectProLec(Map<String, Object> map);
	
	//교수 수강강의 리스트 상세정보
	public Map<String, Object> proLecListDetail(int lecCd);
	
	//교수 기타의견 리스트(해당 강의)
	public List<EvaluationVO> selectEctList(int lecCd);
	
	//교수 강의평가 중 해당 년 월 출력
	public Map<String, Object> getThisYr();
	
	//관리자 강의평가 중 현재학기 수강강의 출력
	public List<LecApplyVO> selectAllLec(Map<String, Object> map);
	
	//관리자 강의평가 중 미평가 학생들 출력
	public List<EvaluationVO> noEvalStucd(int lecCd);
}
