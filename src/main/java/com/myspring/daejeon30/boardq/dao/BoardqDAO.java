package com.myspring.daejeon30.boardq.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.boardq.vo.BoardqVO;
import com.myspring.daejeon30.qcomment.vo.QcommentVO;

public interface BoardqDAO{
	public List selectAllQNA() throws DataAccessException;
	public int addQna(BoardqVO boardqVO) throws DataAccessException;
	public BoardqVO adminQna(int num)throws DataAccessException;
	public void updateQna(BoardqVO boardqVO) throws DataAccessException;
	public void deleteQna(int num) throws DataAccessException;
	
	public BoardqVO passthro(BoardqVO boardqVO) throws DataAccessException;
	
	//���
	public List<QcommentVO> allcomments(int num) throws Exception;
	//����˻�
	public List searchTitle(Map map) throws DataAccessException;
}