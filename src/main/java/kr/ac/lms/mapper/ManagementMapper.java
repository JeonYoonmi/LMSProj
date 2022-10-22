package kr.ac.lms.mapper;

import java.util.List;

import kr.ac.lms.vo.MemberVO;

public interface ManagementMapper {
	
	/**
	 * 학생 목록 출력
	 * @return
	 */
	public List<MemberVO> stuList();
	
	/**
	 * 학생 상세 정보 출력
	 * @param memCd
	 * @return
	 */
	public MemberVO stuDetail(int memCd);
	
	/**
	 * 교수 정보 출력
	 * @return
	 */
	public List<MemberVO> proList();
	
	/**
	 * 교수 상세정보 출력
	 * @param memCd
	 * @return
	 */
	public MemberVO proDetail(int memCd);

	/**
	 * 교수별 학과 학생 출력
	 * @param memberVO
	 * @return
	 */
	public List<MemberVO> getProStuList(MemberVO memberVO);
}
