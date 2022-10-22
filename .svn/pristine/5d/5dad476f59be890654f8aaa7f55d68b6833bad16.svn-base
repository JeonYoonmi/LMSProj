package kr.ac.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.PaymentMapper;
import kr.ac.lms.service.PaymentService;
import kr.ac.lms.vo.CollegeVO;
import kr.ac.lms.vo.PaymentVO;
import kr.ac.lms.vo.StudentVO;

@Service
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper;

	@Override
	public List<HashMap<String, Object>> adminPaymentList() {
		return paymentMapper.adminPaymentList();
	}

	@Override
	public List<PaymentVO> stuPaymentList(StudentVO vo) {
		return paymentMapper.stuPaymentList(vo);
	}

	@Override
	public int fee(int depCd) {
		return paymentMapper.fee(depCd);
	}

	@Override
	public String depName(int depCd) {
		return paymentMapper.depName(depCd);
	}

	@Override
	public HashMap<String, Object> bill(int stuCd) {
		return paymentMapper.bill(stuCd);
	}

	@Override
	public List<HashMap<String, Object>> attendList() {
		return paymentMapper.attendList();
	}

	@Override
	public int insert(List<Map<String, Object>> param) {
		return paymentMapper.insert(param);
	}

	@Override
	public int pay(int payCd) {
		return paymentMapper.pay(payCd);
	}

	@Override
	public List<HashMap<String, Object>> params(List<Map<String, Object>> stuCd) {
		return paymentMapper.params(stuCd);
	}

	@Override
	public int billSch(int stuCd) {
		return paymentMapper.billSch(stuCd);
	}

	@Override
	public int billCount(int stuCd) {
		return paymentMapper.billCount(stuCd);
	}

	@Override
	public HashMap<String, Object> payDetail(HashMap<String,Integer>map) {
		return paymentMapper.payDetail(map);
	}

	@Override
	public List<HashMap<String, Object>> collegeFeeList() {
		return paymentMapper.collegeFeeList();
	}

	@Override
	public PaymentVO sumCollegeFee() {
		return paymentMapper.sumCollegeFee();
	}


}
