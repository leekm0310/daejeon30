package com.myspring.daejeon30.boardq.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.boardq.vo.BoardqVO;
import com.myspring.daejeon30.paging.Criteria;
import com.myspring.daejeon30.qcomment.vo.QcommentVO;

public interface BoardqDAO{
	public List selectAllQNA() throws DataAccessException;
	public void addQna(BoardqVO boardqVO) throws DataAccessException;
	public BoardqVO adminQna(int num)throws DataAccessException;
	public void updateQna(BoardqVO boardqVO) throws DataAccessException;
	public void deleteQna(int num) throws DataAccessException;
	
	public BoardqVO passthro(BoardqVO boardqVO) throws DataAccessException;
	
	//댓글
	public List<QcommentVO> allcomments(int num) throws Exception;
	//제목검색
	public List searchTitle(Map map) throws DataAccessException;
	
	//아이디별 문의글 - 마이페이지
	public List searchbyId(String id)throws DataAccessException;
	
	//신규문의
	public int newQna()throws DataAccessException;
	
	//페이지
	public List selectBoardList(Criteria cri) throws Exception;
	public int countBoardList()throws Exception;
}