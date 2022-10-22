package kr.ac.lms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.RecordApprovalMapper;
import kr.ac.lms.service.RecordApprovalService;
import kr.ac.lms.vo.RecordVO;

@Service
public class RecordApprovalServiceImpl implements RecordApprovalService {

	@Autowired
	private RecordApprovalMapper recordApprovalMapper;
	
	// 학적 신청 내역 불러오기
	@Override
	public List<RecordVO> getRecordList(int cate) {
		return this.recordApprovalMapper.getRecordList(cate);
	}

	// 학적 신청 상세
	@Override
	public RecordVO recordDetail(int recCd) {
		return this.recordApprovalMapper.recordDetail(recCd);
	}

	
	/**
	 * 학적 신청 승인 처리
	 */
	@Override
	public int updateY(int recCd) {
		return this.recordApprovalMapper.updateY(recCd);
	}

	/**
	 *  학적 산청 반려 처리
	 */
	@Override
	public int updateN(RecordVO recordVO) {
		return this.recordApprovalMapper.updateN(recordVO);
	}

}
