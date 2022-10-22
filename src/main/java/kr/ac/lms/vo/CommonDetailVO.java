package kr.ac.lms.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class CommonDetailVO {

	private String comdCd;
	private String comCd;
	private String comdNm;
	private String comdCon;
	
	public String getComdCd() {
		return comdCd;
	}
	public void setComdCd(String comdCd) {
		this.comdCd = comdCd;
	}
	public String getComCd() {
		return comCd;
	}
	public void setComCd(String comCd) {
		this.comCd = comCd;
	}
	public String getComdNm() {
		return comdNm;
	}
	public void setComdNm(String comdNm) {
		this.comdNm = comdNm;
	}
	public String getComdCon() {
		return comdCon;
	}
	public void setComdCon(String comdCon) {
		this.comdCon = comdCon;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
