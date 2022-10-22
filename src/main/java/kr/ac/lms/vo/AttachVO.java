package kr.ac.lms.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class AttachVO {
	private int attachCd;
	private String attachNm;
	private String attachPt;
	private String attachTm;
	
	public int getAttachCd() {
		return attachCd;
	}
	public void setAttachCd(int attachCd) {
		this.attachCd = attachCd;
	}
	public String getAttachNm() {
		return attachNm;
	}
	public void setAttachNm(String attachNm) {
		this.attachNm = attachNm;
	}
	public String getAttachPt() {
		return attachPt;
	}
	public void setAttachPt(String attachPt) {
		this.attachPt = attachPt;
	}
	public String getAttachTm() {
		return attachTm;
	}
	public void setAttachTm(String attachTm) {
		this.attachTm = attachTm;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	
}
