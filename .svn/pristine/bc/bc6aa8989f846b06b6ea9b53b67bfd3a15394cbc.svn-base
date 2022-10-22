package kr.ac.lms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.validation.SchemaFactoryLoader;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.NotificationService;
import kr.ac.lms.service.ScholarshipService;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.ProfessorVO;
import kr.ac.lms.vo.SclHistoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/scholarship")
public class ScholarshipController {
	
	@Autowired
	private ScholarshipService scholarshipService;
	@Autowired
	private NotificationService notificationService; 
	
	
	//교수추천장학금 페이지로 이동
	@GetMapping("/recommend")
	public String recommend(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memVO.getMemCd();
		model.addAttribute("memCd",memCd);
		
		return "scholarship/recommend";
	}
	
	//교수가 추천장학금 몇번 했는지 체크
	@ResponseBody
	@PostMapping("/countCheck")
	public int countCheck(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memVO.getMemCd();
		int cnt = scholarshipService.countCheck(memCd);
		log.info("cnt" + cnt);
		
		return cnt;
		
	}
	
	//교수와 같은 학과 학생들 리스트
	@ResponseBody
	@PostMapping("/recommendGrid")
	public List<HashMap<String,Object>> recommendGrid(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		ProfessorVO proVO = memVO.getProfessorVO();
		
		int depCd = proVO.getDepCd();
		
		List<HashMap<String,Object>>stuList = scholarshipService.stuList(depCd);
		return stuList;
	}
	
	//교수가 교수추천장학금 신청
	@ResponseBody
	@PostMapping("/proApply")
	public int proApply(@RequestBody List<HashMap<String, Object>> list) {
		
		int result = 0;
		log.info("리스트" + list);
	
		result = scholarshipService.proApply(list);
		
		//알림 
		
		List<Integer> memList = new ArrayList<Integer>();
		for(int i = 0; i<list.size(); i++) {
			memList.add(Integer.parseInt(String.valueOf(list.get(i).get("stuCd"))));
		}
		
		Map<String,Object> noticeMap = new HashMap<String, Object>();
		noticeMap.put("ntfCon", "교수추천장학금이 수여되었습니다.");
		noticeMap.put("memList", memList);
		noticeMap.put("ntfUrl", "/scholarship/stuHistory");
		  
		this.notificationService.insertNtf(noticeMap);
		
		return result;
	}
	
	//학생의 장학금 수혜내역 조회 페이지 이동
	
	@GetMapping("/stuHistory")
	public String stuHistory() {
		
		return "scholarship/stuHistory";
	}
	
	//학생 본인의 장학금 수혜내역 그리드
	@ResponseBody
	@PostMapping("/stuHistoryGrid")
	public List<SclHistoryVO> stuHistoryGrid(HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int stuCd = memVO.getMemCd();
		
		List<SclHistoryVO> list = scholarshipService.stuHistory(stuCd);
		
		return list;
	}
	
	//관리자의 모든 학생 장학금 수혜내역 조회 페이지 이동
	@GetMapping("/allHistory")
	public String allHistory() {
		return "scholarship/allHistory";
	}
	
	//모든 학생 장학금 수혜내역 그리드
	@ResponseBody
	@PostMapping("/allHistoryGrid")
	public List<SclHistoryVO> allHistoryGrid(){
		List<SclHistoryVO> list = scholarshipService.allHistory();
		return list;
	}
	
	//교수가 장학금 추천한 학생내역 이동
	@GetMapping("/proHistory")
	public String proHistory() {
		return "scholarship/proHistory";
	}
	
	//캘린더 관련 ajax
	
	//교수가 장학금 추천한 학생내역 그리드
	@ResponseBody
	@PostMapping("/proHistoryGrid")
	public List<SclHistoryVO> proHistoryGrid(HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memVO.getMemCd();
		List<SclHistoryVO> list = scholarshipService.proHistory(memCd);
		return list;
	}
	
	//올해 학생들의 성적 리스트 페이지 이동
	@GetMapping("/grade")
	public String grade() {
		return "scholarship/grade";
	}
	
	//성적 그리드 
	@ResponseBody
	@PostMapping("/gradeListGrid")
	public List<HashMap<String,Object>> gradeList(){
		List<HashMap<String,Object>> list = scholarshipService.gradeList();
		return list;
	}
	
	//성적장학금 수여 여부 조회
	@ResponseBody
	@PostMapping("/insertGradeCheck")
	public int insertGradeCheck() {
		int cnt = scholarshipService.insertGradeCheck();
		return cnt;
	}
	
	//성적장학금 데이터 삽입
	@ResponseBody
	@PostMapping("/insertGradeScl")
	public int insertGradeScl(@RequestBody List<HashMap<String, Object>> list, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memVO.getMemCd();
		for(int i = 0; i < list.size(); i++) {
			list.get(i).put("memCd", memCd);
		}
		
		int cnt = scholarshipService.insertGradeScl(list);
		
		//알림
		List<Integer> memList = new ArrayList<Integer>();
		for(int i = 0; i <list.size(); i++) {
			memList.add(Integer.parseInt(String.valueOf(list.get(i).get("stuCd"))));
		}
		
		Map<String,Object> noticeMap = new HashMap<String,Object>();
		noticeMap.put("ntfCon", "성적장학금이 수여되었습니다.");
		noticeMap.put("memList", memList);
		noticeMap.put("ntfUrl", "/scholarship/stuHistory");
		this.notificationService.insertNtf(noticeMap);
		
		return cnt;
	}
	
	//성적장학금용 강의 성적 상세정보
	@ResponseBody
	@PostMapping("/getLectureGrade")
	public List<HashMap<String,Object>> getLectureGrade(@RequestParam("stuCd") int stuCd){
		List<HashMap<String,Object>> list = scholarshipService.getLectureGrade(stuCd);
		return list;
	}
	
	//장학금 목록 이동
	@GetMapping("/scholarshipList")
	public String scholarshipList() {
		return "scholarship/scholarshipList";
	}
	
	//교수추천장학금 취소
	@ResponseBody
	@PostMapping("/deleteRecommend")
	public int deleteRecommend(@RequestParam("sclhCd") int sclhCd) {
		int result = scholarshipService.deleteRecommend(sclhCd);
		return result;
	}
	
}
