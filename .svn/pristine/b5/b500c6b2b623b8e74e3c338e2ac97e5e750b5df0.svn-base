package kr.ac.lms.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.CollegeVO;
import kr.ac.lms.vo.PaymentVO;
import kr.ac.lms.vo.StudentVO;

public interface PaymentMapper {

//관리자의 등록금 납부여부 조회 
public List<HashMap<String, Object>> adminPaymentList();
//학생의 등록금 납부내역 조회
public List<PaymentVO> stuPaymentList(StudentVO vo);
//학부 등록금 가져오기
public int fee (int depCd);
//등록금 고지서 출력시 가져올 장학금 조회 
public int billSch(int stuCd);
//학과 명 가져오기
public String depName (int depCd);
//등록금 고지서
public HashMap<String,Object> bill(int stuCd);
//등록금 부여할 재학생 리스트 가져오기
public List<HashMap<String, Object>> attendList();
//등록금 고지하기
public int insert(List<Map<String, Object>> param);
//등록금 카드결제하기
public int pay(int payCd);
//등록금 고지시 파라미터 가져오기
public List<HashMap<String,Object>> params(List<Map<String, Object>> stuCd);
//등록금 납부여부 체크
public int billCount(int stuCd);
//해당 학기의 학생 등록금 납부증명서 상세내역
public HashMap<String,Object> payDetail(HashMap<String,Integer>map);
//등록금 리스트
public List<HashMap<String,Object>>collegeFeeList();
//올해 납부되어야 할 등록금 총액과 현재 납부된 등록금 총액 불러오기
public PaymentVO sumCollegeFee();
}
