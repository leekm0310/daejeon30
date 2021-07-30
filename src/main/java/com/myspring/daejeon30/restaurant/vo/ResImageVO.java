package com.myspring.daejeon30.restaurant.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class ResImageVO{
	private int resNum;
	private int resImageNum;
	private String resImageFileName;
	private String resImageSort;

	public int getResNum() {
		return resNum;
	}

	public void setResNum(int resNum) {
		this.resNum = resNum;
	}

	public int getResImageNum() {
		return resImageNum;
	}

	public void setResImageNum(int resImageNum) {
		this.resImageNum = resImageNum;
	}

	public String getResImageFileName() {
		return resImageFileName;
	}

	public void setResImageFileName(String resImageFileName) {
		try {
			if(resImageFileName != null && resImageFileName.length()!=0) {
				this.resImageFileName = URLEncoder.encode(resImageFileName, "utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
	}
	
	public void setResImageSort(String resImageSort) {
		this.resImageSort = resImageSort;
	}
	
	public String getResImageSort() {
		return resImageSort;
	}
	
}