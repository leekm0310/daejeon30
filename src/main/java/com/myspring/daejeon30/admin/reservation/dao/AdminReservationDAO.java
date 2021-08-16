package com.myspring.daejeon30.admin.reservation.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.paging.Criteria;

public interface AdminReservationDAO{
	public List selectAll() throws DataAccessException;
	public void acceptRes(int rsvNum) throws DataAccessException;
	public void cancelRes(int rsvNum) throws DataAccessException;
	public List selectStatus(String status) throws DataAccessException;
	
	//비회원
	public List selectResNon() throws DataAccessException;
	public void acceptnonRes(int rsvNum) throws DataAccessException;
	public void cancelnonRes(int rsvNum) throws DataAccessException;
	public List selectnonStatus(String status) throws DataAccessException;
	//신규예약-회원
	public int countNewRsvmem()throws DataAccessException;
	
	//회원 취소
	public int countCanRsvmem() throws DataAccessException;
	
	//페이지
		public List selectMemRList(Criteria cri) throws Exception;
		public int countMemRList()throws Exception;
}