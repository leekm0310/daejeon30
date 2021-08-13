package com.myspring.daejeon30.restaurant.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.restaurant.vo.ResImageVO;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

@Repository("restaurantDAO")
public class RestaurantDAOImpl implements RestaurantDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllResList() throws DataAccessException{
		List<RestaurantVO> restaurantList = sqlSession.selectList("mapper.restaurant.selectAllResList");
		return restaurantList;
	}
	
	
	@Override
	public List selectAll() throws DataAccessException{
		List resAll = sqlSession.selectList("mapper.admin.restaurants.selectAll");
		return resAll;
	}
	
	
	
	
	@Override
	public RestaurantVO selectRest(int resNum) throws DataAccessException{
		return sqlSession.selectOne("mapper.restaurant.selectRest", resNum);
	}
	
	@Override
	public List selectRestImg(int resNum) throws DataAccessException{
		List<ResImageVO> selectRestImg = sqlSession.selectList("mapper.restaurant.selectRestImg", resNum);
		return selectRestImg;
	}
	
	@Override
	public List<Map<String, Object>> selectAllImg() throws DataAccessException{
		List<Map<String, Object>> selectAllImg = sqlSession.selectList("mapper.restaurant.selectAllImg");
		return selectAllImg;
	}
	
	@Override
	public List sortRes(int resSort) throws DataAccessException{
		List sorting = sqlSession.selectList("mapper.restaurant.sortRes", resSort);
		return sorting;
	}
	@Override
	public List sortfoods(String resCategory) throws DataAccessException{
		List sortingF = sqlSession.selectList("mapper.restaurant.sortfoods", resCategory);
		return sortingF;
	}
	
	@Override
	public List searchRes(String word) throws DataAccessException{
		List search = sqlSession.selectList("mapper.restaurant.searchRes", word);
		return search;
	}
	
	
	
	//페이지테스트
			@Override
			@SuppressWarnings("unchecked")
			public List selectResList(Criteria cri) {
			    return sqlSession.selectList("mapper.restaurant.getPage", cri);
			}
			@Override
			public int countResList()throws Exception{
				return (Integer)sqlSession.selectOne("mapper.restaurant.countresList");
			}
}