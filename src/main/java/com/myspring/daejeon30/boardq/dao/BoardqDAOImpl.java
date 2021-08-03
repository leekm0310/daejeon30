package com.myspring.daejeon30.boardq.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.boardq.vo.BoardqVO;

@Repository("boardqDAO")
public class BoardqDAOImpl implements BoardqDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllQNA() throws DataAccessException{
		List allQNA = sqlSession.selectList("mapper.boardq.selectAllqna");
		return allQNA;
	}
	
	@Override
	public int addQna(BoardqVO boardqVO) throws DataAccessException{
		return sqlSession.insert("mapper.boardq.addQna", boardqVO);	
	}
}