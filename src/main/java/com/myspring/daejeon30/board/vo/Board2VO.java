package com.myspring.daejeon30.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component("board2VO")
public class Board2VO {

	private int rb_num;
	private String rb_title;
	private String rb_content;
	private String id;
	private Timestamp rb_date;
	private int rb_views;
	private String imageFileName;

	public Board2VO() {

	}

	public int getRb_num() {
		return rb_num;
	}

	public void setRb_num(int rb_num) {
		this.rb_num = rb_num;
	}

	public String getRb_title() {
		return rb_title;
	}

	public void setRb_title(String rb_title) {
		this.rb_title = rb_title;
	}

	public String getRb_content() {
		return rb_content;
	}

	public void setRb_content(String rb_content) {
		this.rb_content = rb_content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getRb_date() {
		return rb_date;
	}


	public void setRb_date(Timestamp string) {
		this.rb_date = string;
	}


	public int getRb_views() {
		return rb_views;
	}

	public void setRb_views(int rb_views) {
		this.rb_views = rb_views;
	}

	public String getImageFileName() {
		try {
			if (imageFileName != null && imageFileName.length() != 0) {
				imageFileName = URLDecoder.decode(imageFileName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName != null && imageFileName.length() != 0) {
				this.imageFileName = URLEncoder.encode(imageFileName,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	

}
