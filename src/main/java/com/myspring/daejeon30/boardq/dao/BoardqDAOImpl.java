package com.myspring.daejeon30.boardq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("boardqDAO")
public class BoardqDAOImpl implements BoardqDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllQNA() throws DataAccessException{
		List allQNA = sqlSession.selectList("mapper.boardq.selectAllqna");
		return allQNA;
	}
}