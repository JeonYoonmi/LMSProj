package kr.ac.lms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.NotificationService;
import kr.ac.lms.service.RecordApplyService;
import kr.ac.lms.service.RecordApprovalService;
import kr.ac.lms.vo.DepartmentVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.RecordVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/recordApproval")
@Controller
public class RecordApprovalController {

	@Autowired
	private RecordApprovalService recordApprovalService;
	@Autowired
	private NotificationService notificationService;
	@Autowired
	private RecordApplyService recordApplyService;
	
	// 휴/복학 관리 페이지 
	@GetMapping("/hyubokhak")
	public String hyubokhak() {
		log.info("== hyubokhak ==");
		
		return "record/hyubokhak";
	}
	
	// 휴/복학 신청 내역 출력- 0
	@ResponseBody
	@PostMapping("/getHyubokhakRecord")
	public List<RecordVO> getHyubokhakRecord(){
		log.info("== getHyubokhakRecord ==");
		
		List<RecordVO> recordList = this.recordApprovalService.getRecordList(0);
		log.info("recordList >> " + recordList);
		
		return recordList;
	}
	
	// 자퇴 관리 페이지 
	@GetMapping("/jatoe")
	public String jatoe() {
		log.info("== jatoe ==");
		
		return "record/jatoe";
	}
	
	// 자퇴 신청 내역 출력 - 1
	@ResponseBody
	@PostMapping("/getJatoeRecord")
	public List<RecordVO> getJatoeRecord(){
		log.info("== getJatoeRecord ==");
		
		List<RecordVO> recordList = this.recordApprovalService.getRecordList(1);
		log.info("recordList >> " + recordList);
		
		return recordList;
	}
	
	// 졸업 관리 페이지
	@GetMapping("/joleop")
	public String joleop() {
		log.info("== joleop ==");
		
		return "record/joleop";
	}
	
	// 졸업 관리 페이지
	@GetMapping("/joleopDetail")
	public String joleopDetail(int memCd, Model model) {
		log.info("== joleopDetail ==");
		
		model.addAttribute("memCd", memCd);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemCd(memCd);
		
		//신상정보 불러오기
		List<MemberVO> stuInfoList = this.recordApplyService.stuInfoList(memberVO);;
		log.info("stuInfoList : " + stuInfoList);
		
		model.addAttribute("data", stuInfoList);
		
		//졸업사정조회 불러오기
		Map<String, Object> map = this.recordApplyService.graduationSelect(memCd);
		log.info("graduationSelect map : " + map);
		model.addAttribute("grade", map);
		
		//졸업사정조회 중 배당 불러오기
		DepartmentVO departmentVO = this.recordApplyService.fixedGrade(memCd);
		log.info("departmentVO : " + departmentVO);
		model.addAttribute("fix", departmentVO);
		
		return "record/joleopDetail";
	}
	
	// 졸업 신청 내역 출력 - 2
	@ResponseBody
	@PostMapping("/getJoleopRecord")
	public List<RecordVO> getJoleopRecord(){
		log.info("== getJoleopRecord ==");
		
		List<RecordVO> recordList = this.recordApprovalService.getRecordList(2);
		log.info("recordList >> " + recordList);
		
		return recordList;
	}
	
	
	/**
	 * 학적 신청 상세 보기
	 * @param recCd
	 * @return
	 */
	@ResponseBody
	@PostMapping("/recordDetail")
	public RecordVO recordDetail(int recCd) {
		log.info("== recordDetail ==");
		
		RecordVO recordVO = this.recordApprovalService.recordDetail(recCd);		
		log.info("recordVO >> " + recordVO);
		
		return recordVO;
	}
	
	@ResponseBody
	@PostMapping("/updateY")
	public int updateY(int recCd, int stuCd) {
		log.info("== updateY ==");
//		log.info("recCd >> " + recCd + "stuCd >> " + stuCd);
		int result = this.recordApprovalService.updateY(recCd);
		
		List<Integer> memList = new ArrayList<Integer>();
		memList.add(stuCd);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ntfCon", "학적 신청이 처리되었습니다.");
		map.put("memList", memList);
		map.put("ntfUrl", "/record/apply");
		
		this.notificationService.insertNtf(map);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/updateN")
	public int updateN(RecordVO recordVO) {
		log.info("== updateN ==");
		
		log.info("recordVO >> " + recordVO);
		
		int result = this.recordApprovalService.updateN(recordVO);

		List<Integer> memList = new ArrayList<Integer>();
		memList.add(recordVO.getStuCd());
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ntfCon", "학적 신청이 처리되었습니다.");
		map.put("memList", memList);
		map.put("ntfUrl", "/record/apply");
		
		return result;
	}
}
