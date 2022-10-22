package kr.ac.lms.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.MyPageMapper;
import kr.ac.lms.service.MyPageService;
import kr.ac.lms.vo.RecordVO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageMapper myPageMapper;
	
	public int uploadProfile(HashMap<String,Object> map) {
		return this.myPageMapper.uploadProfile(map);
	}
	
	public String selectPW(int memCd) {
		return this.myPageMapper.selectPW(memCd);
	}
	
	public int updatePW(HashMap<String,Object>map) {
		return this.myPageMapper.updatePW(map);
	}
	
	public List<RecordVO> selectRecord(int memCd) {
		return this.myPageMapper.selectRecord(memCd);
	}
	
	public String selectProfile(int memCd) {
		return this.myPageMapper.selectProfile(memCd);
	}
}
