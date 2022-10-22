package kr.ac.lms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/error")
@Controller
public class ErroController {
		
	@RequestMapping(value = "/error400", method = { RequestMethod.GET, RequestMethod.POST })
	public String error400(Model model) {
		
		return "error400";
	}
	
	@RequestMapping(value = "/error404", method = { RequestMethod.GET, RequestMethod.POST })
	public String error404(Model model) {
		
		return "error404";
	}
	
	@RequestMapping(value = "/error500", method = { RequestMethod.GET, RequestMethod.POST })
	public String error500(Model model) {
		
		return "error500";
	}
}
