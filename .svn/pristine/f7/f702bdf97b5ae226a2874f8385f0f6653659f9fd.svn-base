package kr.ac.lms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.CounselMapper;
import kr.ac.lms.service.CounselService;
import kr.ac.lms.vo.CommonDetailVO;
import kr.ac.lms.vo.CounselVO;

@Service
public class CounselServiceImpl implements CounselService{
	
	@Autowired
	private CounselMapper counselMapper;

	@Override
	public List<CommonDetailVO> cate() {
		return counselMapper.cate();
	}

	@Override
	public List<CounselVO> history(Map<String,String> map) {
		return counselMapper.history(map);
	}

	@Override
	public int save(CounselVO vo) {
		return counselMapper.save(vo);
	}
	
	@Override
	public CounselVO detail(int cnslCd) {
		return counselMapper.detail(cnslCd);
	}

	@Override
	public List<CounselVO> proHistory(Map<String,String> map) {
		return counselMapper.proHistory(map);
	}

	@Override
	public int reply(CounselVO vo) {
		return counselMapper.reply(vo);
	}

	@Override
	public int modify(CounselVO vo) {
		return counselMapper.modify(vo);
	}

	@Override
	public int delete(int cnslCd) {
		return counselMapper.delete(cnslCd);
	}

	@Override
	public List<CounselVO> portStuCounsel(int stuCd) {
		return counselMapper.portStuCounsel(stuCd);
	}

	@Override
	public List<CounselVO> portProCounsel(int proCd) {
		return counselMapper.portProCounsel(proCd);
	}

	@Override
	public int getTotal(int stuCd) {
		return counselMapper.getTotal(stuCd);
	}

	@Override
	public int getTotalPro(int proCd) {
		return counselMapper.getTotalPro(proCd);
	}

	/**
	 * 메인화면 학생의 상담 신청/완료 건수
	 */
	@Override
	public CounselVO getCnslCnt(int stuCd) {
		return this.counselMapper.getCnslCnt(stuCd);
	}



	

}
