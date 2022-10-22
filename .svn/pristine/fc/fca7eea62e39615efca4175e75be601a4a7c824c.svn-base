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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.PreRegisterService;
import kr.ac.lms.service.RegisterService;
import kr.ac.lms.service.TotalGradeService;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/register")
@Controller
public class RegisterController {

	@Autowired
	RegisterService registerService;
	@Autowired
	TotalGradeService totalGradeService;
	@Autowired
	PreRegisterService preRegisterService;
	
	//수강신청 페이지
	@GetMapping("/list")
	public String list(Model model) {
		
		Map<String, Object> map = this.preRegisterService.getYrNSem();
		model.addAttribute("map", map);
		
		return "register/list";
	}
	
	//수강신청 페이지 도착 - 강의 리스트 가져오기
	@ResponseBody
	@GetMapping("/getList")
	public List<LecApplyVO> getList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		//2022년, 2학기 불러오기
		Map<String, Object> inputMap = this.preRegisterService.getYrNSem();
		Object year = inputMap.get("YEAR");
		Object semester = inputMap.get("SEMESTER");
		
		//parameterType이 될 map 생성
		//강의 리스트 map : {year=2022, memCd=20163530, semester=2}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memCd", memCd);
		map.put("year", year);
		map.put("semester", semester);
		
		//확인 완료
		List<LecApplyVO> list = this.registerService.list(map);
		
		return list;
	}
	
	//수강신청하기
	@ResponseBody
	@PostMapping("/putStuLec")
	public int putStuLec(
			@RequestBody Map<String, Object> map,
			HttpServletRequest request) {
		
		int result1 = 0;
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("lecaCd", map.get("lecaCd"));
		insertMap.put("memCd", memCd);
		
		//제한인원 및 수강인원 확인하기
		LecApplyVO intMap = this.registerService.getMaxHcnt(Integer.parseInt(String.valueOf(map.get("lecaCd"))));
		log.info("신청하려는 강의 leca_max, lec_hcnt : " + intMap);
		
		if(intMap.getLecaMax() > intMap.getLecaUnit()) {
			//수강신청하기
			result1 = this.registerService.putStuLec(insertMap);
			
			if(result1 == 1)  { //장바구니 제거 및 신청인원 + 1
				result1 += this.preRegisterService.deleteWish(insertMap);
				result1 += this.registerService.putStuLecCnt(Integer.parseInt(String.valueOf(map.get("lecaCd"))));
			}
		}else {
			result1 = 4;
		}
		
		return result1;
	}
	
	//수강신청 완료 리스트 불러오기
	@ResponseBody
	@GetMapping("/getRegList")
	public List<LecApplyVO> getRegList(HttpServletRequest request) {
		
		//log.info("도착했다!");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		//2022년, 2학기 불러오기
		Map<String, Object> inputMap = this.preRegisterService.getYrNSem();
		Object year = inputMap.get("YEAR");
		Object semester = inputMap.get("SEMESTER");
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("memCd", memCd);
		insertMap.put("year", year);
		insertMap.put("semester", semester);
		
		//log.info("insertMap : " + insertMap);
		
		List<LecApplyVO> list = this.registerService.getRegList(insertMap);
		
		return list;
	}
	
	//검색 후 개설강좌 불러오기
	@ResponseBody
	@PostMapping("/getListAgain")
	public List<LecApplyVO> getListAgain(
			HttpServletRequest request,
			@RequestBody Map<String, Object> map) {
		
		//log.info("개설강좌 검색 조건 map : " + map);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		//parameterType이 될 map 생성
		map.put("memCd", memCd);
		
		List<LecApplyVO> list = this.registerService.list(map);
		
		return list;
	}
	
	//수강신청 학점 및 과목수 불러오기
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
		
		Map<String, Object> inputMap = this.preRegisterService.getYrNSem();
		Object year = inputMap.get("YEAR");
		Object semester = inputMap.get("SEMESTER");
		
		//parameterType이 될 map 생성
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("memCd", memCd);
		insertMap.put("year", year);
		insertMap.put("semester", semester);
		
		Map<String, Object> map = this.registerService.getCnt(insertMap);
		
		return map;
	}
	
	//수강신청 목록에서 삭제하기
	@ResponseBody
	@PostMapping("/deleteStuLec")
	public int deleteStuLec(
			HttpServletRequest request,
			@RequestBody Map<String, Object> map) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("lecaCd", map.get("lecaCd"));
		insertMap.put("memCd", memCd);
		
		//STU_LEC에서 삭제하기
		int result = this.registerService.delStuLec(insertMap);
		
		//LECTURE LEC_HCNT에서 1 빼기
		result += this.registerService.delStuLecCnt(Integer.parseInt(String.valueOf(map.get("lecaCd"))));
		
		return result;
	}
	
	//수강신청 시간표 가져오기
	@ResponseBody
	@PostMapping("/getTime")
	public List<Map<String, Object>> getTime(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		Map<String, Object> inputMap = this.preRegisterService.getYrNSem();
		Object year = inputMap.get("YEAR");
		Object semester = inputMap.get("SEMESTER");
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("memCd", memCd);
		insertMap.put("year", year);
		insertMap.put("semester", semester);
		
		return this.registerService.getTime(insertMap);
	}
	
	//시간표가 중복되는지 확인하기
	@ResponseBody
	@PostMapping("/checkTime")
	public int checkTime(
			HttpServletRequest request,
			@RequestBody Map<String, Object> map) {
		
		//log.info("checkTime 도착");
		
		//보낼 값 (1 - 중복X, 2 - 중복0)
		int result = 1;
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		Map<String, Object> inputMap = this.preRegisterService.getYrNSem();
		Object year = inputMap.get("YEAR");
		Object semester = inputMap.get("SEMESTER");
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("memCd", memCd);
		insertMap.put("year", year);
		insertMap.put("semester", semester);
		
		//수강신청한 tm_cd 가져오기
		List<String> timeList = this.registerService.getCurrentTime(insertMap);
		//수강신청하려고 하는 강의의 tm_cd 가져오기
		List<String> thisList = this.registerService.getThisTime(Integer.parseInt(String.valueOf(map.get("lecaCd"))));
		
		if(timeList == null) {
			result = 1;
		}else {
			for(int i = 0; i < thisList.size(); i++) {
				for(int j = 0; j < timeList.size(); j++) {
					if(thisList.get(i).equals(timeList.get(j))) {
						result = 2;
					}
				}
			}
		}
		
//		for(int i = 0; i < timeList.size(); i++) {
//			log.info("timeList : " + timeList.get(i).toString());
//		}
//		for(int i = 0; i < thisList.size(); i++) {
//			log.info("thisList : " + thisList.get(i).toString());
//		}
//		
//		log.info(result + "");
		
		return result;
	}
	
	//소켓에 메시지가 있을 때 lec_hcnt 리스트 불러오기
	@ResponseBody
	@PostMapping("/updateCntList")
	public List<Integer> updateCntList(
			HttpServletRequest request,
			@RequestBody Map<String, Object> map) {
		
		//log.info("socket 변화로 리스트 불러올 때 map : " + map);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		map.put("memCd", memCd);
		
		List<Integer> list = this.registerService.updateCntList(map);
		
		return list;
	}
	
	//포틀릿용 페이지
	@GetMapping("/sample")
	public String sample(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		//동일한 부분
		List<LecApplyVO> yrList = this.totalGradeService.ptlYrNSem(memCd);
		String yrNsem = yrList.get(0).getLecaYr() + "" + yrList.get(0).getLecaSem();
		model.addAttribute("yrNSem", yrList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memCd", memCd);
		map.put("yrNsem", yrNsem);
		Map<String, Object> totalMap = this.totalGradeService.ptlGet(map);
		model.addAttribute("totalMap", totalMap);
		
		List<LecApplyVO> regHistoryList = this.registerService.ptlList(map);
		model.addAttribute("regHistoryList", regHistoryList);
		
		return "register/sample";
	}
	
	//포틀릿용 페이지 도착 - 수강신청 리스트 가져오기
	@ResponseBody
	@PostMapping("/getRegHistoryList")
	public List<LecApplyVO> getRegHistoryList(
			@RequestBody Map<String, Object> map,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		//log.info("돌아온 map : " + map.toString());
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("memCd", memCd);
		insertMap.put("yrNsem", map.get("yrNsem"));
		
		List<LecApplyVO> gradeList = this.registerService.ptlList(insertMap);
		
		return gradeList;
	}
	
	@ResponseBody
	@PostMapping("/updateTimeTable")
	public List<Map<String, Object>> updateTimeTable(@RequestBody Map<String, Object> map) {
		List<Map<String, Object>> list = this.registerService.updateTimeTable(Integer.parseInt(String.valueOf(map.get("lecaCd"))));
		
		return list;
	}
	
	//소켓에 메시지가 있을 때 lec_hcnt 위시리스트 불러오기
	@ResponseBody
	@PostMapping("/updateCntWishList")
	public List<Integer> updateCntWishList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20163530;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		//2022년, 2학기 불러오기
		Map<String, Object> inputMap = this.preRegisterService.getYrNSem();
		Object year = inputMap.get("YEAR");
		Object semester = inputMap.get("SEMESTER");
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("memCd", memCd);
		insertMap.put("year", year);
		insertMap.put("semester", semester);
		
		List<Integer> list = this.registerService.updateCntWishList(insertMap);
		
		return list;
	}
	
}