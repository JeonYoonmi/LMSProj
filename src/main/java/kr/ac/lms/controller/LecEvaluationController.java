package kr.ac.lms.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.lms.service.LecEvaluationService;
import kr.ac.lms.service.NotificationService;
import kr.ac.lms.service.RecordApplyService;
import kr.ac.lms.vo.EvaluationQVO;
import kr.ac.lms.vo.EvaluationVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/lecEval")
public class LecEvaluationController {
	
	@Inject
	LecEvaluationService lecEvaluationService;
	@Inject
	RecordApplyService recordAapplyService;
	@Autowired
	private NotificationService notificationService;
	
	@GetMapping("/getStuLecEval")
	public String getStuLecEval(HttpServletRequest request, Model model) {
		log.info("lecEval start에 왔다!");
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		
		//신상정보 불러오기
		List<MemberVO> stuInfoList = this.recordAapplyService.stuInfoList(memberVO);
		log.info("stuInfoList : " + stuInfoList);
		model.addAttribute("data", stuInfoList);
		

		//강의 평가 항목 불러오기
		List<EvaluationQVO> evalQList = this.lecEvaluationService.selectEvalItem();
		log.info("evalQList : " + evalQList);
		model.addAttribute("list", evalQList);
		
		return "evaluation/stuEval";
	}
	
	//학생 강의평가 중 현재학기 강의 조회 (toast ui grid)
	@ResponseBody
	@PostMapping("/lecListPost")
	public List<LecApplyVO> lecListPost(@RequestBody Map<String, Object>  map) {
		
		log.info("lecListPost map : " + map);
		
		//학생 강의평가 중 현재학기 강의 조회
		List<LecApplyVO> stuLecList = this.lecEvaluationService.stuLecList(Integer.parseInt((String) map.get("memCd")) );
		log.info("stuLecList : " + stuLecList);
		
		return stuLecList;
	}
	
	//학생 강의평가중 저장시키기
	@ResponseBody
	@PostMapping("/stuEvalSave")
	public int stuEvalSave(@RequestBody Map<String, Object> map) {
		log.info("stuEvalSave map : " + map);
		
		int cnt = this.lecEvaluationService.insertStuEval(map);
		
		return cnt;
	}
	
	//교수 강의평가로 가기
	@GetMapping("/getProLecEval")
	public String getProLecEval(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int proCd = memberVO.getMemCd();
		//교수 학번 model로 보내기
		model.addAttribute("proCd", proCd);
		
		return "evaluation/proEval";
	}

	//교수 강의평가 강의 리스트
	@ResponseBody
	@PostMapping("/postProLecList")
	public List<LecApplyVO> postProLecList(@RequestBody Map<String, Object> map, Model model){
		log.info("postProLecList map : " + map);
		List<LecApplyVO> proLecList = this.lecEvaluationService.selectProLec(map);
		
		model.addAttribute("proLecList", proLecList);
		
		return proLecList;
	}
	
	//교수 강의평가 상세정보
	@ResponseBody
	@PostMapping("/proLecEvalDetail")
	public Map<String, Object> proLecEvalDetail(@RequestBody Map<String, Object> map) {
		
		Map<String, Object> maps = new HashMap<String, Object>();
		maps = this.lecEvaluationService.proLecListDetail((Integer) map.get("lecCd"));
		
		return maps;
	}
	
	@ResponseBody
	@PostMapping("/selectEctList")
	public List<EvaluationVO> selectEctList(@RequestBody Map<String, Object> map, Model model) {
		
		log.info("selectEctList map : " + map);
		
		List<EvaluationVO> list = this.lecEvaluationService.selectEctList((Integer) map.get("lecCd"));
		model.addAttribute("etcList", list);
		
		return list;
	}
	
	@GetMapping("/mgrLecEvalGet")
	public String mgrLecEvalGet() {
		return "evaluation/mgrEval";
	}
	
	@ResponseBody
	@PostMapping("/selectAllLec")
	public List<LecApplyVO> selectAllLec(@RequestBody Map<String, Object> map){
		List<LecApplyVO> list = this.lecEvaluationService.selectAllLec(map);
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("/notFinishStucd")
	public int notFinishStucd(@RequestBody Map<String, Object> map){
		
		List<EvaluationVO> list = this.lecEvaluationService.noEvalStucd((Integer) map.get("lecCd"));
		log.info("notFinishStucd >> " + list);

		//알림 넣는 부분
		List<Integer> memList = new ArrayList<Integer>();
//		memList.add(proCd);
		for(int i=0; i<list.size(); i++) {
			memList.add(i, list.get(i).getStuCd());
		}
		
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		noticeMap.put("ntfCon", "완료되지 않은 강의평가가 있습니다.");
		noticeMap.put("memList", memList);
		noticeMap.put("ntfUrl", "/lecEval/getStuLecEval");
		
		int cnt = this.notificationService.insertNtf(noticeMap);
		
		
		return cnt;
	}
}
