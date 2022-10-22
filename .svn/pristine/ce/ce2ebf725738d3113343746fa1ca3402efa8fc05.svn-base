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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.CounselService;
import kr.ac.lms.service.NotificationService;
import kr.ac.lms.util.ArticlePage;
import kr.ac.lms.vo.CommonDetailVO;
import kr.ac.lms.vo.CounselVO;
import kr.ac.lms.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/counsel")
public class CounselController {

   @Autowired
   private CounselService service;
   @Autowired
   private NotificationService notificationService;
   
   //학생의 전체 상담기록 불러오기
   @GetMapping("/stuCounsel")
   public String list(Model model, HttpServletRequest request, @RequestParam Map<String, String> map) {
	      
	  HttpSession session = request.getSession();
	  MemberVO memVO = (MemberVO) session.getAttribute("memSession");   
	  log.info("memVO" + memVO);
	  String stuCd = String.valueOf(memVO.getMemCd());
	  
	  int page =10;
	  
	  map.put("stuCd", stuCd);
	  
	  if(map.size() == 0) {
			map.put("currentPage", "1");
	  }
		
	  log.info("map >> " + map);
		
	  String currentPage = map.get("currentPage");
		
	  int total = service.getTotal(memVO.getMemCd());
		
	  // 현제 페이지가 null이라면 1로 세팅
	  if(currentPage == null) {
			currentPage = "1";
			map.put("currentPage", "1");
	  }
	  
      List<CounselVO> history = service.history(map);
      log.info("history" + history);
      
      model.addAttribute("history",new ArticlePage<CounselVO>(total, Integer.parseInt(currentPage),page,history));
      model.addAttribute("map", map);
      
      return "counsel/stuCounsel";
   }
   
   //학생의 상담 상세 기록 불러오기
   @GetMapping("/stuCounselDetail")
   public String stuCounselDetail(@RequestParam("cnslCd") int cnslCd, Model model, HttpServletRequest request ){
	   
	   HttpSession session = request.getSession();
	   MemberVO memVO = (MemberVO) session.getAttribute("memSession");   
	   
	   if(memVO.getStudentVO()!=null) {
		   model.addAttribute("stuCd","stu");
		   model.addAttribute("proCd",null);
	   }else if(memVO.getProfessorVO()!=null) {
		   model.addAttribute("stuCd",null);
		   model.addAttribute("proCd","pro");
	   }
	   
	   CounselVO detail = service.detail(cnslCd);
	   model.addAttribute("detail",	detail);
	   List<CommonDetailVO> cate = service.cate();
	   model.addAttribute("cate",cate);

	   return "counsel/stuCounselDetail";
	   
   }
  
  
   //학생의 상담 신청페이지이동
   @GetMapping("/applyCounsel")
   public String applyCounsel(Model model) {
	   List<CommonDetailVO> cate = service.cate();
	   model.addAttribute("cate",cate);
	   return "counsel/applyCounsel";
   }
  
   //학생의 상담 신청
   @ResponseBody
   @PostMapping("/stuCounselPost")
   public int save(@ModelAttribute CounselVO counselVO, HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		log.info("memVO" + memVO);
		int stuCd = memVO.getMemCd();

		int result = 0;

		counselVO.setStuCd(stuCd);
		log.info("vooooo" + counselVO.toString());

		result = service.save(counselVO);

		return result;
   }
   
   //교수의 전체 상담 불러오기
   @GetMapping("/proCounsel")
   public String proHistory(Model model, HttpServletRequest request, @RequestParam Map<String, String> map ) {
	   
	   	HttpSession session = request.getSession();
	   	MemberVO memVO = (MemberVO) session.getAttribute("memSession");   
	   	log.info("memVO" + memVO);
	   	String proCd = String.valueOf(memVO.getMemCd());
		  
	  	int page =10;
	  
	  	map.put("proCd", proCd);
	  
		if(map.size() == 0) {
			map.put("currentPage", "1");
		}
		
		log.info("map >> " + map);
		
		String currentPage = map.get("currentPage");
		
		int total = service.getTotalPro(memVO.getMemCd());
		
		
		// 현제 페이지가 null이라면 1로 세팅
		if(currentPage == null) {
			currentPage = "1";
			map.put("currentPage", "1");
		}
		  
		  
		List<CounselVO> proHistory = service.proHistory(map);
		log.info("history" + proHistory);
      
		model.addAttribute("proHistory",new ArticlePage<CounselVO>(total, Integer.parseInt(currentPage),page,proHistory));
		model.addAttribute("map", map);
      
	      
	   return "counsel/proCounsel";
   }
   

   
   //교수 상담 답장 //알림 추가
   @PostMapping("/reply")
   @ResponseBody
   public String reply(@ModelAttribute CounselVO counselVo) {
	  
	  service.reply(counselVo);
	  String result= "답변을 작성하였습니다";
	   
	  int stuCd = counselVo.getStuCd();
	  log.info("stuCd"+stuCd);
	  List<Integer> memList = new ArrayList<Integer>();
	  memList.add(stuCd);
	  
	  Map<String,Object> noticeMap = new HashMap<String, Object>();
	  noticeMap.put("ntfCon", "상담에 답변이 게시되었습니다.");
	  noticeMap.put("memList", memList);
	  noticeMap.put("ntfUrl", "/counsel/stuCounselDetail?cnslCd=" + counselVo.getCnslCd());
	  
	  this.notificationService.insertNtf(noticeMap);

	  return result;
   }
   
   //학생 상담 카테, 제목, 내용 수정
   @PostMapping("/modify")
   @ResponseBody
   public String modify(@ModelAttribute CounselVO counselVO) {
	   
	   String result= "글을 수정하였습니다.";
	   log.info("counselVO" + counselVO);
	   int cnt = service.modify(counselVO);
	   return result;
   }
   
   @PostMapping("/delete")
   @ResponseBody
   public int delete(int cnslCd) {
	   
	   int cnt = service.delete(cnslCd);
	   return cnt;
   }
   
   @ResponseBody
   @RequestMapping("/getCnslCnt")
   public CounselVO getCnslCnt(int stuCd) {
	   log.info("== getCnslCnt ==");
	   
	   CounselVO counselVO = this.service.getCnslCnt(stuCd);
	   log.info("counselVO >> " + counselVO);
	   
	   return counselVO;
   }
}