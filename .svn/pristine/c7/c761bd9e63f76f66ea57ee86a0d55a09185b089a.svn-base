package kr.ac.lms.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.LecEvaluationMapper;
import kr.ac.lms.service.LecEvaluationService;
import kr.ac.lms.vo.EvaluationQVO;
import kr.ac.lms.vo.EvaluationVO;
import kr.ac.lms.vo.LecApplyVO;

@Service
public class LecEvaluationServiceImpl implements LecEvaluationService{
	
	@Inject
	private LecEvaluationMapper lecEvaluationMapper;

	//학생 강의평가 중 현재학기 강의 조회
	@Override
	public List<LecApplyVO> stuLecList(int stuCd) {
		return this.lecEvaluationMapper.stuLecList(stuCd);
	}

	//강의 평가 항목 불러오기
	@Override
	public List<EvaluationQVO> selectEvalItem() {
		return this.lecEvaluationMapper.selectEvalItem();
	}

	//학생 강의평가 저장
	@Override
	public int insertStuEval(Map<String, Object> map) {
		return this.lecEvaluationMapper.insertStuEval(map);
	}

	//교수 수강강의 리스트 출력
	@Override
	public List<LecApplyVO> selectProLec(Map<String, Object> map) {
		return this.lecEvaluationMapper.selectProLec(map);
	}
	
	//교수 수강강의 리스트 상세정보
	@Override
	public Map<String, Object> proLecListDetail(int lecCd) {
		return this.lecEvaluationMapper.proLecListDetail(lecCd);
	}

	//교수 기타의견 리스트(해당 강의)
	@Override
	public List<EvaluationVO> selectEctList(int lecCd) {
		return this.lecEvaluationMapper.selectEctList(lecCd);
	}

	//교수 강의평가 중 해당 년 월 출력
	@Override
	public Map<String, Object> getThisYr() {
		return this.lecEvaluationMapper.getThisYr();
	}

	//관리자 강의평가 중 현재학기 수강강의 출력
	@Override
	public List<LecApplyVO> selectAllLec(Map<String, Object> map) {
		return this.lecEvaluationMapper.selectAllLec(map);
	}

	//관리자 강의평가 중 미평가 학생들 출력
	@Override
	public List<EvaluationVO> noEvalStucd(int lecCd) {
		return this.lecEvaluationMapper.noEvalStucd(lecCd);
	}
	
	
}
