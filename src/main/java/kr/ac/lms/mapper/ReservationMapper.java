package kr.ac.lms.mapper;

import java.util.HashMap;
import java.util.List;

import kr.ac.lms.vo.FacilityVO;
import kr.ac.lms.vo.ReservationVO;

public interface ReservationMapper {
	//시설 불러오기
	public List<FacilityVO> facility();
	//예약 등록
	public int insert(ReservationVO vo);
	//예약 불러오기
	public List<ReservationVO> list(String facCd);
	//예약 삭제
	public int delete(ReservationVO vo);
	//예약 수정
	public int modify(HashMap<String,Object> map);
	//과거예약 조회
	public List<HashMap<String,Object>> history(ReservationVO vo);
}
