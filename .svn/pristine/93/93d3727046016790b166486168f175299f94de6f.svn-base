package kr.ac.lms.service;


import java.util.HashMap;
import java.util.Map;

import kr.ac.lms.vo.MemberVO;

public interface loginTestService {
	
	//로그인 처리
	public int login(HashMap<String,Object> map);
	
	//아이디 찾기
	public String confirmId(HashMap<String, String> map);
	
	//임시비밀번호로 수정
	public String confirmPass(Map<String, String> map);
	
	//학생세션
	public MemberVO stuSession(int memCd);
	
	//교수세션
	public MemberVO proSession(int memCd);
	
	//관리자 세션
	public MemberVO mgrSession(int memCd);
}
