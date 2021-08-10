package com.myspring.daejeon30.admin.reservation.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface AdminReservationService{
	public List allRsv() throws Exception;
	public void acceptRsv(int rsvNum) throws Exception;
	public void cancelRsv(int rsvNum) throws Exception;
	public List selectStatus(String status) throws Exception;
	
	//ºñÈ¸¿ø
	public List Allnon() throws Exception;
	public void acceptnonRsv(int rsvNum) throws Exception;
	public void cancelnonRsv(int rsvNum) throws Exception;
	public List selectnonStatus(String status) throws Exception;
}