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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.NotificationService;
import kr.ac.lms.service.QnaService;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.QnaVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/qna")
public class qnaController {
	
	@Autowired
	QnaService qnaService;
	@Autowired
	NotificationService notificationService;
	
	
	@GetMapping("/qnaWrite")
	public String qnaWrite() {
		return "qna/qnaWrite";
	}
	
	@ResponseBody
	@PostMapping("/qnaWriteAction")
	public int qnaWriteAction(String title, String content, int isShow ,HttpServletRequest request ) {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
		
		log.info("isShow : " + isShow);
		log.info("memCd : " + memCd);
		log.info("title : " + title);
		log.info("content : " + content);
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("memCd",memCd);
		map.put("qnaTtl",title);
		map.put("qnaCon", content);
		map.put("qnaYn",isShow);
		
		int res = qnaService.insertQ(map);
		
		return res;
	}
	
	
	@RequestMapping("/qnaDetail")
	public String qnaDetail(
			Model model, QnaVO qnaVO
			){
		log.info("qnaCd : " + qnaVO.getQnaCd());
		log.info("memCd:" + qnaVO.getMemCd());
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
		map.put("qnaCd", qnaVO.getQnaCd());
		map.put("memCd", qnaVO.getMemCd());
		
		//QnaVO qnaVO_ = new QnaVO();
		qnaVO = this.qnaService.detail(map);
		
		model.addAttribute("qnaVO", qnaVO);
		
		log.info("qnaVO : " + qnaVO);
		
		return "qna/qnaDetail";
		
	}
	
	
	
	@ResponseBody
	@PostMapping("/qnarWrite")
	public int qnarWrite(String reply, int qnaCd, int memCd) {
		
		log.info("reply : " + reply);
		log.info("qnaCd : " + qnaCd);
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("qnaCd", qnaCd);
		map.put("qnarCon", reply);
		
		int res = qnaService.qnarWrite(map);
		
		
		
		List<Integer> memList = new ArrayList<Integer>();
		memList.add(memCd);
		
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		noticeMap.put("ntfCon", " 문의 답변이 도착했습니다.");
		noticeMap.put("memList", memList);
		noticeMap.put("ntfUrl", "/qna/qnaDetail?qnaCd=" + qnaCd + "&memCd=" + memCd);
		log.info("noticeMap : " + noticeMap);
		this.notificationService.insertNtf(noticeMap);
		
		return res;
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session)
	{
		session.invalidate();
		log.info("logout-success");
		return "redirect:/login/loginForm";
	}
	
	@PostMapping("/replyUpdate")
	@ResponseBody
	public int replyUpdate(int qnaCd, String qnarCon) {
		
		HashMap<String, Object> map = new HashMap<String,Object>();
		
		map.put("qnaCd", qnaCd);
		map.put("qnarCon", qnarCon);
		
		log.info("qnaCd : " + qnaCd);
		log.info("qnarCon : " + qnarCon);
		
		int res = qnaService.updateRepl(map);
		
		return res;
	}
	
	
	@PostMapping("/qnaUpdate")
	@ResponseBody
	public int qnaUpdate(int qnaCd,String title, String content) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("qnaCd", qnaCd);
		map.put("qnaTtl",title);
		map.put("qnaCon", content);
		int res = qnaService.updateQ(map);
		
		return res;
	}
	
	@PostMapping("/qnaDelete")
	@ResponseBody
	public int qnaDelete(int qnaCd) {
		int res = qnaService.deleteQ(qnaCd);
		return res;
	}
	

}
