package com.myspring.daejeon30.bboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.bboard.vo.BboardVO;

@Repository("bboardDAO")
public class BboardDAOImpl implements BboardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	//@Override
	//public List selectNBoard() throws DataAccessException{
	//	List nboard = sqlSession.selectList("mapper.bboard.selectnboard");
	//	return nboard;
	//}
	
	@Override
	public int addNotice(BboardVO bboardVO)throws Exception{
		return sqlSession.insert("mapper.bboard.addNotice", bboardVO);
	}
	
	@Override
	public List selectbboard(String sort) throws DataAccessException{
		List bboard = sqlSession.selectList("mapper.bboard.selectbboard", sort);
		return bboard;
	}
	
	@Override
	public BboardVO oneNo(String num)throws DataAccessException{
		BboardVO bbo = sqlSession.selectOne("mapper.bboard.selectOneNo", num);
		return bbo;
	}
	
	@Override
	public void deleteOne(String num) throws Exception{
		sqlSession.delete("mapper.bboard.deleteOneNo", num);
	}
}