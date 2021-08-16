package com.myspring.daejeon30.admin.restaurant.service;

import java.util.List;
import java.util.Map;

import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

public interface AdminRestaurantService{
	public List<RestaurantVO> listRes() throws Exception;
	
	//조인쓰
	public List allRes()throws Exception;
	
	
	
	public int addNewRes(Map resMap) throws Exception;
	//public String addNewRes(Map resMap) throws Exception;
	public Map viewRes(int resNum) throws Exception;
	public void removeRes(int resNum) throws Exception;
	public void modRes(Map resMap) throws Exception;
	
	

	//검색
	public List searchRes(String word) throws Exception;
	
	//페이지테스트
			public List selectResList(Criteria cri) throws Exception;
			public int countResListTotal() throws Exception;

}