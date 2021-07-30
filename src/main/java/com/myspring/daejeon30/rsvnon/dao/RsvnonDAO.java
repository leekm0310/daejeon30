package com.myspring.daejeon30.rsvnon.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.rsvnon.vo.RsvnonVO;

public interface RsvnonDAO{
	public int insertNewNon (RsvnonVO rsvnonVO) throws DataAccessException;
	public RsvnonVO selectRsvNon (RsvnonVO rsvnonVO) throws Exception;
}