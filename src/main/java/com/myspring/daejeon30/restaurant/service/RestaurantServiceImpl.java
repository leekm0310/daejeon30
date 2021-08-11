package com.myspring.daejeon30.restaurant.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.restaurant.dao.RestaurantDAO;
import com.myspring.daejeon30.restaurant.vo.ResImageVO;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

@Service("restaurantService")
public class RestaurantServiceImpl implements RestaurantService {
	@Autowired
	RestaurantDAO restaurantDAO;
	
	@Override
	public List<RestaurantVO> listRestaurant() throws Exception {
		List<RestaurantVO> restaurantList = restaurantDAO.selectAllResList();
		return restaurantList;
	}
	
	
	
	public List allRes() throws Exception{
		List resAll = restaurantDAO.selectAll();
		return resAll;
	}
	
	@Override
	public Map viewRestaurant(int resNum) throws Exception{
		Map resMap = new HashMap();
		RestaurantVO restaurantVO = restaurantDAO.selectRest(resNum);
		List<ResImageVO> resImageFileList = restaurantDAO.selectRestImg(resNum);		
		resMap.put("res",restaurantVO);
		resMap.put("resImageFileList", resImageFileList);
		return resMap;
	}
	
	//@Override
	//public RestaurantVO viewRestaurant(int resNum) throws Exception {
	//	RestaurantVO restaurantVO = restaurantDAO.selectRest(resNum);
	//	return restaurantVO;
	//}
	
	//@Override
	//public List<Map<String, Object>> listImg(int resNum) throws Exception{
	//	List<Map<String, Object>> selectRestImg = restaurantDAO.selectRestImg(resNum);
	//	return selectRestImg;
	//}
	
	@Override
	public List<Map<String, Object>> allImg()throws Exception{
		List<Map<String, Object>> selectAllImg = restaurantDAO.selectAllImg();
		return selectAllImg;
	}
	
	@Override
	public List sortview(int resSort) throws Exception{
		List sorting = restaurantDAO.sortRes(resSort);
		return sorting;
	}
	
	@Override
	public List sortf(String resCategory) throws Exception{
		List sortingF = restaurantDAO.sortfoods(resCategory);
		return sortingF;
	}
	
	@Override
	public List searchRes(String word) throws Exception{
		List search = restaurantDAO.searchRes(word);
		return search;
	}
}