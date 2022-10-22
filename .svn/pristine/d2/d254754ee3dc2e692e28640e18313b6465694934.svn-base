package kr.ac.lms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.NotificationService;
import kr.ac.lms.service.PaymentService;
import kr.ac.lms.vo.CollegeVO;
import kr.ac.lms.vo.DepartmentVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.PaymentVO;
import kr.ac.lms.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/payment")
public class PaymentController {
	
	@Autowired
	private PaymentService service;
	@Autowired
	private NotificationService notificationService; 
	
	//관리자 학생 납부내역 기본화면
	@GetMapping("/adminPaymentList")
	public String adminPaymentList(Model model) {
		PaymentVO paymentVO = service.sumCollegeFee();
		model.addAttribute("paymentVO",paymentVO);
		return "payment/adminPaymentList";
	}
	
	//관리자 등록금 그리드(ajax)
	@ResponseBody
	@PostMapping("/adminPaymentgrid")
	public List<HashMap<String,Object>> adminPaymentListAjax(){
				
		List<HashMap<String,Object>> hashmap = service.adminPaymentList();
		log.info("hashmap값"+ hashmap);
		return hashmap;
				
	}
	
	//학생의 전체 등록금 납부내역 기본화면(ajax아님)
	@GetMapping("/stuPaymentList")
	public String stuPaymentList() {
		
		return "payment/stuPaymentList";
	}
	
	@ResponseBody
	@PostMapping("/stuPaymentListGrid")
	public List<PaymentVO> stuPaymentListGrid(HttpServletRequest request){
		HttpSession session = request.getSession();
	    MemberVO memVO = (MemberVO) session.getAttribute("memSession");   
	    StudentVO stuVo = memVO.getStudentVO();
	    List<PaymentVO> list= service.stuPaymentList(stuVo);
	    return list;
	}
	
	@ResponseBody
	@PostMapping("/payDetailAjax")
	public HashMap<String,Object> payDetailAjax(HttpServletRequest request, @RequestBody HashMap<String,Integer>map){
		
		int payCd = map.get("payCd");
		
		HttpSession session = request.getSession();
	    MemberVO memVO = (MemberVO) session.getAttribute("memSession");   
	    int stuCd = memVO.getMemCd();
	    String memNm = memVO.getMemNm();
	    
	    StudentVO stuVo = memVO.getStudentVO();
		  
	    int depCd = stuVo.getDepCd();
	    
	    map.put("stuCd", stuCd);
	    map.put("depCd", depCd);
	    
	    HashMap<String, Object> detail = service.payDetail(map);
	    detail.put("MEM_NM", memNm);
		return detail;
		
	}

	
	//납부확인서 이동(관련 파라미터 넘긱기)
	@GetMapping("/certificate/{payCd}")
	public String certificate(@PathVariable("payCd") int payCd, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession"); 
		int stuCd = memVO.getMemCd();
		StudentVO stuVO = memVO.getStudentVO();
		int depCd = stuVO.getDepCd();
		
		String memNm = memVO.getMemNm();
		
		
		HashMap<String,Integer>map = new HashMap<String, Integer>();
		map.put("depCd", depCd);
		map.put("stuCd", stuCd);
		map.put("payCd", payCd);
		
		
		
		
		HashMap<String,Object> detail = service.payDetail(map);
		model.addAttribute("detail",detail);
		model.addAttribute("MEM_NM",memNm);
		
		return "payment/certificate";
	}
	
	
	//등록금 고지서 출력/등록금 납부 가능 화면
	@GetMapping("/bill")
	public String bill(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");   
		int stuCd = memVO.getMemCd();
		String memMail = memVO.getMemMl();
		log.info("stuCd1" + stuCd);
		int stuSem = memVO.getStudentVO().getStuSem();
		String memNm = memVO.getMemNm();
		String memTel = memVO.getMemTel();
		
		HashMap<String, Object> map = service.bill(stuCd);
		map.put("MEM_ML", memMail);
		map.put("MEM_TEL", memTel);
		log.info("bill" + map);

		model.addAttribute("map",map);
		
		return "payment/bill";
	}
	
	//등록금 납부 여부 확인 
	@ResponseBody
	@PostMapping("/billCount")
	public int billCount(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");   
		int stuCd = memVO.getMemCd();
		log.info("stuCd2" + stuCd);
		int cnt = service.billCount(stuCd);
		log.info("cnt" + cnt);
		return cnt;
		
	}

	@ResponseBody
	@PostMapping("/pay")
	public int pay(int payCd) {
		int result = service.pay(payCd);
		return result;
		
	}
	
	//등록금 고지할 재학생 리스트 
	@GetMapping("/payNotice")
	public String payNotice(Model model) {
		
		return "payment/payNotice";
	}
	
	@ResponseBody
	@PostMapping("/payNoticeGrid")
	public List<HashMap<String,Object>> list(){
		List<HashMap<String, Object>> list = service.attendList();
		return list;
	}
	
	//등록금 납부하기
	@ResponseBody
	@PostMapping("/insert")
	public int insert(@RequestBody List<Map<String, Object>> list) {
		
		int cnt = service.insert(list);
		log.info("cnt" + cnt);
		
		//알림
		List<Integer> memList = new ArrayList<Integer>();
		for(int i = 0; i <list.size(); i++) {
			memList.add(Integer.parseInt(String.valueOf(list.get(i).get("stuCd"))));
		}
		
		Map<String,Object> noticeMap = new HashMap<String,Object>();
		noticeMap.put("ntfCon", "등록금이 고지되었습니다.");
		noticeMap.put("memList", memList);
		noticeMap.put("ntfUrl", "/payment/bill");
		this.notificationService.insertNtf(noticeMap);
		
		return cnt;
	
	
	}
	
	//등록금 리스트 이동
	@GetMapping("/collegeFeeList")
	public String collegeFeeList(Model model){
		List<HashMap<String,Object>> collegeFeeList = service.collegeFeeList();
		model.addAttribute("collegeFeeList", collegeFeeList);
		return "payment/collegeFeeList";
	}

}
