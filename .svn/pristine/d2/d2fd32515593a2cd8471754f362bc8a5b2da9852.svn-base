package kr.ac.lms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.QnaMapper;
import kr.ac.lms.service.QnaService;
import kr.ac.lms.vo.QnaVO;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired
	QnaMapper qnaMapper;
	
	public int insertQ(HashMap<String,Object> map) {
		return this.qnaMapper.insertQ(map);
	}
	

	//문의게시판/검색결과 리스트 출력
	public List<QnaVO> list(Map<String, String> map){
		return this.qnaMapper.list(map);
	}

	@Override
	public QnaVO detail(HashMap<String,Object> map) {
		increaseHit(map);
		return this.qnaMapper.detail(map);
	}

	//댓글등록
	@Override
	public int qnarWrite(HashMap<String, Object> map) {
		return this.qnaMapper.qnarWrite(map);
	}


	@Override
	public int increaseHit(HashMap<String, Object> map) {
		return this.qnaMapper.increaseHit(map);
	}
	
	//답변 수정
	@Override
	public int updateRepl(HashMap<String, Object> map) {
		return this.qnaMapper.updateRepl(map);
	}
	
	//게시글 수정
	public int updateQ(HashMap<String,Object> map) {
		return this.qnaMapper.updateQ(map);
	}
	
	//게시글 삭제
	@Override
	public int deleteQ(int qnaCd) {
		this.qnaMapper.deleteQrepl(qnaCd);
		return this.qnaMapper.deleteQ(qnaCd);
	}


	@Override
	public int getTotal(Map<String, String> map) {
		return this.qnaMapper.getTotal(map);
	}
	
}
