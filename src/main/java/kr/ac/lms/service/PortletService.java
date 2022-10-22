package kr.ac.lms.service;

import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.PortletVO;

public interface PortletService {
	//유저별 포틀릿 화면 저장
	public int updateSave(Map<String, Object> map);
	
	//포틀릿 화면) 삭제 포틀릿 YN 업데이트
	public int updateDeleteYn(Map<String, Object> map);
	
	//유저별 포틀릿 화면 보여주기
	public List<PortletVO> portletSelect(MemberVO memberVO);
	
	//유저가 선택안한 포틀릿 목록 보여주기
	public List<PortletVO> portletNotSelect(int memCd);
	
	//포틀릿 설정) X눌렀을 경우 포틀릿 목록으로 돌아가기
	public Map<String, Object> deletePortlet(String comdCd);
	
	//포틀릿 설정) 저장버튼 눌렀을 경우 설정 저장
	public int settingSave(Map<String, Object> map);
	
	//포틀릿 설정) 포틀릿 목록에 있는 것들은 YN 0으로 셋팅
	public int settingPtlList(Map<String, Object> map);
	
	//포틀릿 설정) 포틀릿 화면 보여주기
	public List<PortletVO> settingPortletSelect(int memCd);
}
