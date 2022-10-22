package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

public class RecordVO {
	private int recCd;
	private int stuCd;
	private String recCate;
	private int recYr;
	private int recSem;
	private int recPer;
	private String recRsn;
	@DateTimeFormat(pattern = "yyyymmdd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",  timezone = "Asia/Seoul")
	private Date recDt; // 신청 일시
	private int recYn;
	private String recNrsn;
	
	private int rnum;
	private String comdNm;
	private int cnt;
	private int rownum;
	private int year;
	private int hak;
	private String endExpect;
	
	// 필요한 변수 추가(윤미)
	// 신청 년도 + 학기
	private String recYrnsem;
	// 승인 여부
	private String trecTn;
	
	// 신청 일자
	private String recDts;
	
	// 학생정보
	private MemberVO memberVO;

	public int getRecCd() {
		return recCd;
	}

	public void setRecCd(int recCd) {
		this.recCd = recCd;
	}

	public int getStuCd() {
		return stuCd;
	}

	public void setStuCd(int stuCd) {
		this.stuCd = stuCd;
	}

	public String getRecCate() {
		return recCate;
	}

	public void setRecCate(String recCate) {
		this.recCate = recCate;
	}

	public int getRecYr() {
		return recYr;
	}

	public void setRecYr(int recYr) {
		this.recYr = recYr;
	}

	public int getRecSem() {
		return recSem;
	}

	public void setRecSem(int recSem) {
		this.recSem = recSem;
	}

	public int getRecPer() {
		return recPer;
	}

	public void setRecPer(int recPer) {
		this.recPer = recPer;
	}

	public String getRecRsn() {
		return recRsn;
	}

	public void setRecRsn(String recRsn) {
		this.recRsn = recRsn;
	}

	public Date getRecDt() {
		return recDt;
	}

	public void setRecDt(Date recDt) {
		this.recDt = recDt;
	}

	public int getRecYn() {
		return recYn;
	}

	public void setRecYn(int recYn) {
		this.recYn = recYn;
	}

	public String getRecNrsn() {
		return recNrsn;
	}

	public void setRecNrsn(String recNrsn) {
		this.recNrsn = recNrsn;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getComdNm() {
		return comdNm;
	}

	public void setComdNm(String comdNm) {
		this.comdNm = comdNm;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getHak() {
		return hak;
	}

	public void setHak(int hak) {
		this.hak = hak;
	}

	public String getEndExpect() {
		return endExpect;
	}

	public void setEndExpect(String endExpect) {
		this.endExpect = endExpect;
	}

	public String getRecYrnsem() {
		return recYrnsem;
	}

	public void setRecYrnsem(String recYrnsem) {
		this.recYrnsem = recYrnsem;
	}

	public String getTrecTn() {
		return trecTn;
	}

	public void setTrecTn(String trecTn) {
		this.trecTn = trecTn;
	}

	public String getRecDts() {
		return recDts;
	}

	public void setRecDts(String recDts) {
		this.recDts = recDts;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}