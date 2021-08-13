package com.myspring.daejeon30.bboard2.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("bboard2VO")
public class Bboard2VO {

	private int num;
	private String title;
	private String content;
	private Date date;
	private int views;
	private String id;
	private String imageFileName;
	private int resNum;
	
	public Bboard2VO() {
		
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	
	public int getResNum() {
		return resNum;
	}
	
	public void setResNum(int resNum) {
		this.resNum=resNum;
	}
	
	
	
}