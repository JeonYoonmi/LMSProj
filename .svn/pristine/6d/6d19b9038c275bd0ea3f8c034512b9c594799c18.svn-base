package kr.ac.lms.mapper;

import java.util.List;

import kr.ac.lms.vo.ScheduleVO;

public interface ScheduleMapper {
	//개인일정 조회
	public List<ScheduleVO> allSchedule(int memCd);
	//개인일정 등록
	public int insert(ScheduleVO vo);
	//개인일정 삭제
	public int delete(int schCd);
	//개인일정 내용,시간 가져오기
	public ScheduleVO findCon(int schCd);
	//개인일정 제목, 내용, 시간, 색 바꾸기
	public int updateCon(ScheduleVO vo);
	//시퀀스 다음번호 조회
	public int findSeq();
	//포틀릿용 미니캘린더
	public List<ScheduleVO>miniCal(int memCd);
	//포틀릿용 투두리스트
	public List<ScheduleVO>toDo(int memCd);
	//포틀릿용 위클리
	public List<ScheduleVO>weekCal(int memCd);
	//투두리스트 체크업데이트
	public int todoCheck(ScheduleVO vo);
}
