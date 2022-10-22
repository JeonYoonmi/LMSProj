package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.commons.validator.GenericValidator;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.util.HtmlUtils;

public class TaskSubmitVO {
	private int tsubCd;
	private int taskCd;
	private int lecCd;
	private int stuCd;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date tsubDt;
	private String tsubCon;
	private String tsubFnm;
	private int tsubScore;
	
	// 수원
	private String memNm;
	private int rnum;
	
	public String getTsubConDisplay() {
		String result = null;
		if(!GenericValidator.isBlankOrNull(this.tsubCon)) {
			result = HtmlUtils.htmlUnescape(this.tsubCon);
		}
		return result;
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public int getTsubCd() {
		return tsubCd;
	}
	public void setTsubCd(int tsubCd) {
		this.tsubCd = tsubCd;
	}
	public int getTaskCd() {
		return taskCd;
	}
	public void setTaskCd(int taskCd) {
		this.taskCd = taskCd;
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
	public Date getTsubDt() {
		return tsubDt;
	}
	public void setTsubDt(Date tsubDt) {
		this.tsubDt = tsubDt;
	}
	public String getTsubCon() {
		return tsubCon;
	}
	public void setTsubCon(String tsubCon) {
		this.tsubCon = tsubCon;
	}
	public String getTsubFnm() {
		return tsubFnm;
	}
	public void setTsubFnm(String tsubFnm) {
		this.tsubFnm = tsubFnm;
	}
	public int getTsubScore() {
		return tsubScore;
	}
	public void setTsubScore(int tsubScore) {
		this.tsubScore = tsubScore;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
