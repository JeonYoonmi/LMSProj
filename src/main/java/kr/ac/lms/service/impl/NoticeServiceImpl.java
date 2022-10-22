package kr.ac.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.lms.mapper.NoticeMapper;
import kr.ac.lms.service.NoticeService;
import kr.ac.lms.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper noticeMapper;
	
	/**
	 * 공지사항 목록 출력
	 */
	@Override
	public List<NoticeVO> ntcList(Map<String, String> map) {
		return this.noticeMapper.ntcList(map);
	}

	/**
	 * 중요 공지사항 목록 출력
	 */
	@Override
	public List<NoticeVO> ntcHotList() {
		return this.noticeMapper.ntcHotList();
	}
	
	
	/**
	 * 전체 글 개수
	 */
	@Override
	public int getTotal(Map<String, String> map) {
		return this.noticeMapper.getTotal(map);
	}

	/**
	 * 공지시항 상세 출력
	 */
	@Transactional
	@Override
	public NoticeVO ntcDetail(int ntcCd) {
		// 조회수 증가
		this.noticeMapper.updateHit(ntcCd);
		
		return this.noticeMapper.ntcDetail(ntcCd);
	}

	/**
	 * 공지사항 등록
	 */
	@Transactional
	@Override
	public int ntcWrite(NoticeVO noticeVO) {
		// 공지사항 등록
		int result = this.noticeMapper.ntcWrite(noticeVO);
		
		if(noticeVO.getNtcFileVOList() != null) {
			log.info("== ntcFileVOList 있음 ==");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ntcCd", noticeVO.getNtcCd());
			map.put("ntcFileVOList", noticeVO.getNtcFileVOList());
			
			// 공지사항 첨부파일 저장
			result = this.noticeMapper.ntcFileWrite(map);
		}
		
		return result;
	}

	/**
	 * 공지사항 수정
	 */
	@Transactional
	@Override
	public int updateNtc(NoticeVO noticeVO) {
		int result = this.noticeMapper.updateNtc(noticeVO);
		
		if(noticeVO.getNtcFileVOList() != null) {
			log.info("== ntcFileVOList 있음 ==");
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ntcCd", noticeVO.getNtcCd());
			map.put("ntcFileVOList", noticeVO.getNtcFileVOList());
			
			// 공지사항 첨부파일 저장
			result = this.noticeMapper.ntcFileWrite(map);
		}
		
		return result;
	}

	/**
	 * 공지사항 삭제
	 */
	@Transactional
	@Override
	public int deleteNtc(int ntcCd) {
		int result = this.noticeMapper.deleteNtcFile(ntcCd);
		
		result = this.noticeMapper.deleteNtc(ntcCd);
		
		return result;
	}

	/**
	 * 포틀릿을 위한 공지사항 출력
	 */
	@Override
	public List<NoticeVO> portletNtc() {
		return this.noticeMapper.portletNtc();
	}

	/**
	 * 메인메뉴 상단의 공지사항 출력
	 */
	@Override
	public List<NoticeVO> mainNtcList(String cate) {
		return this.noticeMapper.mainNtcList(cate);
	}

}
