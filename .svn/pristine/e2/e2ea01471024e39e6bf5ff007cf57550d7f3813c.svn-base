package kr.ac.lms.vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.commons.validator.GenericValidator;
import org.springframework.web.util.HtmlUtils;

import com.fasterxml.jackson.annotation.JsonFormat;

public class NoticeVO {
	private int ntcCd;
	private int mgrCd;
	private int ntcHot;
	private int ntcHit;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date ntcDt;
	private String ntcCate;
	private String ntcCon;
	private String ntcTtl;
	
	// 임의로 추가
	private int rnum;
	private String mgrNm;
	private List<NoticeFileVO> ntcFileVOList;

	public String getNtcConDisplay() {
		String result = null;
		if(!GenericValidator.isBlankOrNull(this.ntcCon)) {
			result = HtmlUtils.htmlUnescape(this.ntcCon);
		}
		return result;
	}
	
	public int getNtcCd() {
		return ntcCd;
	}
	public void setNtcCd(int ntcCd) {
		this.ntcCd = ntcCd;
	}
	public int getMgrCd() {
		return mgrCd;
	}
	public void setMgrCd(int mgrCd) {
		this.mgrCd = mgrCd;
	}
	public int getNtcHot() {
		return ntcHot;
	}
	public void setNtcHot(int ntcHot) {
		this.ntcHot = ntcHot;
	}
	public int getNtcHit() {
		return ntcHit;
	}
	public void setNtcHit(int ntcHit) {
		this.ntcHit = ntcHit;
	}
	public Date getNtcDt() {
		return ntcDt;
	}
	public void setNtcDt(Date ntcDt) {
		this.ntcDt = ntcDt;
	}
	public String getNtcCate() {
		return ntcCate;
	}
	public void setNtcCate(String ntcCate) {
		this.ntcCate = ntcCate;
	}
	public String getNtcCon() {
		return ntcCon;
	}
	public void setNtcCon(String ntcCon) {
		this.ntcCon = ntcCon;
	}
	public String getNtcTtl() {
		return ntcTtl;
	}
	public void setNtcTtl(String ntcTtl) {
		this.ntcTtl = ntcTtl;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getMgrNm() {
		return mgrNm;
	}
	public void setMgrNm(String mgrNm) {
		this.mgrNm = mgrNm;
	}
	
	public List<NoticeFileVO> getNtcFileVOList() {
		return ntcFileVOList;
	}
	public void setNtcFileVOList(List<NoticeFileVO> ntcFileVOList) {
		this.ntcFileVOList = ntcFileVOList;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
