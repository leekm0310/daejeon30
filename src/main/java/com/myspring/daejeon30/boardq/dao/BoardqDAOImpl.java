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
	
	@Override
	public BoardqVO adminQna(int num)throws DataAccessException{
		BoardqVO bVO = sqlSession.selectOne("mapper.boardq.adminQna", num);
		return bVO;
	}
	
	@Override
	public void updateQna(BoardqVO boardqVO) throws DataAccessException{
		sqlSession.update("mapper.boardq.updateQna", boardqVO);
	}
	
	@Override
	public void deleteQna(int num) throws DataAccessException{
		sqlSession.delete("mapper.boardq.deleteQna", num);
	}
	
	@Override
	public BoardqVO passthro(BoardqVO boardqVO) throws DataAccessException{
		BoardqVO bb = sqlSession.selectOne("mapper.boardq.passthro",boardqVO);
		return bb;
	}
}