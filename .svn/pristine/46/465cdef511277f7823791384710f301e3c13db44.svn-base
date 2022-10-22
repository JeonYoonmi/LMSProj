package kr.ac.lms.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.ObjectionVO;

public interface TotalGradeService {

	//개인정보 가져오기
	public MemberVO getInfo(int memCd);

	//년도 및 학기 가져오기
	public List<LecApplyVO> getYrNSem(Map<String, Object> map);

	//전체 성적 가져오기
	public List<LecApplyVO> getList(Map<String, Object> map);
	
	//현재 년도, 학기 가져오기
	public Map<String, Object> getNow();
	
	//성적 건수 가져오기
	public int getCnt(Map<String, Object> map);
	
	//현재 학기 성적 불러오기
	public List<LecApplyVO> getPreList(Map<String, Object> map);
	
	//전체 성적 불러오기
	public Map<String, Object> getTgrade(Map<String, Object> map);
	
	//신청학점 불러오기
	public int getTcnt(Map<String, Object> map);
	
	//강의정보 불러오기
	public LecApplyVO getCourseInfo(int lecaCd);
	
	//이의신청 여부 확인하기
	public ObjectionVO checkObjection(Map<String, Object> map);
	
	//이의신청하기
	public int insertObjection(ObjectionVO objectionVO);
	
	//사진 가져오기
	public String getPhoto(int memCd);
	
	/**
	 * 성적 이의 신청 리스트 출력(교수)
	 * @param proCd
	 * @return
	 */
	public List<ObjectionVO> objectionList(int proCd);

	/**
	 * 성적 이의 신청 상세 정보 출력(교수)
	 * @param objCd
	 * @return
	 */
	public ObjectionVO objDetail(int objCd);
	
	//포틀릿용 성적 조회 - 년도 및 학기 불러오기
	public List<LecApplyVO> ptlYrNSem(int memCd);
	
	//포틀릿용 성적 조회 - 해당 년도 및 학기의 성적 정보 리스트 불러오기
	public List<LecApplyVO> ptlList(Map<String, Object> map);
	
	//포틀릿용 학점 조회 - 신청 학점, 취득 학점 불러오기
	public Map<String, Object> ptlGet(Map<String, Object> map);

	/**
	 * 성적 이의 신청 승인
	 * @param objectionVO
	 * @return
	 */
	public int updateY(ObjectionVO objectionVO);
	
	/**
	 * 성적 이의 신청 반려
	 * @param objectionVO
	 * @return
	 */
	public int updateN(ObjectionVO objectionVO);
	
	//성적 도넛 차트로 보여주기
	public JSONObject doughnut(int memCd);
	
	//성적 도넛 차트로 보여주기 2
	public Map<String, Object> getDoughnut(int memCd);
	
	//학과별 취득학점 가져오기
	public int getDepSum(int memCd);
	
	//포틀릿용 시간표 조회
	public List<LecApplyVO> ptlTimeTable(Map<String, Object> map);
}
