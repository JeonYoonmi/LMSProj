package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QnaReplyVO {
	private int qnaCd;
	private String qnarCon;
	
	@DateTimeFormat(pattern = "yyyymmdd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date qnarDt;
	
	
	public int getQnaCd() {
		return qnaCd;
	}
	public void setQnaCd(int qnaCd) {
		this.qnaCd = qnaCd;
	}
	public String getQnarCon() {
		return qnarCon;
	}
	public void setQnarCon(String qnarCon) {
		this.qnarCon = qnarCon;
	}
	public Date getQnarDt() {
		return qnarDt;
	}
	public void setQnarDt(Date qnarDt) {
		this.qnarDt = qnarDt;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
