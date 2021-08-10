package com.myspring.daejeon30.admin.reservation.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface AdminReservationDAO{
	public List selectAll() throws DataAccessException;
	public void acceptRes(int rsvNum) throws DataAccessException;
	public void cancelRes(int rsvNum) throws DataAccessException;
	public List selectStatus(String status) throws DataAccessException;
	
	//ºñÈ¸¿ø
	public List selectResNon() throws DataAccessException;
	public void acceptnonRes(int rsvNum) throws DataAccessException;
	public void cancelnonRes(int rsvNum) throws DataAccessException;
	public List selectnonStatus(String status) throws DataAccessException;
}