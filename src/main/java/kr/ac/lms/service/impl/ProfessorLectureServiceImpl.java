package kr.ac.lms.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.lms.mapper.ProfessorLectureMapper;
import kr.ac.lms.service.ProfessorLectureService;
import kr.ac.lms.vo.AttenadenceVO;
import kr.ac.lms.vo.LecApplyVO;
import kr.ac.lms.vo.LecDataVO;
import kr.ac.lms.vo.LecNoticeVO;
import kr.ac.lms.vo.MemberVO;
import kr.ac.lms.vo.StuLecVO;
import kr.ac.lms.vo.TaskSubmitVO;
import kr.ac.lms.vo.TaskVO;
import kr.ac.lms.vo.TestQVO;
import kr.ac.lms.vo.TestVO;
import kr.ac.lms.vo.WeekplanVO;

@Service
public class ProfessorLectureServiceImpl implements ProfessorLectureService {

	@Autowired
	ProfessorLectureMapper professorLectureMapper;
	
	// 교수 정보
	@Override
	public List<MemberVO> getPro() {
		return this.professorLectureMapper.getPro();
	}
	
	// 강의 정보 
	// int proCd
	@Override
	public List<LecApplyVO> getProLecList(Map<String, Object> map) {
		return this.professorLectureMapper.getProLecList(map);
	}
	
	// 교수 강의 목록 대시보드 > 학년 검색
	@Override
	public List<LecApplyVO> getLecaYr(int proCd) {
		return this.professorLectureMapper.getLecaYr(proCd);
	}
	
	// 교수 강의 목록 대시보드 > 학기 검색
	@Override
	public List<LecApplyVO> getLecaSem(Map<String, Object> lecaSemMap) {
		return this.professorLectureMapper.getLecaSem(lecaSemMap);
	}
	
	// 교수 강의실 이동
	@Override
	public LecApplyVO getProLecOne(Map<String, Object> map) {
		return this.professorLectureMapper.getProLecOne(map);
	}
	
	// 강의 공지사항 목록
	@Override
	public List<LecNoticeVO> lecNotList(int lecCd){
		return this.professorLectureMapper.lecNotList(lecCd);
	}
	
	// 강의 공지사항 상세
	@Override
	public LecNoticeVO lecNotDetail(int lntcCd) {
		return this.professorLectureMapper.lecNotDetail(lntcCd);
	}
	
	// 강의 공지사항 글쓰기
	@Override
	public int lecNotInsert(LecNoticeVO lecNoticeVO) {
		return this.professorLectureMapper.lecNotInsert(lecNoticeVO);
	}
	
	// 강의 공지사항 수정
	@Override
	public int lecNotUpdate(LecNoticeVO lecNoticeVO) {
		return this.professorLectureMapper.lecNotUpdate(lecNoticeVO);
	}
	
	// 강의 공지사항 삭제
	@Override
	public int lecNotDelete(int lntcCd) {
		return this.professorLectureMapper.lecNotDelete(lntcCd);
	}
	
	// 수업 계획서
	@Override
	public LecApplyVO getLecApply(int lecCd) {
		return this.professorLectureMapper.getLecApply(lecCd);
	}
	
	// 수업 계획서 > 주차별 강의 내용
	@Override
	public List<WeekplanVO> getWeekPlan(int lecaCd) {
		return this.professorLectureMapper.getWeekPlan(lecaCd);
		
	}
	
	// 퀴즈 게시판 조회
	@Override
	public List<TestVO> quizBoardList(int lecCd) {
		return this.professorLectureMapper.quizBoardList(lecCd);
	}
	
	// 퀴즈 상세 조회
	@Override
	public TestVO quizDetail(int testCd){
		return this.professorLectureMapper.quizDetail(testCd);
	}
	
	// 퀴즈 생성(null값으로)
	@Override
	public int quizInsert(TestVO testVO) {
		return this.professorLectureMapper.quizInsert(testVO);
	}
	
	// 퀴즈 생성(null인 값 update)
	@Override
	public int quizInsertUpdate(TestVO testVO) {
		return this.professorLectureMapper.quizInsertUpdate(testVO);
	}
	
	// 퀴즈 상세 생성
	//TestQVO [teqCd=0, testCd=35, teqNo=d, teqOp1=d, teqOp2=d, teqOp3=d, teqOp4=d, teqAnswer=3, rnum=0]
	@Override
	public int quizQInsert(List<TestQVO> testQVOList) {
		return this.professorLectureMapper.quizQInsert(testQVOList);
	}

	// 강의 자료실 조회
	@Override
	public List<LecDataVO> lecDataList(int lecCd) {
		return this.professorLectureMapper.lecDataList(lecCd);
	}

	// 강의 자료실 등록
	@Override
	public int lecDataInsert(LecDataVO lecDataVO) {
		return this.professorLectureMapper.lecDataInsert(lecDataVO);
	}

	// 강의 자료실 상세 조회
	@Override
	public LecDataVO lecDataDetail(int ldtCd) {
		return this.professorLectureMapper.lecDataDetail(ldtCd);
	}

	// 강의 자료실 상세 조회 > 이전글 다음글
	@Override
	public LecDataVO lecDataPreNext(int ldtCd) {
		return this.professorLectureMapper.lecDataPreNext(ldtCd);
	}

	// 강의 자료실 삭제
	@Override
	public int lecDataDelete(int ldtCd) {
		return this.professorLectureMapper.lecDataDelete(ldtCd);
	}

	// 강의 자료실 조회수 증가
	@Override
	public int lecDataHit(int ldtCd) {
		return this.professorLectureMapper.lecDataHit(ldtCd);
	}

	// 강의 자료실 수정
	@Override
	public int lecDataUpdate(LecDataVO lecDataVO) {
		return this.professorLectureMapper.lecDataUpdate(lecDataVO);
	}

	// 과제 및 평가 생성리스트 조회
	@Override
	public List<TaskVO> lecTaskList(int lecCd) {
		return this.professorLectureMapper.lecTaskList(lecCd);
	}

	// 과제 및 평가 생성
	@Override
	public int lecTaskInsert(TaskVO taskVO) {
		return this.professorLectureMapper.lecTaskInsert(taskVO);
	}

	// 과제 및 평가 상세
	@Override
	public TaskVO lecTaskDetail(int taskCd) {
		return this.professorLectureMapper.lecTaskDetail(taskCd);
	}

	// 과제 및 평가 이전글 다음글
	@Override
	public TaskVO lecTaskPreNext(int taskCd) {
		return this.professorLectureMapper.lecTaskPreNext(taskCd);
	}

	// 과제 및 평가 삭제(교수)
	@Override
	public int lecTaskDelete(int taskCd) {
		return this.professorLectureMapper.lecTaskDelete(taskCd);
	}

	// 과제 및 평가 수정(교수)
	@Override
	public int lecTaskUpdate(TaskVO taskVO) {
		return this.professorLectureMapper.lecTaskUpdate(taskVO);
	}

	// 과제 및 평가 제출리스트 조회
	@Override
	public TaskVO lecTaskStuList(int taskCd) {
		return this.professorLectureMapper.lecTaskStuList(taskCd);
	}

	// 과제 및 평가 학생 제출 조회
	@Override
	public TaskSubmitVO stuLecTaskDetail(Map<String, Object> map) {
		return this.professorLectureMapper.stuLecTaskDetail(map);
	}

	// 과제 및 평가 학생 점수 부여
	@Override
	public int stuLecTaskScoreUpdate(TaskSubmitVO taskSubmitVO) {
		return this.professorLectureMapper.stuLecTaskScoreUpdate(taskSubmitVO);
	}

	// 출결 > 수강생 정보 조회
	@Override
	public List<MemberVO> attendanceStuInform(int lecCd) {
		return this.professorLectureMapper.attendanceStuInform(lecCd);
	}

	// 출결 > 수강생 정보 상세 조회
	@Override
	public MemberVO attendanceStuDetail(Map<String, Object> map) {
		return this.professorLectureMapper.attendanceStuDetail(map);
	}

	// 출결 > 수강생별 cnt 조회
	@Override
	public AttenadenceVO attendanceCnt(Map<String, Object> map) {
		return this.professorLectureMapper.attendanceCnt(map);
	}

	// 출결 > 수강생별 출결 상세 조회
	@Override
	public List<AttenadenceVO> attendStuDetail(Map<String, Object> map) {
		return this.professorLectureMapper.attendStuDetail(map);
	}

	// 출결 > 수강생별 출결 등록
	@Override
	public int attendStuInsert(AttenadenceVO attenadenceVO) {
		return this.professorLectureMapper.attendStuInsert(attenadenceVO);
	}

	// 출결 > 출결 insert 확인 cnt
	@Override
	public int attenChkCnt(Map<String, Object> map) {
		return this.professorLectureMapper.attenChkCnt(map);
	}

	// 출결 > 출결 update
	@Override
	public int attendStuUpdate(AttenadenceVO attenadenceVO) {
		return this.professorLectureMapper.attendStuUpdate(attenadenceVO);
	}

	// 성적 학생 리스트
	@Override
	public List<MemberVO> getTotalScoreList(Map<String, Object> map) {
		return this.professorLectureMapper.getTotalScoreList(map);
	}

	// 성적 학생 상세 
	@Override
	public List<MemberVO> getTotalScoreDetail(Map<String, Object> map) {
		return this.professorLectureMapper.getTotalScoreDetail(map);
	}

	// 성적 학생 총점
	@Override
	public MemberVO getStuScoreAndMaxScore(Map<String, Object> map) {
		return this.professorLectureMapper.getStuScoreAndMaxScore(map);
	}

	// 성정 등급 부여
	@Override
	public int stuGradeUpdate(StuLecVO stuLecVO) {
		return this.professorLectureMapper.stuGradeUpdate(stuLecVO);
	}

	// 공지사항 조회수
	@Override
	public int lecNotHit(int lntcCd) {
		return this.professorLectureMapper.lecNotHit(lntcCd);
	}

	// 퀴즈 단순 삭제
	@Override
	public int quizDelete(int testCd) {
		return this.professorLectureMapper.quizDelete(testCd);
	}

	
	
}
