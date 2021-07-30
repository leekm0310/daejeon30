package com.myspring.daejeon30.rsvnon.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.rsvnon.vo.RsvnonVO;

@Repository("rsvnonDAO")
public class RsvnonDAOImpl implements RsvnonDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertNewNon(RsvnonVO rsvnonVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.rsvnon.insertNewNon",rsvnonVO);
		return result;
	}
	
	@Override
	public RsvnonVO selectRsvNon (RsvnonVO rsvnonVO) throws Exception{
		RsvnonVO vo = sqlSession.selectOne("mapper.rsvnon.selectRsvNon", rsvnonVO);
		return vo;
	}
	
}