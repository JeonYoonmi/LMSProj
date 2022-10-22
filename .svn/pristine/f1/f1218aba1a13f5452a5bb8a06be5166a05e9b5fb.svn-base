package kr.ac.lms.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.mapper.ReservationMapper;
import kr.ac.lms.service.ReservationService;
import kr.ac.lms.vo.FacilityVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.ReservationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/facility")
public class ReservationController {
	
	int result = 0;
	int facility = 0;

	@Autowired
	private ReservationService reservationService;

	//페이지 이동
	@GetMapping("/calendar")
	public String calendar(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memVO.getMemCd();
		String memNm = memVO.getMemNm();
		
		List<FacilityVO> facility = reservationService.facility();
		model.addAttribute("facility",facility);
		
		model.addAttribute("code",memCd);
		model.addAttribute("name",memNm);
		return "facility/calendar";
	}
	
	
	//과거예약 조회 ajax
	@ResponseBody
	@PostMapping("/historyAjax")
	public List<HashMap<String,Object>> historyAjax(@RequestParam("facCd")int facCd, HttpServletRequest request){
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memVO.getMemCd();
		
		ReservationVO vo = new ReservationVO();
		vo.setMemCd(memCd);
		vo.setFacCd(facCd);
		
		List<HashMap<String,Object>> hashmap = reservationService.history(vo);
		return hashmap;
	}
	
	//일정가져오기
	@ResponseBody
	@PostMapping("/allcalendar")
	public List<Map<String, Object>> list(@RequestParam("facCd")String facCd, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO memVO = (MemberVO) session.getAttribute("memSession");
		int memCd = memVO.getMemCd();
		
		HashMap<String, Object> hm = new HashMap<String, Object>();

		JSONObject jo;
		JSONArray ja = new JSONArray();

		List<ReservationVO> list = this.reservationService.list(facCd);

		for (ReservationVO vo : list) {
			
			hm.put("id", vo.getMemCd());
			hm.put("title", "["+vo.getMemCd()+"] "+ vo.getMemNm());
			hm.put("start", vo.getRsvSt());
			hm.put("end", vo.getRsvEn());
			if(vo.getMemCd()==memCd) {
				hm.put("color","#001353");
			}else{
				hm.put("color","#BABABA");
			}

			jo = new JSONObject(hm);
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
		System.out.println("멤버코드" + memCd);
		
		int facCd = Integer.parseInt(param.get("facCd"));
		System.out.println("시설코드" + facCd);
		String rsvSt = (String) param.get("start");
		String rsvEn = (String) param.get("end");
		
		ReservationVO vo = new ReservationVO();
		vo.setFacCd(facCd);
		vo.setRsvSt(rsvSt);
		vo.setRsvEn(rsvEn);
		vo.setMemCd(memCd);
		
		result = reservationService.insert(vo);
		System.out.println(result + "결과");
		
		log.info("voooooooooo" + vo);
			
		return result;

	}

	//삭제하기
	@DeleteMapping("/update")
	@ResponseBody
	public int delete(@RequestBody Map<String, String> param) {
		int memCd = Integer.parseInt(param.get("memCd"));
		String rsvSt = param.get("rsvSt");
		ReservationVO vo = new ReservationVO();
		vo.setMemCd(memCd);
		vo.setRsvSt(rsvSt);
		result =reservationService.delete(vo);

		return result;
	}

	//수정하기
	@PatchMapping("/update")
	@ResponseBody
	public int modify(@RequestBody Map<String, String> param) {

			String newSt=  param.get("newSt"); // 시작 시간
			String newEn =  param.get("newEn"); // 끝나는 시간
			String oldSt = param.get("oldSt");
			String memCd = param.get("memCd");
			
			HashMap<String, Object> hm = new HashMap<String,Object>();
			hm.put("newSt", newSt);
			hm.put("newEn", newEn);
			hm.put("oldSt", oldSt);
			hm.put("memCd", memCd);
			
			result = reservationService.modify(hm);
		
			return result;
	
	}

	
}
