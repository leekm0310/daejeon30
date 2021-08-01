package com.myspring.daejeon30.admin.reservation.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface AdminReservationDAO{
	public List selectAll() throws DataAccessException;
	public void acceptRes(int rsvNum) throws DataAccessException;
	public void cancelRes(int rsvNum) throws DataAccessException;
	public List selectResNon() throws DataAccessException;
}