package kr.ac.lms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.PreRegisterMapper;
import kr.ac.lms.service.PreRegisterService;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.StudentVO;

@Service
public class PreRegisterServiceImpl implements PreRegisterService{
	
	@Autowired
	PreRegisterMapper preRegisterMapper;
	
	//개인정보 가져오기
	@Override
	public StudentVO getInfo(int memCd) {
		return this.preRegisterMapper.getInfo(memCd);
	}
	
	//장바구니 리스트 가져오기
	@Override
	public List<LecApplyVO> wishList(int memCd) {
		return this.preRegisterMapper.wishList(memCd);
	}
	
	//장바구니 총 학점, 총 과목수 가져오기
	@Override
	public Map<String, Object> getCnt(Map<String, Object> map) {
		return this.preRegisterMapper.getCnt(map);
	}
	
	//장바구니 추가
	@Override
	public int addWish(Map<String, Object> map) {
		return this.preRegisterMapper.addWish(map);
	}
	
	//현재 년도, 학기 가져오기
	@Override
	public Map<String, Object> getYrNSem() {
		return this.preRegisterMapper.getYrNSem();
	}
	
	//장바구니 중복 신청 확인하기
	@Override
	public int checkWish(Map<String, Object> map) {
		return this.preRegisterMapper.checkWish(map);
	}
	
	//장바구니 삭제
	@Override
	public int deleteWish(Map<String, Object> map) {
		return this.preRegisterMapper.deleteWish(map);
	}

	//장바구니 체크박스 체크 시 시간표 가져오기
	@Override
	public List<Map<String, Object>> getWishTime(int lecaCd) {
		return this.preRegisterMapper.getWishTime(lecaCd);
	}
}
