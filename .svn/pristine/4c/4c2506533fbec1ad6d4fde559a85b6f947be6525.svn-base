package kr.ac.lms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.ScheduleMapper;
import kr.ac.lms.service.ScheduleService;
import kr.ac.lms.vo.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private ScheduleMapper scheduleMapper;
	
	@Override
	public List<ScheduleVO> allSchedule(int memCd) {
		return scheduleMapper.allSchedule(memCd);
	}

	@Override
	public int insert(ScheduleVO vo) {
		return scheduleMapper.insert(vo);
	}

	@Override
	public int delete(int schCd) {
		return scheduleMapper.delete(schCd);
	}

	@Override
	public ScheduleVO findCon(int schCd) {
		return scheduleMapper.findCon(schCd);
	}

	@Override
	public int updateCon(ScheduleVO vo) {
		return scheduleMapper.updateCon(vo);
	}

	@Override
	public int findSeq() {
		return scheduleMapper.findSeq();
	}

	@Override
	public List<ScheduleVO> miniCal(int memCd) {
		return scheduleMapper.miniCal(memCd);
	}

	@Override
	public List<ScheduleVO> toDo(int memCd) {
		return scheduleMapper.toDo(memCd);
	}

	@Override
	public List<ScheduleVO> weekCal(int memCd) {
		return scheduleMapper.weekCal(memCd);
	}

	@Override
	public int todoCheck(ScheduleVO vo) {
		return scheduleMapper.todoCheck(vo);
	}

}
