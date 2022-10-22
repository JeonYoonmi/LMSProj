package kr.ac.lms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.RegisterMapper;
import kr.ac.lms.service.RegisterService;
import kr.ac.lms.vo.LecApplyVO;

@Service
public class RegisterServiceImpl implements RegisterService {
	
	@Autowired
	RegisterMapper registerMapper;

	//수강신청 리스트 불러오기
	@Override
	public List<LecApplyVO> list(Map<String, Object> map) {
		return this.registerMapper.list(map);
	}

	//포틀릿용 성적 조회 - 수강신청내역 불러오기
	@Override
	public List<LecApplyVO> ptlList(Map<String, Object> map) {
		return this.registerMapper.ptlList(map);
	}
	//수강신청하기
	@Override
	public int putStuLec(Map<String, Object> map) {
		return this.registerMapper.putStuLec(map);
	}

	//수강신청 신청인원 추가하기
	@Override
	public int putStuLecCnt(int lecaCd) {
		return this.registerMapper.putStuLecCnt(lecaCd);
	}
	//수강신청 완료 리스트 불러오기
	@Override
	public List<LecApplyVO> getRegList(Map<String, Object> map) {
		return this.registerMapper.getRegList(map);
	}

	//수강신청 학점, 과목수 불러오기
	@Override
	public Map<String, Object> getCnt(Map<String, Object> map) {
		return this.registerMapper.getCnt(map);
	}

	//수강신청 삭제하기
	@Override
	public int delStuLec(Map<String, Object> map) {
		return this.registerMapper.delStuLec(map);
	}

	//수강신청 신청인원 삭제하기
	@Override
	public int delStuLecCnt(int lecaCd) {
		return this.registerMapper.delStuLecCnt(lecaCd);
	}

	//수강신청 시간표 가져오기
	@Override
	public List<Map<String, Object>> getTime(Map<String, Object> map) {
		return this.registerMapper.getTime(map);
	}

	//비교하기 위한 수강신청 시간표 가져오기
	@Override
	public List<String> getCurrentTime(Map<String, Object> map) {
		return this.registerMapper.getCurrentTime(map);
	}

	//신청하려는 강의의 시간표 가져오기
	@Override
	public List<String> getThisTime(int lecaCd) {
		return this.registerMapper.getThisTime(lecaCd);
	}

	//업데이트할 강의 lec_hcnt 값을 가져오기
	@Override
	public List<Integer> updateCntList(Map<String, Object> map) {
		return this.registerMapper.updateCntList(map);
	}
	//시간표 표시 또는 삭제하기 위해 불러오는 리스트
	@Override
	public List<Map<String, Object>> updateTimeTable(int lecaCd) {
		return this.registerMapper.updateTimeTable(lecaCd);
	}

	//업데이트할 장바구니 lec_hcnt 값을 가져오기
	@Override
	public List<Integer> updateCntWishList(Map<String, Object> map) {
		return this.registerMapper.updateCntWishList(map);
	}

	//수강신청하려는 과목의 leca_max, lec_hcnt 값을 가져오기
	@Override
	public LecApplyVO getMaxHcnt(int lecaCd) {
		return this.registerMapper.getMaxHcnt(lecaCd);
	}
}
