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
	
	@Override
	public List selectResNon() throws DataAccessException{
		List nonAll = sqlSession.selectList("mapper.admin.rsv.selectResNon");
		return nonAll;
	}
	
	@Override
	public List selectStatus(String status) throws DataAccessException{
		List sorted = sqlSession.selectList("mapper.admin.rsv.selectStatus", status);
		return sorted;
	}
	
	@Override
	public void acceptnonRes(int rsvNum) throws DataAccessException{
		sqlSession.update("mapper.admin.rsv.acceptresnon", rsvNum);
	}
	
	@Override
	public void cancelnonRes(int rsvNum) throws DataAccessException{
		sqlSession.update("mapper.admin.rsv.cancelresnon", rsvNum);
	}
	
	@Override
	public List selectnonStatus(String status) throws DataAccessException{
		List sorted = sqlSession.selectList("mapper.admin.rsv.selectnonStatus", status);
		return sorted;
	}
}