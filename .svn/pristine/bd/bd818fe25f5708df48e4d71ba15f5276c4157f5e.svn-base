package kr.ac.lms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.AScheduleMapper;
import kr.ac.lms.service.AScheduleService;
import kr.ac.lms.vo.AScheduleVO;

@Service
public class AScheduleServiceImpl implements AScheduleService{
	
	@Autowired
	private AScheduleMapper ascheduleMapper;

	@Override
	public List<AScheduleVO> allSchedule() {
		return ascheduleMapper.allSchedule();
	}

	@Override
	public int insert(AScheduleVO vo) {
		return ascheduleMapper.insert(vo);
	}

	@Override
	public int delete(AScheduleVO vo) {
		return ascheduleMapper.delete(vo);
	}

	@Override
	public int modify(AScheduleVO vo) {
		return ascheduleMapper.modify(vo);
	}

	@Override
	public List<AScheduleVO> portAsche(String aschCate) {
		return ascheduleMapper.portAsche(aschCate);
	}

	@Override
	public int findMax() {
		return ascheduleMapper.findMax();
	}
	
	

}
