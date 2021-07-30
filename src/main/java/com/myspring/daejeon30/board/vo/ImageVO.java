package com.myspring.daejeon30.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

public class ImageVO {
	private int rb_ImageNum;
	private int rb_num;
	private String rb_imageFileName;
	private Date date;
	public int getRb_ImageNum() {
		return rb_ImageNum;
	}
	public void setRb_ImageNum(int rb_ImageNum) {
		this.rb_ImageNum = rb_ImageNum;
	}
	public int getRb_num() {
		return rb_num;
	}
	public void setRb_num(int rb_num) {
		this.rb_num = rb_num;
	}
	public String getRb_imageFileName() {
		return rb_imageFileName;
	}
	public void setRb_imageFileName(String rb_imageFileName) {
		try {
			if(rb_imageFileName != null && rb_imageFileName.length() != 0) {
				this.rb_imageFileName = URLEncoder.encode(rb_imageFileName,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
		
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	

}
