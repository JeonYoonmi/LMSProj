package kr.ac.lms.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.lms.vo.QnaVO;

public interface QnaMapper {
	
	//문의게시판 등록
	public int insertQ(HashMap<String,Object> map);
	
	
	//문의게시판/검색결과 리스트 출력
	public List<QnaVO> list(Map<String, String> map);
	
	public QnaVO detail(HashMap<String,Object> map);
	
	//답변등록
	public int qnarWrite(HashMap<String,Object> map);
	
	//조회수 증가
	public int increaseHit(HashMap<String,Object>map);
	
	//답변 수정
	public int updateRepl(HashMap<String,Object>map);
	
	//게시글 수정
	public int updateQ(HashMap<String,Object> map);
	
	//게시글 삭제
	public int deleteQrepl(int qnaCd);
	
	public int deleteQ(int qnaCd);
	
	public int getTotal(Map<String, String> map);
}
