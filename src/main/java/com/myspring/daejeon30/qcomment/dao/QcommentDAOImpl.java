package com.myspring.daejeon30.qcomment.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.qcomment.vo.QcommentVO;

@Repository("qcommnetDAO")
public class QcommentDAOImpl implements QcommentDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectQcomment(int num) throws DataAccessException{
		List qcomment = sqlSession.selectList("mapper.qcomment.selectQcomment", num);
		return qcomment;
	}
	
	@Override
	public void writeQcomment(QcommentVO qcommentVO) throws DataAccessException{
		sqlSession.insert("mapper.qcomment.writeQcomment", qcommentVO);
	}
	
	@Override
	public void updateQcomment(QcommentVO qcommentVO) throws DataAccessException{
		sqlSession.update("mapper.qcomment.updateQcomment", qcommentVO);
	}
	
	@Override
	public void deleteQcomment(int num) throws DataAccessException{
		sqlSession.delete("mapper.qcomment.deleteQcomment", num);	
	}
	

	
}
