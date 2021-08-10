package com.myspring.daejeon30.admin.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.daejeon30.admin.reservation.dao.AdminReservationDAO;

@Service("adminReservationService")
public class AdminReservationServiceImpl implements AdminReservationService{
	@Autowired
	AdminReservationDAO adminReservationDAO;
	
	@Override
	public List allRsv() throws Exception{
		List memRsvAll = adminReservationDAO.selectAll();
		return memRsvAll;
	}
	
	@Override
	public void acceptRsv(int rsvNum) throws Exception{
		adminReservationDAO.acceptRes(rsvNum);
	}
	
	@Override
	public void cancelRsv(int rsvNum) throws Exception{
		adminReservationDAO.cancelRes(rsvNum);
	}
	
	@Override
	public List Allnon() throws Exception{
		List nonRsvAll = adminReservationDAO.selectResNon();
		return nonRsvAll;
	}
	
	@Override
	public List selectStatus(String status) throws Exception{
		List sorted = adminReservationDAO.selectStatus(status);
		return sorted;
	}
	
	@Override
	public void acceptnonRsv(int rsvNum) throws Exception{
		adminReservationDAO.acceptnonRes(rsvNum);
	}
	
	@Override
	public void cancelnonRsv(int rsvNum) throws Exception{
		adminReservationDAO.cancelnonRes(rsvNum);
	}
	
	@Override
	public List selectnonStatus(String status) throws Exception{
		List sorted = adminReservationDAO.selectnonStatus(status);
		return sorted;
	}
}