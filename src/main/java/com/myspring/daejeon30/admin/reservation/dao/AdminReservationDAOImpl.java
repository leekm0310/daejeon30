package com.myspring.daejeon30.admin.reservation.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Repository("adminReservationDAO")
public class AdminReservationDAOImpl implements AdminReservationDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAll() throws DataAccessException{
		List memAll = sqlSession.selectList("mapper.admin.rsv.selectResMem");
		return memAll;
	}
	
	@Override
	public void acceptRes(int rsvNum) throws DataAccessException{
		sqlSession.update("mapper.admin.rsv.acceptres", rsvNum);
	}
	
	@Override
	public void cancelRes(int rsvNum) throws DataAccessException{
		sqlSession.update("mapper.admin.rsv.cancelres", rsvNum);
	}
}