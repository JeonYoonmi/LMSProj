package kr.ac.lms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.PopUpMapper;
import kr.ac.lms.service.PopUpService;
import kr.ac.lms.vo.PopupVO;

@Service
public class PopUpServiceImpl implements PopUpService{

	@Autowired
	PopUpMapper popUpMapper;
	
	//팝업 등록
	@Override
	public int insert(PopupVO popUpVO) {
		return this.popUpMapper.insert(popUpVO);
	}
	
	//팝업 리스트 가져오기
	@Override
	public List<PopupVO> list() {
		return this.popUpMapper.list();
	}
	
	//수정할 팝업 가져오기
	@Override
	public PopupVO getVO(int popCd) {
		return this.popUpMapper.getVO(popCd);
	}
	
	//팝업 삭제하기
	@Override
	public int delete(int popCd) {
		return this.popUpMapper.delete(popCd);
	}
	
	//오늘 날짜에서 띄워야 하는 팝업 리스트 가져오기
	@Override
	public List<PopupVO> popupList() {
		return this.popUpMapper.popupList();
	}
	
	//팝업 수정하기
	@Override
	public int update(PopupVO popUpVO) {
		return this.popUpMapper.update(popUpVO);
	}
}
