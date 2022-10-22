package kr.ac.lms.service.impl;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.ManagementMapper;
import kr.ac.lms.service.ManagementService;
import kr.ac.lms.vo.MemberVO;

/**
 * @author Present
 *
 */
@Service
public class ManagementServiceImpl implements ManagementService {

	@Autowired
	private ManagementMapper ManagementMapper;
	
	/**
	 * 학생 목록 출력
	 */
	@Override
	public List<MemberVO> stuList() {
		return this.ManagementMapper.stuList();
	}

	/**
	 * 학생 상세 정보 출력
	 */
	@Override
	public MemberVO stuDetail(int memCd) {
		return this.ManagementMapper.stuDetail(memCd);
	}

	/**
	 * 교수 정보 출력
	 */
	@Override
	public List<MemberVO> proList() {
		return this.ManagementMapper.proList();
	}

	/**
	 * 교수 상세정보 출력
	 */
	@Override
	public MemberVO proDetail(int memCd) {
		return this.ManagementMapper.proDetail(memCd);
	}

	/**
	 * 교수별 해당 학과학생 출력
	 */
	@Override
	public List<MemberVO> getProStuList(MemberVO memberVO) {
		return this.ManagementMapper.getProStuList(memberVO);
	}

}
