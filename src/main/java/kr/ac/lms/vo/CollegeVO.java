package kr.ac.lms.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class CollegeVO {

	private int colCd;
	private String colNm;
	private int colCrd;
	private int colFee;
	
	public int getColCd() {
		return colCd;
	}
	public void setColCd(int colCd) {
		this.colCd = colCd;
	}
	public String getColNm() {
		return colNm;
	}
	public void setColNm(String colNm) {
		this.colNm = colNm;
	}
	public int getColCrd() {
		return colCrd;
	}
	public void setColCrd(int colCrd) {
		this.colCrd = colCrd;
	}
	public int getColFee() {
		return colFee;
	}
	public void setColFee(int colFee) {
		this.colFee = colFee;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
