package com.myspring.daejeon30.restaurant.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.restaurant.vo.ResImageVO;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

public interface RestaurantDAO{
	
	public List<RestaurantVO> selectAllResList() throws DataAccessException;
	
	
	//�ؿ������
	public List selectAll()throws DataAccessException;
	
	
	public RestaurantVO selectRest(int resNum) throws DataAccessException;
	//public List selectRestImg(int resNum) throws DataAccessException;
	public List selectRestImg(int resNum) throws DataAccessException;
	public List<Map<String,Object>> selectAllImg() throws DataAccessException;
	
	public List sortRes(int resSort)throws DataAccessException;
	public List sortfoods(String resCategory) throws DataAccessException;
	
	//�˻�
	public List searchRes(String word) throws DataAccessException;
	
	//������
	public List selectResList(Criteria cri) throws Exception;
	public int countResList()throws Exception;
}