package kr.ac.lms.service;

import java.util.List;

import kr.ac.lms.vo.RecordVO;

public interface RecordApprovalService {
	// 학적 신청 내역 불러오기
	public List<RecordVO> getRecordList(int cate);

	// 학적 신청 상세
	public RecordVO recordDetail(int recCd);
	
	/**
	 * 학적 신청 승인 처리
	 * @param recCd
	 * @return
	 */
	public int updateY(int recCd);
	
	/**
	 * 학적 신청 반려 처리
	 * @param recordVO
	 * @return
	 */
	public int updateN(RecordVO recordVO);
}
