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
}