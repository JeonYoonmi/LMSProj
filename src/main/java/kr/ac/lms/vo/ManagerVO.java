package kr.ac.lms.vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class ManagerVO {
	private int mgrCd;
	private String mgrDiv;
		private String mgrDivNm;
	private String mgrPos;
		private String mgrPosNm;
	private Date mgrJoin;
	private Date mgrRet;
	private List<CommonVO> mgrPosList;
	
	
	
	public String getMgrDivNm() {
		return mgrDivNm;
	}
	public void setMgrDivNm(String mgrDivNm) {
		this.mgrDivNm = mgrDivNm;
	}
	public String getMgrPosNm() {
		return mgrPosNm;
	}
	public void setMgrPosNm(String mgrPosNm) {
		this.mgrPosNm = mgrPosNm;
	}
	public List<CommonVO> getMgrPosList() {
		return mgrPosList;
	}
	public void setMgrPosList(List<CommonVO> mgrPosList) {
		this.mgrPosList = mgrPosList;
	}
	public int getMgrCd() {
		return mgrCd;
	}
	public void setMgrCd(int mgrCd) {
		this.mgrCd = mgrCd;
	}
	public String getMgrDiv() {
		return mgrDiv;
	}
	public void setMgrDiv(String mgrDiv) {
		this.mgrDiv = mgrDiv;
	}
	public String getMgrPos() {
		return mgrPos;
	}
	public void setMgrPos(String mgrPos) {
		this.mgrPos = mgrPos;
	}
	public Date getMgrJoin() {
		return mgrJoin;
	}
	public void setMgrJoin(Date mgrJoin) {
		this.mgrJoin = mgrJoin;
	}
	public Date getMgrRet() {
		return mgrRet;
	}
	public void setMgrRet(Date mgrRet) {
		this.mgrRet = mgrRet;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
