package com.myspring.daejeon30.favo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.favo.vo.FavoVO;
import com.myspring.daejeon30.restaurant.vo.RestaurantVO;

@Repository("favoDAO")
public class FavoDAOImpl implements FavoDAO{
	@Autowired
	private SqlSession sqlSession;
	
	//@Override
	//public int insertFavo(FavoVO favoVO) throws DataAccessException{
	//	int result = sqlSession.insert("mapper.favo.insertFavo", favoVO);
	//	return result;
	//}
	
	
	@Override
	public FavoVO insertFavo(FavoVO favoVO) throws DataAccessException{
		int favoCount = sqlSession.selectOne("mapper.favo.favoCount", favoVO);
		int result = 0;
		//아래 추가부
		FavoVO fav = new FavoVO();
		//List favlist1 = null;
		
		if (favoCount == 0) {
			result = sqlSession.insert("mapper.favo.insertFavo", favoVO);
			fav= sqlSession.selectOne("mapper.favo.countLikeNum", favoVO);
			//favlist1 = sqlSession.selectOne("mapper.favo.countLikeNum", favoVO);
		
		} else {
			result = sqlSession.delete("mapper.favo.deleteFavo", favoVO);
			fav= sqlSession.selectOne("mapper.favo.countLikeNum", favoVO);
			//favlist1 = sqlSession.selectOne("mapper.favo.countLikeNum", favoVO);
		}
		//return favlist1;
		return fav;
		//fav=sqlSession.selectOne("mapper.favo.countLikeNum", favoVO);
		
	}
	
	@Override
	public List selectFavo(String id) throws DataAccessException{
		List favolist = sqlSession.selectList("mapper.favo.selectFavo", id);
		return favolist;
	}
	
	@Override
	public void deleteFavo(FavoVO favoVO)throws DataAccessException{
		sqlSession.delete("mapper.favo.deleteFavo", favoVO);
	}
	
	@Override
	public int memberfavo(String id)throws DataAccessException{
		return sqlSession.selectOne("mapper.favo.memberfavo", id);
	}
	
}