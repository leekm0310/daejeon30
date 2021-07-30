package com.myspring.daejeon30.admin.restaurant.service;

import java.util.List;
import java.util.Map;

import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

public interface AdminRestaurantService{
	public List<RestaurantVO> listRes() throws Exception;
	
	//Á¶ÀÎ¾²
	public List allRes()throws Exception;
	
	
	
	public int addNewRes(Map resMap) throws Exception;
	//public String addNewRes(Map resMap) throws Exception;
	public Map viewRes(int resNum) throws Exception;
	public void removeRes(int resNum) throws Exception;
	public void modRes(Map resMap) throws Exception;

}