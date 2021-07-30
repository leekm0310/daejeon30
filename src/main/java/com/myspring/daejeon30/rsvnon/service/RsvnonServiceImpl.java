package com.myspring.daejeon30.rsvnon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.rsvnon.dao.RsvnonDAO;
import com.myspring.daejeon30.rsvnon.vo.RsvnonVO;

@Service("rsvnonService")
public class RsvnonServiceImpl implements RsvnonService{
	@Autowired
	private RsvnonDAO rsvnonDAO;
	
	@Override
	public int addNewRsv(RsvnonVO rsvnonVO) throws DataAccessException {
		return rsvnonDAO.insertNewNon(rsvnonVO);
	}
	
	@Override
	public RsvnonVO searchRsvNon(RsvnonVO rsvnonVO) throws Exception {
		return rsvnonDAO.selectRsvNon(rsvnonVO);
	}
}