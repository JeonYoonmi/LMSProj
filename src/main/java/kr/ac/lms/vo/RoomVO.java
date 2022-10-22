package kr.ac.lms.vo;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class RoomVO {
	private int roomCd;
	private int bldCd;
	private String roomNo;
	private int roomMax;
	public int getRoomCd() {
		return roomCd;
	}
	public void setRoomCd(int roomCd) {
		this.roomCd = roomCd;
	}
	public int getBldCd() {
		return bldCd;
	}
	public void setBldCd(int bldCd) {
		this.bldCd = bldCd;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public int getRoomMax() {
		return roomMax;
	}
	public void setRoomMax(int roomMax) {
		this.roomMax = roomMax;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
