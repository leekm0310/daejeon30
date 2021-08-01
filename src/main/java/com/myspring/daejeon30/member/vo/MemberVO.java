package com.myspring.daejeon30.member.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO{
	private String id;
	private String password;
	private String name;
	private String phone;
	private String email;
	private Timestamp joindate;
	private String memType;
	
	
	public MemberVO() {
		
	}
	
	public MemberVO(String id, String password, String name, String phone, String email, Timestamp joindate,
			String memType) {
		this.id=id;
		this.password=password;
		this.name=name;
		this.phone=phone;
		this.email=email;
		this.joindate=joindate;
		this.memType=memType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Timestamp getJoindate() {
		return joindate;
	}

	public void setJoindate(Timestamp joindate) {
		this.joindate = joindate;
	}

	public String getMemType() {
		return memType;
	}

	public void setMemType(String memType) {
		this.memType = memType;
	}
	
	


}