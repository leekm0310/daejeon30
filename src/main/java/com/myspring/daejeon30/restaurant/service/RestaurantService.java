package com.myspring.daejeon30.restaurant.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

public interface RestaurantService {
	public List<RestaurantVO> listRestaurant() throws Exception;
	
	//레스토랑 리스트 불러오기 최신
	public List allRes()throws Exception;
	
	
	//public RestaurantVO viewRestaurant(int resNum) throws Exception;
	//public List listImg(int resNum) throws Exception;
	public Map viewRestaurant(int resNum) throws Exception;
	//public List<Map<String, Object>> listImg(int resNum) throws Exception;
	public List<Map<String, Object>> allImg() throws Exception;
	
	public List sortview(int resSort) throws Exception;
	public List sortf(String resCategory) throws Exception;
	
	//검색
	public List searchRes(String word) throws Exception;
	
	//페이지테스트
		public List selectResList(Criteria cri) throws Exception;
		public int countResListTotal() throws Exception;

}