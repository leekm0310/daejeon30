package com.myspring.daejeon30.boardq.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface BoardqDAO{
	public List selectAllQNA() throws DataAccessException;
}