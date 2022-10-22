package kr.ac.lms.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.ac.lms.service.MailService;
import kr.ac.lms.util.ArticlePage;
import kr.ac.lms.vo.AttachVO;
import kr.ac.lms.vo.MailVO;
import kr.ac.lms.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/mail")
@Controller
public class MailController {

	@Autowired
	private MailService mailService;
	
	/**
	 * 전체 메일 출력
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/mailAll")
	public String mailAll(HttpServletRequest request, Model model, @RequestParam Map<String, Object> map) {
		log.info("== mailAll ==");
		
		log.info("map >> " + map);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20182696;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		// 한 화면에 보여지는 행의 수(기본 20행)
		int page = 12;
		map.put("show", "12");
		if(map.size() == 0) {
			map.put("keyword", "");
			map.put("currentPage", "1");
		}
		
		map.put("memCd", memCd);
		
		log.info("map >> " + map);

		String currentPage = (String) map.get("currentPage");
		
		// 현제 페이지가 null이라면 1로 세팅
		if(currentPage == null) {
			currentPage = "1";
			map.put("currentPage", "1");
		}
		
		map.put("cate", "all");
		
		List<MailVO> mailAll = this.mailService.mailAll(map);
		log.info("mailAll" + mailAll);
		
		
		int total = this.mailService.getTotal(map);
		
		model.addAttribute("list", new ArticlePage<MailVO>(total, Integer.parseInt(currentPage), page, mailAll));
		model.addAttribute("map", map);
		
		return "mail/totalbox";
	}
	
	/**
	 * 받은 메일함
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/inbox")
	public String inbox(HttpServletRequest request, Model model, @RequestParam Map<String, Object> map) {
		log.info("== inbox ==");
		
		log.info("map >> " + map);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");

		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20182696;
		}else {
			memCd = memberVO.getMemCd();
		}

		// 한 화면에 보여지는 행의 수(기본 20행)
		int page = 12;
		map.put("show", "12");
		if(map.size() == 0) {
			map.put("keyword", "");
			map.put("currentPage", "1");
		}
		
		map.put("mlRcp", memCd);
		
		log.info("map >> " + map);

		String currentPage = (String) map.get("currentPage");
		
		// 현제 페이지가 null이라면 1로 세팅
		if(currentPage == null) {
			currentPage = "1";
			map.put("currentPage", "1");
		}
		
		map.put("cate", "inbox");
		
		List<MailVO> mailVOList = this.mailService.getInbox(map);
		log.info("mailVOList >> " + mailVOList.toString());
		
		int total = this.mailService.getTotal(map);
		
		model.addAttribute("list", new ArticlePage<MailVO>(total, Integer.parseInt(currentPage), page, mailVOList));
		model.addAttribute("map", map);
		
		return "mail/inbox";
	}
	
	/**
	 * 보낸 메일함
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/sentmailbox")
	public String sentmailbox(HttpServletRequest request, Model model, @RequestParam Map<String, Object> map) {
		log.info("== sentmailbox ==");
		
		log.info("map >> " + map);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");

		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20182696;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		// 한 화면에 보여지는 행의 수(기본 20행)
		int page = 12;
		map.put("show", "12");
		if(map.size() == 0) {
			map.put("keyword", "");
			map.put("currentPage", "1");
		}
		
		map.put("mlSen", memCd);
		
		log.info("map >> " + map);

		String currentPage = (String) map.get("currentPage");
		
		// 현제 페이지가 null이라면 1로 세팅
		if(currentPage == null) {
			currentPage = "1";
			map.put("currentPage", "1");
		}
		
		map.put("cate", "sent");
		
		List<MailVO> mailVOList = this.mailService.getSentMail(map);
		log.info("mailVOList >> " + mailVOList.toString());
		
		int total = this.mailService.getTotal(map);
		
		model.addAttribute("list", new ArticlePage<MailVO>(total, Integer.parseInt(currentPage), page, mailVOList));
		model.addAttribute("map", map);
		
		return "mail/sentmailbox";
	}
	
	/**
	 * 임시 메일함
	 * @param request
	 * @param model
	 * @return
	 */
	@GetMapping("/imsiMailBox")
	public String imsiMailBox(HttpServletRequest request, Model model, @RequestParam Map<String, Object> map) {
		log.info("== imsiMailBox ==");
		
		log.info("map >> " + map);
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");

		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20182696;
		}else {
			memCd = memberVO.getMemCd();
		}

		// 한 화면에 보여지는 행의 수(기본 20행)
		int page = 12;
		map.put("show", "12");
		if(map.size() == 0) {
			map.put("keyword", "");
			map.put("currentPage", "1");
		}
		
		map.put("mlSen", memCd);
		
		log.info("map >> " + map);

		String currentPage = (String) map.get("currentPage");
		
		// 현제 페이지가 null이라면 1로 세팅
		if(currentPage == null) {
			currentPage = "1";
			map.put("currentPage", "1");
		}
		
		map.put("cate", "imsi");
		
		List<MailVO> mailVOList = this.mailService.getImsiMail(map);		
		log.info("mailVOList >> " + mailVOList);
		
		int total = this.mailService.getTotal(map);
		
		model.addAttribute("list", new ArticlePage<MailVO>(total, Integer.parseInt(currentPage), page, mailVOList));
		model.addAttribute("map", map);
		
		return "mail/imsiMailBox";
	}
	
	/**
	 * 메일 상세
	 * @param mlCd
	 * @param model
	 * @param request
	 * @return
	 */
	@GetMapping("/detail")
	public String detail(@RequestParam String mlCd, Model model, HttpServletRequest request) {
		log.info("mlCd >> " + mlCd);
		
		MailVO mailVO = this.mailService.mailDetail(Integer.parseInt(mlCd));
		log.info("mailVO >> " + mailVO);

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");

		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20182696;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		log.info("mailVO.getMlRcp() >> " + mailVO.getMlRcp() + " / memCd >> " + memCd);
		
		if(mailVO.getMlRcp() == memCd) {
			this.mailService.updateMlYn(Integer.parseInt(mlCd));
		}
		
		model.addAttribute("mailVO", mailVO);
		
		return "mail/detail";
	}
	
	/**
	 * 메일 쓰기
	 * @param mlCd
	 * @param model
	 * @return
	 */
	@GetMapping("/write")
	public String write(@RequestParam(value = "mlCd", required = false, defaultValue = "0") int mlCd, Model model, @RequestParam(value = "memCd", required = false, defaultValue = "0") int memCd) {
		log.info("== write ==");
		
		if(mlCd != 0) {
			MailVO mailVO = new MailVO();
			
			mailVO = this.mailService.mailDetail(mlCd);
			log.info("mailVO >> " + mailVO);
			
			MemberVO memInfo = this.mailService.getMemInfo(mailVO.getMlRcp());
			
			model.addAttribute("mailVO", mailVO);
			model.addAttribute("memInfo", memInfo);
			
		}
		
		if(memCd != 0) {
			MemberVO memInfo = this.mailService.getMemInfo(memCd);
			
			model.addAttribute("memInfo", memInfo);
		}
		
		return "mail/write";
	}
	
	/**
	 * 드래그 앤 드롭으로 첨부할 때마다 파일 Attach 테이블에 저장
	 * @param multipartRequest
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/sendFile")
	public int sendFile(MultipartHttpServletRequest multipartRequest, HttpServletRequest request) {
		log.info("== sendFile ==");
		
		Iterator<String> itr =  multipartRequest.getFileNames();
		
		ServletContext servletContext = request.getSession().getServletContext();
		String realPath  = servletContext.getRealPath("/");
        
//        String filePath = "C:/test"; //설정파일로 뺀다.
		int idx = realPath.indexOf(".metadata");
		String filePath = realPath.substring(0, idx);
		filePath += "LMSProj\\src\\main\\webapp\\resources\\attach";
		
		File uploadPath = new File(filePath, getFolder());
		log.info("upload path >> " + uploadPath);
		
		// 만약 해당 폴더가 없다면 생성
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		
		AttachVO attachVO = new AttachVO();
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
            
            /* 기존 주석처리
	            MultipartFile mpf = multipartRequest.getFile(itr.next());
	            String originFileName = mpf.getOriginalFilename();
	            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            */
            
            MultipartFile mpf = multipartRequest.getFile(itr.next());
     
            String originalFilename = mpf.getOriginalFilename(); // 실제 파일명
     
            UUID uuid = UUID.randomUUID(); // 임의 값을 생성
            String uploadFileName = uuid + "_" + originalFilename;
            
            String fileFullPath = uploadPath + File.separator + uploadFileName; //파일 전체 경로
     
            String dbFilePath = "LMSProj\\src\\main\\webapp\\resources\\attach" + uploadFileName;
            log.info("dbFilePath >> " + dbFilePath);
            
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                
                System.out.println("originalFilename => " + originalFilename);
                System.out.println("uploadFileName => " + uploadFileName);
                System.out.println("fileFullPath => "+ fileFullPath);
                
                //attach 테이블에 insert -> selectKey 태그를 통해서 max(attach_seq)+1 -> attachVO의 attachCd 멤버변수에 저장됨
                attachVO.setAttachNm(getFolder().replace("\\", "/") + "/" + uploadFileName);
                attachVO.setAttachPt(dbFilePath);
                
                int result = this.mailService.attachInsert(attachVO);
                log.info("attachCd >> " + attachVO.getAttachCd());
                
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======> " + fileFullPath);
                e.printStackTrace();
            }
                         
       }
        //attachVO의 attachSeq 값을 리턴
		return attachVO.getAttachCd();
	}
	
	/**
	 * 실제로 메일 보내는 메소드
	 * @param mailVO
	 * @param request
	 * @return
	 */
	@PostMapping("/sendMail")
	public String sendMail(MailVO mailVO, HttpServletRequest request) {
		log.info("== sendMail ==");
		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");

		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20182696;
		}else {
			memCd = memberVO.getMemCd();
		}
		
		mailVO.setMlSen(memCd);
		
		log.info("mailVO >> " + mailVO);
		
		int result = this.mailService.sendMail(mailVO);
		
		log.info("result >> " + result);
		
		return "redirect:/mail/sentmailbox";
	}
	
	/**
	 * 메일 임시저장
	 * @param mailVO
	 * @param request
	 * @return
	 */
	@PostMapping("/drafts")
	public String drafts(MailVO mailVO, HttpServletRequest request) {
		log.info("== drafts ==");
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memSession");
		
		int memCd = 0;
		
		if(memberVO == null) {
			memCd = 20182696;
		}else {
			memCd = memberVO.getMemCd();
		}
			
		mailVO.setMlSen(memCd);
		
		log.info("mailVO >> " + mailVO);
		
		int result = this.mailService.drafts(mailVO);
		log.info("result >> " + result);
		
		return "redirect:/mail/imsiMailBox"; 
	}
	
	/**
	 * 임시저장한 메일 다시 임시저장
	 * @param mailVO
	 * @return
	 */
	@PostMapping("/imsiMailDrafts")
	public String imsiMailDrafts(MailVO mailVO) {
		log.info("== imsiMailDrafts ==");
		log.info("mailVO >> " + mailVO);
		
		int result = this.mailService.imsiMailDrafts(mailVO);
		log.info("result >> " + result);
		
		return "redirect:/mail/imsiMailBox";
	}
	
	// 임시저장한 메일 전송
	@PostMapping("/imsiSendMail")
	public String imsiSendMail(MailVO mailVO) {
		log.info("== imsiSendMail ==");
		
		log.info("mailVO >> " + mailVO);
		
		int result = this.mailService.sendImsiMail(mailVO);
		log.info("result >> " + result);
		
		return "redirect:/mail/sentmailbox";
	}

	/**
	 * 메일 삭제
	 * @param mlCd
	 * @return
	 */
	@GetMapping("/delete")
	public String delete(@RequestParam(value = "mlCd") String mlCd) {
		log.info("mlCd >> " + mlCd);
		String[] data = new String[1]; 
		data[0] = mlCd;
		
		int result = this.mailService.deleteMail(data);
		log.info("result >> " + result);
		
		return "redirect:/mail/mailAll";
	}
	
	/**
	 * 선택한 메일 삭제(여러개)
	 * @param data
	 * @param model
	 * @param request
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteAll")
	public int deleteAll(@RequestBody String[] data, Model model, HttpServletRequest request) {
		log.info("== deleteAll ==");
		log.info("data >> " + data[0]);
		
		int result = this.mailService.deleteMail(data);
		
		return result;
	}
	
	// 읽음 여부 수정
	@ResponseBody
	@PostMapping("/changeYN")
	public int changeYN(@RequestBody Map<String, Object> data) {
		log.info("== changeYN ==");
		
		log.info("data >> " + data);
		
		int result = this.mailService.changeYN(data);
		log.info("result >> " + result);
		
		return result;
	}
	
	/**
	 * 메인화면 안읽은 메일 건수
	 * @param memCd
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getMlCnt")
	public int getMlCnt(int memCd) {
		log.info("== getMlCnt ==");
		
		int mlCntN = this.mailService.getMlCnt(memCd);
		log.info("mlCntN >> " + mlCntN);
		
		return mlCntN;
	}
	
	/**
	 * 파일 다운로드
	 * @param fileName
	 * @param request
	 * @return
	 */
	@GetMapping("/download")
	public ResponseEntity<Resource> download(String fileName, HttpServletRequest request) {
		log.info("fileName >> " + fileName);

		ServletContext servletContext = request.getSession().getServletContext();
		String realPath  = servletContext.getRealPath("/");
		
		int idx = realPath.indexOf(".metadata");
		String filePath = realPath.substring(0, idx);
		filePath += "LMSProj\\src\\main\\webapp\\resources\\attach\\";
		
		// resource : 다운로드 받을 파일(지원)
		Resource resource = new FileSystemResource(filePath + fileName);
		
		// a44c66c9-1e7d-4729-82aa-8796b940c417_P1237.jpg
		String resourceName = resource.getFilename();
		log.info("resourceName >> " + resourceName);
		
		int separatorIdx = resourceName.indexOf("_");
		String originalFilename = resourceName.substring(separatorIdx + 1);
		log.info("originalFilename >> " + originalFilename);
		
		// header : 인코딩 정보, 파일명 정보
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Disposition", "attachment;filename=" + new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			log.info(e.getMessage());
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK);
	}
	
	//년/월/일 폴더 생성
	private static String getFolder() {
		// 2022-07-22 형식(format) 지정
		// 간단한 날짜 형식
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		// 날짜 객체 생성(java.util 패키지)
		Date date = new Date();
		
		// 2022-07-22
		String str =sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
	//이름 리스트 불러오기
	@ResponseBody
	@PostMapping("/getNames")
	public List<MemberVO> getNames() {
		
		List<MemberVO> nameList = this.mailService.getNames();
		
		return nameList;
	}
	
}