package kr.ac.lms.service;

import java.util.List;

import kr.ac.lms.vo.PopupVO;

public interface PopUpService {

	//팝업 등록
	public int insert(PopupVO popUpVO);

	//팝업 리스트 가져오기
	public List<PopupVO> list();

	//수정할 팝업 가져오기
	public PopupVO getVO(int popCd);

	//팝업 삭제하기
	public int delete(int popCd);

	//오늘 날짜에서 띄워야 하는 팝업 리스트 가져오기
	public List<PopupVO> popupList();

	//팝업 수정하기
	public int update(PopupVO popUpVO);

}
