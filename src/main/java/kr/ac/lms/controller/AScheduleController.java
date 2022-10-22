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
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import kr.ac.lms.service.AScheduleService;
import kr.ac.lms.vo.AScheduleVO;
import kr.ac.lms.vo.MemberVO;

@Controller
@RequestMapping("/aschedule")
public class AScheduleController {
	
	int result = 0;

	@Autowired
	private AScheduleService ascheduleService;
	
	@GetMapping("/calendar")
	public String calendar() {
		return "aschedule/calendar";
	}
	
	@ResponseBody
	@PostMapping("/findMax")
	public int findMax() {
		int max = ascheduleService.findMax();
		return max;
	}
	
	@ResponseBody
	@PostMapping("/calendarList")
	public List<Map<String,Object>> allSchedule(){
		
		HashMap<String,Object> hm = new HashMap<String,Object>();
		
		JSONObject jo;
		JSONArray ja = new JSONArray();
		String aschCate;
		List<AScheduleVO> allSchedule = ascheduleService.allSchedule();
		
		for(AScheduleVO vo : allSchedule) {
			hm.put("title", vo.getAschCon());
			hm.put("start", vo.getAschSt());
			hm.put("end",vo.getAschEn());
			hm.put("id",vo.getAschCd());
			aschCate = vo.getAschCate();
			if(aschCate.equals("S101")){
				hm.put("color","#ffe0b2");
  			}else if(aschCate.equals("S102")){
  				hm.put("color","#b2dfdb");
  			}else if(aschCate.equals("S103")){
  				hm.put("color","#d1c4e9");
  			}else{
  				hm.put("color","#ffcdd2");
  			}
			hm.put("allDay","allDay");
			jo = new JSONObject(hm);
			ja.add(jo);
		}
		
		return ja;
	        
		
	}
	
		//등록하기
		@PostMapping("/update")
		@ResponseBody
		public String insert(@RequestBody Map<String, Object> param,HttpServletRequest request) {

			HttpSession session = request.getSession();
			MemberVO memVO = (MemberVO) session.getAttribute("memSession");
			int memCd = memVO.getMemCd();
			AScheduleVO vo = new AScheduleVO();
			vo.setAschMem(memCd);
			
			
			String aschCon = (String) param.get("aschCon");
			String aschCate = (String) param.get("aschCate");
			
			String aschSt = (String) param.get("aschSt");
			String aschEn = (String) param.get("aschEn");

			vo.setAschCate(aschCate);
			vo.setAschCon(aschCon);
			vo.setAschSt(aschSt);
			vo.setAschEn(aschEn);
			
			result = ascheduleService.insert(vo);
			
			
			if (result > 0) {
				return "aschedule/calendar";
			} else {
				return "aschedule/update";
			}

		}
		
		
		//삭제하기
		@DeleteMapping("/update")
		@ResponseBody
		public String delete(@RequestBody Map<String, Integer> param){
			
			int aschCd = param.get("aschCd");
			System.out.println("숫자"+aschCd);
			
			AScheduleVO vo = new AScheduleVO();
			vo.setAschCd(aschCd);
			
			result = ascheduleService.delete(vo);
			System.out.println(result);
			
			return "aschedule/calendar";
		
		}
		
		//수정하기
		@PatchMapping("/update")
		@ResponseBody
		public String modify(@RequestBody Map<String,String> param) {
			
			AScheduleVO vo = new AScheduleVO();
			
			String id = param.get("id");
			int aschCd = Integer.parseInt(id);
			String aschSt = (String) param.get("start");
			String aschEn = (String) param.get("end");
			
			vo.setAschCd(aschCd);
			vo.setAschSt(aschSt);
			vo.setAschEn(aschEn);
			
			result = ascheduleService.modify(vo);
			
			return "aschedule/calendar";
		}
	
	
}
