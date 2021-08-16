package com.myspring.daejeon30.admin.reservation.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.daejeon30.paging.Criteria;

public interface AdminReservationService{
	public List allRsv() throws Exception;
	public void acceptRsv(int rsvNum) throws Exception;
	public void cancelRsv(int rsvNum) throws Exception;
	public List selectStatus(String status) throws Exception;
	
	//비회원
	public List Allnon() throws Exception;
	public void acceptnonRsv(int rsvNum) throws Exception;
	public void cancelnonRsv(int rsvNum) throws Exception;
	public List selectnonStatus(String status) throws Exception;
	
	//신규 예약 - 회원
	public int countNewRsvmem()throws Exception;
	
	//회원 - 취소
	public int countCanRsvmem() throws Exception;
	
	//페이지테스트
	public List selectMemRList(Criteria cri) throws Exception;
	public int countMemRListTotal() throws Exception;

}