package kr.ac.lms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.CourseHandbookMapper;
import kr.ac.lms.service.CourseHandbookService;
import kr.ac.lms.vo.LecApplyVO;

@Service
public class CourseHandbookServiceImpl implements CourseHandbookService{
	
	@Autowired
	CourseHandbookMapper courseHandbookMapper;
	
	//수강편람 리스트 출력
	@Override
	public List<LecApplyVO> list(Map<String , Object> map) {
		return this.courseHandbookMapper.list(map);
	}
	
	//개설학과 리스트 출력
	@Override
	public List<String> department() {
		return this.courseHandbookMapper.department();
	}

	//수강편람 년도 출력
	@Override
	public List<Integer> getYr() {
		return this.courseHandbookMapper.getYr();
	}

	//지난 학기의 년도 및 학기
	@Override
	public Map<String, Integer> getPreYr() {
		return this.courseHandbookMapper.getPreYr();
	}

	//당학기의 년도 및 학기
	@Override
	public Map<String, Integer> getThisYr() {
		return this.courseHandbookMapper.getThisYr();
	}
}
