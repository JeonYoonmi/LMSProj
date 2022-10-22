package kr.ac.lms.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class ExamVO {
	/**
	 * exam key
	 */
	private int examCd;
	/**
	 * 강의 코드
	 */
	private int lecCd;
	/**
	 * 학생 코드
	 */
	private int stuCd;
	/**
	 * 시험 성적 기입
	 */
	private int examScore;
	/**
	 *  시험 성적 카테고리
	 */
	private String examCate;
	public int getExamCd() {
		return examCd;
	}
	public void setExamCd(int examCd) {
		this.examCd = examCd;
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
	public int getExamScore() {
		return examScore;
	}
	public void setExamScore(int examScore) {
		this.examScore = examScore;
	}
	public String getExamCate() {
		return examCate;
	}
	public void setExamCate(String examCate) {
		this.examCate = examCate;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
	
}
