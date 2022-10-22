package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.commons.validator.GenericValidator;
import org.springframework.web.util.HtmlUtils;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ObjectionVO {
	/**
	 * 이의 신청 코드
	 */
	private int objCd;
	/**
	 * 강의 코드
	 */
	private int lecCd;
	/**
	 * 학번
	 */
	private int stuCd;
	/**
	 * 이의 제목
	 */
	private String objTtl;
	/**
	 * 이의 내용
	 */
	private String objCon;
	/**
	 * 이의 신청 일자
	 */
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",  timezone = "Asia/Seoul")
	private Date objDt;
	/**
	 * 처리 결과
	 */
	private int objYn;
	/**
	 * 처리 내용
	 */
	private String objRpl;

	// 임의 컬럼 추가
	/**
	 * 학생 한글 이름
	 */
	private String stuNm;
	
	/**
	 * 강의 년도 / 학기
	 */
	private String lecaYrnsem;
	
	/**
	 * 강의 이름
	 */
	private String lecaNm;
	
	/**
	 * 승인 여부(한글)
	 */
	private String objYns;
	
	/**
	 * 소속(단과대학 + 학과)
	 */
	private String colDep;
	
	/**
	 * 학생 학년(재학학기수0
	 */
	private String yrSem;
	
	/**
	 * 학생 학점(성적평가)
	 */
	private String lecaGrade;
	
	/**
	 * 학생 평점(등급)
	 */
	private String slScore;
	
	/**
	 * 신청 일시
	 */
	private String objDtt;
	
	public String getObjConDisplay() {
		String result = null;
		if(!GenericValidator.isBlankOrNull(this.objCon)) {
			result = HtmlUtils.htmlUnescape(this.objCon);
		}
		return result;
	}
	
	public int getObjCd() {
		return objCd;
	}

	public void setObjCd(int objCd) {
		this.objCd = objCd;
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

	public String getObjTtl() {
		return objTtl;
	}

	public void setObjTtl(String objTtl) {
		this.objTtl = objTtl;
	}

	public String getObjCon() {
		return objCon;
	}

	public void setObjCon(String objCon) {
		this.objCon = objCon;
	}

	public Date getObjDt() {
		return objDt;
	}

	public void setObjDt(Date objDt) {
		this.objDt = objDt;
	}

	public int getObjYn() {
		return objYn;
	}

	public void setObjYn(int objYn) {
		this.objYn = objYn;
	}

	public String getObjRpl() {
		return objRpl;
	}

	public void setObjRpl(String objRpl) {
		this.objRpl = objRpl;
	}

	public String getStuNm() {
		return stuNm;
	}

	public void setStuNm(String stuNm) {
		this.stuNm = stuNm;
	}

	public String getLecaYrnsem() {
		return lecaYrnsem;
	}

	public void setLecaYrnsem(String lecaYrnsem) {
		this.lecaYrnsem = lecaYrnsem;
	}

	public String getLecaNm() {
		return lecaNm;
	}

	public void setLecaNm(String lecaNm) {
		this.lecaNm = lecaNm;
	}
	
	public String getObjYns() {
		return objYns;
	}

	public void setObjYns(String objYns) {
		this.objYns = objYns;
	}

	public String getColDep() {
		return colDep;
	}

	public void setColDep(String colDep) {
		this.colDep = colDep;
	}

	public String getYrSem() {
		return yrSem;
	}

	public void setYrSem(String yrSem) {
		this.yrSem = yrSem;
	}

	public String getLecaGrade() {
		return lecaGrade;
	}

	public void setLecaGrade(String lecaGrade) {
		this.lecaGrade = lecaGrade;
	}

	public String getSlScore() {
		return slScore;
	}

	public void setSlScore(String slScore) {
		this.slScore = slScore;
	}

	public String getObjDtt() {
		return objDtt;
	}

	public void setObjDtt(String objDtt) {
		this.objDtt = objDtt;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}

}
