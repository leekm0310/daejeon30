package com.myspring.daejeon30.qcomment.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("qcommentVO")
public class QcommentVO{
	private int num;
	private int boardnum;
	private String id;
	private String content;
	private Date date;
	
	public QcommentVO() {
		
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
	
	
}