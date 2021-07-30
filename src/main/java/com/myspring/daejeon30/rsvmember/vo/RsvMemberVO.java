package com.myspring.daejeon30.rsvmember.vo;

import org.springframework.stereotype.Component;

@Component("rsvMemberVO")
public class RsvMemberVO{
    
	private Integer rsvNum;
	private String name;
	private String phone;
	private String addInfo;
	private String rsvDate;
	private String rsvTime; // -> 제거하고 rsvDate를DB에서 DATE형식으로 받게끔 해야함
	private String guestNum;
	private String id; // fk --> ??table join
	private String status;
	
	// member table 컬럼.
	private Integer resNum;
	private String resPhone;
	private String resName;
	
	public RsvMemberVO() {
		
	}
	
	public RsvMemberVO(int rsvNum, String name, String phone, String addInfo, String rsvDate, String rsvTime,
			String guestNum, String id, int resNum, String resPhone, String resName, String status) {
		this.rsvNum=rsvNum;
		this.name=name;
		this.phone=phone;
		this.addInfo=addInfo;
		this.rsvDate=rsvDate;
		this.rsvTime=rsvTime;
		this.guestNum=guestNum;
		this.id = id;
		this.resNum=resNum;
		this.resPhone=resPhone;
		this.resName=resName;
		this.status=status;
	}
	
	public Integer getRsvNum() {
		return rsvNum;
	}
	public void setRsvNum(Integer rsvNum) {
		this.rsvNum = rsvNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddInfo() {
		return addInfo;
	}
	public void setAddInfo(String addInfo) {
		this.addInfo = addInfo;
	}
	public String getRsvDate() {
		return rsvDate;
	}
	public void setRsvDate(String rsvDate) {
		this.rsvDate = rsvDate;
	}
	public String getRsvTime() {
		return rsvTime;
	}
	public void setRsvTime(String rsvTime) {
		this.rsvTime = rsvTime;
	}
	public String getGuestNum() {
		return guestNum;
	}
	public void setGuestNum(String guestNum) {
		this.guestNum = guestNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getResNum() {
		return resNum;
	}
	public void setResNum(Integer resNum) {
		this.resNum = resNum;
	}
	public String getResPhone() {
		return resPhone;
	}
	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status=status;
	}
	


}