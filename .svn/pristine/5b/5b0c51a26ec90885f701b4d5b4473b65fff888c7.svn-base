package kr.ac.lms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.CourseHandbookService;
import kr.ac.lms.service.PreRegisterService;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/pregister")
@Controller
public class PreRegisterController {
	
	@Autowired
	PreRegisterService preRegisterService;
	
	@Autowired
	CourseHandbookService courseHandbookService;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		Map<String, Object> map = this.preRegisterService.getYrNSem();
		
		model.addAttribute("map", map);
		
		//log.info(map.toString());
		
		return "pregister/list";
	}
	
	@ResponseBody
	@PostMapping("/getInfo")
	public StudentVO getInfo(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		StudentVO student = this.preRegisterService.getInfo(memCd);
		
		return student;
	}
	
	@ResponseBody
	@PostMapping("/wishList")
	public List<LecApplyVO> wishList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		List<LecApplyVO> list = this.preRegisterService.wishList(memCd);
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("/getCnt")
	public Map<String, Object> getCnt(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		Map<String, Object> inputMap1 = this.preRegisterService.getYrNSem();
		Object year = inputMap1.get("YEAR");
		Object semester = inputMap1.get("SEMESTER");
		
		Map<String, Object> inputMap2 = new HashMap<String, Object>();
		inputMap2.put("year", year);
		inputMap2.put("semester", semester);
		inputMap2.put("memCd", memCd);
		
		Map<String, Object> map = this.preRegisterService.getCnt(inputMap2);
		
		return map;
	}
	
	//리스트 가져오기 (수강편람에 현재 년도와 학기 입력하기)
	//{SEMESTER=2, YEAR=2022}
	@ResponseBody
	@GetMapping("/getList")
	public List<LecApplyVO> getList() {
		
		Map<String, Object> inputMap = this.preRegisterService.getYrNSem();
		Object year = inputMap.get("YEAR");
		Object semester = inputMap.get("SEMESTER");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("year", year);
		map.put("semester", semester);
		
		List<LecApplyVO> list = this.courseHandbookService.list(map);
		
//		if(list != null) {
//			log.info(list.get(0).toString());
//		}
		
		return list;
	}
	
	//장바구니 추가
	//중복 검사 후 insert
	@ResponseBody
	@PostMapping("/addWish")
	public int addWish(HttpServletRequest request, @RequestParam("lecaCd") Object lecaCd) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memCd", memCd);
		map.put("lecaCd", lecaCd);
		
		//중복 신청 확인
		int check = this.preRegisterService.checkWish(map);
		int result = 0;
		
		if(check == 0) {
			//중복되지 않는 경우 장바구니에 넣기
			result = this.preRegisterService.addWish(map);
			//0 : insert되지 않음
			//1 : insert됨
		}else {
			result = 2;
			//2 : 중복됨 
		}
		
		return result;
	}
	
	//장바구니 삭제
	@ResponseBody
	@PostMapping("/deleteWish")
	public int deleteWish(HttpServletRequest request, @RequestParam("lecaCd") Object lecaCd) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memCd", memCd);
		map.put("lecaCd", lecaCd);
		
		int result = this.preRegisterService.deleteWish(map);
		
		return result;
	}
	
	//장바구니 체크박스 체크 시 시간표 가져오기
	@ResponseBody
	@PostMapping("/getWishTime")
	public List<Map<String, Object>> getWishTime(@RequestBody Map<String, Integer> map) {
		
		List<Map<String, Object>> list = this.preRegisterService.getWishTime(map.get("lecaCd"));
		
		return list;
	}
}
