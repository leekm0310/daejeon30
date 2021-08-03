package com.myspring.daejeon30.boardq.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.boardq.vo.BoardqVO;

public interface BoardqDAO{
	public List selectAllQNA() throws DataAccessException;
	public int addQna(BoardqVO boardqVO) throws DataAccessException;
}