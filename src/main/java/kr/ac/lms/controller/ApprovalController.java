package kr.ac.lms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonFormat;

import kr.ac.lms.mapper.ApprovalMapper;
import kr.ac.lms.service.ApprovalService;
import kr.ac.lms.service.NotificationService;
import kr.ac.lms.service.ProfessorLectureService;
import kr.ac.lms.vo.ApprovalVO;
import kr.ac.lms.vo.BuildingVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.LectureVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.RoomVO;
import kr.ac.lms.vo.WeekplanVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/approval")
public class ApprovalController {
	
	@Inject
	private ApprovalService apprivalService;
	@Autowired
	private NotificationService notificationService;
	
	@GetMapping("/list")
	public String list(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
		
		model.addAttribute("memCd", memCd);
		return "approval/proApprovalList";
	}
	
	@ResponseBody
	@GetMapping("/proApprovalList")
	public List<LecApplyVO> proApprovalList(Model model,  HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
//		log.info("proApprovalList에 왔다!");
		
		List<LecApplyVO> proApprovalList = this.apprivalService.proApprovalList(memCd);
//		log.info("proApprovalList : " + proApprovalList);
		
		model.addAttribute("data", proApprovalList);
		
		return proApprovalList;
	}
	
	@ResponseBody
	@PostMapping("/searchList")
	public List<LecApplyVO> searchList(@RequestBody Map<String, Object> map){
//		log.info("searchList Map : " + map);
		
		List<LecApplyVO> list = this.apprivalService.proApprovalSearchList(map);

		
		return list;
	}
	
	
	@ResponseBody
	@PostMapping("/lecApplyPdf")
	public LecApplyVO lecApplyPdf(@RequestBody Map<String, Object> map, Model model) {
//		log.info("강의계획서 pdf에 왔따!");
		
//		log.info("lecaCd : " + map);
		
		LecApplyVO lecApproVO = this.apprivalService.proApprovalPdf(map);
//		log.info("lecApproVO : " + lecApproVO);
		
		model.addAttribute("data", lecApproVO);
		
		return lecApproVO;
		
	}
	
	@GetMapping("/lecApproPdfGet/{lecaCd}")
	public String lecApproPdfGet(@PathVariable("lecaCd") int lecaCd, Model model,
			HttpServletRequest request) {

		HttpSession session = request.getSession();

		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");

		Map<String, Object> lecApply = new HashMap<String, Object>();

		lecApply.put("lecaCd", lecaCd);

		LecApplyVO lec = this.apprivalService.getLecApply(lecApply);
		log.info("lec : " + lec);

		List<WeekplanVO> wee = this.apprivalService.getWeekPlan(lecaCd);
		log.info("wee : " + wee);

		model.addAttribute("data", lec);
		model.addAttribute("week", wee);
		
		
		Map<String, Object> map = this.apprivalService.applyInfo(lecaCd);
		model.addAttribute("map", map);


		return "approval/proApprovalPdf";
	}
	
	//반려내역 가져오기
	@ResponseBody
	@PostMapping("/returnHistory")
	public List<LecApplyVO> returnHistory(HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
		
		List<LecApplyVO> list = this.apprivalService.returnHistory(memCd);
		log.info("반려내역 list : " + list);
		log.info("반려내역 list size() : " + list.size());
		
		
		log.info("returnHistory에 왔다!");
		
		return list;
	}
	
	//학사관리자 결재 Get
	@GetMapping("/managerApprovalListGet")
	public String managerApprovalListGet(){
		
		return "approval/managerApprovalList";
	}
	
	//학사관리자 전체 결재목록 조회
	@ResponseBody
	@GetMapping("/mgrApprovalList")
	public List<LecApplyVO> mgrApprovalList(){
		Map<String, String> map = new HashMap<String, String>();
		
		List<LecApplyVO> approvalList = this.apprivalService.managerApprovalList(map);
		List<LecApplyVO> approvalList2 = this.apprivalService.managerApprovalListS(map);
		
		List<LecApplyVO> joined = new ArrayList<LecApplyVO>();
		joined.addAll(approvalList);
		joined.addAll(approvalList2);
		
		return joined;
		
	}
	
	//날짜 계산
	@ResponseBody
	@PostMapping("/dateCal")
	public Map<String, Object> dateCal(@RequestBody Map<String, Object> map){
		
		Map<String, Object> maps = this.apprivalService.dateCal();
		log.info("날짜계산 : " + maps);
		
		return maps;
	}
	
	//처음 날짜 계산
	@ResponseBody
	@PostMapping("/dateCalFirst")
	public Map<String, Object> dateCalFirst(){
		Map<String, Object> map = this.apprivalService.dateCal();
		
		return map;
	}
	
	@ResponseBody
	@PostMapping("/mgrApprovalListAgain")
	public List<LecApplyVO> mgrApprovalListAgain(@RequestBody Map<String, String> map){
		log.info("mgrApprovalListAgain Map : " + map);
		
		List<LecApplyVO> approvalList = this.apprivalService.managerApprovalList(map);
		List<LecApplyVO> approvalList2 = this.apprivalService.managerApprovalListS(map);
		
		List<LecApplyVO> joined = new ArrayList<LecApplyVO>();
		joined.addAll(approvalList);
		joined.addAll(approvalList2);
		
		return joined;
	}
	
	@GetMapping("/mgrlecApproval")
	public String mgrlecApproval() {
		log.info("mgrlecApproval에 왔다!");
		
		return "approval/mgrLecApproval";
	}
	
	@ResponseBody
	@PostMapping("/mgrLecApprovalList")
	public List<LecApplyVO> mgrLecApprovalList(@RequestBody Map<String, Object> map){
		log.info("mgrLecApprovalList map : " + map);
		List<LecApplyVO> list = this.apprivalService.mgrLecApprovalList(map);
		
		return list;
	}
	
	//학사관리자 강의계획서 보기
	@GetMapping("/lecApproPdfGetMgr/{lecaCd}")
	public String lecApproPdfGetMgr(@PathVariable("lecaCd") int lecaCd, Model model,
			HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int mgrCd = memberVO.getMemCd();
		model.addAttribute("mgrCd", mgrCd);
		model.addAttribute("lecaCd", lecaCd);

		Map<String, Object> lecApply = new HashMap<String, Object>();
		lecApply.put("lecaCd", lecaCd);
		

		LecApplyVO lec = this.apprivalService.getLecApply(lecApply);

		List<WeekplanVO> wee = this.apprivalService.getWeekPlan(lecaCd);

		model.addAttribute("data", lec);
		model.addAttribute("week", wee);
		
		
		Map<String, Object> map = this.apprivalService.applyInfo(lecaCd);
		log.info("여기다 map : " + map);
		model.addAttribute("map", map);

		return "approval/mgrApprovalNew";
	}
	
	@ResponseBody
	@PostMapping("/lecApplyView")
	public Map<String, Object> lecApplyView(@RequestBody Map<String, Object> map, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
//		log.info("lecApplyView memCd : " + memCd);
		
//		model.addAttribute("memCd", memCd);
		
//		log.info("lecApplyView Map : " + map);
		
		LecApplyVO lec = this.apprivalService.getLecApply(map);
		List<WeekplanVO> wee = this.apprivalService.getWeekPlan((Integer) map.get("lecaCd"));
		
//		log.info("lecApplyView lec : " + lec);
//		log.info("lecApplyView wee : " + wee);
		
		Map<String, Object> maps = new HashMap<String, Object>();
		
		maps.put("memCd", memCd);
		maps.put("lec", lec);
		maps.put("wee", wee);
		
		model.addAttribute("data", lec);
		model.addAttribute("week", wee);
		
		return maps;
	}
	
	//반려사유 update
	@ResponseBody
	@PostMapping("/approvalNo")
	public int approvalNo(@RequestBody Map<String, Object> map) {
//		log.info("approvalNo Map : " + map);
		
		int cnt = this.apprivalService.lecApplyNoUpdate(map);
		
		return cnt;
	}
	
	@GetMapping("/lecaRoomAssignGet/{lecaCd}")
	public String lecaRoomAssignGet(Model model, @PathVariable("lecaCd") int lecaCd, HttpServletRequest request) {
		log.info("lecaRoomAssignGet에 왔따");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int mgrCd = memberVO.getMemCd();
		
		LecApplyVO lecApplyVO = this.apprivalService.lecInfoSelect(lecaCd);
		log.info("lecApplyVO의 데이터 : " + lecApplyVO);
		model.addAttribute("data", lecApplyVO);
		model.addAttribute("lecaCd", lecaCd);
		model.addAttribute("mgrCd", mgrCd);
		
		Map<String, Object> map = this.apprivalService.applyInfo(lecaCd);
		log.info("여기다 map : " + map);
		model.addAttribute("map", map);
		
		return "approval/lecaRoomAssign";
	}
	
	@ResponseBody
	@PostMapping("/buildingList")
	public List<BuildingVO> buildingList() {
		
		List<BuildingVO> list = this.apprivalService.buildingList();
//		log.info("buildingList list : " + list);
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("/lecaRoomListPost")
	public List<RoomVO> lecaRoomListPost(@RequestBody Map<String, Object> map) {
		List<RoomVO> list = this.apprivalService.roomList((String) map.get("bldNm"));
//		log.info("lecaRoomListPost List : " + list);
		
		return list;
	}
	
	//수용가능인원 출력
	@ResponseBody
	@PostMapping("/selectPeopleCnt")
	public RoomVO selectPeopleCnt(@RequestBody Map<String, Object> map) {
		RoomVO roomVO = this.apprivalService.peopleCntSelect(map);
		
		return roomVO;
	}
	
	
	@ResponseBody
	@PostMapping("/roomListGet")
	public List<HashMap<String, Object>> roomListGet(@RequestBody Map<String, Object> map){
		
		List<HashMap<String, Object>> roomList = this.apprivalService.roomTimeTable(map);
		
		return roomList;
	}
	
	@ResponseBody
	@PostMapping("/allocationSave")
	public int allocationSave(@RequestBody Map<String, Object> map) {
		int cnt = 0;
		log.info("map : " + map);
		
		Map<String, Object> updateMap = new HashMap<String, Object>();
		updateMap.put("lecaRoom", map.get("lecaRoom"));
		updateMap.put("lecaUnit", map.get("lecaUnit"));
		updateMap.put("lecaCd", map.get("lecaCd"));
		cnt = this.apprivalService.updateLecApply(updateMap);
		
		
		List<String> list = (List<String>)map.get("tmCd");
		
		Map<String, Object> insertMap = new HashMap<String, Object>();
		for(int i=0; i<list.size(); i++) {
			insertMap.put("lecaCd", map.get("lecaCd"));
			insertMap.put("tmCd", list.get(i));
			
			cnt += this.apprivalService.insertTimetable(insertMap); 
		}
		return cnt;
	}
	
	//강의계획서 결재 관련 부분 업데이트 시키기
	@ResponseBody
	@PostMapping("/updateApproval")
	public int updateApproval(@RequestBody Map<String, Object> map) {
		
		Map<String, Object> maps = new HashMap<String, Object>();
		maps.put("mgrCd", map.get("mgrCd"));
		maps.put("lecaCd", map.get("lecaCd"));
		int cnt = this.apprivalService.updateApproval(maps);
		log.info("cnt : " + cnt);
		
		//알림 넣는 부분
//		int proCd = Integer.parseInt((String) map.get("proCd"));
		int proCd = Integer.parseInt(String.valueOf(map.get("proCd")));
		
		List<Integer> memList = new ArrayList<Integer>();
		memList.add(proCd);
		
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		noticeMap.put("ntfCon", "강의계획서 신청이 처리되었습니다.");
		noticeMap.put("memList", memList);
		noticeMap.put("ntfUrl", "/approval/list");
		
		this.notificationService.insertNtf(noticeMap);
		
		return cnt;
	}
	
	//학사관리자 교수장학금 결재
	@GetMapping("/schApprovalGet")
	public String schApprovalGet(Model model) {
		model.addAttribute("aa", 10000);
		return "approval/mgrSchApproval";
	}
	
	//학사관리자 교수장학금 결재 리스트
	@ResponseBody
	@PostMapping("/mgrSchApprovalList")
	public List<LecApplyVO> mgrSchApprovalList(){
		List<LecApplyVO> list = this.apprivalService.schApprovalHistory();
		log.info("교수장학금 결재 리스트 : " + list);
		
		return list;
	}
	
	//학사관리자 교수장학금 중 학생 기초정보
	@ResponseBody
	@PostMapping("/stuInfo")
	public Map<String, Object> stuInfo(@RequestBody Map<String, Object> map){
		log.info("map : " + map);
		int sclhCd = (Integer) map.get("sclhCd");
		Map<String, Object> maps = this.apprivalService.stuInfo(sclhCd);
		
		return maps;
	}
	
	@ResponseBody
	@PostMapping("/stuSchHistory")
	public List<Map<String, Object>> stuSchHistory(@RequestBody Map<String, Object> map){
		
		int stuCd = (Integer.parseInt((String) map.get("stuCd"))) ;
		List<Map<String, Object>> list = this.apprivalService.stuSchHistory(stuCd);
		
		return list;
	}
	
	//학사관리자 장학생 결재 승인
	@ResponseBody
	@PostMapping("/schApprovalPost")
	public int schApprovalPost(@RequestBody Map<String, Object> map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		MemberVO memberVO = (MemberVO)session.getAttribute("memSession");
		int memCd = memberVO.getMemCd();
		int cnt = 0;
		
		log.info("schApprovalPost map : " + map);
		
		List<Integer> list = (List<Integer>) map.get("sclhCd");
		
		Map<String, Object> maps = new HashMap<String, Object>();
		
		for(int i=0; i<list.size(); i++) {
			maps.put("mgrCd", memCd);
			maps.put("sclhCd", list.get(i));
			log.info("maps : " + maps);
			
			cnt = this.apprivalService.schApprovalOk(maps);
		}
		
		//알림 넣는 부분
		int proCd = 0;
		List<Integer> proCdList = (List<Integer>)map.get("proCd");
		log.info("proCdList : " + proCdList);
		List<Integer> memList = new ArrayList<Integer>();
		for(int i=0; i<proCdList.size(); i++) {
			proCd = proCdList.get(i);
			memList.add(proCd);
		}
		log.info("알림" + memList);
		
		Map<String, Object> noticeMap = new HashMap<String, Object>();
		noticeMap.put("ntfCon", "장학생 신청이 처리되었습니다.");
		noticeMap.put("memList", memList);
		noticeMap.put("ntfUrl", "/approval/schApprovalGet");
		
		this.notificationService.insertNtf(noticeMap);
		
		return cnt;
	}
	
	/**
	 * 메인화면 교수의 결재 신청/완료 건수 
	 * @param proCd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getProApprCnt")
	public ApprovalVO getProApprCnt(int proCd) {
		log.info("== getProApprCnt ==");
		
		ApprovalVO approvalVO = this.apprivalService.getProApprCnt(proCd);
		log.info("approvalVO >> " + approvalVO);
		
		return approvalVO;
	}
	
	/**
	 * 메인화면 관리자의 결재 신청/완료 건수
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getMgrApprCnt")
	public ApprovalVO getMgrApprCnt() {
		log.info("== getMgrApprCnt ==");
		
		ApprovalVO approvalVO = this.apprivalService.getMgrApprCnt();
		log.info("approvalVO >> " + approvalVO);
		
		return approvalVO;
	}
	
	//학사관리자 강의실 조회
	@GetMapping("/lecaRoomView")
	public String lecaRoomView() {
		return "approval/lecaRoomView";
	}
	
	////관리자 강의계획서 결재 중 이미 승인이나 반려되었는지 확인 
	@ResponseBody
	@PostMapping("/confirmYn")
	public int confirmYn(@RequestBody Map<String, Object> map) {
		
		int cnt = this.apprivalService.confirmYn((Integer) map.get("lecaCd"));
		
		return cnt;
	}
}
