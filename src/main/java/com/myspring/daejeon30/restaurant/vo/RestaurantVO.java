package com.myspring.daejeon30.restaurant.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

@Component("restaurantVO")
public class RestaurantVO{
	private int resNum;
	private String resName;
	private int resOpen;
	private String resPhone;
	private String resMenu;
	private String resLocation;
	private int resCapacity;
	private String resIngredient;
	private int likeNum;
	private String resCategory;
	private String mapLocation;
	private int openYear;
	private String resImageFileName;
	private int resSort;


	public RestaurantVO() {
	
	}
	
	public RestaurantVO(int resNum, String resName, int resOpen, String resPhone, String resMenu, String resLocation,
			int resCapacity, String resIngredient, int likeNum, String resCategory, String mapLocation, int openYear,
			String resImageFileName, int resSort) {
		this.resNum=resNum;
		this.resName=resName;
		this.resOpen=resOpen;
		this.resPhone=resPhone;
		this.resMenu=resMenu;
		this.resLocation=resLocation;
		this.resCapacity=resCapacity;
		this.resIngredient=resIngredient;
		this.likeNum=likeNum;
		this.resCategory=resCategory;
		this.mapLocation=mapLocation;
		this.openYear=openYear;
		this.resImageFileName=resImageFileName;
		this.resSort=resSort;
	}

	public int getResNum() {
		return resNum;
	}

	public void setResNum(int resNum) {
		this.resNum = resNum;
	}

	public String getResName() {
		return resName;
	}

	public void setResName(String resName) {
		this.resName = resName;
	}

	public int getResOpen() {
		return resOpen;
	}

	public void setResOpen(int resOpen) {
		this.resOpen = resOpen;
	}

	public String getResPhone() {
		return resPhone;
	}

	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}

	public String getResMenu() {
		return resMenu;
	}

	public void setResMenu(String resMenu) {
		this.resMenu = resMenu;
	}

	public String getResLocation() {
		return resLocation;
	}

	public void setResLocation(String resLocation) {
		this.resLocation = resLocation;
	}

	public int getResCapacity() {
		return resCapacity;
	}

	public void setResCapacity(int resCapacity) {
		this.resCapacity = resCapacity;
	}

	public String getResIngredient() {
		return resIngredient;
	}

	public void setResIngredient(String resIngredient) {
		this.resIngredient = resIngredient;
	}

	public int getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(int likeNum) {
		this.likeNum = likeNum;
	}

	public String getResCategory() {
		return resCategory;
	}

	public void setResCategory(String resCategory) {
		this.resCategory = resCategory;
	}

	public String getMapLocation() {
		return mapLocation;
	}

	public void setMapLocation(String mapLocation) {
		this.mapLocation = mapLocation;
	}

	public int getOpenYear() {
		return openYear;
	}

	public void setOpenYear(int openYear) {
		this.openYear = openYear;
	}
	
	public int getResSort() {
		return resSort;
	}
	
	public void setResSort(int resSort) {
		this.resSort = resSort;
	}
	
	
	public String getResImageFileName() {
		try {
			if(resImageFileName != null && resImageFileName.length()!=0) {
				resImageFileName = URLDecoder.decode(resImageFileName,"utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return resImageFileName;
	}
	
	public void setResImageFileName(String resImageFileName) {
		try {
			if(resImageFileName != null && resImageFileName.length() !=0) {
				this.resImageFileName=URLEncoder.encode(resImageFileName,"utf-8");
			} 
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

}