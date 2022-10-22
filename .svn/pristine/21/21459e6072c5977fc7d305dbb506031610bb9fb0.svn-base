package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.fasterxml.jackson.annotation.JsonFormat;

public class NotificationVO {
	private int ntfCd;
	private int memCd;
	private String ntfCon;
   @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date ntfTm;
	private int ntfYn;
	private String ntfUrl;
	
	public int getNtfCd() {
		return ntfCd;
	}
	public void setNtfCd(int ntfCd) {
		this.ntfCd = ntfCd;
	}
	public int getMemCd() {
		return memCd;
	}
	public void setMemCd(int memCd) {
		this.memCd = memCd;
	}
	public String getNtfCon() {
		return ntfCon;
	}
	public void setNtfCon(String ntfCon) {
		this.ntfCon = ntfCon;
	}
	public Date getNtfTm() {
		return ntfTm;
	}
	public void setNtfTm(Date ntfTm) {
		this.ntfTm = ntfTm;
	}
	public int getNtfYn() {
		return ntfYn;
	}
	public void setNtfYn(int ntfYn) {
		this.ntfYn = ntfYn;
	}
	public String getNtfUrl() {
		return ntfUrl;
	}
	public void setNtfUrl(String ntfUrl) {
		this.ntfUrl = ntfUrl;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
