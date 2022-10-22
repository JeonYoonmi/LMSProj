package kr.ac.lms.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class CriteriaVO {

	private int crtrCd;
	private int lecaCd;
	private int crtrMp;
	private int crtrFp;
	private int crtrTp;
	private int crtrQp;
	private int crtrAp;
	
	public int getCrtrQp() {
		return crtrQp;
	}
	public void setCrtrQp(int crtrQp) {
		this.crtrQp = crtrQp;
	}
	public int getCrtrCd() {
		return crtrCd;
	}
	public void setCrtrCd(int crtrCd) {
		this.crtrCd = crtrCd;
	}
	public int getLecaCd() {
		return lecaCd;
	}
	public void setLecaCd(int lecaCd) {
		this.lecaCd = lecaCd;
	}
	public int getCrtrMp() {
		return crtrMp;
	}
	public void setCrtrMp(int crtrMp) {
		this.crtrMp = crtrMp;
	}
	public int getCrtrFp() {
		return crtrFp;
	}
	public void setCrtrFp(int crtrFp) {
		this.crtrFp = crtrFp;
	}
	public int getCrtrTp() {
		return crtrTp;
	}
	public void setCrtrTp(int crtrTp) {
		this.crtrTp = crtrTp;
	}
	public int getCrtrAp() {
		return crtrAp;
	}
	public void setCrtrAp(int crtrAp) {
		this.crtrAp = crtrAp;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
	
}
