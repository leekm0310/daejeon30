package com.myspring.daejeon30.bboard2.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface Bboard2DAO{
	public List selectAllReview() throws DataAccessException;
}