package kr.ac.lms.service;

import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.LecApplyVO;

public interface RegisterService {
	
	//수강신청 리스트 불러오기
	public List<LecApplyVO> list(Map<String, Object> map);
	
	//포틀릿용 성적 조회 - 수강신청내역 불러오기
	public List<LecApplyVO> ptlList(Map<String, Object> map);
	
	//수강신청하기
	public int putStuLec(Map<String, Object> map);
	
	//수강신청 신청인원 추가하기
	public int putStuLecCnt(int lecaCd);
	
	//수강신청 완료 리스트 불러오기
	public List<LecApplyVO> getRegList(Map<String, Object> map);
	
	//수강신청 학점, 과목수 불러오기
	public Map<String, Object> getCnt(Map<String, Object> map);
	
	//수강신청 삭제하기
	public int delStuLec(Map<String, Object> map);
	
	//수강신청 신청인원 삭제하기
	public int delStuLecCnt(int lecaCd);
	
	//수강신청 시간표 가져오기
	public List<Map<String, Object>> getTime(Map<String, Object> map);
	
	//비교하기 위한 수강신청 시간표 가져오기
	public List<String> getCurrentTime(Map<String, Object> map);
	
	//신청하려는 강의의 시간표 가져오기
	public List<String> getThisTime(int lecaCd);
	
	//업데이트할 강의 lec_hcnt 값을 가져오기
	public List<Integer> updateCntList(Map<String, Object> map);
	
	//시간표 표시 또는 삭제하기 위해 불러오는 리스트
	public List<Map<String, Object>> updateTimeTable(int lecaCd);
	
	//업데이트할 장바구니 lec_hcnt 값을 가져오기
	public List<Integer> updateCntWishList(Map<String, Object> map);
	
	//수강신청하려는 과목의 leca_max, lec_hcnt 값을 가져오기
	public LecApplyVO getMaxHcnt(int lecaCd);
}
