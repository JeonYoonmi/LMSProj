package kr.ac.lms.vo;

import java.util.Date;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.commons.validator.GenericValidator;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.util.HtmlUtils;

import com.fasterxml.jackson.annotation.JsonFormat;

public class QnaVO {
	private int qnaCd;
	private int memCd;
	private String qnaTtl;
	private String qnaCon;
	private int qnaYn;
	@DateTimeFormat(pattern = "yyyymmdd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date qnaDt;
	private int qnaHit;
	private int rnum;
	
	
	public String getqnaConDisplay() {
		String result = null;
		if(!GenericValidator.isBlankOrNull(this.qnaCon)) {
			result = HtmlUtils.htmlUnescape(this.qnaCon);
		}
		return result;
	}
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	private QnaReplyVO qnaReplyVO;
	private MemberVO memberVO;
	
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public QnaReplyVO getQnaReplyVO() {
		return qnaReplyVO;
	}
	public void setQnaReplyVO(QnaReplyVO qnaReplyVO) {
		this.qnaReplyVO = qnaReplyVO;
	}
	public int getQnaCd() {
		return qnaCd;
	}
	public void setQnaCd(int qnaCd) {
		this.qnaCd = qnaCd;
	}
	public int getMemCd() {
		return memCd;
	}
	public void setMemCd(int memCd) {
		this.memCd = memCd;
	}
	public String getQnaTtl() {
		return qnaTtl;
	}
	public void setQnaTtl(String qnaTtl) {
		this.qnaTtl = qnaTtl;
	}
	public String getQnaCon() {
		return qnaCon;
	}
	public void setQnaCon(String qnaCon) {
		this.qnaCon = qnaCon;
	}
	public int getQnaYn() {
		return qnaYn;
	}
	public void setQnaYn(int qnaYn) {
		this.qnaYn = qnaYn;
	}
	public Date getQnaDt() {
		return qnaDt;
	}
	public void setQnaDt(Date qnaDt) {
		this.qnaDt = qnaDt;
	}
	public int getQnaHit() {
		return qnaHit;
	}
	public void setQnaHit(int qnaHit) {
		this.qnaHit = qnaHit;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
