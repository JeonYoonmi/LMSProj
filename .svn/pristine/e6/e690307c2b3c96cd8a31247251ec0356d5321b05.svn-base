package kr.ac.lms.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.lms.service.PopUpService;
import kr.ac.lms.vo.PopupVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/popup")
@Controller
public class PopUpController {
	
	@Autowired
	PopUpService popUpService;
	
	//연습용 리스트
	@GetMapping("/sample")
	public String sample() {
		return "popup/sample";
	}
	
	//실제 리스트
	@GetMapping("/list")
	public String list(
			Model model,
			@RequestParam(required = false) String result,
			@RequestParam(required = false) String insertResult) {
		
		List<PopupVO> list = this.popUpService.list();
		
		model.addAttribute("list", list);
		model.addAttribute("result", result);
		model.addAttribute("insertResult", insertResult);
		
		return "popup/list";
	}
	
	//팝업 업로드하는 페이지
	@GetMapping("/upload")
	public String upload() {
		return "popup/upload";
	}
	
	//팝업 등록하기
	@PostMapping("/uploadAction")
	public String uploadAction(
			MultipartFile popUpFile,
			HttpServletRequest request,
			@RequestParam("popUpTitle") String popUpTitle,
			@RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
			Model model
			) {
		
		//context path 가져옴
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath  = servletContext.getRealPath("/");
		
		//원하는 부분까지 추출하고 필요한 경로를 붙여줌
		int idx = realPath.indexOf(".metadata");
		String uploadFolder = realPath.substring(0, idx);
		//uploadFolder += "LMSProj\\src\\main\\webapp\\WEB-INF\\views\\popup\\upload";
		uploadFolder += "LMSProj\\src\\main\\webapp\\resources\\popup";
		
		//오늘날짜_파일명
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date date = new Date();
		String uploadName = sdf.format(date) + "_" + popUpFile.getOriginalFilename() ;
		
		File saveFile = new File(uploadFolder, uploadName);
		
		try {
			popUpFile.transferTo(saveFile); //파일 복사
		} catch (IllegalStateException e) {
			log.error(e.getMessage());
		} catch (IOException e) {
			log.error(e.getMessage());
		}
		
		//DB에 insert
		PopupVO popUpVO = new PopupVO();
		
		String popUpYn = request.getParameter("popUpYn");
		if(popUpYn == null) {
			popUpVO.setPopYn(0);
		}else {
			popUpVO.setPopYn(1);
		}
		popUpVO.setPopTtl(popUpTitle);
		popUpVO.setPopSt(startDate);
		popUpVO.setPopEt(endDate);
		popUpVO.setPopFnm(uploadName);
		
		int result = this.popUpService.insert(popUpVO);
		model.addAttribute("result", result);
		
		return "redirect:/popup/list";
	}
	
	//팝업 수정하기
	@GetMapping("/update/{popCd}")
	public String update(
			@PathVariable int popCd,
			Model model,
			HttpServletRequest request) {
		
		//수정해야 하는 객체를 불러옴
		PopupVO popupVO = this.popUpService.getVO(popCd);
		
		//객체의 파일 경로를 저장해줌
		String uploadFolder = "/resources/popup/";
		uploadFolder += popupVO.getPopFnm();
		
		//객체와 파일 경로를 model로 보냄
		model.addAttribute("popupVO", popupVO);
		model.addAttribute("filePath", uploadFolder);
		
		log.info(uploadFolder);
		
		return "popup/update";
	}
	
	//팝업 삭제하기
	@ResponseBody
	@GetMapping("/delete/{popCd}")
	public int delete(@PathVariable int popCd) {
		
		//log.info("도착했고, popCd는 " + popCd);
		
		int delresult = this.popUpService.delete(popCd);
		
		return delresult;
	}
	
	@GetMapping("/popUpFrame")
	public String popUpFrame() {
		
		return "frame/popUpFrame";
	}
	
	@ResponseBody
	@GetMapping("/popupList")
	public List<PopupVO> popupList() {
		
		List<PopupVO> list = this.popUpService.popupList();
		
		log.info("띄워야 할 팝업 개수 : " + list.size());
		
		if(list.size() != 0) {
			log.info("띄워야 할 팝업 첫번째 : " + list.get(0).toString());
		}
		
		return list;
	}
	
	//팝업 등록하기
		@PostMapping("/updateAction")
		public String updateAction(
			MultipartFile popUpFile,
			HttpServletRequest request,
			@RequestParam("popUpCode") int popUpCode,
			@RequestParam("popUpTitle") String popUpTitle,
			@RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate,
			Model model
			) {

		//파일명이 있는지 확인해보자
		String fileName4update = popUpFile.getOriginalFilename();
		String uploadName = "";	
			
		if(fileName4update != null && !fileName4update.equals("")) {
			//context path 가져옴
			ServletContext servletContext = request.getSession().getServletContext();
			String realPath  = servletContext.getRealPath("/");
			
			//원하는 부분까지 추출하고 필요한 경로를 붙여줌
			int idx = realPath.indexOf(".metadata");
			String uploadFolder = realPath.substring(0, idx);
			//uploadFolder += "LMSProj\\src\\main\\webapp\\WEB-INF\\views\\popup\\upload";
			uploadFolder += "LMSProj\\src\\main\\webapp\\resources\\popup";
			
			//오늘날짜_파일명
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			Date date = new Date();
			uploadName = sdf.format(date) + "_" + popUpFile.getOriginalFilename() ;
			
			File saveFile = new File(uploadFolder, uploadName);
			
			try {
				popUpFile.transferTo(saveFile); //파일 복사
			} catch (IllegalStateException e) {
				log.error(e.getMessage());
			} catch (IOException e) {
				log.error(e.getMessage());
			}
		}
			
		
		//DB에 insert
		PopupVO popUpVO = new PopupVO();
		
		String popUpYn = request.getParameter("popUpYn");
		if(popUpYn == null) {
			popUpVO.setPopYn(0);
		}else {
			popUpVO.setPopYn(1);
		}
		popUpVO.setPopCd(popUpCode);
		popUpVO.setPopTtl(popUpTitle);
		popUpVO.setPopSt(startDate);
		popUpVO.setPopEt(endDate);
		if(fileName4update != null && !fileName4update.equals("")) {
			popUpVO.setPopFnm(uploadName);
		}
		
		log.info("update할 popUpVO : " + popUpVO);
		
		int insertResult = this.popUpService.update(popUpVO);
		model.addAttribute("insertResult", insertResult);
		
		return "redirect:/popup/list";
	}
		
	@GetMapping("/imgMaking")
	public String imgMaking() {
		return "popup/imgMaking";
	}
}
