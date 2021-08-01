package com.myspring.daejeon30.bboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("bboardDAO")
public class BboardDAOImpl implements BboardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectNBoard() throws DataAccessException{
		List nboard = sqlSession.selectList("mapper.bboard.selectnboard");
		return nboard;
	}
}