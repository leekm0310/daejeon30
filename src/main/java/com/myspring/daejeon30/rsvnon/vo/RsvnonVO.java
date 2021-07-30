package com.myspring.daejeon30.rsvnon.vo;

import org.springframework.stereotype.Component;

@Component("rsvnonVO")
public class RsvnonVO{
	private int rsvNum;
	private String resName;
	private String name;
	private String phone;
	private String password;
	private String addInfo;
	private String rsvDate;
	private String rsvTime;
	private String rsvGuestNum;

	public RsvnonVO() {
	
	}
	
	public RsvnonVO(int rsvNum, String resName, String name, String phone, String password, String addInfo, String rsvDate,
			String rsvTime, String rsvGuestNum) {
		this.rsvNum=rsvNum;
		this.resName=resName;
		this.name=name;
		this.phone=phone;
		this.password=password;
		this.addInfo=addInfo;
		this.rsvDate=rsvDate;
		this.rsvTime=rsvTime;
		this.rsvGuestNum=rsvGuestNum;
	}

	public int getRsvNum() {
		return rsvNum;
	}

	public void setRsvNum(int rsvNum) {
		this.rsvNum = rsvNum;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getRsvGuestNum() {
		return rsvGuestNum;
	}

	public void setRsvGuestNum(String rsvGuestNum) {
		this.rsvGuestNum = rsvGuestNum;
	}



}
