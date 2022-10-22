package kr.ac.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.TotalGradeMapper;
import kr.ac.lms.service.TotalGradeService;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.ObjectionVO;

@Service
public class TotalGradeServiceImpl implements TotalGradeService{

	@Autowired
	TotalGradeMapper totalGradeMapper;
	
	//개인정보 가져오기
	@Override
	public MemberVO getInfo(int memCd) {
		return this.totalGradeMapper.getInfo(memCd);
	}
	
	//년도 및 학기 가져오기
	@Override
	public List<LecApplyVO> getYrNSem(Map<String, Object> map) {
		return this.totalGradeMapper.getYrNSem(map);
	}
	
	//전체 성적 불러오기
	@Override
	public List<LecApplyVO> getList(Map<String, Object> map) {
		return this.totalGradeMapper.getList(map);
	}
	
	//현재 년도, 학기 가져오기
	@Override
	public Map<String, Object> getNow() {
		return this.totalGradeMapper.getNow();
	}

	//성적 건수 가져오기
	@Override
	public int getCnt(Map<String, Object> map) {
		return this.totalGradeMapper.getCnt(map);
	}

	//현재 학기 성적 불러오기
	@Override
	public List<LecApplyVO> getPreList(Map<String, Object> map) {
		return this.totalGradeMapper.getPreList(map);
	}

	//전체 성적 불러오기
	@Override
	public Map<String, Object> getTgrade(Map<String, Object> map) {
		return this.totalGradeMapper.getTgrade(map);
	}

	//신청학점 불러오기
	@Override
	public int getTcnt(Map<String, Object> map) {
		return this.totalGradeMapper.getTcnt(map);
	}

	//강의정보 불러오기
	@Override
	public LecApplyVO getCourseInfo(int lecaCd) {
		return this.totalGradeMapper.getCourseInfo(lecaCd);
	}

	//이의신청 여부 확인하기
	@Override
	public ObjectionVO checkObjection(Map<String, Object> map) {
		return this.totalGradeMapper.checkObjection(map);
	}

	//이의신청하기
	@Override
	public int insertObjection(ObjectionVO objectionVO) {
		return this.totalGradeMapper.insertObjection(objectionVO);
	}

	//사진 가져오기
	@Override
	public String getPhoto(int memCd) {
		return this.totalGradeMapper.getPhoto(memCd);
	}

	/**
	 * 성적 이의 신청 리스트 출력(교수)
	 */
	@Override
	public List<ObjectionVO> objectionList(int proCd) {
		return this.totalGradeMapper.objectionList(proCd);
	}

	/**
	 * 성적 이의 신청 상세 정보 출력(교수)
	 */
	@Override
	public ObjectionVO objDetail(int objCd) {
		return this.totalGradeMapper.objDetail(objCd);
	}

	/**
	 * 성적 이의 신청 승인
	 */
	@Override
	public int updateY(ObjectionVO objectionVO) {
		return this.totalGradeMapper.updateY(objectionVO);
	}

	/**
	 * 성적 이의신청 반혀
	 */
	@Override
	public int updateN(ObjectionVO objectionVO) {
		return this.totalGradeMapper.updateN(objectionVO);
	}

	//포틀릿용 성적 조회 - 년도 및 학기 불러오기
	@Override
	public List<LecApplyVO> ptlYrNSem(int memCd) {
		return this.totalGradeMapper.ptlYrNSem(memCd);
	}

	//포틀릿용 성적 조회 - 해당 년도 및 학기의 성적 정보 리스트 불러오기
	@Override
	public List<LecApplyVO> ptlList(Map<String, Object> map) {
		return this.totalGradeMapper.ptlList(map);
	}

	//포틀릿용 학점 조회 - 신청 학점, 취득 학점 불러오기
	@Override
	public Map<String, Object> ptlGet(Map<String, Object> map) {
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int total = this.totalGradeMapper.ptlGetTotal(map);
		int totalNotF = this.totalGradeMapper.ptlGetTotalNotF(map);
		
		returnMap.put("total", total);
		returnMap.put("totalNotF", totalNotF);
		
		return returnMap;
	}

	//성적 도넛 차트로 보여주기
	public JSONObject doughnut(int memCd) {

		//학점이 들어있는 map
		Map<String, Object> map =  this.totalGradeMapper.doughnut(memCd);
		
		//리턴할 json 객체
		JSONObject data = new JSONObject();
		
		//json 컬럼 객체
		JSONObject col1 = new JSONObject();
		JSONObject col2 = new JSONObject();
		JSONObject col3 = new JSONObject();
		JSONObject col4 = new JSONObject();
		JSONObject col5 = new JSONObject();
		col1.put("label", "이수구분");
		col1.put("type", "string");
		col2.put("label", "전필");
		col2.put("type", "number");
		col3.put("label", "전선");
		col3.put("type", "number");
		col4.put("label", "교필");
		col4.put("type", "number");
		col5.put("label", "교선");
		col5.put("type", "number");
		
		//json 배열 객체
		JSONArray title = new JSONArray();
		title.add(col1);
		title.add(col2);
		title.add(col3);
		title.add(col4);
		title.add(col5);
		
		data.put("cols", title);
		
		JSONArray body = new JSONArray();
		
		JSONObject gubun = new JSONObject();
		gubun.put("v", "취득학점");
		JSONObject jp = new JSONObject();
		jp.put("v", map.get("JP"));
		JSONObject js = new JSONObject();
		js.put("v", map.get("JS"));
		JSONObject gp = new JSONObject();
		gp.put("v", map.get("GP"));
		JSONObject gs = new JSONObject();
		gs.put("v", map.get("GS"));
		
		JSONArray row = new JSONArray();
		row.add(gubun);
		row.add(jp);
		row.add(js);
		row.add(gp);
		row.add(gs);
		
		JSONObject cell = new JSONObject();
		cell.put("c", row);
		body.add(cell);
		
		data.put("rows", body);
		
		return data;
	}
	
	//성적 도넛 차트로 보여주기 2
	public Map<String, Object> getDoughnut(int memCd) {
		return totalGradeMapper.doughnut(memCd);
	}

	//학과별 취득학점 가져오기
	@Override
	public int getDepSum(int memCd) {
		return this.totalGradeMapper.getDepSum(memCd);
	}

	//포틀릿용 시간표 조회
	@Override
	public List<LecApplyVO> ptlTimeTable(Map<String, Object> map) {
		return this.totalGradeMapper.ptlTimeTable(map);
	}
}
