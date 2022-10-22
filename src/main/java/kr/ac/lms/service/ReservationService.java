package kr.ac.lms.service;

import java.util.HashMap;
import java.util.List;

import kr.ac.lms.vo.FacilityVO;
import kr.ac.lms.vo.ReservationVO;

public interface ReservationService {
	//시설목록 조회
	public List<FacilityVO> facility();
	//예약 등록하기
	public int insert(ReservationVO vo);
	//예약 불러오기
	public List<ReservationVO> list(String facCd);
	//예약 삭제하기
	public int delete(ReservationVO vo);
	//예약 수정하기
	public int modify(HashMap<String,Object> map);
	//과거 예약내역 불러오기
	public List<HashMap<String,Object>> history(ReservationVO vo);
	
}
