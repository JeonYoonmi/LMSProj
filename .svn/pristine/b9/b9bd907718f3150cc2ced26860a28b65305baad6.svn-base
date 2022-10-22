package kr.ac.lms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.ScheduleService;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.ScheduleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	
	int result = 0;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/calendar")
	public String calendar() {
		return "schedule/calendar";
	}
	
	//가장 큰 번호 찾기
	@ResponseBody
	@PostMapping("/findSeq")
	public int findSeq() {
		int seq = scheduleService.findSeq();
		return seq;
	}
	
	//일정리스트 불러오기
	@ResponseBody
	@PostMapping("/calendarList")
	public List<HashMap<String,Object>> allSchedule(HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memVO.getMemCd();
		
		JSONObject jo;
		JSONArray ja = new JSONArray();
		
		List<ScheduleVO> list= scheduleService.allSchedule(memCd);
		HashMap<String,Object> map = new HashMap<String, Object>();
		for(ScheduleVO vo: list) {
			map.put("title", vo.getSchTtl());
			map.put("start", vo.getSchSt());
			map.put("end", vo.getSchEn());
			map.put("id", vo.getSchCd());
			map.put("color", vo.getSchColor());
//			map.put("allDay","false");
			jo = new JSONObject(map);
			ja.add(jo);
		}
		
		return ja;
	}
	
	//등록하기
	@PostMapping("/update")
	@ResponseBody
	public int insert(@RequestBody Map<String, String> param,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memVO.getMemCd();
		ScheduleVO vo = new ScheduleVO();
		vo.setMemCd(memCd);
		String schTtl = param.get("schTtl");
		String schColor = param.get("schColor");
		String schSt = param.get("schSt");
		String schEn = param.get("schEn");
		String schCon = param.get("schCon");
		
		vo.setSchColor(schColor);
		vo.setSchSt(schSt);
		vo.setSchEn(schEn);
		vo.setSchTtl(schTtl);
		vo.setSchCon(schCon);
		
		result = scheduleService.insert(vo);
		
		return result;
	}
	
	//삭제하기
	@DeleteMapping("/update")
	@ResponseBody
	public String delete(@RequestBody Map<String, Integer> param) {
		int schCd = param.get("schCd");
		result = scheduleService.delete(schCd);
		return "성공";
	}
	
	//내용,시간 불러오기
	@ResponseBody
	@PostMapping(value="/findCon")
	public ScheduleVO findCon(@RequestBody Map<String, Integer> param) {
		int schCd = param.get("schCd");
		ScheduleVO vo= scheduleService.findCon(schCd);
		return vo;
	}
	
	//제목,내용,시간,색 수정
	@ResponseBody
	@PostMapping("/updateCon")
	public int updateCon(@RequestBody ScheduleVO vo) {
		log.info("vo" + vo.getSchSt());
		log.info("vo" + vo.getSchEn());
		int res = scheduleService.updateCon(vo);
		return res;
	}
	
//	@GetMapping("/proHistory")
//	public String proHistory() {
//		return "schedule/proHistory";
//	}
	
	//메인페이지에 불러올 포틀릿용 캘린더
	@ResponseBody
	@PostMapping("/portCalendar")
	public List<ScheduleVO> miniCal(HttpServletRequest request){

		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memVO.getMemCd();
		List<ScheduleVO> list = scheduleService.miniCal(memCd);
		log.info("memCd" + memCd);
		log.info("list"+list);
		return list;
	}
	
	//메인페이지 투두리스트 체크 업데이트용
	@ResponseBody
	@PostMapping("/todoCheck")
	public int todoCheck(@RequestBody Map<String, Integer>map ){
		log.info("checkvo" +map);
		ScheduleVO vo = new ScheduleVO();
		vo.setSchCd(map.get("schCd"));
		vo.setSchYn(map.get("schYn"));
		int result = 0;
		result = scheduleService.todoCheck(vo);
		return result;
	}
	
	
}
