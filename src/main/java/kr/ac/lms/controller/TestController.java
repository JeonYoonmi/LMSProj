package kr.ac.lms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.lms.service.UsertestService;
import kr.ac.lms.vo.UsertestVO;

@RequestMapping("/usertest")
@Controller
public class TestController {
	
	@Autowired
	private UsertestService usertestService;	
	
	@GetMapping("/test")
	public String getUser(Model model){
		
		List<UsertestVO> list = this.usertestService.getUser();
		model.addAttribute("list", list);
		
		return "test/test";
	}
	
	
	
}
