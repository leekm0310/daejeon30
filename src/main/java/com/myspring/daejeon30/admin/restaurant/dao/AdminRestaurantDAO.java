package com.myspring.daejeon30.admin.restaurant.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

public interface AdminRestaurantDAO {
	public List selectAllResList() throws DataAccessException;
	
	//조인쓰
	public List selectAll() throws DataAccessException;
	
	
	public int insertNewRes(Map resMap) throws DataAccessException;
	//public String insertNewRes(Map resMap) throws DataAccessException;
	public void insertNewImage (Map resMap) throws DataAccessException;
	
	public RestaurantVO selectRes(int resNum) throws DataAccessException;
	public List selectImageFileList(int resNum) throws DataAccessException;
	public void deleteRes(int resNum) throws DataAccessException;
	public void updateRes(Map resMap) throws DataAccessException;
	
	//검색
		public List searchRes(String word) throws DataAccessException;
	
	//페이지
		public List selectResList(Criteria cri) throws Exception;
		public int countResList()throws Exception;
	
}