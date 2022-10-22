package kr.ac.lms.vo;

import java.util.Date;

import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

public class TestVO {
	private int testCd;
	private int lecCd;
	private String testNm;
	private String testCon;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date testReg;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date testSt;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date testEt;
	
	// 수원
	private int rnum;
	private StuTestVO stuTestVO;
	private List<TestQVO> testQVOList;
	private List<TestDetailVO> testDetailVOList;
	private int stScore;
	
	public int getStScore() {
		return stScore;
	}
	public void setStScore(int stScore) {
		this.stScore = stScore;
	}
	public List<TestDetailVO> getTestDetailVOList() {
		return testDetailVOList;
	}
	public void setTestDetailVOList(List<TestDetailVO> testDetailVOList) {
		this.testDetailVOList = testDetailVOList;
	}
	public StuTestVO getStuTestVO() {
		return stuTestVO;
	}
	public void setStuTestVO(StuTestVO stuTestVO) {
		this.stuTestVO = stuTestVO;
	}
	
	public List<TestQVO> getTestQVOList() {
		return testQVOList;
	}
	public void setTestQVOList(List<TestQVO> testQVOList) {
		this.testQVOList = testQVOList;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getTestCd() {
		return testCd;
	}
	public void setTestCd(int testCd) {
		this.testCd = testCd;
	}
	public int getLecCd() {
		return lecCd;
	}
	public void setLecCd(int lecCd) {
		this.lecCd = lecCd;
	}
	public String getTestNm() {
		return testNm;
	}
	public void setTestNm(String testNm) {
		this.testNm = testNm;
	}
	public String getTestCon() {
		return testCon;
	}
	public void setTestCon(String testCon) {
		this.testCon = testCon;
	}
	public Date getTestReg() {
		return testReg;
	}
	public void setTestReg(Date testReg) {
		this.testReg = testReg;
	}
	public Date getTestSt() {
		return testSt;
	}
	public void setTestSt(Date testSt) {
		this.testSt = testSt;
	}
	public Date getTestEt() {
		return testEt;
	}
	public void setTestEt(Date testEt) {
		this.testEt = testEt;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
