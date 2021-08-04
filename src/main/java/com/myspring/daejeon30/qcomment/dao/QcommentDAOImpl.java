package com.myspring.daejeon30.qcomment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("qcommnetDAO")
public class QcommentDAOImpl implements QcommentDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectQcomment(int num) throws DataAccessException{
		List qcomment = sqlSession.selectList("mapper.qcomment.selectQcomment", num);
		return qcomment;
	}
}