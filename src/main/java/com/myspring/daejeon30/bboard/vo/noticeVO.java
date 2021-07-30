package com.myspring.daejeon30.bboard.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("noticeVO")
public class noticeVO{
	private int n_num;
	private String n_title;
	private String n_content;
	private String id;
	private Timestamp n_date;
	public int getN_num() {
		return n_num;
	}
	public void setN_num(int n_num) {
		this.n_num = n_num;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Timestamp getN_date() {
		return n_date;
	}
	public void setN_date(Timestamp n_date) {
		this.n_date = n_date;
	}
	
}