package kr.ac.lms.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class SubjectVO {
	private int subCd;
	private String subNm;
	public int getSubCd() {
		return subCd;
	}
	public void setSubCd(int subCd) {
		this.subCd = subCd;
	}
	public String getSubNm() {
		return subNm;
	}
	public void setSubNm(String subNm) {
		this.subNm = subNm;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
