package kr.ac.lms.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.ac.lms.vo.CollegeVO;
import kr.ac.lms.vo.PaymentVO;
import kr.ac.lms.vo.StudentVO;

public interface PaymentService {
	public List<HashMap<String, Object>> adminPaymentList();
	public List<PaymentVO> stuPaymentList(StudentVO vo);
	public int fee (int depCd);
	public String depName (int depCd);
	public HashMap<String,Object> bill(int stuCd);
	public List<HashMap<String, Object>> attendList();
	public int insert(List<Map<String, Object>> param);
	public int pay(int payCd);
	public List<HashMap<String,Object>> params(List<Map<String, Object>> stuCd);
	public int billSch(int stuCd);
	public int billCount(int stuCd);
	public HashMap<String,Object> payDetail(HashMap<String,Integer>map);
	public List<HashMap<String,Object>>collegeFeeList();
	public PaymentVO sumCollegeFee();
}
