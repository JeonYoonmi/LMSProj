package kr.ac.lms.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.PortletMapper;
import kr.ac.lms.service.PortletService;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.PortletVO;

@Service
public class PortletServiceImpl implements PortletService{

	@Inject
	PortletMapper portletMapper;
	
	//유저별 포틀릿 화면 저장
	@Override
	public int updateSave(Map<String, Object> map) {
		return this.portletMapper.updateSave(map);
	}

	//유저별 포틀릿 화면 보여주기
	@Override
	public List<PortletVO> portletSelect(MemberVO memberVO) {
		return this.portletMapper.portletSelect(memberVO);
	}

	//유저가 선택안한 포틀릿 목록 보여주기
	@Override
	public List<PortletVO> portletNotSelect(int memCd) {
		return this.portletMapper.portletNotSelect(memCd);
	}

	//포틀릿 화면) 삭제 포틀릿 YN 업데이트
	@Override
	public int updateDeleteYn(Map<String, Object> map) {
		return this.portletMapper.updateDeleteYn(map);
	}

	//포틀릿 설정) X눌렀을 경우 포틀릿 목록으로 돌아가기
	@Override
	public Map<String, Object> deletePortlet(String comdCd) {
		return this.portletMapper.deletePortlet(comdCd);
	}

	//포틀릿 설정) 저장버튼 눌렀을 경우 설정 저장
	@Override
	public int settingSave(Map<String, Object> map) {
		return this.portletMapper.settingSave(map);
	}

	//포틀릿 설정) 포틀릿 목록에 있는 것들은 YN 0으로 셋팅
	@Override
	public int settingPtlList(Map<String, Object> map) {
		return this.portletMapper.settingPtlList(map);
	}

	//포틀릿 설정) 포틀릿 화면 보여주기
	@Override
	public List<PortletVO> settingPortletSelect(int memCd) {
		return this.portletMapper.settingPortletSelect(memCd);
	}

}
