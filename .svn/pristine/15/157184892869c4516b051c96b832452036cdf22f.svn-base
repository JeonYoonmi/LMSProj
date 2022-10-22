package kr.ac.lms.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.lms.service.ProfessorLectureService;
import kr.ac.lms.service.StudentLectureService;
import kr.ac.lms.vo.AttenadenceVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.LecQnaVO;
import kr.ac.lms.vo.LecQnarVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.QnaReplyVO;
import kr.ac.lms.vo.StuLecVO;
import kr.ac.lms.vo.StuTestVO;
import kr.ac.lms.vo.TaskSubmitVO;
import kr.ac.lms.vo.TaskVO;
import kr.ac.lms.vo.TestDetailVO;
import kr.ac.lms.vo.TestVO;
import kr.ac.lms.vo.WeekplanVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequestMapping("/studentLecture")
@Controller
public class StudentLectureController {

	@Autowired
	StudentLectureService studentLectureService;
	
	@Autowired
	ProfessorLectureService professorLectureService; 
	
	// 학생 대시보드
	@GetMapping("/stuList")
	public String list(HttpServletRequest request, Model model, @RequestParam Map<String, Object> map) {
		log.info("stuList");
		
		// 세션 불러 오고 나서
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		if(map.size() == 0) {
			map.put("year", "");
			map.put("sem", "");
		}
		
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20184859;
		} else {
			memCd = memberVO.getMemCd();
		}		
		
		map.put("stuCd", memCd);
		
		List<LecApplyVO> list = this.studentLectureService.getStuLecList(map);
		
		log.info("list==================== : " + list);
		
		model.addAttribute("data", list);
		
		model.addAttribute("map", map);

		return "deshboard/stuList";
	}
	
	// 대시보드 검색 ajax
	@ResponseBody
	@PostMapping("/getLecaYr")
	public List<LecApplyVO> getLecaYr(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");

		int memCd = 0;

		if(memberVO == null) {
			memCd = 200231111;
		} else {
			memCd = memberVO.getMemCd();
		}
		
		
		List<LecApplyVO> lecYr = this.studentLectureService.getLecaYr(memCd);
		
		return lecYr;
	}
	
	// 학생 퀴즈 리스트
	@GetMapping("/quiz")
	public String quiz(@RequestParam("lecCd") int lecCd, Model model, HttpServletRequest request) {
		log.info("quiz");
		
		LecApplyVO lec = this.professorLectureService.getLecApply(lecCd);
		List<TestVO> testList = this.professorLectureService.quizBoardList(lecCd);
		
		// 세션 불러 오고 나서
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20184859;
		} else {
			memCd = memberVO.getMemCd();
		}	
		
		List<TestVO> checkSubmit = this.studentLectureService.checkQuizSubmit(memCd);
		
		log.info("lecCd : " + lecCd);
		log.info("checkSubmit : " + checkSubmit.toString() );
		
		
		model.addAttribute("list", testList);
		model.addAttribute("data", lec);
		model.addAttribute("check", checkSubmit);
		
		return "studentLecture/quiz";
	}
	
	// 학생 퀴즈 
	@GetMapping("/quizDetail")
	public String quizDetail(@RequestParam("testCd") int testCd, Model model) {
		log.info("학생 quizDetail");
		TestVO testQ = this.professorLectureService.quizDetail(testCd);
		
		model.addAttribute("data",testQ);
		return "studentLecture/quizDetail";
	}
	
	// @ModelAttribute StuTestVO stuTestVO, @ModelAttribute TestDetailVO testDetailVO
	// insert query
	// int stuTestRst = this.studentLectureService.stuTestInsert(stuTestVO);

	// 학생 퀴즈 제출
	@PostMapping("/stuQuizInsertPost")
	public String stuQuizInsertPost(int stuCd, StuTestVO stuTestVO) {
		log.info("stuQuizInsertPost 도착");
		log.info("stuCd 받아 지나요? : " + stuCd);
		
//		log.info("stuTestVO >> " + stuTestVO.toString());
		
		int stuTestRst = this.studentLectureService.stuTestInsert(stuTestVO);
		int stCd = stuTestVO.getStCd();
		log.info("stCd 불러와 지나요? : " + stCd);
		
		int lecCd = stuTestVO.getLecCd();
		
		//map 생성
		Map<String, Object> testDetailVOMap = new HashMap<String, Object>();
		
		// 부모 키 자식에 insert 및 자식 list insert
		testDetailVOMap.put("stCd", stCd);
		testDetailVOMap.put("list", stuTestVO.getTestDetailVOList());
		
		
		int testDetailRst = this.studentLectureService.testDetailInsert(testDetailVOMap);
		
		log.info("stuTest insert 됐나요? : " + stuTestRst);
		log.info("testDetail insert 됐나요? : " + testDetailRst);
		
		
		return "redirect:/studentLecture/quizDetailComplete?testCd=" + stuTestVO.getTestCd() + "&&lecCd=" + stuTestVO.getLecCd();
	}
	
	// 제출 완료한 퀴즈 상세
	@GetMapping("/quizDetailComplete")
	public String quizDetailComplete(@RequestParam int testCd, int lecCd, Model model, HttpServletRequest request) {
		log.info("quizDetailComplete에 도착");
		
		
		// 세션 불러 오고 나서
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20184859;
		} else {
			memCd = memberVO.getMemCd();
		}	
		
		log.info("데이터들 불러와지나요? : testCd > " + testCd + " lecCd > "+ lecCd + " stuCd > " + memCd);
//		StuTestVO stuTestVO = new StuTestVO();
//		
//		stuTestVO.setStuCd(memCd);
//		stuTestVO.setTestCd(testCd);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lecCd", lecCd);
		map.put("stuCd", memCd);
		map.put("testCd", testCd);
		
		log.info("map : " + map);
		
		TestVO stuList = this.studentLectureService.stuTestDetail(map);
		
		
		model.addAttribute("data", stuList);
		
		return "studentLecture/quizDetailComplete";
	}
 	
	// 질문게시판 리스트 조회
	@GetMapping("/lecQnaList")
	public String lecQnaList(@RequestParam("lecCd") int lecCd, Model model) {
		log.info("lecQnaList 도착");
		
		// 수업 정보
		LecApplyVO lec = this.professorLectureService.getLecApply(lecCd);
		log.info("lec" + lec.toString());
		// 질문게시판 정보
		List<LecQnaVO> list = this.studentLectureService.getLecQnaList(lecCd);
		log.info("list" + list.toString());
		
		model.addAttribute("data",lec);
		model.addAttribute("list",list);
		
		return "studentLecture/lecQnaList";
	}
	
	// 질문게시판 상세 조회
	@GetMapping("/lecQnaDetail")
	public String lecQnaDetail(@RequestParam("lqnaCd") int lqnaCd, Model model) {
		log.info("lecQnaDetail 도착");

		int result = this.studentLectureService.lecQnaHit(lqnaCd);
		
		log.info("result : " + result);

		LecQnaVO lecQnaVO = this.studentLectureService.getLecQnaDetail(lqnaCd);
		
		List<LecQnarVO> lecQnarVOList = this.studentLectureService.getLecQnar(lqnaCd);
		
		model.addAttribute("data", lecQnaVO);
		
		model.addAttribute("qnarList", lecQnarVOList);
		
		return "studentLecture/lecQnaDetail";
	}
	
	// 질문게시판 수정
	@PostMapping("/lecQnaUpdate")
	public String lecQnaUpdate(@ModelAttribute LecQnaVO lecQnaVO, RedirectAttributes rat) {
		log.info("lecQnaUpdate 도착");
		
		int result = this.studentLectureService.lecQnaUpdate(lecQnaVO);
		
		rat.addFlashAttribute("lQnaCd", lecQnaVO.getLqnaCd());
		
		log.info("lqnaCd : " + lecQnaVO.getLqnaCd());
		
		log.info("result : " + result);
		
		return "redirect:/studentLecture/lecQnaDetail?lqnaCd=" + lecQnaVO.getLqnaCd();
	}
	
	// 질문게시판 삭제
	@PostMapping("/lecQnaDelete")
	public String lecQnaDelete(int lqnaCd, LecQnaVO lecQnaVO) {
		log.info("lecQnaDelete 도착");
		
		int resultR = this.studentLectureService.lecQnarAllDelete(lqnaCd);
		
		int result = this.studentLectureService.lecQnaDelete(lqnaCd);
		
		log.info("result : " + result);
		log.info("resultR : " + resultR);
		log.info("LecCd : " + lecQnaVO.getLecCd());
		
		return "redirect:/studentLecture/lecQnaList?lecCd=" + lecQnaVO.getLecCd();
	}
	
	// 질문게시판 등록 JSP
	@GetMapping("/lecQnaInsert")
	public String lecQnaInsert(@RequestParam int lecCd, Model model) {
		log.info("lecQnaInsert 도착");
		
		LecApplyVO lec = this.professorLectureService.getLecApply(lecCd);
		
		model.addAttribute("data", lec);
		
		
		return "studentLecture/lecQnaInsert";
	}

	// 질문게시판 등록 POST
	@PostMapping("/lecQnaWritePost")
	public String lecQnaWritePost(@ModelAttribute LecQnaVO lecQnaVO) {
		log.info("lecQnaWritePost 도착");
		
		int result = this.studentLectureService.lecQnaInsert(lecQnaVO);
		
		log.info("result : " + result);
		
		return "redirect:/studentLecture/lecQnaList?lecCd=" + lecQnaVO.getLecCd();
	}
	
	// 질문게시판 답글 등록
	@PostMapping("/lecQnarInsert")
	public String lecQnarInsert (@ModelAttribute LecQnarVO lecQnarVO) {
		log.info("lecQnarInsert 도착");
		
		int result = this.studentLectureService.lecqnarInsert(lecQnarVO);
		
		log.info("result : " + result);
		
		return "redirect:/studentLecture/lecQnaDetail?lqnaCd=" + lecQnarVO.getLqnaCd();
	}
	
	// 질문게시판 답글 수정
	@PostMapping("/lecQnarUpdate")
	public String lecQnarUpdate(LecQnarVO lecQnarVO, RedirectAttributes rat) {
		log.info("lecQnarUpdate 도착");
		log.info("lec" + lecQnarVO.toString());
		
//		rat.addFlashAttribute("lqnaCd", lecQnarVO.getLqnaCd()); 
		
		log.info("lqnaCd : " + lecQnarVO.getLqnaCd());

		int result = this.studentLectureService.lecQnarUpdate(lecQnarVO);
		
		log.info("result : " + result);
		
		return "redirect:/studentLecture/lecQnaDetail?lqnaCd=" + lecQnarVO.getLqnaCd();
	}
	
	
	// 질문게시판 답글 삭제
	@PostMapping("/lecqnarDelete")
	public String lecqnarDelete(int lqnaCd, LecQnarVO lecQnarVO) {
		log.info("lecqnarDelete");
		
		int lqnarCd = lecQnarVO.getLqnarCd();
		
		int result = this.studentLectureService.lecQnarDelete(lqnarCd);
		
		log.info("result : " + result);
		
		return "redirect:/studentLecture/lecQnaDetail?lqnaCd=" + lecQnarVO.getLqnaCd();
	}

	
	// 학생 과제 리스트 (제출 확인)
	@GetMapping("/lecTaskList")
	public String lecTaskList(int lecCd, Model model, HttpServletRequest request) {
		log.info("lecTaskList 도착");
		
		LecApplyVO lec = this.professorLectureService.getLecApply(lecCd);
		List<TaskVO> taskVOList = this.professorLectureService.lecTaskList(lecCd);
		
		// 세션 불러 오고 나서
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20184859;
		} else {
			memCd = memberVO.getMemCd();
		}	
		
		List<TaskSubmitVO> taskSubmitVOList = this.studentLectureService.lecTaskSubmit(memCd);
		
		log.info("과제 제출 확인 : " + taskSubmitVOList);
		
		model.addAttribute("list", taskVOList);
		model.addAttribute("data", lec);
		model.addAttribute("check", taskSubmitVOList);
		
		return "studentLecture/lecTaskList";
	}
	
	// 학생 과제 상세
	@GetMapping("/lecTaskDetail")
	public String lecTaskDetail(@RequestParam int taskCd, Model model) {
		log.info("lecTaskDetail 도착");
		
		TaskVO taskVO = this.professorLectureService.lecTaskDetail(taskCd);
		TaskVO preNext = this.professorLectureService.lecTaskPreNext(taskCd);

		int lecCd = taskVO.getLecCd();
		
		LecApplyVO lec = this.professorLectureService.getLecApply(lecCd);
		
		model.addAttribute("data", taskVO);
		model.addAttribute("preNext", preNext);
		model.addAttribute("lec", lec);
		
		return "studentLecture/lecTaskDetail";
	}
	
	@PostMapping("/stuLecTaskInsert")
	public String lecTaskInsertPost(TaskSubmitVO taskSubmitVO, HttpServletRequest request, MultipartFile mpf) {
		log.info("stuLecTaskInsert 도착");
		log.info("taskSubmitVO :" + taskSubmitVO.toString());
		
		log.info("tsubFnm : " + taskSubmitVO.getTsubFnm());
		log.info("mpf[] : " + mpf.getOriginalFilename());
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath  = servletContext.getRealPath("/");

		int idx = realPath.indexOf(".metadata");
	      String filePath = realPath.substring(0, idx);
	      filePath += "LMSProj\\src\\main\\webapp\\resources\\lecDataFile";

		// 파일 경로
//		String uploadFolder = "C:\\09.FinalProject\\workspace\\LMSProj\\src\\main\\webapp\\resources\\lecDataFile";
		//-----------------------------------------------------------------------//
			File uploadPath = new File(filePath, getFolder());
			log.info("upload Path : " + uploadPath);
			
			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
		//-----------------------------------------------------------------------//
		
		String originalFilename = mpf.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		String uploadFileName = uuid.toString() + "_" + originalFilename;
		
		String fileFullPath = uploadPath + File.separator + uploadFileName; // 파일 전체 경로
		
		
		try {
            //파일 저장
            mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
            
            System.out.println("originalFilename => " + originalFilename);
            System.out.println("uploadFileName => " + uploadFileName);
            System.out.println("fileFullPath => "+ fileFullPath);
            
            	taskSubmitVO.setTsubFnm(getFolder().replace("\\", "/") + "/" + uploadFileName);
            
            	
            	int result = this.studentLectureService.stuLecTaskInsert(taskSubmitVO);
	            log.info("result : " + result);
            
        } catch (Exception e) {
            System.out.println("postTempFile_ERROR======> " + fileFullPath);
            e.printStackTrace();
        }
		
		return "redirect:/studentLecture/lecTaskList?lecCd=" + taskSubmitVO.getLecCd();
	}
	
	// 년/월/일 폴더 생성
	public static String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		return str.replace("-", File.separator); 
	}
	
	// 학생 과제 상세(제출 완료)
	@GetMapping("/lecTaskDetailComplete")
	public String lecTaskDetailComplete(@RequestParam int tsubCd, int taskCd, Model model, HttpServletRequest request) {
		log.info("lecTaskDetailComplete 도착");
		
		TaskVO taskVO = this.professorLectureService.lecTaskDetail(taskCd);
		TaskVO preNext = this.professorLectureService.lecTaskPreNext(taskCd);
		
		// 세션 불러 오고 나서
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20184859;
		} else {
			memCd = memberVO.getMemCd();
		}	
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("stuCd", memCd);
		map.put("taskCd", taskCd);
		
		TaskSubmitVO taskSubmitVO = this.studentLectureService.stuLecTaskDetail(map);
		
		int lecCd = taskVO.getLecCd();
		
		LecApplyVO lec = this.professorLectureService.getLecApply(lecCd);
		
		model.addAttribute("data", taskVO);
		model.addAttribute("preNext", preNext);
		model.addAttribute("lec", lec);
		model.addAttribute("taskSubmit", taskSubmitVO);
		
		return "studentLecture/lecTaskDetailComplete";
	}
	
	// 학생 과제 제출 수정
	@PostMapping("/lecTaskDetailCompleteUpdate")
	public String lecTaskDetailCompleteUpdate(TaskSubmitVO taskSubmitVO, HttpServletRequest request, MultipartFile mpf) {
		
		log.info("taskCd : " + taskSubmitVO.getTaskCd());
		log.info("tsubFnm : " + taskSubmitVO.getTsubFnm());
		log.info("mpf[] : " + mpf.getOriginalFilename());
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath  = servletContext.getRealPath("/");

		int idx = realPath.indexOf(".metadata");
	      String filePath = realPath.substring(0, idx);
	      filePath += "LMSProj\\src\\main\\webapp\\resources\\lecDataFile";

		// 파일 경로
//		String uploadFolder = "C:\\09.FinalProject\\workspace\\LMSProj\\src\\main\\webapp\\resources\\lecDataFile";
		//-----------------------------------------------------------------------//
			File uploadPath = new File(filePath, getFolder());
			log.info("upload Path : " + uploadPath);
			
			if(uploadPath.exists() == false) {
				uploadPath.mkdirs();
			}
		//-----------------------------------------------------------------------//
		
		String originalFilename = mpf.getOriginalFilename();
		
		UUID uuid = UUID.randomUUID();
		String uploadFileName = uuid.toString() + "_" + originalFilename;
		
		String fileFullPath = uploadPath + File.separator + uploadFileName; // 파일 전체 경로
		
		
		try {
            //파일 저장
            mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
            
            System.out.println("originalFilename => " + originalFilename);
            System.out.println("uploadFileName => " + uploadFileName);
            System.out.println("fileFullPath => "+ fileFullPath);
            
            taskSubmitVO.setTsubFnm(getFolder().replace("\\", "/") + "/" + uploadFileName);
            
            int result = this.studentLectureService.stulecTaskUpdate(taskSubmitVO);
            	
	        log.info("result : " + result);
	        log.info("taskSubmitVO : " + taskSubmitVO.toString());
            
        } catch (Exception e) {
            System.out.println("postTempFile_ERROR======> " + fileFullPath);
            e.printStackTrace();
        }
		
		return "redirect:/studentLecture/lecTaskDetailComplete?tsubCd=" + taskSubmitVO.getTsubCd() + "&&taskCd=" + taskSubmitVO.getTaskCd();
	}
	
	// 과제 및 평가 삭제(학생)
	@PostMapping("/lecTaskDetailCompleteDelete")
	public String lecTaskDetailCompleteUpdate(TaskSubmitVO taskSubmitVO) {
		log.info("lecTaskDetailCompleteDelete 도착");
		
		int result = this.studentLectureService.stuLecTaskDelete(taskSubmitVO.getTsubCd());
		
		log.info("result : " + result);
		
		return "redirect:/studentLecture/lecTaskList?lecCd=" + taskSubmitVO.getLecCd();
	}


	// 학생 출결 현황 페이지
	@GetMapping("/lecAttendance")
	public String lecAttendance(int lecCd, Model model, HttpServletRequest request) {
		log.info("lecAttendance 도착");
		
		LecApplyVO lec = this.professorLectureService.getLecApply(lecCd);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		// 세션 처리~
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20184859;
		} else {
			memCd = memberVO.getMemCd();
		}
		
		map.put("stuCd", memCd);
		map.put("lecCd", lecCd);
		map.put("memCd", memCd);
		
		MemberVO memberVOattend = this.professorLectureService.attendanceStuDetail(map);
		// 출결 CNT
		AttenadenceVO attendenceVO = this.professorLectureService.attendanceCnt(map);
		
		model.addAttribute("memInfo", memberVOattend);
		model.addAttribute("attenCnt", attendenceVO);
		model.addAttribute("data", lec);
		
		return "studentLecture/lecAttendance";
	}
	
	
	// 출결 ajax
	@ResponseBody
	@PostMapping("/getStuAttend")
	public List<AttenadenceVO> getStuAttend(int lecCd, int stuCd) {
		log.info("/getStuAttend ajax도착");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("stuCd", stuCd);
		map.put("lecCd", lecCd);
		
		List<AttenadenceVO> attendList = this.studentLectureService.getStuLecAttend(map);
		
		return attendList;
	}

	// 학습목표  ajax
	@ResponseBody
	@PostMapping("/getWeekCon")
	public List<WeekplanVO> getWeekCon(int lecaCd) {
		log.info("getWeekCon ajax 도착");
		
		List<WeekplanVO> wee = this.professorLectureService.getWeekPlan(lecaCd);
		
		return wee;
	}



	// 성적 조회
	@GetMapping("/lecTotalScore")
	public String lecTotalScore(int lecCd, Model model, HttpServletRequest request) {
		log.info("lecTotalScore 도착");
		
		LecApplyVO lec = this.professorLectureService.getLecApply(lecCd);
		
		//세션
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20184859;
		} else {
			memCd = memberVO.getMemCd();
		}
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("lecCd", lecCd);
		map.put("stuCd", memCd);
		
		log.info("lecCd + memCd : " + lecCd +  " / " + memCd);
		
		List<AttenadenceVO> attenDetail = this.professorLectureService.attendStuDetail(map);
		
		log.info("attenDetail " + attenDetail);
		
		StuLecVO slScore = this.studentLectureService.getStuGrade(map);
		
		log.info("slScore : " + slScore);
		
		model.addAttribute("data", lec);
		model.addAttribute("attend", attenDetail);
		model.addAttribute("grade", slScore);
		
		return "studentLecture/lecTotalScore";
	}























}