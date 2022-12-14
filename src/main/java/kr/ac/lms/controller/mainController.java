package kr.ac.lms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator;

import kr.ac.lms.service.AScheduleService;
import kr.ac.lms.service.ApprovalService;
import kr.ac.lms.service.CounselService;
import kr.ac.lms.service.LectureApplyService;
import kr.ac.lms.service.NoticeService;
import kr.ac.lms.service.PortletService;
import kr.ac.lms.service.ProfessorLectureService;
import kr.ac.lms.service.QnaService;
import kr.ac.lms.service.RecordApplyService;
import kr.ac.lms.service.RegisterService;
import kr.ac.lms.service.ScheduleService;
import kr.ac.lms.service.StudentLectureService;
import kr.ac.lms.service.TotalGradeService;
import kr.ac.lms.util.ArticlePage;
import kr.ac.lms.vo.AScheduleVO;
import kr.ac.lms.vo.CounselVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.NoticeVO;
import kr.ac.lms.vo.PortletVO;
import kr.ac.lms.vo.QnaVO;
import kr.ac.lms.vo.RecordVO;
import kr.ac.lms.vo.ScheduleVO;
import kr.ac.lms.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/main")
public class mainController {
	
	@Inject
	private RecordApplyService recordAapplyService;
	
	@Inject
	private ApprovalService approvalService;
	
	@Inject
	private AScheduleService ascheduleService;
	
	@Inject
	private CounselService counselService;
	
	@Inject
	private PortletService portletService;
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private TotalGradeService totalGradeService;
	
	@Autowired
	private RegisterService registerService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private StudentLectureService studentLectureService;
	
	@Autowired
	private ProfessorLectureService professorLectureService;
	
	@Autowired
	private LectureApplyService lectureApplyService;

	//???????????????????????? ??????
	@GetMapping("/mainPage")
	public String stuMainPage(HttpServletRequest request, @ModelAttribute RecordVO recordVO,
			@ModelAttribute StudentVO studentVO, Model model) {
		
		HttpSession session = request.getSession();
	      
	      MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
	      int memCd = memberVO.getMemCd();
	      
	      model.addAttribute("memCd", memCd);

		
		List<PortletVO> portletList = this.portletService.portletSelect(memberVO);
		log.info("portletList : " + portletList);
		model.addAttribute("list", portletList);
		
		//?????????????????? ????????????
		List<LecApplyVO> historyList = this.recordAapplyService.history(memberVO);
		if(historyList != null) {
			   model.addAttribute("history", historyList);
		}
		
		//???????????? ????????????
		if(memberVO.getProfessorVO() != null) {//???????????????
			Map<String, String> map = new HashMap<String, String>();
			map.put("subCd", "????????????");
			map.put("lecaNm", "????????????");
			map.put("lecaRoom", "????????????");
			map.put("lecaCon", "????????????");
			model.addAttribute("proApprovalTh", map);
			
			List<LecApplyVO> proApprovalHistory = this.approvalService.portletProApproval(memCd);
			model.addAttribute("proApprovalList", proApprovalHistory);
		
		}else if(memberVO.getManagerVO() != null) {	//???????????? ??????
			Map<String, String> map = new HashMap<String, String>();
			map.put("lecaBook", "????????????");
			map.put("lecaNote", "????????????");
			map.put("lecaDt", "????????????");
			map.put("lecaCon", "????????????");
			model.addAttribute("mgrApprovalTh", map);
			
			List<LecApplyVO> mgrApprovalHistory = this.approvalService.portletMgrApproval();
			model.addAttribute("mgrApprovalList", mgrApprovalHistory);
		}
		
		// ????????? ???????????? ????????????
		if(memberVO.getStudentVO() != null) {
			List<LecApplyVO> currLec = this.studentLectureService.portGetCurrentLec(memCd);
			model.addAttribute("currentLecture", currLec);
		}else if(memberVO.getProfessorVO() != null) {
			List<LecApplyVO> currLecPro = this.studentLectureService.portGetCurrentLecPro(memCd);
			model.addAttribute("currentLecture", currLecPro);
		}
		
		
		//???????????? ????????? ????????????
		List<ScheduleVO> weekCal = this.scheduleService.weekCal(memCd);
		log.info("weekCal : " + weekCal);
		model.addAttribute("weekCal", weekCal);
		
		//???????????? ??????????????? ????????????
		List<ScheduleVO> toDo = this.scheduleService.toDo(memCd);
		log.info("toDo : " + toDo);
		model.addAttribute("toDo" , toDo);
		
		//???????????? ???????????? scheduleContorller?????? ?????? ajax??? ????????????.
		
		//???????????? ????????????
		String aschCate;
		if(memberVO.getStudentVO()!=null) {
			 aschCate = "S101";
		}else if(memberVO.getProfessorVO()!=null) {
			 aschCate = "S102";
		}else {
			 aschCate = "S103";
		}
		
		List<AScheduleVO> aschedule = this.ascheduleService.portAsche(aschCate);
		log.info("aschedule : " + aschedule);
		model.addAttribute("aschedule", aschedule);
		
		//?????? ????????????
		List<CounselVO> stuCounsel = null;
		List<CounselVO> proCounsel = null;
		
		 if(memberVO.getStudentVO()!=null) {
			 stuCounsel = this.counselService.portStuCounsel(memCd);
		}else if(memberVO.getProfessorVO()!=null){
			 proCounsel = this.counselService.portProCounsel(memCd);
		}
		 
		log.info("stuCounsel : " + stuCounsel);
		log.info("proCounsel : " + proCounsel);
		model.addAttribute("stuCounsel", stuCounsel);
		model.addAttribute("proCounsel", proCounsel);
		 
		
		/**
		 * ???????????? ??????
		 */
		List<NoticeVO> ntcList = this.noticeService.portletNtc();
		model.addAttribute("ntcList", ntcList);
		log.info("ntcList : " + ntcList);
		
		//?????? ??????
		List<LecApplyVO> yrList = this.totalGradeService.ptlYrNSem(memCd);
		
		if(yrList.size() != 0) {
			model.addAttribute("yrNSem", yrList);
			
			String yrNsem = yrList.get(0).getLecaYr() + "" + yrList.get(0).getLecaSem();
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memCd", memCd);
			map.put("yrNsem", yrNsem);
			
			List<LecApplyVO> gradeList = this.totalGradeService.ptlList(map);
			Map<String, Object> totalMap = this.totalGradeService.ptlGet(map);
			
			model.addAttribute("gradeList", gradeList);
			model.addAttribute("totalMap", totalMap);
			
			//???????????? ?????? ??????
			List<LecApplyVO> regHistoryList = this.registerService.ptlList(map);
			if(regHistoryList != null) {
				model.addAttribute("regHistoryList", regHistoryList);
			}
		}
		
		//?????? ???????????????
		List<LecApplyVO> proYrList = this.lectureApplyService.ptlProTimeTable(memCd);
		
		if(proYrList.size() != 0) {
			model.addAttribute("yrNSem", proYrList);
		}
		
		return "main/mainPage";
	}
	
	
//	//?????? ?????????????????? ??????
//	@GetMapping("/proMainPage")
//	public String proMainPage(HttpSession session) {
//		return "main/mainPage";
//	}
//	
//	//????????????????????????????????? ??????
//	@GetMapping("/mgrMainPage")
//	public String mgrMainPage(HttpSession session) {
//		
//		return "main/mainPage";
//	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session)
	{
		session.invalidate();
		log.info("logout-success");
		return "redirect:/login/loginForm";
	}
	
	@ResponseBody
	@PostMapping("/portletSavePost")
	public String portletSavePost(@RequestBody List<Map<String, Object>> param, Map<String, Object> map, Model model) {
		String resultmsg = "";
		
		log.info("param : " + param);
		//????????? ?????? ??????
		for(int i=0; i< param.size(); i++) {
			log.info("param >> " + param.get(i));
			
			map.put("poX", param.get(i).get("x"));
			map.put("poY", param.get(i).get("y"));
			map.put("poW", param.get(i).get("w"));
			map.put("poH", param.get(i).get("h"));
			map.put("memCd", param.get(i).get("memCd"));
			map.put("poCate", param.get(i).get("id"));
			
			log.info("sql?????? ????????? param : " + map);
		
			
			int cnt = this.portletService.updateSave(map);
			log.info("portlet save cnt : " + cnt);
		}
		
		
		return resultmsg;
	}
	
	@ResponseBody
	@PostMapping("/updateDelete")
	public int updateDelete(@RequestBody Map<String, Object> map, PortletVO portletVO) {
		log.info("updateDelete??? ??????!");
		int cnt = this.portletService.updateDeleteYn(map);
		
		return cnt;
	}
	
	@GetMapping("/popupPortlet/{memCd}")
	public String popupPortlet(@PathVariable("memCd") int memCd,
								@ModelAttribute StudentVO studentVO, @ModelAttribute MemberVO memberVO,
								Model model) {
		
		List<PortletVO> portletNotSelect = this.portletService.portletNotSelect(memCd);
		log.info("portletNotSelect : " + portletNotSelect);
		model.addAttribute("portletData", portletNotSelect);
		model.addAttribute("memCd", memCd);
		memberVO.setMemCd(memCd);
		
		//????????? ??????) ????????? ????????????
		List<PortletVO> portletList = this.portletService.settingPortletSelect(memCd);
		log.info("??????????????? portletList : " + portletList);
		model.addAttribute("list", portletList);
		
		return "main/popupPortlet";
	}
	
	@ResponseBody
	@PostMapping("/deletePortlet")
	public Map<String, Object> deletePortlet(@RequestBody Map<String, Object> map) {
		log.info("deletePortlet map : " + map);
		
		Map<String, Object> maps = this.portletService.deletePortlet((String) map.get("poCate"));
		
		log.info("deletePortlet maps : " + maps);
		
		return maps;
	}
	
	//????????? ??????) ??????
	@ResponseBody
	@PostMapping("/savePortlet")
	public int savePortlet(@RequestBody List<Map<String, Object>> param, Map<String, Object> map) {
		log.info("savePortlet map : " + param);
		int cnt = 0;
		//????????? ?????? ??????
		for(int i=0; i< param.size(); i++) {
			log.info("param >> " + param.get(i));
			
			map.put("poX", param.get(i).get("x"));
			map.put("poY", param.get(i).get("y"));
			map.put("poW", param.get(i).get("w"));
			map.put("poH", param.get(i).get("h"));
			map.put("memCd", param.get(i).get("memCd"));
			map.put("poCate", param.get(i).get("id"));
			
			log.info("sql?????? ????????? param : " + map);
		
			cnt = this.portletService.settingSave(map);
			log.info("portlet save cnt : " + cnt);
		}
		
		return cnt;
	}
	
	//????????? ??????) ?????????????????? ?????? ?????? yn = 0?????? ??????
	@ResponseBody
	@PostMapping("/portletListYn")
	public int portletListYn(@RequestBody Map<String, Object> map) {
		log.info("portletListYn map : " + map);
		log.info(map.get("arr") + "");
		
		List<String> list = (List<String>)map.get("arr");
		int cnt = 0;
		
		//maps : sql ???????????????
		Map<String, Object> maps = new HashMap<String, Object>();
		
		for(int i=0; i< list.size(); i++) {
			log.info("arr >> " + list.get(i));
			
			maps.put("poCate", list.get(i));
			maps.put("memCd", map.get("memCd"));
			
			cnt = this.portletService.settingPtlList(maps);
		}
		
		return cnt;
	}
	
	/**
	 * ???????????? ????????? ?????? ?????????
	 * @return ???????????? ????????? view ??????
	 */
	@GetMapping("/ui")
	public String ui() {
		log.info("ui");
		return "info/UI";
	}
	
	@Autowired
	QnaService qnaService;
	
	
	@GetMapping("qna")
	public String list(Model model, @RequestParam Map<String, String> map) {
		
		log.info("map >> " + map);
		

		// ??? ????????? ???????????? ?????? ???(?????? 20???)
		int page = 10;
		map.put("show", "10");
		if(map.size() == 0) {
			map.put("cond", "");
			map.put("keyword", "");
			map.put("currentPage", "1");
		}
		
		
		String currentPage = map.get("currentPage");
		
		// ?????? ???????????? null????????? 1??? ??????
		if(currentPage == null) {
			currentPage = "1";
			map.put("currentPage", "1");
		}
		
		List<QnaVO> list = qnaService.list(map);
		int total = this.qnaService.getTotal(map);
		log.info("total : " + total);
		
		log.info("list >> " + list);
		
		model.addAttribute("list", new ArticlePage<QnaVO>(total, Integer.parseInt(currentPage), page, list));
		model.addAttribute("map", map);
		
		return "qna/qnaBoard";
	}
	
	@GetMapping("/register")
	public String register() {
		return "info/register";
	}
	
	

}
