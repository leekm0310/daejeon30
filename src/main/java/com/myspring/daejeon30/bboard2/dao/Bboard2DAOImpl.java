package com.myspring.daejeon30.bboard2.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("bboard2DAO")
public class Bboard2DAOImpl implements Bboard2DAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllReview() throws DataAccessException{
		List reviewList = sqlSession.selectList("mapper.bboard2.selectAllReview");
		return reviewList;
	}
	
	@Override
	public void addreview(Map reviewMap) throws DataAccessException{
		sqlSession.insert("mapper.bboard2.addreview", reviewMap);
	}
}