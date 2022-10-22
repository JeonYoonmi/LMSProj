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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.NotificationService;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.NotificationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/notification")
@Controller
public class NotificationController {

	@Autowired
	private NotificationService notificationService;
	
	@ResponseBody
	@GetMapping("/getNotification")
	public List<NotificationVO> getNotification(HttpServletRequest request, Model model) {
//		log.info("== getNotification ==");

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");

		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20182696;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		List<NotificationVO> notificationVOList = this.notificationService.getNotification(memCd);
//		log.info("notificationVOList >> " + notificationVOList);
		
		model.addAttribute("notificationVOList", notificationVOList);
		
		return notificationVOList;
	}
	
	@ResponseBody
	@PostMapping("/updateNtfYn")
	public int updateNtfYn(@RequestBody Map<String, Integer> map) {
		log.info("== updateNtfYn ==");
		
		int ntfCd = map.get("ntfCd");
		
		int result = this.notificationService.updateNtfYn(ntfCd);
		
		return result;
	}
}
