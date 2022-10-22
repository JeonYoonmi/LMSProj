package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

public class ApprovalVO {

	private int apprCd;
	private String apprMem;
	@DateTimeFormat(pattern = "yyyymmdd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date apprDt;
	private int apprYn;
	private String apprRsn;
	private int apprCate;
	@DateTimeFormat(pattern = "yyyymmdd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date apprAdt;
	
	//임의로 컬럼 추가(가은)
	private String apprYnYn;
	private String apprGubun;
	
	/**
	 * 결재 신청 건수
	 */
	private int apprCnty;
	
	/**
	 * 결재 완료 건수
	 */
	private int apprCntn;
	
	public int getApprCd() {
		return apprCd;
	}
	public void setApprCd(int apprCd) {
		this.apprCd = apprCd;
	}
	public String getApprMem() {
		return apprMem;
	}
	public void setApprMem(String apprMem) {
		this.apprMem = apprMem;
	}
	public Date getApprDt() {
		return apprDt;
	}
	public void setApprDt(Date apprDt) {
		this.apprDt = apprDt;
	}
	public int getApprYn() {
		return apprYn;
	}
	public void setApprYn(int apprYn) {
		this.apprYn = apprYn;
	}
	public String getApprRsn() {
		return apprRsn;
	}
	public void setApprRsn(String apprRsn) {
		this.apprRsn = apprRsn;
	}
	public int getApprCate() {
		return apprCate;
	}
	public void setApprCate(int apprCate) {
		this.apprCate = apprCate;
	}
	public Date getApprAdt() {
		return apprAdt;
	}
	public void setApprAdt(Date apprAdt) {
		this.apprAdt = apprAdt;
	}
	public String getApprYnYn() {
		return apprYnYn;
	}
	public void setApprYnYn(String apprYnYn) {
		this.apprYnYn = apprYnYn;
	}
	public String getApprGubun() {
		return apprGubun;
	}
	public void setApprGubun(String apprGubun) {
		this.apprGubun = apprGubun;
	}
	
	public int getApprCnty() {
		return apprCnty;
	}
	public void setApprCnty(int apprCnty) {
		this.apprCnty = apprCnty;
	}
	public int getApprCntn() {
		return apprCntn;
	}
	public void setApprCntn(int apprCntn) {
		this.apprCntn = apprCntn;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
