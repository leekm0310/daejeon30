package com.myspring.daejeon30.admin.restaurant.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.admin.restaurant.dao.AdminRestaurantDAO;
import com.myspring.daejeon30.restaurant.vo.ResImageVO;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

@Service("adminRestaurantService")
public class AdminRestaurantServiceImpl implements AdminRestaurantService{
	@Autowired
	AdminRestaurantDAO adminRestaurantDAO;
	
	public List<RestaurantVO> listRes() throws Exception{
		List<RestaurantVO> resList = adminRestaurantDAO.selectAllResList();
		return resList;
	}
	
	
	//Á¶ÀÎ¾²
	public List allRes() throws Exception{
		List resAll = adminRestaurantDAO.selectAll();
		return resAll;
	}
	
	
	
	//@Override
	//public int addNewRes(Map resMap) throws Exception{
	//	int resNum = adminRestaurantDAO.insertNewRes(resMap);
	//	resMap.put("resNum", resNum);
	//	adminRestaurantDAO.insertNewImage(resMap);
	//	return resNum;
	//}
	
	@Override
	public int addNewRes(Map resMap) throws Exception{
		int resNum = adminRestaurantDAO.insertNewRes(resMap);
		resMap.put("resNum", resNum);
		adminRestaurantDAO.insertNewImage(resMap);
		return resNum;
	}
	
	@Override
	public Map viewRes(int resNum) throws Exception{
		Map resMap = new HashMap();
		RestaurantVO restaurantVO = adminRestaurantDAO.selectRes(resNum);
		List<ResImageVO> resImageFileList = adminRestaurantDAO.selectImageFileList(resNum);
		resMap.put("res",restaurantVO);
		resMap.put("resImageFileList", resImageFileList);
		return resMap;
	}
	
	@Override
	public void removeRes(int resNum) throws Exception{
		adminRestaurantDAO.deleteRes(resNum);
	}
	
	@Override
	public void modRes(Map resMap) throws Exception{
		adminRestaurantDAO.updateRes(resMap);
	}

}