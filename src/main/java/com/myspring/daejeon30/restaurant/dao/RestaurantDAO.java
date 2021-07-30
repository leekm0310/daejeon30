package com.myspring.daejeon30.restaurant.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.restaurant.vo.ResImageVO;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

public interface RestaurantDAO{
	
	public List<RestaurantVO> selectAllResList() throws DataAccessException;
	
	
	//πÿø°ø‰∞≈¿”
	public List selectAll()throws DataAccessException;
	
	
	public RestaurantVO selectRest(int resNum) throws DataAccessException;
	//public List selectRestImg(int resNum) throws DataAccessException;
	public List selectRestImg(int resNum) throws DataAccessException;
	public List<Map<String,Object>> selectAllImg() throws DataAccessException;
	
	public List sortRes(int resSort)throws DataAccessException;
	public List sortfoods(String resCategory) throws DataAccessException;
}