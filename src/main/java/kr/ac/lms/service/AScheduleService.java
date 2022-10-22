package kr.ac.lms.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.lms.vo.AScheduleVO;

public interface AScheduleService {
	public List<AScheduleVO> allSchedule();
	public int insert(AScheduleVO vo);
	public int delete(AScheduleVO vo);
	public int modify(AScheduleVO vo);
	public List<AScheduleVO> portAsche(String aschCate);
	public int findMax();
}
