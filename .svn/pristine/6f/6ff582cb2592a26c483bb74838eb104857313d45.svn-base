package kr.ac.lms.vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

public class StuTestVO {
	private int stCd;
	private int testCd;
	private int lecCd;
	private int stuCd;
	private int stScore;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date stDt;
	
	private List<TestDetailVO> TestDetailVOList;

	public int getStCd() {
		return stCd;
	}

	public void setStCd(int stCd) {
		this.stCd = stCd;
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

	public int getStuCd() {
		return stuCd;
	}

	public void setStuCd(int stuCd) {
		this.stuCd = stuCd;
	}

	public int getStScore() {
		return stScore;
	}

	public void setStScore(int stScore) {
		this.stScore = stScore;
	}

	public Date getStDt() {
		return stDt;
	}

	public void setStDt(Date stDt) {
		this.stDt = stDt;
	}

	public List<TestDetailVO> getTestDetailVOList() {
		return TestDetailVOList;
	}

	public void setTestDetailVOList(List<TestDetailVO> testDetailVOList) {
		TestDetailVOList = testDetailVOList;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
