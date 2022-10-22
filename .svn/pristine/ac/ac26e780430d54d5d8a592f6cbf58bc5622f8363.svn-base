package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.commons.validator.GenericValidator;
import org.springframework.web.util.HtmlUtils;

public class LecQnaVO {
	private int lqnaCd;
	private int lecCd;
	private int stuCd;
	private String lqnaTtl;
	private String lqnaCon;
	private Date lqnaDt;
	private int lqnaHit;
	
	// 수원
	private String memNm;
	private int rnum;
	private int cntLqnar;

	public String getLqnaConDisplay() {
		String result = null;
		if(!GenericValidator.isBlankOrNull(this.lqnaCon)) {
			result = HtmlUtils.htmlUnescape(this.lqnaCon);
		}
		return result;
	}
	
	public int getCntLqnar() {
		return cntLqnar;
	}
	public void setCntLqnar(int cntLqnar) {
		this.cntLqnar = cntLqnar;
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
	public int getLqnaCd() {
		return lqnaCd;
	}
	public void setLqnaCd(int lqnaCd) {
		this.lqnaCd = lqnaCd;
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
	public String getLqnaTtl() {
		return lqnaTtl;
	}
	public void setLqnaTtl(String lqnaTtl) {
		this.lqnaTtl = lqnaTtl;
	}
	public String getLqnaCon() {
		return lqnaCon;
	}
	public void setLqnaCon(String lqnaCon) {
		this.lqnaCon = lqnaCon;
	}
	public Date getLqnaDt() {
		return lqnaDt;
	}
	public void setLqnaDt(Date lqnaDt) {
		this.lqnaDt = lqnaDt;
	}
	public int getLqnaHit() {
		return lqnaHit;
	}
	public void setLqnaHit(int lqnaHit) {
		this.lqnaHit = lqnaHit;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
}
