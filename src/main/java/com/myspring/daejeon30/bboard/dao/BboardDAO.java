package com.myspring.daejeon30.bboard.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface BboardDAO{
	public List selectNBoard() throws DataAccessException;
}