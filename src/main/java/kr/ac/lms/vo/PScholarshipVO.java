package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class PScholarshipVO {
	private int psclCd;
	private int stuCd;
	private int sclCd;
	private int psclSem;
	private Date psclDt;
	private String psclCon;
	private int psclYn;
	public int getPsclCd() {
		return psclCd;
	}
	public void setPsclCd(int psclCd) {
		this.psclCd = psclCd;
	}
	public int getStuCd() {
		return stuCd;
	}
	public void setStuCd(int stuCd) {
		this.stuCd = stuCd;
	}
	public int getSclCd() {
		return sclCd;
	}
	public void setSclCd(int sclCd) {
		this.sclCd = sclCd;
	}
	public int getPsclSem() {
		return psclSem;
	}
	public void setPsclSem(int psclSem) {
		this.psclSem = psclSem;
	}
	public Date getPsclDt() {
		return psclDt;
	}
	public void setPsclDt(Date psclDt) {
		this.psclDt = psclDt;
	}
	public String getPsclCon() {
		return psclCon;
	}
	public void setPsclCon(String psclCon) {
		this.psclCon = psclCon;
	}
	public int getPsclYn() {
		return psclYn;
	}
	public void setPsclYn(int psclYn) {
		this.psclYn = psclYn;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
