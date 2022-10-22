package kr.ac.lms.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class StuLecVO {
	private int lecCd;
	private int stuCd;
	private String slScore;
	
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
	public String getSlScore() {
		return slScore;
	}
	public void setSlScore(String slScore) {
		this.slScore = slScore;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
