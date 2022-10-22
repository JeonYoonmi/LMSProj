package kr.ac.lms.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.RecordApplyService;
import kr.ac.lms.vo.DepartmentVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.RecordVO;
import kr.ac.lms.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/record")
@Controller
public class RecordApplyController {
	
	@Inject
	RecordApplyService recordAapplyService;
	
	@GetMapping("/apply")
	public String apply(HttpServletRequest request, Model model, @RequestParam Map<String, String> map) {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		log.info("apply memberVO : " + memberVO);
		int memCd = memberVO.getMemCd();
		log.info("memCd : " +memCd);
		
		model.addAttribute("memCd", memCd);
		
		//신상정보 불러오기
		List<MemberVO> stuInfoList = this.recordAapplyService.stuInfoList(memberVO);
		log.info("stuInfoList : " + stuInfoList);
		
		model.addAttribute("data", stuInfoList);
		
		
		
		//신청/승인이력 건수 불러오기
		int countResult = this.recordAapplyService.countResult(memberVO);
		model.addAttribute("cnt", countResult);
		
		return "record/apply";
	}
	
	@ResponseBody
	@PostMapping("/ajaxhubeokApply")
	public List<LecApplyVO> ajaxhubeokApply(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		//학적변동이력 불러오기
		List<LecApplyVO> historyList = this.recordAapplyService.history(memberVO);
		if(historyList != null) {
			   log.info("list : " + historyList.get(0).toString());
		}
		log.info("historyList : " + historyList);
		log.info("historyList.size() : " + historyList.size());
		
		model.addAttribute("history", historyList);
		
		return historyList;
	}
	
	@ResponseBody
	@PostMapping("/detailHistory")
	public RecordVO detailHistory(@RequestBody Map<String, Object> map, Model model) {
		
		log.info("학적변동 상세이력 map : " + map);
		
		//학적변동 상세이력 불러오기
		List<RecordVO> recordHistory = this.recordAapplyService.detailHisoty(map);
		RecordVO record = recordHistory.get(0);
		log.info("recordHistory : " + recordHistory);
		
		model.addAttribute("recordHistory", recordHistory);
		
		return record;
	}
	
	@ResponseBody
	@PostMapping("/saveRecord")
	public int saveRecord(@RequestBody Map<String, Object> map) {
		log.info("saveRecord에 왔다!");
		
		log.info("saveRecord map : " + map);
		
		//학적변동 저장하기
		int cnt = this.recordAapplyService.insertRecord(map);
		log.info("cnt : " + cnt);
		
		return cnt;
	}
	
	@ResponseBody
	@PostMapping("/counselCnt")
	public int counselCnt(@RequestBody Map<String, Object> map) {
		log.info("counselCnt에 왔다!");
		
		int cnt = this.recordAapplyService.counselCnt(map);
		log.info("Counselcnt :" + cnt);
		
		return cnt;
	}
	
	@ResponseBody
	@PostMapping("/firstData")
	public RecordVO firstData(@RequestBody Map<String, Object> map) {
		List<RecordVO> recordHistory = this.recordAapplyService.detailHisoty(map);
		RecordVO record = recordHistory.get(0);
		
		log.info("firstData record : " + record);
		
		return record;
	}
	
	@GetMapping("/dropApply")
	public String dropApply(HttpServletRequest request, Model model, @RequestParam Map<String, String> map) {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		
		//신상정보 불러오기
		List<MemberVO> stuInfoList = this.recordAapplyService.stuInfoList(memberVO);
		log.info("stuInfoList : " + stuInfoList);
		
		model.addAttribute("data", stuInfoList);
		
		//학적변동이력 불러오기
		List<LecApplyVO> historyList = this.recordAapplyService.history(memberVO);
		if(historyList != null) {
			   log.info("list : " + historyList.get(0).toString());
		}
		log.info("historyList : " + historyList);
		
		model.addAttribute("history", historyList);
		
		//신청/승인이력 건수 불러오기
		int countResult = this.recordAapplyService.countResult(memberVO);
		model.addAttribute("cnt", countResult);
		
		return "record/dropApply";
	}
	
	@PostMapping("/dropSave")
	public String dropSave() {
		return "record/dropSave";
	}

	//졸업신청 페이지 이동
	@GetMapping("/graduateGet")
	public String graduateGet(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		log.info("apply memberVO : " + memberVO);
		int memCd = memberVO.getMemCd();
		log.info("memCd : " +memCd);
		
		model.addAttribute("memCd", memCd);
		
		//신상정보 불러오기
		List<MemberVO> stuInfoList = this.recordAapplyService.stuInfoList(memberVO);
		log.info("stuInfoList : " + stuInfoList);
		
		model.addAttribute("data", stuInfoList);
		
		//졸업사정조회 불러오기
		Map<String, Object> map = this.recordAapplyService.graduationSelect(memCd);
		log.info("graduationSelect map : " + map);
		model.addAttribute("grade", map);
		
		//졸업사정조회 중 배당 불러오기
		DepartmentVO departmentVO = this.recordAapplyService.fixedGrade(memCd);
		log.info("departmentVO : " + departmentVO);
		model.addAttribute("fix", departmentVO);
		
		return "record/graduateApply";
	}
	
	//학생 졸업신청 중 전공별 이수내역 출력
	@ResponseBody
	@PostMapping("/majorHistory")
	public List<LecApplyVO> majorHistory(@RequestBody Map<String, Object> map) {
		log.info("majorHistory map : " + map);
		
		List<LecApplyVO> majorHistory = this.recordAapplyService.majorHistory(Integer.parseInt((String) map.get("stuCd")));
		log.info("majorHistory : " + majorHistory);
		
		return majorHistory;
	}
	
	//학생 졸업신청 중 교양별 이수내역 출력
	@ResponseBody
	@PostMapping("/culturalHistory")
	public List<LecApplyVO> culturalHistory(@RequestBody Map<String, Object> map){
		
		List<LecApplyVO> culturalHistory = this.recordAapplyService.culturalHistory(Integer.parseInt((String) map.get("stuCd")));
		log.info("culturalHistory : " + culturalHistory);
		
		return culturalHistory;
	}
	
	//졸업사정 일람표 팝업 열기
	@GetMapping("/getGradeTable/{stuCd}/{yn}")
	public String getGradeTable(@PathVariable("stuCd") int stuCd, @PathVariable("yn") String yn, Model model) {
		log.info("gtGradeTable에 왔다!");
		log.info("gtGradeTable stuCd : " + stuCd);
		
		model.addAttribute("stuCd", stuCd);
		
		////성적일람표 중 전필 출력
		List<LecApplyVO> jeonpilList = this.recordAapplyService.jeonpil(stuCd);
		log.info("jeonpilList : " + jeonpilList);
		model.addAttribute("jplist", jeonpilList);
		
		//성적일람표 중 전선 출력
		List<LecApplyVO> jeonseonList = this.recordAapplyService.jeonseon(stuCd);
		model.addAttribute("jslist", jeonseonList);
		
		//성적일람표 중 신상정보 출력
		Map<String, Object> stuMyInfo = this.recordAapplyService.stuMyInfo(stuCd);
		log.info("stuMyInfo : " + stuMyInfo);
		model.addAttribute("myInfo", stuMyInfo);
		
		//성적일람표 중 학점 출력
		Map<String, Object> stuGrageInfo = this.recordAapplyService.graduationSelect(stuCd);
		log.info("stuGrageInfo : " + stuGrageInfo);
		model.addAttribute("gradeInfo", stuGrageInfo);
		
		//불가사유 출력
		log.info("ynyn : " + yn);
		model.addAttribute("yn", yn);
		
		return "record/gradeTable";
	}
	
	//졸업신청 insert
	@ResponseBody
	@PostMapping("/postApply")
	public int postApply(@RequestBody Map<String, Object> map) {
		
		int cnt = this.recordAapplyService.graduationInsert(Integer.parseInt((String) map.get("stuCd")));
		
		return cnt;
	}
	
	//졸업신청 중 졸업신청한적있는지 count
	@ResponseBody
	@PostMapping("/graduateHistory")
	public int graduateHistory(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int stuCd = memberVO.getMemCd();
		
		int cnt = this.recordAapplyService.graduateHistory(stuCd);
		
		return cnt;
	}
	
}
