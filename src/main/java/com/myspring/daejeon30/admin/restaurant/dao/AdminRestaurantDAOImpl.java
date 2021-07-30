package com.myspring.daejeon30.admin.restaurant.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.restaurant.vo.ResImageVO;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

@Repository("adminRestaurantDAO")
public class AdminRestaurantDAOImpl implements AdminRestaurantDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllResList() throws DataAccessException{
		List<RestaurantVO> restaurantList = sqlSession.selectList("mapper.admin.restaurants.selectAllResList");
		return restaurantList;
	}
	
	
	//Á¶ÀÎ¾²
	@Override
	public List selectAll() throws DataAccessException{
		List resAll = sqlSession.selectList("mapper.admin.restaurants.selectAll");
		return resAll;
	}
	
	
	
	//@Override
	//public int insertNewRes(Map resMap)throws DataAccessException{
	//	return sqlSession.insert("mapper.admin.restaurants.insertNewRes",resMap);
	//}
	
	@Override
	public int insertNewRes(Map resMap)throws DataAccessException{
		sqlSession.insert("mapper.admin.restaurants.insertNewRes",resMap);
		//String resNameChab = (String) resMap.get("resName");
		//RestaurantVO chanv = new RestaurantVO();
		//chanv.setResName(resNameChab);
		int resNum = selectResNum(resMap);
		resMap.put("resNum", resNum);
		return resNum;
	}
	
	@Override
	public void insertNewImage(Map resMap) throws DataAccessException{
		List<ResImageVO> resImageFileList = (ArrayList)resMap.get("resImageFileList");
		int resNum = (Integer)resMap.get("resNum");
		//int resImageNum = selectNewImageFileNO();
		int resImageNum = 0;
		for(ResImageVO resImageVO : resImageFileList) {
			resImageVO.setResImageNum(++resImageNum);
			resImageVO.setResNum(resNum);
		}
		sqlSession.insert("mapper.admin.restaurants.insertNewImage", resImageFileList);
	}
	
	@Override
	public RestaurantVO selectRes(int resNum) throws DataAccessException{
		return sqlSession.selectOne("mapper.admin.restaurants.selectRes", resNum);
	}
	
	@Override
	public List selectImageFileList(int resNum) throws DataAccessException {
		List<ResImageVO> resImageFileList = null;
		resImageFileList = sqlSession.selectList("mapper.admin.restaurants.selectImageFileList", resNum);
		return resImageFileList;
	}
	
	@Override
	public void deleteRes(int resNum) throws DataAccessException{
		sqlSession.delete("mapper.admin.restaurants.deleteRes", resNum);
	}
	
	@Override
	public void updateRes(Map resMap) throws DataAccessException{
		sqlSession.update("mapper.admin.restaurants.updateRes", resMap);
	}
	
	
	private int selectNewImageFileNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.admin.restaurants.selectNewImageFileNO");
	}
	
	//private int selectResNum(RestaurantVO chanv) throws DataAccessException {
	//	int sd = sqlSession.selectOne("mapper.admin.restaurants.selectResNum", chanv);
	//	return sd;
	//}
	
	private int selectResNum(Map resMap) throws DataAccessException {
		int resNum = sqlSession.selectOne("mapper.admin.restaurants.selectResNum", resMap.get("resName"));
		return resNum;
	}
}