package kr.ac.lms.mapper;

import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.CommonDetailVO;
import kr.ac.lms.vo.CounselVO;

public interface CounselMapper {
	//카테리스트 불러오기
	public List<CommonDetailVO> cate();
	//학생 상담내역 불러오기
	public List<CounselVO> history(Map<String,String> map);
	//학생 상담 신청
	public int save(CounselVO vo);
	//학생 상담내역 하나 불러오기
	public CounselVO detail(int cnslCd);
	//교수 상담내역 불러오기
	public List<CounselVO> proHistory(Map<String,String> map);
	//교수 상담 답장하기
	public int reply(CounselVO vo);
	//학생 상담 수정
	public int modify(CounselVO vo);
	//학생 상담 삭제
	public int delete(int cnslCd);
	//포틀릿에서 학생 상담 불러오기
	public List<CounselVO> portStuCounsel(int stuCd);
	//포틀릿에서 교수 상담 불러오기
	public List<CounselVO> portProCounsel(int proCd);
	//학생의 게시글 행의 개수 불러오기
	public int getTotal(int stuCd);
	//교수의 게시글 행의 개수 불러오기
	public int getTotalPro(int proCd);
	
	/**
	 * 메인화면 학생의 상담 신청/완료 건수
	 * @param stuCd
	 * @return
	 */
	public CounselVO getCnslCnt(int stuCd);
}
