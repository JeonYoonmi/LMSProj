package kr.ac.lms.service;

import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.StudentVO;

public interface PreRegisterService {

	//개인정보 가져오기
	public StudentVO getInfo(int memCd);

	//장바구니 리스트 가져오기
	public List<LecApplyVO> wishList(int memCd);

	//장바구니 총 학점, 총 과목수 가져오기
	public Map<String, Object> getCnt(Map<String, Object> map);

	//장바구니 추가
	public int addWish(Map<String, Object> map);

	//현재 년도, 학기 가져오기
	public Map<String, Object> getYrNSem();

	//장바구니 중복 신청 확인하기
	public int checkWish(Map<String, Object> map);

	//장바구니 삭제
	public int deleteWish(Map<String, Object> map);
	
	//장바구니 체크박스 체크 시 시간표 가져오기
	public List<Map<String, Object>> getWishTime(int lecaCd);
}
