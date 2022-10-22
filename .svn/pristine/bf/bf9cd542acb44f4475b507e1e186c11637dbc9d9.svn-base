package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.commons.validator.GenericValidator;
import org.springframework.web.util.HtmlUtils;

import com.fasterxml.jackson.annotation.JsonFormat;

public class CounselVO {

	private int cnslCd;
	private int stuCd;
	private String cnslTtl;
	private String cnslCon;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date cnslReg;
	private Date cnslDt;
	private String cnslRpl;
	private String cnslYn;
	private String cnslCate;
	
	//추가
	private String memNm;
	private String comdNm;
	private int rnum;
	private String proNm;
	
	private int cnslCnty;
	private int cnslCntn;
	
	public String getCnslConDisplay() {
		String result = null;
		if(!GenericValidator.isBlankOrNull(this.cnslCon)) {
			result = HtmlUtils.htmlUnescape(this.cnslCon);
		}
		return result;
	}
	
	public String getCnslRplDisplay() {
		String result = null;
		if(!GenericValidator.isBlankOrNull(this.cnslRpl)) {
			result = HtmlUtils.htmlUnescape(this.cnslRpl);
		}
		return result;
	}
	
	public int getCnslCd() {
		return cnslCd;
	}

	public void setCnslCd(int cnslCd) {
		this.cnslCd = cnslCd;
	}

	public int getStuCd() {
		return stuCd;
	}

	public void setStuCd(int stuCd) {
		this.stuCd = stuCd;
	}

	public String getCnslTtl() {
		return cnslTtl;
	}

	public void setCnslTtl(String cnslTtl) {
		this.cnslTtl = cnslTtl;
	}

	public String getCnslCon() {
		return cnslCon;
	}

	public void setCnslCon(String cnslCon) {
		this.cnslCon = cnslCon;
	}

	public Date getCnslReg() {
		return cnslReg;
	}

	public void setCnslReg(Date cnslReg) {
		this.cnslReg = cnslReg;
	}

	public Date getCnslDt() {
		return cnslDt;
	}

	public void setCnslDt(Date cnslDt) {
		this.cnslDt = cnslDt;
	}

	public String getCnslRpl() {
		return cnslRpl;
	}

	public void setCnslRpl(String cnslRpl) {
		this.cnslRpl = cnslRpl;
	}

	public String getCnslYn() {
		return cnslYn;
	}

	public void setCnslYn(String cnslYn) {
		this.cnslYn = cnslYn;
	}

	public String getCnslCate() {
		return cnslCate;
	}

	public void setCnslCate(String cnslCate) {
		this.cnslCate = cnslCate;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public String getComdNm() {
		return comdNm;
	}

	public void setComdNm(String comdNm) {
		this.comdNm = comdNm;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getProNm() {
		return proNm;
	}

	public void setProNm(String proNm) {
		this.proNm = proNm;
	}

	public int getCnslCnty() {
		return cnslCnty;
	}

	public void setCnslCnty(int cnslCnty) {
		this.cnslCnty = cnslCnty;
	}

	public int getCnslCntn() {
		return cnslCntn;
	}

	public void setCnslCntn(int cnslCntn) {
		this.cnslCntn = cnslCntn;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
}
