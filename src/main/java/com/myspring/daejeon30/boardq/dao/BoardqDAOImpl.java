package com.myspring.daejeon30.boardq.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.daejeon30.boardq.vo.BoardqVO;
import com.myspring.daejeon30.qcomment.vo.QcommentVO;

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
	public void addQna(BoardqVO boardqVO) throws DataAccessException{
		int num = selectNO();
		boardqVO.setNum(num);
		sqlSession.insert("mapper.boardq.addQna", boardqVO);
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
	
	//댓글
	@Override
	public List<QcommentVO> allcomments(int num) throws Exception{
		return sqlSession.selectList("mapper.qcomment.selectQcomment", num);
	}
	
	//검색
	@Override
	public List searchTitle(Map map) throws DataAccessException{
		return sqlSession.selectList("mapper.boardq.searchTitle", map);
	}
	
	//아이디별 문의글 - 마이페이지
	public List searchbyId(String id)throws DataAccessException{
		return sqlSession.selectList("mapper.boardq.searchbyId", id);
	}
	
	//신규문의
	@Override
	public int newQna()throws DataAccessException{
		return sqlSession.selectOne("mapper.boardq.newQna");
	}
	
	//글번호추가
	private int selectNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.boardq.selectNO");
	}
}