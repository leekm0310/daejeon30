package com.myspring.daejeon30.rsvnon.service;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.rsvnon.vo.RsvnonVO;

public interface RsvnonService {
	public int addNewRsv(RsvnonVO rsvnonVO) throws DataAccessException;
	public RsvnonVO searchRsvNon(RsvnonVO rsvnonVO) throws Exception;
}