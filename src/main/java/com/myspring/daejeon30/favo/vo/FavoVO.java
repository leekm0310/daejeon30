package com.myspring.daejeon30.favo.vo;

import org.springframework.stereotype.Component;

@Component("favoVO")
public class FavoVO{
	private int favNum;
	private String id;
	private int resNum;
	private String resPhone;
	private String resName;
	private String resImageFileName;
	private int likeNum;
	public int getFavNum() {
		return favNum;
	}
	public void setFavNum(int favNum) {
		this.favNum = favNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getResNum() {
		return resNum;
	}
	public void setResNum(int resNum) {
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
	public String getResImageFileName() {
		return resImageFileName;
	}
	public void setResImageFileName(String resImageFileName) {
		this.resImageFileName = resImageFileName;
	}
	public int getLikeNum() {
		return likeNum;
	}
	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}
	
	

	

	
	
}