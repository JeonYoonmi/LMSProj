package kr.ac.lms.vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.commons.validator.GenericValidator;
import org.springframework.web.util.HtmlUtils;

public class MailVO {
	private int mlCd;
	private int mlRcp;
	private String mlRcpnm;
	private String mlRcpml;
	private int mlSen;
	private String mlSennm;
	private String mlSenml;
	private String mlTtl;
	private String mlCon;
	private int mlImsi;
	private Date mlTm;
	private int mlYn;
	private Date mlYndt;
	
	/*
		보낸사람인지 받은사람인지 0, 1로 표시(사용 기준)
		받은 메일함 : 0
		보낸 메일함 : 1
	*/
	private int senRcp;
	
	// senRcp에서 해당하는 출력 되어야 하는 사람 이름
	private String memNm;
	
	// 메일 첨부 파일 리스트
	private List<MailFileVO> mailFileVOList;
	
	// 안읽은 메일 건수
	private int mlN;
	
	public String getMlConDisplay() {
		String result = null;
		if(!GenericValidator.isBlankOrNull(this.mlCon)) {
			result = HtmlUtils.htmlUnescape(this.mlCon);
		}
		return result;
	}

	public int getMlCd() {
		return mlCd;
	}

	public void setMlCd(int mlCd) {
		this.mlCd = mlCd;
	}

	public int getMlRcp() {
		return mlRcp;
	}

	public void setMlRcp(int mlRcp) {
		this.mlRcp = mlRcp;
	}

	public String getMlRcpnm() {
		return mlRcpnm;
	}

	public void setMlRcpnm(String mlRcpnm) {
		this.mlRcpnm = mlRcpnm;
	}

	public String getMlRcpml() {
		return mlRcpml;
	}

	public void setMlRcpml(String mlRcpml) {
		this.mlRcpml = mlRcpml;
	}

	public int getMlSen() {
		return mlSen;
	}

	public void setMlSen(int mlSen) {
		this.mlSen = mlSen;
	}

	public String getMlSennm() {
		return mlSennm;
	}

	public void setMlSennm(String mlSennm) {
		this.mlSennm = mlSennm;
	}

	public String getMlSenml() {
		return mlSenml;
	}

	public void setMlSenml(String mlSenml) {
		this.mlSenml = mlSenml;
	}

	public String getMlTtl() {
		return mlTtl;
	}

	public void setMlTtl(String mlTtl) {
		this.mlTtl = mlTtl;
	}

	public String getMlCon() {
		return mlCon;
	}

	public void setMlCon(String mlCon) {
		this.mlCon = mlCon;
	}

	public int getMlImsi() {
		return mlImsi;
	}

	public void setMlImsi(int mlImsi) {
		this.mlImsi = mlImsi;
	}

	public Date getMlTm() {
		return mlTm;
	}

	public void setMlTm(Date mlTm) {
		this.mlTm = mlTm;
	}

	public int getMlYn() {
		return mlYn;
	}

	public void setMlYn(int mlYn) {
		this.mlYn = mlYn;
	}

	public Date getMlYndt() {
		return mlYndt;
	}

	public void setMlYndt(Date mlYndt) {
		this.mlYndt = mlYndt;
	}

	public int getSenRcp() {
		return senRcp;
	}

	public void setSenRcp(int senRcp) {
		this.senRcp = senRcp;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public List<MailFileVO> getMailFileVOList() {
		return mailFileVOList;
	}

	public void setMailFileVOList(List<MailFileVO> mailFileVOList) {
		this.mailFileVOList = mailFileVOList;
	}

	public int getMlN() {
		return mlN;
	}

	public void setMlN(int mlN) {
		this.mlN = mlN;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
