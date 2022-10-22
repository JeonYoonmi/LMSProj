package kr.ac.lms.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.NoticeService;
import kr.ac.lms.util.ArticlePage;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.NoticeVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@RequestMapping("/notice")
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 공지사항 목록 출력
	 * @param model
	 * @return
	 */
	@GetMapping("/ntcList")
	public String ntcList(Model model, @RequestParam Map<String, String> map) {
		log.info("== ntcList ==");
		
		log.info("map >> " + map);
		
		List<NoticeVO> ntcHotList = this.noticeService.ntcHotList();
		
		// 한 화면에 보여지는 행의 수(기본 20행)
		int page = 20;
		map.put("show", "20");
		if(map.size() == 0) {
			map.put("ntcCate", "");
			map.put("cond", "");
			map.put("keyword", "");
			map.put("currentPage", "1");
		}
		
		log.info("map >> " + map);
		
		String currentPage = map.get("currentPage");
		
		// 현제 페이지가 null이라면 1로 세팅
		if(currentPage == null) {
			currentPage = "1";
			map.put("currentPage", "1");
		}
		
		
		List<NoticeVO> ntcList = this.noticeService.ntcList(map);
		log.info("ntcList >> " + ntcList);
		log.info("ntcList size >> " + ntcList.size());
		
		int total = this.noticeService.getTotal(map);
		
		// select 결과 list를 페이징 객체에 테워서 보냄
		// (전체 글 수 , 현재페이지, 한 화면에 보여질 행 수, select결과 list)
		model.addAttribute("ntcList", new ArticlePage<NoticeVO>(total, Integer.parseInt(currentPage), page, ntcList));
//		model.addAttribute("ntcList", ntcList);
		model.addAttribute("ntcHotList", ntcHotList);
		model.addAttribute("map", map);
		
		return "notice/ntcList";
	}
	
	/**
	 * 공지사항 상세 정보 출력
	 * @param ntcCd
	 * @return
	 */
	@GetMapping("/ntcDetail")
	public String ntcDetail(int ntcCd, Model model) {
		log.info("== ntcDetail ==");
		
		NoticeVO noticeVO = this.noticeService.ntcDetail(ntcCd);
		log.info("noticeVO >> " + noticeVO);
		
		model.addAttribute("noticeVO", noticeVO);
		
		return "notice/ntcDetail";
	}
	
	/**
	 * 공지사항 등록하기
	 * @return
	 */
	@GetMapping("/ntcWirte")
	public String ntcWirte(@RequestParam(value = "ntcCd", required = false, defaultValue = "0") int ntcCd, Model model) {
		log.info("== ntcWirte ==");
		
		if(ntcCd != 0) {
			NoticeVO noticeVO = this.noticeService.ntcDetail(ntcCd);
			log.info("noticeVO >> " + noticeVO);
			model.addAttribute("noticeVO", noticeVO);
		}
		
		return "notice/ntcWrite";
	}
	
	/**
	 * 공지사항 등록
	 * @param noticeVO
	 * @param request
	 * @return
	 */
	@PostMapping("/ntcWriteInsert")
	public String ntcWriteInsert(NoticeVO noticeVO, HttpServletRequest request) {
		log.info("== ntcWriteInsert ==");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSessiom");
		
		if(memberVO == null) {
			noticeVO.setMgrCd(202203);
		}else {
			noticeVO.setMgrCd(memberVO.getMemCd());
		}
		
		log.info("noticeVO >> " + noticeVO);
		
		int result = this.noticeService.ntcWrite(noticeVO);
		log.info("result >> " + result);
		
		return "redirect:/notice/ntcList";
	}
	
	/**
	 * 공지사항 수정
	 * @param noticeVO
	 * @param request
	 * @return
	 */
	@PostMapping("/updateNtc")
	public String updateNtc(NoticeVO noticeVO, HttpServletRequest request) {
		log.info("== updateNtc ==");
		log.info("noticeVO >> " + noticeVO);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		if(memberVO == null) {
			noticeVO.setMgrCd(202203);
		}else {
			noticeVO.setMgrCd(memberVO.getMemCd());
		}
		
		int result = this.noticeService.updateNtc(noticeVO);
		log.info("result >> " + result);
		
		return "redirect:/notice/ntcDetail?ntcCd=" + noticeVO.getNtcCd();
	}
	
	/**
	 * 공지사항 삭제
	 * @param ntcCd
	 * @return
	 */
	@GetMapping("/deleteNtc")
	public String deleteNct(@RequestParam int ntcCd) {
		log.info("== deleteNct ==");
		
		int result = this.noticeService.deleteNtc(ntcCd);
		log.info("result >> " + result);
		
		return "redirect:/notice/ntcList";
	}
	
	@ResponseBody
	@RequestMapping("/mainNtcList")
	public List<NoticeVO> mainNtcList(String cate){
		log.info("== mainNtcList ==");
		log.info("cate >> " + cate);
		
		List<NoticeVO> ntcList = this.noticeService.mainNtcList(cate);
		log.info("ntcList >> " + ntcList);
		
		return ntcList;
	}
}
