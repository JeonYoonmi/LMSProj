package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.commons.validator.GenericValidator;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.util.HtmlUtils;

@Validated
public class LecNoticeVO {
	private int lntcCd;
	private int lecCd;
	@NotBlank
	private String lntcTtl;
	@NotBlank
	private String lntcCon;
	private Date lntcReg;
	private Date lntcUpd;
	private int rnum;
	private int lntcHit;
	
	public String getLntcConDisplay() {
		String result = null;
		if(!GenericValidator.isBlankOrNull(this.lntcCon)) {
			result = HtmlUtils.htmlUnescape(this.lntcCon);
		}
		return result;
	}
	
	public int getlntcHit() {
		return lntcHit;
	}
	public void setlntcHit(int lntcHit) {
		this.lntcHit = lntcHit;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getLntcCd() {
		return lntcCd;
	}
	public void setLntcCd(int lntcCd) {
		this.lntcCd = lntcCd;
	}
	public int getLecCd() {
		return lecCd;
	}
	public void setLecCd(int lecCd) {
		this.lecCd = lecCd;
	}
	public String getLntcTtl() {
		return lntcTtl;
	}
	public void setLntcTtl(String lntcTtl) {
		this.lntcTtl = lntcTtl;
	}
	public String getLntcCon() {
		return lntcCon;
	}
	public void setLntcCon(String lntcCon) {
		this.lntcCon = lntcCon;
	}
	public Date getLntcReg() {
		return lntcReg;
	}
	public void setLntcReg(Date lntcReg) {
		this.lntcReg = lntcReg;
	}
	public Date getLntcUpd() {
		return lntcUpd;
	}
	public void setLntcUpd(Date lntcUpd) {
		this.lntcUpd = lntcUpd;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
