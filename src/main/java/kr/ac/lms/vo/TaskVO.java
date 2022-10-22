package kr.ac.lms.vo;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;
import org.apache.commons.validator.GenericValidator;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.util.HtmlUtils;

public class TaskVO {
	private int taskCd;
	private int lecCd;
	private String taskNm;
	private String taskCon;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date taskEt;
	private String taskFnm;
	
	// 수원
	private int rnum;
	@DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm")
	private Date taskReg; 
	private int next;
	private int last;
	private String nexttitle;
	private String lasttitle;
	private int taskScore;
	private List<TaskSubmitVO> taskSubmitVOList;
	
	public String getTaskConDisplay() {
		String result = null;
		if(!GenericValidator.isBlankOrNull(this.taskCon)) {
			result = HtmlUtils.htmlUnescape(this.taskCon);
		}
		return result;
	}
	
	public List<TaskSubmitVO> getTaskSubmitVOList() {
		return taskSubmitVOList;
	}
	public void setTaskSubmitVOList(List<TaskSubmitVO> taskSubmitVOList) {
		this.taskSubmitVOList = taskSubmitVOList;
	}
	public int getTaskScore() {
		return taskScore;
	}
	public void setTaskScore(int taskScore) {
		this.taskScore = taskScore;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public String getNexttitle() {
		return nexttitle;
	}
	public void setNexttitle(String nexttitle) {
		this.nexttitle = nexttitle;
	}
	public String getLasttitle() {
		return lasttitle;
	}
	public void setLasttitle(String lasttitle) {
		this.lasttitle = lasttitle;
	}
	public Date getTaskReg() {
		return taskReg;
	}
	public void setTaskReg(Date taskReg) {
		this.taskReg = taskReg;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getTaskCd() {
		return taskCd;
	}
	public void setTaskCd(int taskCd) {
		this.taskCd = taskCd;
	}
	public int getLecCd() {
		return lecCd;
	}
	public void setLecCd(int lecCd) {
		this.lecCd = lecCd;
	}
	public String getTaskNm() {
		return taskNm;
	}
	public void setTaskNm(String taskNm) {
		this.taskNm = taskNm;
	}
	public String getTaskCon() {
		return taskCon;
	}
	public void setTaskCon(String taskCon) {
		this.taskCon = taskCon;
	}
	public Date getTaskEt() {
		return taskEt;
	}
	public void setTaskEt(Date taskEt) {
		this.taskEt = taskEt;
	}
	public String getTaskFnm() {
		return taskFnm;
	}
	public void setTaskFnm(String taskFnm) {
		this.taskFnm = taskFnm;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
