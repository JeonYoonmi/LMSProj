package kr.ac.lms.service;

import java.util.List;
import java.util.Map;

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

public interface ProfessorLectureService {

	// 교수 통합 정보
	public List<MemberVO> getPro();

	// 교수 강의 대시보드
	// int proCd
	public List<LecApplyVO> getProLecList(Map<String, Object> map);
	
	// 강의 공지사항 목록
	public List<LecNoticeVO> lecNotList(int lecCd);

	// 강의 목록 > 년도 검색
	public List<LecApplyVO> getLecaYr(int proCd);
	
	// 강의 목록 > 학기 검색
	public List<LecApplyVO> getLecaSem(Map<String, Object> lecaSemMap);
	
	// 교수 강의실 이동
	public LecApplyVO getProLecOne(Map<String, Object> map);

	// 강의 자료실 조회수 증가
	public int lecNotHit(int lntcCd);
	
	// 강의 공지사항 상세
	public LecNoticeVO lecNotDetail(int lntcCd);

	// 강의 공지사항 등록
	public int lecNotInsert(LecNoticeVO lecNoticeVO);

	// 강의 공지사항 수정
	public int lecNotUpdate(LecNoticeVO lecNoticeVO);

	// 강의 공지사항 삭제
	public int lecNotDelete(int lntcCd);

	// 수업 계획서
	public LecApplyVO getLecApply(int lecCd);
	
	// 수업 계획서 > 주차별 강의 내용
	public List<WeekplanVO> getWeekPlan(int lecaCd);

	// 퀴즈 게시판 조회
	public List<TestVO> quizBoardList(int lecCd);

	// 교수 퀴즈 상세 조회
	public TestVO quizDetail(int testCd);

	// 퀴즈 생성(null로 insert)
	public int quizInsert(TestVO testVO);

	// 퀴즈 생성(null값을 update)
	public int quizInsertUpdate(TestVO testVO);

	// 퀴즈 상세 생성
	public int quizQInsert(List<TestQVO> testQVOList);

	// 자료 게시판 조회
	public List<LecDataVO> lecDataList(int lecCd);
	
	// 강의 자료실 등록
	public int lecDataInsert(LecDataVO lecDataVO);
	
	// 강의 자료실 상세 조회
	public LecDataVO lecDataDetail(int ldtCd);
	
	// 강의 자료실 조회수 증가
	public int lecDataHit(int ldtCd);
	
	// 강의 자료실 상세 조회 > 이전글 다음글
	public LecDataVO lecDataPreNext(int ldtCd);
	
	// 강의 자료실 삭제
	public int lecDataDelete(int ldtCd);
	
	// 강의 자료실 수정
	public int lecDataUpdate(LecDataVO lecDataVO);
	
	// 과제 및 평가 생성리스트 조회
	public List<TaskVO> lecTaskList(int lecCd);
	
	// 과제 및 평가 생성
	public int lecTaskInsert(TaskVO taskVO);
	
	// 과제 및 평가 상세보기
	public TaskVO lecTaskDetail(int taskCd);
	
	// 과제 및 평가 이전글다음글
	public TaskVO lecTaskPreNext(int taskCd);
	
	// 과제 및 평가 삭제
	public int lecTaskDelete(int taskCd);
	
	// 과제 및 평가 수정(교수)
	public int lecTaskUpdate(TaskVO taskVO);
	
	// 과제 및 평가 학생 과제 제출 조회
	public TaskVO lecTaskStuList(int taskCd);
	
	// 과제 및 평가 학생 제출 상세 조회
	public TaskSubmitVO stuLecTaskDetail(Map<String, Object> map);
	
	// 과제 및 평가 학생 점수 부여
	public int stuLecTaskScoreUpdate(TaskSubmitVO taskSubmitVO);
	
	// 출결 > 수강생 정보 조회
	public List<MemberVO> attendanceStuInform(int lecCd);
	
	// 출결 > 수강생 정보 상세 조회
	public MemberVO attendanceStuDetail(Map<String, Object> map);
	
	// 출결 > 수강생 별 출결 cnt 조회
	public AttenadenceVO attendanceCnt(Map<String, Object> map);
	
	// 출결 > 수강생 별 출결 상세 현황 조회
	public List<AttenadenceVO> attendStuDetail(Map<String, Object> map);
	
	// 출결 > 수강생별 출결 등록
	public int attendStuInsert(AttenadenceVO attenadenceVO);
	
	// 출결 > 출결 insert 확인 cnt
	public int attenChkCnt(Map<String, Object> map);
	
	// 출결 > 출결 update
	public int attendStuUpdate(AttenadenceVO attenadenceVO);
	
	// 성적 학생 리스트 조회
	public List<MemberVO> getTotalScoreList(Map<String, Object> map);
	
	// 성적 학생 상세 조회
	public List<MemberVO> getTotalScoreDetail(Map<String, Object> map);
	
	// 성적 학생 총점
	public MemberVO getStuScoreAndMaxScore(Map<String, Object> map);
	
	// 학생 성적 등급 부여
	public int stuGradeUpdate(StuLecVO stuLecVO);
	
	// 퀴즈 단순 삭제
	public int quizDelete(int testCd);

}
