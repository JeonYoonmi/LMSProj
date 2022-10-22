package kr.ac.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.lms.mapper.MailMapper;
import kr.ac.lms.service.MailService;
import kr.ac.lms.vo.AttachVO;
import kr.ac.lms.vo.MailVO;
import kr.ac.lms.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

/**
 * @author Present
 *
 */
@Slf4j
@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MailMapper mailMapper;
	
	/**
	 * 메일 보내기
	 */
	@Transactional
	@Override
	public int sendMail(MailVO mailVO) {
		// 메일 보내기
		int result = this.mailMapper.sendMail(mailVO);
		
		if(mailVO.getMailFileVOList() != null) {
			log.info("== mailFileVOList 있음 ==");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mlCd", mailVO.getMlCd());
			map.put("mailFileVOList", mailVO.getMailFileVOList());
			
			// 메일 첨부파일 저장
			result = this.mailMapper.mailFileInsert(map);
		}
		
		return result;
	}

	/**
	 * 전체 메일 출력하기
	 */
	@Override
	public List<MailVO> mailAll(Map<String, Object> map) {
		return this.mailMapper.mailAll(map);
	}
	
	/**
	 * 보낸 메일 불러오기
	 */
	@Override
	public List<MailVO> getInbox(Map<String, Object> map) {
		return this.mailMapper.getInbox(map);
	}
	
	/**
	 * 받은 메일 불러오기
	 */
	@Override
	public List<MailVO> getSentMail(Map<String, Object> map) {
		return this.mailMapper.getSentMail(map);
	}
	
	/**
	 * 전체 행의 수
	 */
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.mailMapper.getTotal(map);
	}
	
	/**
	 * 메일 상세 보기
	 */
	@Override
	public MailVO mailDetail(int mlCd) {
		return this.mailMapper.mailDetail(mlCd);
	}
	
	/**
	 * 드래그 앤 드롭한 파일 attach테이블에 저장
	 */
	@Override
	public int attachInsert(AttachVO attachVO) {
		return this.mailMapper.attachInsert(attachVO);
	}

	/**
	 * 수신여부 업데이트
	 */
	@Override
	public int updateMlYn(int mlCd) {
		return this.mailMapper.updateMlYn(mlCd);
	}

	/**
	 * 임시 저장 메일 불러오기
	 */
	@Override
	public List<MailVO> getImsiMail(Map<String, Object> map) {
		return this.mailMapper.getImsiMail(map);
	}

	/**
	 * 메일 임시 저장
	 */
	@Override
	public int drafts(MailVO mailVO) {
		// 메일 임시저장
		int result = this.mailMapper.drafts(mailVO);
		
		if(mailVO.getMailFileVOList() != null) {
			log.info("== mailFileVOList 있음 ==");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mlCd", mailVO.getMlCd());
			map.put("mailFileVOList", mailVO.getMailFileVOList());
			
			// 메일 첨부파일 저장
			result = this.mailMapper.mailFileInsert(map);
		}
		
		return result;
	}

	/**
	 * 임시 저장한 메일 전송
	 */
	@Override
	public int sendImsiMail(MailVO mailVO) {
		
		int result = this.mailMapper.sendImsiMail(mailVO);
		
		if(mailVO.getMailFileVOList() != null) {
			log.info("== mailFileVOList 있음 ==");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mlCd", mailVO.getMlCd());
			map.put("mailFileVOList", mailVO.getMailFileVOList());
			
			// 메일 첨부파일 저장
			result = this.mailMapper.mailFileInsert(map);
		}
		return result;
	}

	/**
	 * 임시 저장한 메일 다시 임시저장
	 */
	@Transactional
	@Override
	public int imsiMailDrafts(MailVO mailVO) {
		
		int result = this.mailMapper.imsiMailDrafts(mailVO);
		
		if(mailVO.getMailFileVOList() != null) {
			log.info("== mailFileVOList 있음 ==");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mlCd", mailVO.getMlCd());
			map.put("mailFileVOList", mailVO.getMailFileVOList());
			
			// 메일 첨부파일 저장
			result = this.mailMapper.mailFileInsert(map);
		}
		
		return result;
	}

	/**
	 * 메일 삭제
	 */
	@Transactional
	@Override
	public int deleteMail(String[] mlCdArray) {
		// 메일 파일 삭제
		int result = this.mailMapper.deleteMailFile(mlCdArray);
		
		// 메일 삭제
		result = this.mailMapper.deleteMail(mlCdArray);
		
		return result;
	}

	/**
	 * 메일 읽음, 안읽음 처리
	 */
	@Override
	public int changeYN(Map<String, Object> map) {
		return this.mailMapper.changeYN(map);
	}

	//메일 이름 자동완성
	@Override
	public List<MemberVO> getNames() {
		return this.mailMapper.getNames();
	}

	/**
	 * 사이버 캠퍼스에서 수강생 목옥에서 메일 쓰기를 했을 떄 필요한 정보 출력
	 */
	@Override
	public MemberVO getMemInfo(int stuCd) {
		return this.mailMapper.getMemInfo(stuCd);
	}

	/**
	 * 메인화면 안읽은 메일 건수
	 */
	@Override
	public int getMlCnt(int memCd) {
		return this.mailMapper.getMlCnt(memCd);
	}

}
