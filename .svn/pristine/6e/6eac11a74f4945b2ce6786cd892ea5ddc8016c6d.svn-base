package kr.ac.lms.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.lms.service.ManagementService;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.ProfessorVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/management")
@Controller
public class ManagementController {
	
	@Autowired
	private ManagementService managementService;
	
	/**
	 * 학생 목록 조회 페이지로 이동
	 * @return
	 */
	@GetMapping("/stuList")
	public String stuList() {
		log.info("== stuList ==");
		
		return "management/stuList";
	}
	
	/**
	 * 학생 목록 조회
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getStuList")
	public List<MemberVO> getStuList() {
		log.info("== getStuList ==");
		
		List<MemberVO> memberVOList = this.managementService.stuList();
		log.info("memberVOList >> " + memberVOList);
		
		return memberVOList;
	}
	
	/**
	 * 학생 상세 정보 출력
	 * @param memCd
	 * @return
	 */
	@ResponseBody
	@PostMapping("/stuDetail")
	public MemberVO stuDetail(int memCd) {
		log.info("== stuDetail ==");
		
		MemberVO memberVO = this.managementService.stuDetail(memCd);
		
		return memberVO;
	}
	
	/**
	 * 교수 목록 조회 페이지로 이동
	 * @return
	 */
	@GetMapping("/proList")
	public String proList() {
		log.info("== proList ==");
		
		return "management/proList";
	}
	
	/**
	 * 교수 목록 조회
	 * @return
	 */
	@ResponseBody
	@PostMapping("/getProList")
	public List<MemberVO> getProList() {
		log.info("== getProList ==");
		
		List<MemberVO> memberVOList = this.managementService.proList();
		log.info("memberVOList >> " + memberVOList);
		
		return memberVOList;
	}

	/**
	 * 교수 상세 정보 출력
	 * @param memCd
	 * @return
	 */
	@ResponseBody
	@PostMapping("/proDetail")
	public MemberVO proDetail(int memCd) {
		log.info("== proDetail ==");
		
		MemberVO memberVO = this.managementService.proDetail(memCd);
		
		return memberVO;
	}
	
	/**
	 * 학생, 교수 등록 페이지 이동
	 * @return
	 */
	@GetMapping("/memRegister")
	public String memRegister() {
		log.info("== memRegister ==");
		
		return "management/memRegister";
	}

	/**
	 * 교수의 학생 관리 페이지 이동
	 * @return
	 */
	@RequestMapping("/proStuList")
	public String proStuList() {
		log.info("== proStuList ==");
		
		return "management/proStuList";
	}
	
	/**
	 * 교수별 해당 학과 학생 출력
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getProStuList")
	public List<MemberVO> getProStuList(HttpServletRequest request){
		log.info("== getProStuList ==");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		if(memberVO == null) {
			memberVO = new MemberVO();
			memberVO.setMemCd(200231111);
			
			ProfessorVO professorVO = new ProfessorVO();
			professorVO.setDepCd(1);
			
			memberVO.setProfessorVO(professorVO);
		}
		
		List<MemberVO> memberVOList = this.managementService.getProStuList(memberVO);
		log.info("memberVOList >> " + memberVOList);
		
		return memberVOList;
	}
	
}
