package kr.ac.lms.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.loginTestService;
import kr.ac.lms.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class loginTestController {

	@Autowired
	loginTestService logintestService;

	
	//로그인 화면
	@GetMapping("/login/loginForm")
	public String loginForm() {
		return "login/loginForm";
	}

	
	//로그인 정보가 일치하는지 체크
	//로그인 요청
	@PostMapping("/login/loginCheck")
	public String login(int memCd, String memPass,HttpSession session) {
		
		log.info("loginCheck");
		log.info("id : " + memCd);
		log.info("pw : " + memPass);

		//화면에서 입력한 아이디와 비밀번호가 일치하는 회원 정보가 DB에 있는지 확인하여
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("memCd", memCd);
		map.put("memPass", memPass);
		
		//map : {memPass=e5708cbc, memCd=20220001}
		log.info("map : " + map);
		
		int res = logintestService.login(map);
		
		log.info("res : " + res);
		
		HashMap<String, Object> memMap = new HashMap<String, Object>();


		//일치하는 회원 정보가 있다면 회원 정보를 세션에 담는다
		session.setAttribute("data", res);
		session.setAttribute("memMap", memMap);
		
		log.info("login메소드에 왔다");
		
		if(res == 1) {//1번은 학생
			MemberVO memVO = logintestService.stuSession(memCd);
			
			//res(1) -> memVO : MemberVO [memCd=20220001, memNm=이도현, memNme=Lee Do Hyeon
			//, memTel=010-4929-0808, memZip=54321, memAddr1=대전 중구 오류동 사공 빌딩
			//, memAddr2=101동 102호, memReg1=950411, memReg2=1234567, memMl=lehgus0411@naver.com
			//, memPass=e5708cbc, memBank=국민은행, memDepo=이도현, memAct=1234543212121, memFnm=0
			//, memFpt=null, birth=null, sex=null, depNm=null, stuSem=0, stuYr=0, first=null]
			
			log.info("res(1) -> memVO : " + memVO);
			//null세팅
			
			session.setAttribute("memSession", logintestService.stuSession(memCd));
			log.info("memSession : " + session.getAttribute("memSession"));
			return "redirect:/main/mainPage";
		}
		else if(res == 2) {//2번은 교수
			MemberVO memVO = logintestService.proSession(memCd);
			
			log.info("res(2) -> memVO : " + memVO);
			
			session.setAttribute("memSession", logintestService.proSession(memCd));
			return "redirect:/main/mainPage";
		} 
		else if(res == 3) {//3번은 관리자
			MemberVO memVO = logintestService.mgrSession(memCd);
			
			log.info("res(3) -> memVO : " + memVO);
			
			session.setAttribute("memSession", logintestService.mgrSession(memCd));
			return "redirect:/main/mainPage";
		} 
		else {
//			alert('아이디나 비밀번호가 일치하지 않습니다!');
			return "redirect:/login/loginForm?result=0";
		}
		
		
	}
	
	@GetMapping("/login/findID")
	public String findID()
	{
		return "login/findID";
	}
	
	@PostMapping("/login/confirmId")
	@ResponseBody
	public ResponseEntity<String> confirmId(HttpServletRequest request) {
		
		String memNm = request.getParameter("memNm");
		String memReg1 = request.getParameter("memReg1");
		String depNm = request.getParameter("depNm");
		
		log.info("memNm : " + memNm);
		log.info("memReg1 : " + memReg1);
		log.info("depNM : " + depNm);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("memNm", memNm);
		map.put("memReg1", memReg1);
		map.put("depNm", depNm);
		
		String res = logintestService.confirmId(map);
		
		log.info(res);
		
		ResponseEntity<String> entity = new ResponseEntity<String>(res, HttpStatus.OK);
		
		return entity;
	}
	
	//map : {memCd=asdf, tel=010-1212-3434}
	@PostMapping("/login/confirmPass")
	@ResponseBody
	public String confirmPass(HttpServletRequest request,@RequestBody Map<String,String> map) {
		log.info("map(최초) : " + map);
		log.info("tel(최초) : " + map.get("tel"));
		
		//메시지 발송 + 회원정보변경
		String temp = this.logintestService.confirmPass(map);
		
		return map.get("tel");
	}
	
	@GetMapping("/login/sample")
	public String sample() {
		return "login/sample";
	}
	
	@GetMapping("/login/findInfo")
	public String findInfo() {
		return "login/findInfo";
	}
	
}
