package kr.ac.lms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.CourseHandbookService;
import kr.ac.lms.vo.LecApplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/course")
@Controller
public class CourseHandbookController {
	
	@Autowired
	CourseHandbookService courseHandbookService;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		List<Integer> yearList = this.courseHandbookService.getYr();
		Map<String, Integer> preYearMap = this.courseHandbookService.getPreYr();
		Map<String, Integer> thisYearMap = this.courseHandbookService.getThisYr();
		
		model.addAttribute("yearList", yearList);
		model.addAttribute("preYearMap", preYearMap);
		model.addAttribute("thisYearMap", thisYearMap);
		
		return "course/list";
	}
	
	@ResponseBody
	@PostMapping("/getList")
	public List<LecApplyVO> getList(@RequestBody Map<String, Object> map) {
		
		List<LecApplyVO> list = this.courseHandbookService.list(map);
		
		return list;
	}
	
	@ResponseBody
	@GetMapping("/department")
	public List<String> department() {
		
		List<String> list = this.courseHandbookService.department();
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("/getListAgain")
	public List<LecApplyVO> getListAgain(@RequestBody Map<String, Object> map) {
		
		List<LecApplyVO> list = this.courseHandbookService.list(map);
		
		return list;
	}
	
	@GetMapping("/preList")
	public String getList(Model model) {
		
		Map<String, Integer> thisYearMap = this.courseHandbookService.getThisYr();
		model.addAttribute("thisYearMap", thisYearMap);
		
		return "course/preList";
	}
}
