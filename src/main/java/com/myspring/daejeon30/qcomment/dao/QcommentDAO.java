package com.myspring.daejeon30.qcomment.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface QcommentDAO{
	public List selectQcomment(int num) throws DataAccessException;
}