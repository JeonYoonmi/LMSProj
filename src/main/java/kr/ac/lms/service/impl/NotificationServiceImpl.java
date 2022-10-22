package kr.ac.lms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.NotificationMapper;
import kr.ac.lms.service.NotificationService;
import kr.ac.lms.vo.NotificationVO;

@Service
public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationMapper notificationMapper;
	
	// 읽지 않은 알림
	@Override
	public List<NotificationVO> getNotification(int memCd) {
		return this.notificationMapper.getNotification(memCd);
	}

	// 알림 읽음 처리
	@Override
	public int updateNtfYn(int ntfCd) {
		return this.notificationMapper.updateNtfYn(ntfCd);
	}

	/**
	 * 알림 추가
	 */
	@Override
	public int insertNtf(Map<String, Object> map) {
		return this.notificationMapper.insertNtf(map);
	}

}
