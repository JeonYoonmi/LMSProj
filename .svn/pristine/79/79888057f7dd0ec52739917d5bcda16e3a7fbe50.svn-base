package kr.ac.lms.service;

import java.util.List;
import java.util.Map;


import kr.ac.lms.vo.CommonDetailVO;
import kr.ac.lms.vo.CounselVO;

public interface CounselService {
	public List<CommonDetailVO> cate();
	public List<CounselVO> history(Map<String,String> map);
	public int save(CounselVO vo);
	public CounselVO detail(int cnslCd);
	public List<CounselVO> proHistory(Map<String,String> map);
	public int reply(CounselVO vo);
	public int modify(CounselVO vo);
	public int delete(int cnslCd);
	public List<CounselVO> portStuCounsel(int stuCd);
	public List<CounselVO> portProCounsel(int proCd);
	public int getTotal(int stuCd);
	public int getTotalPro(int proCd);
	
	/**
	 * 메인화면 학생의 상담 신청/완료 건수
	 * @param stuCd
	 * @return
	 */
	public CounselVO getCnslCnt(int stuCd);
}
