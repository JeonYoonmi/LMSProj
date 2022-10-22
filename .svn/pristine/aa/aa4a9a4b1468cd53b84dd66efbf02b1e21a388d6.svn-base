package kr.ac.lms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.UsertestMapper;
import kr.ac.lms.service.UsertestService;
import kr.ac.lms.vo.UsertestVO;

@Service
public class UsertestServiceImpl implements UsertestService {

	@Autowired
	private UsertestMapper usertestMapper;
	
	@Override
	public List<UsertestVO> getUser() {
		return this.usertestMapper.getUser();
	}

}
