package kr.ac.lms.service;

import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.AttachVO;
import kr.ac.lms.vo.MailVO;
import kr.ac.lms.vo.MemberVO;

public interface MailService {

	/**
	 * 메일 보내기
	 * @param mailVO
	 * @return
	 */
	public int sendMail(MailVO mailVO);
	
	/**
	 * 전체 메일 불러오기
	 * @param memCd
	 * @return
	 */
	public List<MailVO> mailAll(Map<String, Object> map);
	
	/**
	 * 받은 메일 불러오기
	 * @param mlRcp
	 * @return
	 */
	public List<MailVO> getInbox(Map<String, Object> map);
	
	/**
	 * 보낸 메일 불러오기
	 * @param mlSen
	 * @return
	 */
	public List<MailVO> getSentMail(Map<String, Object> map);
	
	/**
	 * 전체 행의 수
	 * @param map
	 * @return
	 */
	public int getTotal(Map<String, Object> map);
	
	/**
	 * 메일 상세 보기
	 * @param mlCd
	 * @return
	 */
	public MailVO mailDetail(int mlCd);
	
	/**
	 * 드래그 앤 드롭한 파일 attach테이블에 저장
	 * @param attachVO
	 * @return
	 */
	public int attachInsert(AttachVO attachVO);

	/**
	 * 메일 첨부파일 저장
	 * @param map
	 * @return
	 */
	public int updateMlYn(int mlCd);

	/**
	 * 임시 저장 메일 불러오기
	 * @param mlCd
	 * @return
	 */
	public List<MailVO> getImsiMail(Map<String, Object> map);

	/**
	 * 메일 임시 저장
	 * @param mailVO
	 * @return
	 */
	public int drafts(MailVO mailVO);
	
	/**
	 * 임시 저장한 메일 전송
	 * @param mailVO
	 * @return
	 */
	public int sendImsiMail(MailVO mailVO);

	/**
	 * 임시 저장한 메일 다시 임시저장
	 * @param mailVO
	 * @return
	 */
	public int imsiMailDrafts(MailVO mailVO);
	
	/**
	 * 메일 삭제
	 * @param mlCdArray
	 * @return
	 */
	public int deleteMail(String[] mlCdArray);
	/**
	 * 메일 읽음, 안읽음 변경
	 * @param map
	 * @return
	 */
	public int changeYN(Map<String, Object> map);
	
	//메일 이름 자동완성
	public List<MemberVO> getNames();

	/**
	 * 사이버 캠퍼스에서 수강생 목옥에서 메일 쓰기를 했을 떄 필요한 정보 출력
	 * @param stuCd
	 * @return
	 */
	public MemberVO getMemInfo(int stuCd);

	/**
	 * 메인화면 안읽은 메일 건수
	 * @param memCd
	 * @return
	 */
	public int getMlCnt(int memCd);
}
